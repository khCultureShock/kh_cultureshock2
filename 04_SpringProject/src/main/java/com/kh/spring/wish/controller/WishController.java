package com.kh.spring.wish.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.wish.model.service.WishService;
import com.kh.spring.wish.model.vo.WishList;

@Controller
public class WishController {
	
	@Autowired
	WishService wishService;
	
	@RequestMapping("/wish/insert.do") //세부적인 url mapping

    public String insert(@RequestParam("artId") String artNo, 
            HttpSession session) {

        //@ModelAttribute는 sumit된 form의 내용을 저장해서 전달받거나, 다시 뷰로 넘겨서 출력하기 위해 사용되는 오브젝트 이다
        //도메인 오브젝트나 DTO의 프로퍼티에 요청 파라미터를 바인딩해서 한번에 받으면 @ModelAttribute 라고 볼 수 있다.
        //@ModelAttribute는 컨트롤러가 리턴하는 모델에 파라미터로 전달한 오브젝트를 자동으로 추가해준다.
        //로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인

        int userNo=((Member)session.getAttribute("member")).getUserNo();
        WishList wish = new WishList();
        wish.setWishUserNo(userNo);
        wish.setWishArtId(artNo);
        
        // System.out.println("wish : " + wish); 여기까지 문제 없음(컨트롤러까지 들어옴)
        wishService.insert(wish); //장바구니 테이블에 저장됨
        
        return "redirect:/wish/wishList.do"; //장바구니 목록으로 이동
    }
	
	@RequestMapping("/wish/wishList.do")
    public ModelAndView list(HttpSession session, ModelAndView mav) {
        Map<String, Object> map=new HashMap<>();

        //hashmap은 map(key,value)로 이뤄져 있고,
        //key값은 중복이 불가능 하고 value는 중복이 가능하다.
        //value에 null값도 사용이 가능하다.
        //전달할 정보가 많을 경우에는 HashMap<>을 사용하는 것이 좋다.
        //장바구니에 담을 값들이 많기 때문에 여기선 HashMap<>를 사용한다.
                

        int userNo=((Member)session.getAttribute("member")).getUserNo();

        //session에 저장된 userid를 getAttribute()메소드를 사용해서 얻어오고 오브젝트 타입이기 때문에
        //String 타입으로 타입변환한다.

        if(userNo!=0) { 
            //로그인한 상태이면 실행
            List<WishList> list=wishService.listWish(userNo);//장바구니 목록
            
           
           System.out.println("list : " + list);
            
            map.put("list", list); //장바구니 목록
            map.put("count", list.size()); //레코드 갯수

           //ModelAndView mav에 이동할 페이지의 이름과 데이터를 저장한다.

            mav.setViewName("wish/wishList"); //이동할 페이지의 이름
            mav.addObject("map", map); //데이터 저장
           
        }
        return mav; //화면 이동
    }
	
	@RequestMapping("/wish/delete.do")
    public String delete(@RequestParam int wishId) {
		
        wishService.delete(wishId);
        return "redirect:/wish/wishList.do";
    }


}
