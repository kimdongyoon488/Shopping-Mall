<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="mall_top.jsp"%>

<!-- Hero Section Begin -->
<%--<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>카테고리</span>
                    </div>
                    <ul>
                        <c:forEach var="cdto" items="${listCategory}">
                            <li><a href="javascript:nextPage('${cdto.code}','${cdto.cname}')">${cdto.cname}[${cdto.code}]</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>--%>
<div class="col-lg-9">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>HIT Products</h4>
					<div class="latest-product__slider owl-carousel">
						<c:if test="${not empty viewGoods.HIT}">
							<c:choose>
								<c:when test="${fn:length(viewGoods.HIT) % 3 == 0 }">
									<c:set var="pageCnt" value="${fn:length(viewGoods.HIT) / 3 }"/>
								</c:when>
								<c:otherwise>
									<c:set var="pageCnt" value="${fn:length(viewGoods.HIT) / 3 + 1 }"/>
								</c:otherwise>
							</c:choose>
							<c:set var="co" value="0"/>
							<c:forEach var="cnt" begin="1" end="${pageCnt}">
								<div class="latest-prdouct__slider__item">
									<c:forEach var="vo" begin="1" end="3">
										<!-- 상품 strat -->
										<c:if test="${not empty viewGoods.HIT[co]}">
											<a href="/shopping/mall_goodsView?code=HIT&pnum=${viewGoods.HIT[co].pnum}" class="latest-product__item">
												<div class="latest-product__item__pic">
													<img src="images/${viewGoods.HIT[co].pimage}" alt="">
												</div>
												<div class="latest-product__item__text">
													<h6>${viewGoods.HIT[co].pname}</h6>
													<span>${viewGoods.HIT[co].price}원</span>
												</div>
											</a>
											<c:set var="co" value="${co+1}"/>
										</c:if>
										<!-- 상품 end -->
									</c:forEach>
								</div>
							</c:forEach>
							<c:set var="co" value="0"/>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>NEW Products</h4>
					<div class="latest-product__slider owl-carousel">
						<c:if test="${not empty viewGoods.NEW}">
							<c:choose>
								<c:when test="${fn:length(viewGoods.NEW) % 3 == 0 }">
									<c:set var="pageCnt" value="${fn:length(viewGoods.NEW) / 3 }"/>
								</c:when>
								<c:otherwise>
									<c:set var="pageCnt" value="${fn:length(viewGoods.NEW) / 3 + 1 }"/>
								</c:otherwise>
							</c:choose>

							<c:set var="co" value="0"/>
							<c:forEach var="cnt" begin="1" end="${pageCnt}">
								<div class="latest-prdouct__slider__item">
									<c:forEach var="vo" begin="1" end="3">
										<!-- 상품 strat -->
										<c:if test="${not empty viewGoods.NEW[co]}">
											<a href="/shopping/mall_goodsView?code=NEW&pnum=${viewGoods.NEW[co].pnum}" class="latest-product__item">
												<div class="latest-product__item__pic">
													<img src="images/${viewGoods.NEW[co].pimage}" alt="">
												</div>
												<div class="latest-product__item__text">
													<h6>${viewGoods.NEW[co].pname}</h6>
													<span>${viewGoods.NEW[co].price}원</span>
												</div>
											</a>
											<c:set var="co" value="${co+1}"/>
										</c:if>
										<!-- 상품 end -->
									</c:forEach>
								</div>
							</c:forEach>
							<c:set var="co" value="0"/>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>SALE Products</h4>
					<div class="latest-product__slider owl-carousel">
						<c:if test="${not empty viewGoods.SALE}">
							<c:choose>
								<c:when test="${fn:length(viewGoods.SALE) % 3 == 0 }">
									<c:set var="pageCnt" value="${fn:length(viewGoods.SALE) / 3 }"/>
								</c:when>
								<c:otherwise>
									<c:set var="pageCnt" value="${fn:length(viewGoods.SALE) / 3 + 1 }"/>
								</c:otherwise>
							</c:choose>

							<c:set var="co" value="0"/>
							<c:forEach var="cnt" begin="1" end="${pageCnt}">
								<div class="latest-prdouct__slider__item">
									<c:forEach var="vo" begin="1" end="3">
										<!-- 상품 strat -->
										<c:if test="${not empty viewGoods.SALE[co]}">
											<a href="/shopping/mall_goodsView?code=SALE&pnum=${viewGoods.SALE[co].pnum}" class="latest-product__item">
												<div class="latest-product__item__pic">
													<img src="images/${viewGoods.SALE[co].pimage}" alt="">
												</div>
												<div class="latest-product__item__text">
													<h6>${viewGoods.SALE[co].pname}</h6>
													<span>${viewGoods.SALE[co].price}원</span>
												</div>
											</a>
											<c:set var="co" value="${co+1}"/>
										</c:if>
										<!-- 상품 end -->
									</c:forEach>
								</div>
							</c:forEach>
							<c:set var="co" value="0"/>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</section>
<!-- Hero Section End -->

