package travel.t_board.vo;

public class T_boardVO {

	private long no;
	private String title, content, writer, place, startDate, endDate, staff, photo;
	private long hit;
	private String tags;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	@Override
	public String toString() {
		return "T_boardVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", place="
				+ place + ", startDate=" + startDate + ", endDate=" + endDate + ", staff=" + staff + ", photo=" + photo
				+ ", hit=" + hit + ", tags=" + tags + "]";
	}
	
	
}
