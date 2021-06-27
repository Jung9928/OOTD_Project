package com.ootd.ootdApp.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ootd.ootdApp.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOneMember(String member_id) {
		
		return sqlSession.selectOne("member-mapper.selectOneMember", member_id);
	}

	@Override
	public int insertMember(Member member) {
		
		return sqlSession.insert("member-mapper.insertMember", member);
	}
	
	@Override
	public int insertBrandMember(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member-mapper.insertBrandMember", member);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member selectMemberID(Member member) {
		
		if ( member.getLogin_type() == 1 ) {
			return sqlSession.selectOne("member-mapper.selectBrandId", member);
		} else {
			return sqlSession.selectOne("member-mapper.selectMemberId", member);
		}
	}

	@Override
	public int updateNewPass(Member m) {
		
		return sqlSession.update("member-mapper.updatePasswordFind", m);
	}

	@Override
	public String selectEmailCount(String email) {
		
		return sqlSession.selectOne("member-mapper.selectEmailCheck", email);
	}

	// 중고회원 아이디 중복 체크
	@Override
	public int checkIdDuplicate(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member-mapper.checkIdDuplicate", memberId);
	}

}
