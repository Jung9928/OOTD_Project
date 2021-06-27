package com.ootd.ootdApp.common;

public class Utils {
	// 페이지 계산 처리 및 HTML 생성용 클래스 
	// (팩토리 디자인 패턴)
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		
		String pageBar = "";
		int pageBarSize = 5; // 1, 2, 3, 4, 5 --> 6, 7, 8, 9, 10
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("totalPage : "+totalPage);
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<div class=\"pagination_r\">";
		//[이전]section
		if(pageNo == 1 ){
			// pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "<a href='#'>&laquo;</a>";
		}
		else {
			pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a>";
		}
		
		// pageNo section
		while(!(pageNo > pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<a id='currPage'>"+pageNo+"</a>";
			} 
			else {
				pageBar += "<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<a href='#'>&raquo;</a>";
			
		} else {
			pageBar += "<a href='javascript:fn_paging("+ (pageNo+1) +")'>&raquo;</a>";
		}
		
		pageBar += "</div>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

}
