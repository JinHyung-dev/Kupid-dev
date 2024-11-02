package com.kupid.inquiry.model.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.getConnection;

import com.kupid.inquiry.model.dao.InquiryDao;
import java.sql.Connection;

public class InquiryService {
	InquiryDao dao=new InquiryDao();

    public int insertInquiry(String inqTitle,String inqContent,String inqFile,int inq_Member) {
    	Connection conn=getConnection();
    	int result=dao.insertInquiry(conn,inqTitle, inqContent, inqFile, inq_Member);
    	close(conn);
    	return result; 
    }
}
