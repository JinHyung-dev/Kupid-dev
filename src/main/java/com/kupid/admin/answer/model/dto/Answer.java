package com.kupid.admin.answer.model.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Answer {
	private int answerNO;
	private int inqNo;
	private String answerTitle;
	private String answerContent;
	private Date answerDate;
}
