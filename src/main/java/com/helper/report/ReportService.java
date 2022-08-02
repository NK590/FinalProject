package com.helper.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helper.admin.ReportDAO;
import com.helper.admin.ReportDTO;

@Service
public class ReportService {
   @Autowired
   private ReportDAO dao;
   
   public void insert(ReportDTO dto) throws Exception {
      dao.insert(dto);
   }
}