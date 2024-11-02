package com.kupid.calender.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Calendar {
	private int scId;
	private String scTitle;
	private String scStart;
	private String scEnd;
	private String field;
	private int groupNo;
	
}
