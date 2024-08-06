package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;

public class MemberDAO {
	// JDBC 관련 변수 
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private String MEMBER_LIST = "select * from member";
	private String MEMBER_ONE = "select * from member where num = ?";
	private String MEMBER_DELETE = "delete from member where num = ?";
	private String MEMBER_UPDATE = "update member set id = ?, pw = ?, name = ?";
	 
	
	
	// 회원 목록 삭제
	public void deleteMember(int num) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(MEMBER_DELETE);
			stmt.setInt(1, num);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 회원 목록 조회
	public List<MemberDTO> getMemberList() {
		List<MemberDTO> list = new ArrayList<>();
		
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(MEMBER_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO(rs.getString("id"),
						rs.getString("name"), rs.getString("pw"));
						
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return list;
	}
	
	public void updateMember(MemberDTO dto) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(MEMBER_UPDATE);
			stmt.setString(1, dto.getId());
			stmt.setString(2, dto.getName());
			stmt.setString(3, dto.getPw());
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

}
