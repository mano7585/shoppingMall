package com.shoppingMall.cart.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	
	private String member_id;	 // ȸ�����̵�
	private int product_no;		 // ��ǰ��ȣ
	private int count;			 // ����
	private Date cart_date;		 // ��ٱ��ϳ�¥
	private int origin_price;	 // ����
	private int sale_price;		 // ���ΰ�
	private int cart_no;		 // ��ٱ��Ϲ�ȣ
	
	
	public CartVO() {}

	public CartVO(String member_id, int product_no, int count, Date cart_date, int origin_price, int sale_price,
			int cart_no) {
		super();
		this.member_id = member_id;
		this.product_no = product_no;
		this.count = count;
		this.cart_date = cart_date;
		this.origin_price = origin_price;
		this.sale_price = sale_price;
		this.cart_no = cart_no;
	}


	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCart_date() {
		return cart_date;
	}

	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}

	public int getOrigin_price() {
		return origin_price;
	}

	public void setOrigin_price(int origin_price) {
		this.origin_price = origin_price;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}


	@Override
	public String toString() {
		return "CartVO [member_id=" + member_id + ", product_no=" + product_no + ", count=" + count + ", cart_date="
				+ cart_date + ", origin_price=" + origin_price + ", sale_price=" + sale_price + ", cart_no=" + cart_no
				+ "]";
	}

	
	

}
