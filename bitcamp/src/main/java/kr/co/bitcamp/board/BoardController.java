package kr.co.bitcamp.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/boardNotice")
	public String boardNotice() {
		return "board/notice";
	}
	
	@RequestMapping("/boardEnquiry")
	public String boardEnquiry() {
		return "board/enquiry";
	}
	
	@RequestMapping("/boardReview")
	public String boardReview() {
		return "board/review";
	}
	
	@RequestMapping("/notice_listForm")
	public String notice_listForm() {
		return "board/notice_listForm";
	}
	
	@RequestMapping("/enquiry_listForm")
	public String enquiry_listForm() {
		return "board/enquiry_listForm";
	}
	
	@RequestMapping("/review_listForm")
	public String review_listForm() {
		return "board/review_listForm";
	}
	
	@RequestMapping("/notice_writeForm")
	public String notice_writeForm() {
		return "board/notice_writeForm";
	}
	
	@RequestMapping("/enquiry_writeForm")
	public String enquiry_writeForm() {
		return "board/enquiry_writeForm";
	}
	
	@RequestMapping("/review_writeForm")
	public String review_writeForm() {
		return "board/review_writeForm";
	}
	
	@RequestMapping("/enquiry_writeOk")
	public String enquiry_writeOk() {
		return "";
	}
	
	@RequestMapping("/notice_editForm")
	public String notice_editForm() {
		return "/board/notice_editForm";
	}
	
	@RequestMapping("/enquiry_editForm")
	public String enquiry_editForm() {
		return "/board/enquiry_editForm";
	}
	
	@RequestMapping("/review_editForm")
	public String review_editForm() {
		return "/board/review_editForm";
	}
	
}
