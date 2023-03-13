package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.bean.Member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDao {

	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void addUpdateMember(Member member) {
		this.hibernateTemplate.saveOrUpdate(member);
	}

	public Member getMember(int id) {
		return this.hibernateTemplate.get(Member.class, id);
	}

	@SuppressWarnings("deprecation")
	public List<Member> getAllMember() {
		@SuppressWarnings("unchecked")
		List<Member> members = (List<Member>) this.hibernateTemplate.find("From Member");
		return members;
	}

	@Transactional
	public void deleteMember(int id) {
		Member member = getMember(id);
		this.hibernateTemplate.delete(member);
	}
}
