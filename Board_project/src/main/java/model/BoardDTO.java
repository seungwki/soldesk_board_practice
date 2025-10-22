package model;

import lombok.Data;

@Data
public class BoardDTO {
	private int num; //글 번호(자동 생성)
	private String writer; //작성자
	private String email; //이메일
	private String subject; //...?
	private String password; //비밀번호
	private String reg_date; //등록일자
	private int ref; //참조 글 번호, 참조하지 않는다면 num과 동일한 값을 갖는다
	private int re_step; //참조 글 계층. 게시글은 1, 댓글은 2, 대댓글은 3...
	private int re_level; //참조 글 순서
	private int readcount; //조회수
	private String content; //내용
}
/*
 * 답글 개념이 포함 된, 스레드 게시판이 될 예정이다
 * */