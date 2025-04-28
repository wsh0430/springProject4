package com.spring.springProject4.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.springProject4.dao.CommunityDao;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.CommentVo;
import com.spring.springProject4.vo.LikesVo;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao communityDao;
	
	@Override
	public List<CategoryVo> getMainCategoryList() {
		return communityDao.getMainCategoryList();
	}
	
	@Override
	public List<CategoryVo> getSubCategoryList(String pName) {
		return communityDao.getSubCategoryList(pName);
	}
	
	@Override
	public List<BoardVo> getBoardList(String category, int startIndexNo, int pageSize, String search, String searchString) {
		return communityDao.getBoardList(category, startIndexNo, pageSize, search, searchString);
	}

	@Override
	public BoardVo getBoardVo(int boardIdx) {
		return communityDao.getBoardVo(boardIdx);
	}

	@Override
	public LikesVo getLikes(String part, int partIdx, String memberId) {
		return communityDao.getLikes(part, partIdx, memberId);
	}
	
	@Override
	public List<LikesVo> getLikesVos(String part, String parent, int parentIdx, String memberId) {
		return communityDao.getLikesVos(part, parent, parentIdx, memberId); 
	}
	
	
	@Override
	public List<CommentVo> getCommentVos(int boardIdx) {
		return communityDao.getCommentVos(boardIdx);
	}

	@Override
	public List<CommentVo> getReplyList(int parentIdx) {
		return communityDao.getReplyList(parentIdx);
	}

	
	@Override
	public int setCreateLikes(String part, int partIdx, String memberId, String parent, int parentIdx) {
		return communityDao.setCreateLikes(part, partIdx, memberId, parent, parentIdx);
	}

	@Override
	public int setDeleteLikes(int idx) {
		return communityDao.setDeleteLikes(idx);
	}

	@Override
	public int setUpdateLikeCnt(String part, int partIdx, int n) {
		return communityDao.setUpdateLikeCnt(part, partIdx, n);
		
	}

	@Override
	public int setCreateComment(CommentVo cmtVo) {
		return communityDao.setCreateComment(cmtVo);
	}

	@Override
	public int setCreateReply(CommentVo cmtVo) {
		return communityDao.setCreateReply(cmtVo);
	}

	@Override
	public int setUpdateCommetCnt(String part, int partIdx) {
		return communityDao.setUpdateCommetCnt(part, partIdx);
	}

	@Override
	public int setUpdateComment(int idx, String content) {
		return communityDao.setUpdateComment(idx, content);
	}

	@Override
	public int setUpdateDeleteCheck(String part,int idx) {
		return communityDao.setUpdateDeleteCheck(part, idx);
	}

	@Override
	public int setCreateBoard(BoardVo vo) {
		return communityDao.setCreateBoard(vo);
	}

	@Override
	public int setUpdateBoardViewCnt(int boardIdx) {
		return communityDao.setUpdateBoardViewCnt(boardIdx);
	}

	@Override
	public int setUpdateBoard(BoardVo vo) {
		return communityDao.setUpdateBoard(vo);
	}

	@Override
	public int setUpdateBoardDeleteCheck(int boardIdx) {
		return communityDao.setUpdateBoardDeleteCheck(boardIdx);
	}

	@Override
	public void imgCheck(String content) {		
		//     				 0         1         2         3         4         4
		//     				 01234567890123456789012345678901234567890123456789012345678
		// <img src="/springProject4/data/ckeditor/250321140356_2503.jpg" style="height:854px; width:1280px" />
			
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
			
		int position = 35;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		System.out.println("nextImg: " + nextImg);
		boolean sw = true;
			
		while(sw) {
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));
				
			String origFilePath = realPath + "ckeditor/" + imgFile;
			String copyFilePath = realPath + "cmtyBoard/" + imgFile;
				
			fileCopyCheck(origFilePath, copyFilePath);
			
			if(nextImg.indexOf("src=\"/") == -1) sw = false;
			else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
	}
	
	// 파일 복사처리
		private void fileCopyCheck(String origFilePath, String copyFilePath) {
			try {
				FileInputStream fis = new FileInputStream(new File(origFilePath));
				FileOutputStream fos = new FileOutputStream(new File(copyFilePath));
				
				byte[] b = new byte[2048];
				int cnt = 0;
				while((cnt = fis.read(b)) != -1) {
					fos.write(b, 0, cnt);
				}
				fos.flush();
				fos.close();
				fis.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 게시글에 사진포함되어 있을때 사진 삭제하기
		@Override
		public void imgDelete(String content) {
			//      0         1         2         3         4         4
			//      01234567890123456789012345678901234567890123456789012345678
			// <img src="/JspringProject/data/board/250321140356_2503.jpg" style="height:854px; width:1280px" />
			
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
			
			int position = 32;
			String nextImg = content.substring(content.indexOf("src=\"/") + position);
			boolean sw = true;
			
			while(sw) {
				String imgFile = nextImg.substring(0, nextImg.indexOf("\""));
				
				String origFilePath = realPath + "cmtyBoard/" + imgFile;
				
				fileDelete(origFilePath);
				
				if(nextImg.indexOf("src=\"/") == -1) sw = false;
				else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
		
		// 파일 삭제처리
		private void fileDelete(String origFilePath) {
			File delFile = new File(origFilePath);
			if(delFile.exists()) delFile.delete();
		}
		
		@Override
		public void imgBackup(String content) {
			//      0         1         2         3         4         4
			//      01234567890123456789012345678901234567890123456789012345678
			// <img src="/JspringProject/data/board/250321140356_2503.jpg" style="height:854px; width:1280px" />
			// <img src="/JspringProject/data/ckeditor/250321140356_2503.jpg" style="height:854px; width:1280px" />
			
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
			
			int position = 32;
			String nextImg = content.substring(content.indexOf("src=\"/") + position);
			boolean sw = true;
			
			while(sw) {
				String imgFile = nextImg.substring(0, nextImg.indexOf("\""));
				
				String origFilePath = realPath + "cmtyBoard/" + imgFile;
				String copyFilePath = realPath + "ckeditor/" + imgFile;
				
				fileCopyCheck(origFilePath, copyFilePath);
				
				if(nextImg.indexOf("src=\"/") == -1) sw = false;
				else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}

		@Override
		public List<BoardVo> getHotBoardList(String category) {
			return communityDao.getHotBoardList(category);
		}
}
