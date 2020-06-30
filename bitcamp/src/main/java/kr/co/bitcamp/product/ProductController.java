package kr.co.bitcamp.product;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

@Controller
public class ProductController {
	SqlSession sqlSession; // 변수명은 xml에 있는거랑 똑같이 지어야함.

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
////////////////////////장바구니
	@RequestMapping(value = "/productCart")
	public String productInterest() {
		return "product/productCart";
	}
	
	
	
////////////////////////상품 상세글
	@RequestMapping("/productView")
	public ModelAndView productView(int p_no) {
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		mav.addObject("product", dao.productView(p_no));
		mav.setViewName("product/productView");
		return mav;
	}
/////////////////////////상품 리스트
	@RequestMapping("/productList")
	public ModelAndView productList() {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.allSelectRecord());
		mav.setViewName("product/productList");
		return mav;
	}

	@RequestMapping("/productOrder")
	public String productOrder() {
		return "product/productOrderForm";
	}

	@RequestMapping(value = "/productWrite")
	public String productWrite() {
		return "product/productWrite";
	}

//////////////////////////// review 글 땡겨오기
//	   @RequestMapping("/productReview")/////////////////////나중에 태현이거 긁어오기
//		public ModelAndView productReview() {
//			ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("list", dao.allSelectRecord());
//			mav.setViewName("product/productList");
//			return mav;
//		}
	   
//////////////////////////// enquiry 글 땡겨오기
//	   @RequestMapping("/productEnquiry")/////////////////////나중에 태현이거 긁어오기
//		public ModelAndView productEnquiry() {
//			ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("list", dao.allSelectRecord());
//			mav.setViewName("product/productList");
//			return mav;
//		}
	   
	   
}
























