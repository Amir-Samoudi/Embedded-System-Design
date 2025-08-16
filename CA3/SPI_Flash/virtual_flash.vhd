library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity virtual_flash is
    generic (
        SECTOR_DEPTH : integer := 4096
    );
    port (
        SCK    : in  std_logic;
        CSbar  : in  std_logic;
        DI     : in  std_logic;
        DO     : out std_logic
    );
end virtual_flash;

architecture Behavioral of virtual_flash is
    signal clk       : std_logic := '0';
    signal din       : std_logic_vector(31 downto 0) := (others => '0');
    signal address   : std_logic_vector(23 downto 0) := (others => '0');
    signal state     : std_logic := '0';
    signal ld        : std_logic := '0';
    signal cen       : std_logic := '0';
    signal done      : std_logic := '0';
    signal senddata  : std_logic := '0';
    signal cnt       : std_logic_vector(31 downto 0) := (others => '0');
    signal CS_rec    : std_logic_vector(1 downto 0) := (others => '0');
    
    type mem_type is array (0 to 4095) of std_logic_vector(7 downto 0);
    signal mem : mem_type;
    
    -- Function to initialize memory from file
    impure function init_mem(mif_file_name : in string) return mem_type is
        file mif_file : text open read_mode is mif_file_name;
        variable mif_line : line;
        variable temp_mem : mem_type;
        variable temp_data : std_logic_vector(7 downto 0);
        variable i : integer := 0;
    begin
        while not endfile(mif_file) loop
            readline(mif_file, mif_line);
            hread(mif_line, temp_data);
            temp_mem(i) := temp_data;
            i := i + 1;
        end loop;
        return temp_mem;
    end function;
    
begin
    -- Initialize memory
    mem <= init_mem("mem.mem");


    -- Main counter and address process
    process(SCK, ld)
    begin
        if rising_edge(SCK) OR ld = '1' then
            if ld = '1' then
                address <= din(23 downto 0);
                cnt <= "00000" & std_logic_vector(unsigned(din(23 downto 0))) & "000"; -- Multiply by 8
            elsif cen = '1' then
                cnt <= std_logic_vector(unsigned(cnt) + 1);
            end if;
            
            if ((unsigned(address) + SECTOR_DEPTH) * 8)-1 = unsigned(cnt(31 downto 0)) then
                cnt <= "00000" & din(23 downto 0) & "000"; -- Reset to address * 8
            end if;
        end if;
    end process;

    -- Data input shift register
    process(SCK)
    begin
        if rising_edge(SCK) then
			if senddata = '1' then
				din <=(others=>'0');
			else
				din <= din(30 downto 0) & DI;
			end if;
        end if;
    end process;

    -- Data output process
    process(SCK)
        variable mem_index : integer;
        variable bit_index : integer;
    begin
        if falling_edge(SCK) then
            if senddata = '1' then
                mem_index := to_integer(unsigned(cnt(31 downto 3)));
                bit_index := 7 - to_integer(unsigned(cnt(2 downto 0)));
                DO <= mem(mem_index)(bit_index);
                cen <= '1';
            else
                cen <= '0';
            end if;
        end if;
    end process;

    -- Chip select edge detection
    process(clk)
    begin
        if rising_edge(clk) then
            CS_rec <= CS_rec(0) & CSbar;
            if CS_rec = "01" then
                done <= '1';
            else
                done <= '0';
            end if;
        end if;
    end process;

    -- State machine
    process(clk)
    begin
        if rising_edge(clk) then
            state <= '0';
            ld <= '0';
            
            case state is
                when '0' =>
                    senddata <= '0';
                    if din(31 downto 24) = x"03" then
                        state <= '1';
                        ld <= '1';
                    end if;
                    
                when '1' =>
                    senddata <= '1';
                    if done = '1' then
                        state <= '0';
                    else
                        state <= '1';
                    end if;
                    
                when others =>
                    state <= '0';
            end case;
        end if;
    end process;

	-- Clock generation process
    clk_process: process
    begin
        wait for 1 ns;
        clk <= not clk;
    end process;

end Behavioral;