package kr.co.bitcamp.product;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	SqlSession sqlSession;  //변수명은 xml에 있는거랑 똑같이 지어야함.
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@RequestMapping("/productView")
	public ModelAndView productView(int p_no) {
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		mav.addObject("product",dao.productView(p_no));
		mav.addObject("image",dao.productView(p_no));
		mav.setViewName("product/productView");
		return mav;
	}
	@RequestMapping("/productList")
	public ModelAndView productList() {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",dao.allSelectRecord());
		mav.setViewName("product/productList");
		return mav;
	}
	@RequestMapping("/productOrder")
	public String productOrder() {
		return "product/productOrderForm";
	}
	@RequestMapping(value="/productWrite")
	public String productWrite() {
		return "product/productWrite";
	}
	@RequestMapping(value="/productWirteOk",method=RequestMethod.POST )
	public ModelAndView productWriteOk(ProductVO vo,HttpServletRequest req) {
		//request객체로 --> MultipartHttpServletRequest생성하여 파일 업로드 처리를 한다.
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> fileList = mr.getFiles("p_filename");
		String p_filenames[]= new String[5];
		String path = req.getSession().getServletContext().getRealPath("/upload");
		File folder = new File(path);
		if(!folder.exists()) {
			try {
				folder.mkdir();//폴더 안만들었을시 폴더 생성
			}catch(Exception e) {
				System.out.println("파일 저장 폴더를 생성하는데 실패함."+e.getMessage());
				e.printStackTrace();
			}
		}else {
			System.out.println("폴더가 이미 존재해서 따로 안만들어도 됨.");
		}
		int idx = 0;
		if(fileList!=null) {
			for(int i =0;i<fileList.size();i++) {//업로드할 파일의 수만큼 반복처리
				MultipartFile mf = fileList.get(i);
				//업로드한 파일명
				String fname = mf.getOriginalFilename();
				if(fname!=null && !fname.equals("")) {
					//파일명 변경하기
					File f = new File(path,fname);
				
					if(f.exists()) {//파일이 존재함
						for(int renameNum=1;;renameNum++) {
							String orgFilename = fname.substring(0,fname.lastIndexOf("."));//파일명 (확장자 뺀)
							String orgExt = fname.substring(fname.lastIndexOf(".")+1);//확장자명
							f = new File(path,orgFilename+"("+renameNum+")"+"."+orgExt);
						
							
							if(!f.exists()) {//파일이 존재 안하면
								fname = orgFilename +"("+ renameNum+")" + "." + orgExt;
								break;
							}
						}
					}
					try {
						mf.transferTo(new File(path,fname));
					}catch(Exception e) {
						e.printStackTrace();
						System.out.println("파일 업로드 에러"+e.getMessage());
					}
					p_filenames[idx++] = fname;
				}
			}
			//vo에 파일명 저장
			
			vo.setP_filename1(p_filenames[0]);
			vo.setP_filename2(p_filenames[1]);
			vo.setP_filename3(p_filenames[2]);
			vo.setP_filename4(p_filenames[3]);
			vo.setP_filename5(p_filenames[4]);
		}
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		int result = dao.productWrite(vo);
		if(result>0) {
			mav.setViewName("redirect:productList");
		}else {
			for(int i =0;i<p_filenames.length;i++) {
				if(p_filenames[i]!=null) {
					deleteFile(path,p_filenames[i]);
				}
			}
			mav.setViewName("redirect:productWrite");
		}
		return mav;
	}
	
	
	public void deleteFile(String p,String f) {//파일삭제
		File fn = new File(p,f);
		fn.delete();
	}
}
