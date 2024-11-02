package com.kupid.calender.model.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.getConnection;

import com.kupid.calender.model.dao.CalendarDao;
import com.kupid.calender.model.dto.Calendar;
import java.sql.Connection;
import java.util.List;

public class CalendarService {
	private final CalendarDao dao = new CalendarDao();
	
	public List<Calendar> getEventsByGroupNo(int groupNo){
		Connection conn = getConnection();
		List<Calendar> c = dao.getEventsByGroupNo(conn,groupNo);
		close(conn);
		return c;
	}
}
