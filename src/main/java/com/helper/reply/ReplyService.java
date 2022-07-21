package com.helper.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helper.member.MemberDTO;

@Service
public class ReplyService {
	@Autowired
	private ReplyDAO dao;
	
	public int insert(int bo_seq, ReplyDTO reDto, MemberDTO dto)throws Exception{ // 댓글 등록
		
		int reply_seq = dao.replySeq();
		reDto.setReply_seq(reply_seq);
		reDto.setMem_nick(dto.getMem_nick());
		reDto.setBo_seq(bo_seq);
		reDto.setMem_seq(dto.getMem_seq());
		
		return dao.insert(reDto);
	}
	public List<ReplyDTO> selectReply(int bo_seq)throws Exception{ // 해당 게시물의 댓글 불러오기
		return dao.selectReply(bo_seq);	
	}
	public int delete(int reply_seq)throws Exception{ // 댓글 삭제
		return dao.delete(reply_seq);
		
	}
	
}









