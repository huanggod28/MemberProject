package dao;

import model.Member;

public interface MemberDao {
	//create
	void addMember(Member m);
	
	//read
	Member findUsernameAndPassword(String username,String password);
	boolean findByUsername(String username);
	//update
	
	
	//delete
}
