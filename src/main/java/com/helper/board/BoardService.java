package com.helper.board;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;

	public List<BoardDTO> selectAll(int start, int end) throws Exception { // 모든 게시글 조회
		return boardDAO.selectAll( start, end);
	}
	
	public int getListCnt()throws Exception{ // 전체 게시글의 개수
		
		return boardDAO.getListCnt();
	}
	
	public int searchPaging(String category, String keyword)throws Exception{ // 검색한 게시글의 개수
		 return boardDAO.searchPaging(category, keyword);
	}

	public String summernote(MultipartFile file, String realPath) throws Exception { // summernote에 이미지 띄워주기

		File realPathFile = new File(realPath);
		if (!realPathFile.exists()) {
			realPathFile.mkdir();
		}
		String ori_name = file.getOriginalFilename();
		String sys_name = UUID.randomUUID() + "_" + ori_name;
		file.transferTo(new File(realPath + File.separator + sys_name));
		System.out.println(realPath + File.separator + sys_name);
		return sys_name;
	}

	public int insert(BoardDTO dto) throws Exception { // 게시글 등록
		int bo_seq = boardDAO.selectSeq();
		dto.setBo_seq(bo_seq);
		int rs = boardDAO.insert(dto);
		return rs;
	}

	public BoardDTO selectOne(int bo_seq) throws Exception { // 상세보기 페이지
		boardDAO.updateCount(bo_seq); // 조회수 등록
		return boardDAO.selectOne(bo_seq);
	}

	public int delete(int bo_seq, List<String> img_arr, String realPath) throws Exception { // 게시글 삭제

		if (img_arr != null) {
			for (String arr : img_arr) { // 배열의 값 꺼내기
				File file = new File(realPath + File.separator + arr); // 이미지의 서버 경로값
				System.out.println(file);
				if(file.exists()) {
					file.delete();
				}
			}
		}
		return boardDAO.delete(bo_seq);
	}
	public int delete2(int bo_seq) throws Exception { // 이미지없는 게시글 삭제

		return boardDAO.delete(bo_seq);
	}

	public int update(List<String>list,BoardDTO dto,String realPath) throws Exception { // 게시글 수정
		if(list.size()>0) { // 삭제할 파일이 있다면 
			for(String sys_name:list) {
				File file = new File(realPath + File.separator + sys_name);
				if (file.exists()) { // 경로에 파일이 존재한다면
					file.delete(); // 파일을 삭제
				}
			}
		}
		return boardDAO.update(dto);
	}

	public List<BoardDTO> search(String category, String keyword,int start, int end) throws Exception { // 게시글 검색
		System.out.println(category+":"+keyword+":"+start+":"+end);
		return boardDAO.search(category, keyword,start, end);
	}

	public void imgDelete(String img, String realPath) throws Exception { // summernote 서버에서 이미지 제거
		File file = new File(realPath + File.separator + img);
		if (file.exists()) { // 경로에 파일이 존재한다면
			file.delete(); // 파일을 삭제
		}

	}

}
