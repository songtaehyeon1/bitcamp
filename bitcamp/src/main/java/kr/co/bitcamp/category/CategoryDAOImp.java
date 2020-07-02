package kr.co.bitcamp.category;

import java.util.List;

import kr.co.bitcamp.product.ProductVO;

public interface CategoryDAOImp {
	//��� ī�װ� ����
	public List<CategoryVO> allCategorySelect();
	
	//��� ī�װ��� ��� ��ǰ ����
	public List<ProductVO> allProductSelect(String sort);
	
	//ī�װ� 1�� ����
	public List<ProductVO> productSelect(int c_no, String sort);

	//���ɻ�ǰ ����Ʈ ���ϱ�
	public List<Integer> allHearts(String userno);
	
	//���ɻ�ǰ �߰�
	public int addInterest(InterestVO vo);	
	
	//���̻�ǰ ����
	public int delInterest(InterestVO vo);	
}
