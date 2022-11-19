package com.example.bookreview.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.bean.BoardVO;
import com.example.util.JDBCUtil;

public class BoardDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into PLAYLIST (title, content, youtuber, link, views, photo) values (?,?,?,?,?,?);";
    private final String BOARD_UPDATE = "update PLAYLIST set title=?, content=?, youtuber=?, link=?, views=?, photo=? where seq=?";
    private final String BOARD_DELETE = "delete from PLAYLIST  where seq=?";
    private final String BOARD_GET = "select * from PLAYLIST  where seq=?";
    private final String BOARD_LIST = "select * from PLAYLIST order by seq desc";

    public int insertBoard(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getContent());
            stmt.setString(3, vo.getYoutuber());
            stmt.setString(4, vo.getLink());
            stmt.setInt(5, vo.getViews());
            stmt.setString(6, vo.getPhoto());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 글 삭제
    public void deleteBoard(BoardVO vo) {
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, vo.getSeq());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateBoard(BoardVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_UPDATE);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getContent());
            stmt.setString(3, vo.getYoutuber());
            stmt.setString(4, vo.getLink());
            stmt.setInt(5, vo.getViews());
            stmt.setString(6, vo.getPhoto());
            stmt.setInt(7, vo.getSeq());


            System.out.println(vo.getTitle() + "-" + vo.getContent() + "-" + vo.getYoutuber() + "-" + vo.getLink()+"-" + vo.getViews() + "-" + vo.getSeq());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public BoardVO getBoard(int seq) {
        BoardVO one = new BoardVO();
        System.out.println("===> JDBC로 getBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setSeq(rs.getInt("seq"));
                one.setTitle(rs.getString("title"));
                one.setContent(rs.getString("content"));
                one.setYoutuber(rs.getString("youtuber"));
                one.setLink(rs.getString("link"));
                one.setViews(rs.getInt("views"));
                one.setPhoto(rs.getString("photo"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<BoardVO> getBoardList(){
        List<BoardVO> list = new ArrayList<BoardVO>();
        System.out.println("===> JDBC로 getBoardList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                BoardVO one = new BoardVO();
                one.setSeq(rs.getInt("seq"));
                one.setTitle(rs.getString("title"));
                one.setContent(rs.getString("content"));
                one.setYoutuber(rs.getString("youtuber"));
                one.setLink(rs.getString("link"));
                one.setViews(rs.getInt("views"));
                one.setPhoto(rs.getString("photo"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public String getPhotoFilename(int seq){
        String filename = null;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()){
                filename = rs.getString("photo");
            }
            rs.close();
        } catch(Exception e){
            e.printStackTrace();
        }
        System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
        return filename;
    }
}
