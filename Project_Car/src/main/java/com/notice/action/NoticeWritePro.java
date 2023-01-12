package com.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeWritePro implements Action{
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 湲��벐湲� �뤌�뿉�꽌 �엯�젰�븳 �궡�슜�쓣 �꽌踰꾩뿉 �쟾�떖�븯硫� 
		// �궡�옣媛앹껜 request�뿉 ���옣
		// request �븳湲�泥섎━
		request.setCharacterEncoding("utf-8");
		// request name,subject,content �뙆�씪誘명꽣 媛��졇���꽌 蹂��닔�뿉 ���옣
		
		String filepath = request.getSession().getServletContext().getRealPath("notice_images");
		
		int uploadFileSizeLimit = 5*1024*1024;
		String encType = "UTF-8";
		String uploadFilePath = filepath;
		MultipartRequest multi = null;
		multi = new MultipartRequest(request,uploadFilePath,uploadFileSizeLimit,
					encType,new DefaultFileRenamePolicy());
		
		
		
		String name= multi.getParameter("name");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		
		String fileName=multi.getFilesystemName("fileName");
		System.out.println("�뀒�뒪�듃 �엯�땲�떎" + fileName);
		System.out.println("�뀒�뒪�듃 �씠由꾩엯�땲�떎" + name);
		
		
		// �뙣�궎吏�board �뙆�씪�씠由껧oardDTO �옄諛� �겢�옒�뒪 留뚮뱾湲�
		// 硫ㅻ쾭蹂��닔 num,name,subject,content,readcount,date
		// set() get() 硫붿꽌�뱶 �젙�쓽

		// BoardDTO媛앹껜�깮�꽦(湲곗뼲�옣�냼 �븷�떦)
		NoticeDTO dto=new NoticeDTO();
		// set硫붿꽌�뱶 �샇異� �뙆�씪誘명꽣媛� ���옣
		dto.setUser_id(name);
		dto.setNotice_sub(subject);
		dto.setNotice_content(content);
		// �쁽�떆�뒪�뀥 �궇吏쒖떆媛�
//		dto.setDate(new Timestamp(System.currentTimeMillis()));
		//議고쉶�닔 0 �꽕�젙
		dto.setNotice_readcount(0);
		// 湲�踰덊샇 num => BoardDAO�뿉�꽌 �옉�뾽
		dto.setNotice_image(fileName);
		

		// �뙣�궎吏�board �뙆�씪�씠由껧oardDAO �옄諛� �겢�옒�뒪 留뚮뱾湲�
		// BoardDAO 媛앹껜�깮�꽦(湲곗뼲�옣�냼 �븷�떦)
		NoticeDAO dao=new NoticeDAO();
		// 由ы꽩�븷�삎 �뾾�쓬 insertBoard(BoardDTO 二쇱냼媛� ���옣�븯�뒗 蹂��닔) 硫붿꽌�뱶 �젙�쓽 
		// BoardDAO二쇱냼.insertBoard(BoardDTO 二쇱냼)硫붿꽌�뱶 �샇異�
		dao.insertNotice(dto);
		//湲�紐⑸줉 �씠�룞
//		response.sendRedirect("list.jsp");
		ActionForward forward=new ActionForward();
		forward.setPath("./NoticeList.no");
		forward.setRedirect(true);
		return forward;
	}
}

