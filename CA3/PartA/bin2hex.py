def binary_to_hex_file(input_file, output_file):
    with open(input_file, 'r') as infile:
        binary_lines = infile.readlines()

    hex_lines = []
    for binary in binary_lines:
        binary = binary.strip()
        if binary:
            hex_val = hex(int(binary, 2))[2:].upper()
            if len(hex_val) == 1:
                hex_val = '0' + hex_val
            hex_lines.append(hex_val)

    with open(output_file, 'w') as outfile:
        for h in hex_lines:
            outfile.write(h + '\n')

binary_to_hex_file('output.txt', 'mem.txt')
