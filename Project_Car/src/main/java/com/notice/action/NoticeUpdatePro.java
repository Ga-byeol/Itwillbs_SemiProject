package com.notice.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeUpdatePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request 占쎈립疫뀐옙筌ｌ꼶�봺
		request.setCharacterEncoding("utf-8");
		
		
		
		String filepath = request.getSession().getServletContext().getRealPath("notice_images");
		
		int uploadFileSizeLimit = 5*1024*1024;
		String encType = "UTF-8";
		String uploadFilePath = filepath;
		MultipartRequest multi = null;
		multi = new MultipartRequest(request,uploadFilePath,uploadFileSizeLimit,
					encType,new DefaultFileRenamePolicy());
		
		
		
		
		
		
		// request 占쎌젟癰귨옙 揶쏉옙占쎌죬占쎌궎疫뀐옙
		// num name subject content 占쎈솁占쎌뵬沃섎챸苑� 揶쏉옙占쎌죬占쏙옙占쎄퐣 癰귨옙占쎈땾占쎈퓠 占쏙옙占쎌삢
		int num=Integer.parseInt(multi.getParameter("num"));
		String sessionId=multi.getParameter("sessionId");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String eimg=multi.getParameter("eimg");
		String fileName = multi.getFilesystemName("fileName");
		System.out.println("占쎄퉱 占쎌뵠沃섎챷占� 占쎈솁占쎌뵬"+fileName);
		System.out.println("疫꿸퀣�� 占쎌뵠沃섎챷占� 占쎈솁占쎌뵬"+eimg);
		
		
		// 占쎌뵠沃섎챷占� 占쎄텣占쎌젫 疫꿸퀡�뮟 獄쏉옙 占쎈씜占쎈쑓占쎌뵠占쎈뱜占쎈솁占쎌뵬 占쎈씨占쎌뱽占쎈뻻 域밸챶占썸에占� 占쎌�筌욑옙
		if(fileName == null) {
			fileName = eimg;
		}
		if(!fileName.equals(eimg)) {
			String realFile = filepath +"\\"+eimg;
			File f = new File(realFile);
			if( f.exists()) f.delete();
		}
		
		
		
		// BoardDTO 揶쏆빘猿쒙옙源�占쎄쉐
		NoticeDTO dto=new NoticeDTO();
		// set筌롫뗄苑뚳옙諭띰옙�깈�빊占� num name subject content 占쏙옙占쎌삢
		dto.setNotice_num(num);
		dto.setUser_id(sessionId);
		dto.setNotice_sub(subject);
		dto.setNotice_content(content);
		dto.setNotice_image(fileName);

		// 占쎈땾占쎌젟占쎌삂占쎈씜
		// BoardDAO 揶쏆빘猿쒙옙源�占쎄쉐
		NoticeDAO dao=new NoticeDAO();
		// �뵳�뗪쉘占쎈막占쎌굨占쎈씨占쎌벉 updateBoard(BoardDTO 癰귨옙占쎈땾)筌롫뗄苑뚳옙諭� 占쎌젟占쎌벥 
		// 占쎈탵�뜮袁⑹삂占쎈씜 雅뚯눘�꺖�몴占� 占쎈꽰占쎈퉸占쎄퐣 updateBoard(BoardDTO 雅뚯눘�꺖揶쏉옙) 占쎌깈�빊占�
		dao.updateNotice(dto);
		// list.jsp 占쎌뵠占쎈짗
//		response.sendRedirect("list.jsp");
		ActionForward forward=new ActionForward();
		forward.setPath("./NoticeList.no");
		forward.setRedirect(true);
		return forward;
	}
}