<%--<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg">
                        <h5><a href="#">Fresh Fruit</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg">
                        <h5><a href="#">Dried Fruit</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg">
                        <h5><a href="#">Vegetables</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg">
                        <h5><a href="#">drink fruits</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg">
                        <h5><a href="#">drink fruits</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Featured Product</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <li data-filter=".oranges">Oranges</li>
                        <li data-filter=".fresh-meat">Fresh Meat</li>
                        <li data-filter=".vegetables">Vegetables</li>
                        <li data-filter=".fastfood">Fastfood</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-7.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-8.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Featured Section End -->--%>

<!-- Banner Begin -->
<%--<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="img/banner/banner-1.jpg" alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="img/banner/banner-2.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
</div>--%>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<%--section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>HIT Products</h4>
                    <div class="latest-product__slider owl-carousel">
                            <c:if test="${not empty viewGoods.HIT}">
                                <c:choose>
                                    <c:when test="${fn:length(viewGoods.HIT) % 3 == 0 }">
                                        <c:set var="pageCnt" value="${fn:length(viewGoods.HIT) / 3 }"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="pageCnt" value="${fn:length(viewGoods.HIT) / 3 + 1 }"/>
                                    </c:otherwise>
                                </c:choose>
                            <c:set var="co" value="0"/>
                            <c:forEach var="cnt" begin="1" end="${pageCnt}">
                                <div class="latest-prdouct__slider__item">
                                        <c:forEach var="vo" begin="1" end="3">
                                            <!-- 상품 strat -->
                                                <c:if test="${not empty viewGoods.HIT[co]}">
                                                    <a href="/shopping/mall_goodsView?code=HIT&pnum=${viewGoods.HIT[co].pnum}" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="images/${viewGoods.HIT[co].pimage}" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>${viewGoods.HIT[co].pname}</h6>
                                                            <span>${viewGoods.HIT[co].price}원</span>
                                                        </div>
                                                    </a>
                                                    <c:set var="co" value="${co+1}"/>
                                                </c:if>
                                            <!-- 상품 end -->
                                        </c:forEach>
                                </div>
                            </c:forEach>
                            <c:set var="co" value="0"/>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>NEW Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <c:if test="${not empty viewGoods.NEW}">
                            <c:choose>
                                <c:when test="${fn:length(viewGoods.NEW) % 3 == 0 }">
                                    <c:set var="pageCnt" value="${fn:length(viewGoods.NEW) / 3 }"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="pageCnt" value="${fn:length(viewGoods.NEW) / 3 + 1 }"/>
                                </c:otherwise>
                            </c:choose>

                            <c:set var="co" value="0"/>
                            <c:forEach var="cnt" begin="1" end="${pageCnt}">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="vo" begin="1" end="3">
                                        <!-- 상품 strat -->
                                        <c:if test="${not empty viewGoods.NEW[co]}">
                                            <a href="/shopping/mall_goodsView?code=NEW&pnum=${viewGoods.NEW[co].pnum}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="images/${viewGoods.NEW[co].pimage}" alt="">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${viewGoods.NEW[co].pname}</h6>
                                                    <span>${viewGoods.NEW[co].price}원</span>
                                                </div>
                                            </a>
                                            <c:set var="co" value="${co+1}"/>
                                        </c:if>
                                        <!-- 상품 end -->
                                    </c:forEach>
                                </div>
                            </c:forEach>
                            <c:set var="co" value="0"/>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>SALE Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <c:if test="${not empty viewGoods.SALE}">
                            <c:choose>
                                <c:when test="${fn:length(viewGoods.SALE) % 3 == 0 }">
                                    <c:set var="pageCnt" value="${fn:length(viewGoods.SALE) / 3 }"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="pageCnt" value="${fn:length(viewGoods.SALE) / 3 + 1 }"/>
                                </c:otherwise>
                            </c:choose>

                            <c:set var="co" value="0"/>
                            <c:forEach var="cnt" begin="1" end="${pageCnt}">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="vo" begin="1" end="3">
                                        <!-- 상품 strat -->
                                        <c:if test="${not empty viewGoods.SALE[co]}">
                                            <a href="/shopping/mall_goodsView?code=SALE&pnum=${viewGoods.SALE[co].pnum}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="images/${viewGoods.SALE[co].pimage}" alt="">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${viewGoods.SALE[co].pname}</h6>
                                                    <span>${viewGoods.SALE[co].price}원</span>
                                                </div>
                                            </a>
                                            <c:set var="co" value="${co+1}"/>
                                        </c:if>
                                        <!-- 상품 end -->
                                    </c:forEach>
                                </div>
                            </c:forEach>
                            <c:set var="co" value="0"/>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>--%>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<%--<section class="from-blog spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title from-blog__title">
					<h2>From The Blog</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="img/blog/blog-1.jpg" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5><a href="#">Cooking tips make cooking simple</a></h5>
						<p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="img/blog/blog-2.jpg" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
						<p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="img/blog/blog-3.jpg" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5><a href="#">Visit the clean farm in the US</a></h5>
						<p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>--%>
<!-- Blog Section End -->

<%@ include file="mall_bottom.jsp"%>
