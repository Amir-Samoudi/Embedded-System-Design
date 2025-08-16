#include "upCounter.h"

SC_MODULE(upCounter_TB)
{
	sc_in<bool>	rst, clk;
	sc_out<sc_uint<32> > cnt;

	upCounter* CNT1;

	SC_CTOR(upCounter_TB)
	{
		CNT1 = new upCounter("CNT1_Instance");
			CNT1->rst(rst);
			CNT1->clk(clk);
			CNT1->cnt(cnt);
	}
};