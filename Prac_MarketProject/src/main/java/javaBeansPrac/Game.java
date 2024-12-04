package javaBeansPrac;

import java.io.Serializable;

public class Game implements Serializable {

	private String gameId;
	private String imgUrl; //나중에지울것
	private String name;
	private int gamePrice;
	private String developer;
	private String publisher;
	private String description;
	private String genre;
	private String releaseDate;
	private Boolean haveDlc;
	private String mainimg;
	private String subimg1;
	private String subimg2;
	private String subimg3;
	private String subimg4;
	private int quantity;
	
	public String getGameId() {
		return gameId;
	}
	public void setGameId(String gameId) {
		this.gameId = gameId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGamePrice() {
		return gamePrice;
	}
	public void setGamePrice(int gamePrice) {
		this.gamePrice = gamePrice;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Boolean getHaveDlc() {
		return haveDlc;
	}
	public void setHaveDlc(Boolean haveDlc) {
		this.haveDlc = haveDlc;
	}
 	public String getMainimg() {
		return mainimg;
	}
	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}
	public String getSubimg1() {
		return subimg1;
	}
	public void setSubimg1(String subimg1) {
		this.subimg1 = subimg1;
	}
	public String getSubimg2() {
		return subimg2;
	}
	public void setSubimg2(String subimg2) {
		this.subimg2 = subimg2;
	}
	public String getSubimg3() {
		return subimg3;
	}
	public void setSubimg3(String subimg3) {
		this.subimg3 = subimg3;
	}
	public String getSubimg4() {
		return subimg4;
	}
	public void setSubimg4(String subimg4) {
		this.subimg4 = subimg4;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}