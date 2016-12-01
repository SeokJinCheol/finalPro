package com.kosta.finalproject.controller.left;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.FreeDaoImpl;
import com.kosta.finalproject.vo.FreeBoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class LeftController3 {

	@Autowired
	private FreeDaoImpl freeDaoImpl;

	// ±Û ¼öÁ¤ Form_GET
	
}