#include "upCounter.h"

void upCounter::counting()
	{
		if (rst)
		{
			cnt_val = 0;
		}
		else if (clk->event() && clk)
		{
			cnt_val = cnt_val + 1;
		}
		cnt=cnt_val;
	}