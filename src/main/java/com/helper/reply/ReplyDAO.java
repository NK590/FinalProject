package com.helper.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSession session;
	
		// 새로운 댓글 시퀀스 번호 생성
		public int replySeq()throws Exception{
			return session.selectOne("boardMapper.replySeq");
		}
		// 새로운 댓글 작성
		public int insert(ReplyDTO reDto)throws Exception{
			return session.insert("boardMapper.replyInsert",reDto);
		}
		// 해당 게시물의 댓글 불러오기
		public List<ReplyDTO> selectReply(int bo_seq)throws Exception{
			return session.selectList("boardMapper.selectReply",bo_seq);
		}
		// 댓글 삭제
		public int delete(int reply_seq)throws Exception{
			return session.delete("boardMapper.deleteReply",reply_seq);			
		}
}








