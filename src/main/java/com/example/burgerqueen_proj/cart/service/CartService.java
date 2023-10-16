package com.example.burgerqueen_proj.cart.service;


import com.example.burgerqueen_proj.cart.entity.Cart;
import com.example.burgerqueen_proj.cart.entity.CartProduct;
import com.example.burgerqueen_proj.cart.repository.CartProductRepository;
import com.example.burgerqueen_proj.cart.repository.CartRepository;
import com.example.burgerqueen_proj.exception.BusinessLogicException;
import com.example.burgerqueen_proj.exception.ExceptionCode;
import com.example.burgerqueen_proj.member.entity.Member;
import com.example.burgerqueen_proj.member.service.MemberService;
import com.example.burgerqueen_proj.product.entity.Product;
import com.example.burgerqueen_proj.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.beans.Transient;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartService {


    private final MemberService memberService;
    private final CartRepository cartRepository;
    private final ProductService productService;

    private  final CartProductRepository cartProductRepository;


    public Cart createCart(Cart cart){
        //회원이 존재하는지 확인하고, cart를 생성함

        verifyCart(cart);
        Cart savedCart = saveCart(cart);

        return savedCart;
    }

    public Cart findCartByMember(Member member){

        return cartRepository.findByMember(member);
    }

    @Transactional
    public Cart updateCart(Cart cart){
        Cart findCart = findVerifiedCart(cart.getCartId());




//        Optional.ofNullable(cart.getCartProducts())
//                .ifPresent(cartProducts -> findCart.setCartProducts(cartProducts));


        cartProductRepository.deleteAllByCart(findCart);

        cart.getCartProducts()
                .forEach(cartProduct ->  {
                    cartProduct.addProduct(productService.findVerifyProduct(cartProduct.getProduct().getProductId()));
                    System.out.println(cartProduct.getProduct().getProductId());
                    //findCart.addCartProduct(cartProduct);
                    //System.out.println(findCart.getCartProducts().get(0).getProduct().getProductId());
                });
        findCart.updateCartProducts(cart.getCartProducts());

        return cartRepository.save(findCart);

    }




    public Cart findcart(long cartId){
        Cart findCart = findVerifiedCart(cartId);
        return findCart;
    }

    public Page<Cart> findCarts(int page, int size){
        return cartRepository.findAll(PageRequest.of(page,size, Sort.by("cartId").descending()));
    }

    public void cancelCart(long cartId){ ////////// 수정수정수정 수정
        Cart findCart = findVerifiedCart(cartId);
        cartRepository.delete(findCart);
    }
    public void deleteCartProduct(long cartId, long productId){
        Cart findCart = findVerifiedCart(cartId);
        Product findProduct = productService.findProduct(productId);
        CartProduct findCartProduct = cartProductRepository.findByCartAndProduct(findCart,findProduct);
        System.out.println(findCartProduct.getProduct().getProductName());
//        CartProduct findCartProduct = findVerifiedCartProduct(productId);
        cartProductRepository.delete(findCartProduct);

    }



    private Cart findVerifiedCart   (long cartId) {
        Optional<Cart> optionalCart = cartRepository.findById(cartId);
        Cart findCart =
                optionalCart.orElseThrow(() ->
                        new BusinessLogicException(ExceptionCode.CART_NOT_FOUND));
        return findCart;
    }




    public CartProduct findVerifiedCartProduct   (long cartProductId) {
        Optional<CartProduct> optionalCartProduct = cartProductRepository.findById(cartProductId);
        CartProduct findCart =
                optionalCartProduct.orElseThrow(() ->
                        new BusinessLogicException(ExceptionCode.CART_NOT_FOUND));
        return findCart;
    }



    private void verifyCart(Cart cart) {
        // 회원이 존재하는지 확인
        cart.setMember(memberService.findMember(cart.getMember().getMemberId()));

        //상품이 존재하는지 확인
        cart.getCartProducts().stream()
                .forEach(cartProduct ->  productService.findVerifyProduct(cartProduct.getProduct().getProductId()));



//        // 커피가 존재하는지 확인
//        cart.getCartProducts().stream()
//                .forEach(cartProduct ->  productService.findVerifyProduct(cartProduct.getProduct().getProductId()));

    }

    private Cart saveCart(Cart cart) {

        //프로덕트 세팅

        //카트프로덕트 세팅
        int totalPrice = 0;
        int totalCount = 0;
        for(int i=0;i<cart.getCartProducts().size();i++){

            cart.getCartProducts().get(i).setProduct(productService.findProduct(cart.getCartProducts().get(i).getProduct().getProductId()));


            totalPrice+=cart.getCartProducts().get(i).getProduct().getProductPrice()*cart.getCartProducts().get(i).getQuantity();
            totalCount+=cart.getCartProducts().get(i).getQuantity();
        }
        cart.setTotalPrice(totalPrice);
        cart.setTotalCount(totalCount);



        return cartRepository.save(cart);
    }

}
