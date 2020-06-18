package kr.co.bitcamp.order;

import java.util.List;

public interface OrderDAOImp {
	public List<Integer> allSelectProduct(int p_no);
	public List<String> allSelectDate(int s_no);
}
