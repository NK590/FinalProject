package com.helper.board;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardDTO> selectAll() throws Exception{ // 모든 게시글 조회 
		return boardDAO.selectAll();
	}
	public String summernote(MultipartFile file, String realPath)throws Exception{ // summernote에 이미지 띄워주기 
		
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) {
			realPathFile.mkdir();
		}
			String ori_name = file.getOriginalFilename();
			String sys_name =UUID.randomUUID()+"_"+ori_name;
			file.transferTo(new File(realPath+File.separator+sys_name));

		return sys_name;
	}
	
	public int insert(BoardDTO dto)throws Exception {  // 게시글 등록
		int bo_seq = boardDAO.selectSeq();
		dto.setBo_seq(bo_seq);
		int rs = boardDAO.insert(dto);
		return rs;
	}
	public BoardDTO selectOne(int bo_seq)throws Exception{ // 상세보기 페이지 
		return boardDAO.selectOne(bo_seq);
	}

	
}











