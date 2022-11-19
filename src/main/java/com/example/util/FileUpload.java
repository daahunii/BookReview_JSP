package com.example.util;

import com.example.bean.BoardVO;
import com.example.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request){
        String filename="";
        int sizeLimit = 15 * 1024* 1024;
        String realPath = request.getServletContext().getRealPath("upload");
        System.out.println(realPath);
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;
        try{
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");
            one = new BoardVO();
            String seq = multipartRequest.getParameter("seq");
            if(seq != null && !seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setYoutuber(multipartRequest.getParameter("youtuber"));
            one.setLink(multipartRequest.getParameter("link"));
            one.setViews(Integer.parseInt(multipartRequest.getParameter("views")));
            if(seq != null && !seq.equals("")){
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(seq));
                if(filename != null & oldfilename !=null) FileUpload.deleteFile(request, oldfilename);
                else if(filename==null && oldfilename != null) filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch(IOException e){
            e.printStackTrace();
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");
        File f = new File(filePath + "/" + filename);
        if (f.exists()) f.delete();
    }
}
