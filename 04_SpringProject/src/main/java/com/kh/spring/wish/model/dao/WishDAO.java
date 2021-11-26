package com.kh.spring.wish.model.dao;

import java.util.List;

import com.kh.spring.wish.model.vo.WishList;

public interface WishDAO {

	List<WishList> cartMoney();
    void insert(WishList wish); //장바구니 추가
    List<WishList> listWish(int wishUserNo); //장바구니 목록
    void delete(int wishId); //장바구니 개별 삭제
    void deleteAll(int wishUserNo); //장바구니 비우기
    void update(int wishId); 
    int countWish(int wishUserNo, int wishArtId); //장바구니 상품 갯수
    void updateCart(WishList wish); //장바구니 수정 
    void modifyCart(WishList wish);
	
}
