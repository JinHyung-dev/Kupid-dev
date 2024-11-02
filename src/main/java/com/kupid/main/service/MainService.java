package com.kupid.main.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.getConnection;

import com.kupid.group.model.dto.GroupDto;
import com.kupid.main.dao.MainDao;
import java.sql.Connection;
import java.util.List;

public class MainService {
	private final MainDao dao = new MainDao();
	public List<GroupDto> selectAllGroup() {
		Connection conn = getConnection();
		List<GroupDto> g = dao.selectAllGroup(conn);
		close(conn);
		return g;
	}
}
