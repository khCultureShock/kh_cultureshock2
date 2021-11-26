package com.kh.spring.wish.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.wish.model.vo.WishList;

@Repository
public class WishDAOImpl implements WishDAO {
	
	@Inject
    SqlSession sqlSession;

	@Override
	public List<WishList> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(WishList wish) {
		sqlSession.insert("wishSQL.insert", wish);

	}

	@Override
	public List<WishList> listWish(int wishUserNo) {
		return sqlSession.selectList("wishSQL.listWish", wishUserNo);
	}

	@Override
	public void delete(int wishId) {
		sqlSession.delete("wishSQL.delete", wishId);

	}

	@Override
	public void deleteAll(int wishUserNo) {
		sqlSession.delete("wishSQL.deleteAll", wishUserNo);

	}

	@Override
	public void update(int wish_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int countWish(int wish_user_no, int wish_art_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateCart(WishList wish) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyCart(WishList wish) {
		sqlSession.update("wish.modify", wish);

	}

}
