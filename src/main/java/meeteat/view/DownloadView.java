package meeteat.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import meeteat.dto.reviewBoard.ReviewImg;

public class DownloadView extends AbstractView {
	
	private static final Logger logger
	= LoggerFactory.getLogger(DownloadView.class);
	
	@Autowired
	ServletContext context;
	
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
		
		ReviewImg file = (ReviewImg) model.get("downFile");
		
		String path = context.getRealPath("upload");
		String filename = file.getFile_storedname();
		
		File src = new File(path, filename);
		
		//--------------------------------------------------------
		
		//이진데이터형식으로 응답을 설정한다
		//	application/octet-strem : 브라우저에게 이진데이터(파일)을 전송할 때 사용하는 응답형식
		//	브라우저는 응답받은 데이터를 파일로 저장한다
		response.setContentType("application/octet-stream");
				
		//응답 데이터의 크기 설정
		response.setContentLength((int)src.length());
				
		//응답 데이터의 인코딩 설정
		response.setCharacterEncoding("utf-8");
				
		//클라이언트가 파일을 저장할 때 사용할 이름에 대한 인코딩 설정
		String outputName = URLEncoder.encode(file.getFile_originname(), "UTF-8");
		
		//브라우저가 다운로드할 이름을 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		
		//--------------------------------------------------------
		
		//응답 데이터 전송
		//	서버의 File -> FileInputStream -> 응답 OutputStream으로 출력
		
		File origin = new File(context.getRealPath("upload"), file.getFile_storedname());
		
		
		//서버의 파일 입력스트림
		FileInputStream fis = new FileInputStream(origin);
				
		//서버의 응답 출력 스트림
		OutputStream out = response.getOutputStream();
				
		//서버 -> 클라이언트 파일 복사(출력)
		FileCopyUtils.copy(fis, out);
		out.flush();
				
		//스트림 닫기
		fis.close();
		out.close();	
		
	}

}
















