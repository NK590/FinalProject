package com.helper.admin;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.helper.member.MemberDTO;

@Service
public class AdminService {

	@Autowired
	private ReportDAO reportDAO;
	@Autowired
	private AdminGroupDAO groupDAO;
	@Autowired
	private RecordDAO recordDAO;
	@Autowired
	private AdminDAO adminDAO;
  @Autowired
  private NoticeDAO noticeDAO;
	/* Main record */
	public List<Map<String, Object>> selectTopMem() throws Exception {
		return recordDAO.selectTopMem();
	}

	public List<Map<String, Object>> selectTopGroup() throws Exception {
		return recordDAO.selectTopGroup();
	}
		
/* Report */
	// 블랙리스트 목록
	public List<ReportDTO> reportList(int start, int end) throws Exception {
		return reportDAO.reportList(start, end);
	}

	// 블랙리스트 추가
	public int addBleck(int mem_seq) throws Exception {
		return reportDAO.addBlack(mem_seq);
	}

	// 블랙리스트 페이징
	public Map<String, Object> getBleckPageNavi(int curPage) throws Exception {
		return reportDAO.getBleckPageNavi(curPage);
	}

	// 블랙리스트 유저 아이디로 찾기
	public List<ReportDTO> searchMember(String mem_id, int start, int end) throws Exception {
		return reportDAO.searchMember(mem_id, start, end);
	}

	// 찾기 페이징
	public Map<String, Object> getSearchPageNavi(String mem_id, int curPage) throws Exception {
		return reportDAO.getSearchPageNavi(mem_id, curPage);
	}

	/* Group */
	public List<Map<String, Object>> groupList(int start, int end) throws Exception {
		return groupDAO.groupList(start, end);
	}

	public Map<String, Object> getGroupPageNavi(int curPage) throws Exception {
		return groupDAO.getGroupPageNavi(curPage);
	}

	public void deleteGroup(int group_seq) throws Exception {
		groupDAO.deleteGroup(group_seq);
	}

	public List<MemberDTO> selectBlacklist(int start, int end) throws Exception {
		return adminDAO.selectBlacklist(start, end);
	}

	public Map<String, Object> getBlacklistPageNavi(int curPage) throws Exception {
		return adminDAO.getBlacklistPageNavi(curPage);
	}

	// 차단 해제
	public void unblocking(int mem_seq) throws Exception {
		adminDAO.unblocking(mem_seq);
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

	public void imgDelete(String img, String realPath) throws Exception { // summernote 서버에서 이미지 제거
		File file = new File(realPath + File.separator + img);
		if (file.exists()) { // 경로에 파일이 존재한다면
			file.delete(); // 파일을 삭제
		}
	}
	
	public int insertNotice(NoticeDTO dto) throws Exception { // 게시글 등록
		int rs = noticeDAO.insertNotice(dto);
		return rs;
	}
	
	public List<NoticeDTO> selectAllNotice()throws Exception{
		List<NoticeDTO> list = noticeDAO.selectAllNotice();
		return list;
	}
	
	public NoticeDTO selectOneNotice(int notice_seq)throws Exception{
		noticeDAO.updateView(notice_seq);
		return noticeDAO.selectOneNotice(notice_seq);
	}
	
	public int noticeUpdate(List<String>list,NoticeDTO dto,String realPath)throws Exception{
		if(list.size()>0) { // 삭제할 파일이 있다면 
			for(String sys_name:list) {
				File file = new File(realPath + File.separator + sys_name);
				if (file.exists()) { // 경로에 파일이 존재한다면
					file.delete(); // 파일을 삭제
				}
			}
		}
		return noticeDAO.noticeUpdate(dto);
	}
	
	public int noticeDelete(int notice_seq, List<String> img_arr, String realPath) throws Exception { // 게시글 삭제

		if (img_arr != null) {
			for (String arr : img_arr) { // 배열의 값 꺼내기
				File file = new File(realPath + File.separator + arr); // 이미지의 서버 경로값
				System.out.println(file);
				if(file.exists()) {
					file.delete();
				}
			}
		}
		return noticeDAO.noticeDelete(notice_seq);
	}
	public int noticeDelete2(int notice_seq) throws Exception { // 이미지없는 게시글 삭제

		return noticeDAO.noticeDelete(notice_seq);
	}
	
	// 방문자 수 체크
	public void visitCount() throws Exception {
		adminDAO.visitCount();
	}
	public int visitToday() throws Exception {
		return adminDAO.visitToday();
	}
	public int visitTotal() throws Exception {
		return adminDAO.visitTotal();
	}
	public int reportTotal() throws Exception {
		return adminDAO.reportTotal();
	}
	
	public List<Map<String, Integer>> memberJoinCount() throws Exception {
		return adminDAO.memberJoinCount();
	}
	
	public List<Map<String, Integer>> groupCategoryCount() throws Exception {
		return adminDAO.groupCategoryCount();
	}
	
 	
 }
