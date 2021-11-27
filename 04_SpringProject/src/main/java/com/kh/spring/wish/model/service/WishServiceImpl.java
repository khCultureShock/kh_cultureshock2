package com.kh.spring.wish.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.spring.wish.model.dao.WishDAO;
import com.kh.spring.wish.model.vo.WishList;

@Service
public class WishServiceImpl implements WishService {

	@Inject //dao를 사용해야하기 때문에 @Inject로 의존성 부여
    WishDAO wishDao;
	
	@Override
	public List<WishList> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(WishList wish) {
		wishDao.insert(wish);

	}

	@Override
	public List<WishList> listWish(int wishUserNo) {
		return wishDao.listWish(wishUserNo);
	}

	@Override
	public void delete(int wishId) {
		wishDao.delete(wishId);

	}

	@Override
	public void deleteAll(int wishUserNo) {
		wishDao.deleteAll(wishUserNo);

	}

	@Override
	public void update(int wishId) {
		// TODO Auto-generated method stub

	}

	@Override
	public int countWish(int wishUserNo, int wishArtId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateCart(WishList wish) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyCart(WishList wish) {
		wishDao.modifyCart(wish);

	}

}
