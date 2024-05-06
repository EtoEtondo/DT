entity Mux2x1 is
	port(	ia, ib: 	in bit;
			s: 		in bit; --steuereingang
			e:			in bit; --enable
			y1, y2, y3: out bit);
end Mux2x1;




architecture Mux of Mux2x1 is
begin	
	y1 <=	(ia and e and not s) or    --nicht s für 0, um ia zu selektieren 
			(ib and e and s); --s für 1, um ib auszuwählen
	
	with s select
	y2 <= (ia and e) when '0',    --wenn s 0 ist für ia
			(ib and e) when '1';    --wenn s 1 ist f+r ib
			
			
	y3 <= (ia and e) when s = '0' else
			(ib and e);
				
				
end Mux;