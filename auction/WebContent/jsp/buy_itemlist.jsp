<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>

.goods-price{
  font-size: 1rem;
 }

.goods-title{
margin: 0;
}


.col-md-3{
	background-color: #FFF;
}

.col-md-3+.col-md-3{
	padding-left: 1rem;
}

</style>

<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">板橋オークション</h1>
    </div>
  </section>

  <script type="text/javascript" src="/auction/js/jquery.js"></script>

<script>


$(function(){

	$('.col-md-3').each(function(){

		var timeArea = $(this).find('.dead-time');

		var deadTimes =  new Date(timeArea.text().trim());
		var remainingTimes = Math.ceil(new Date(deadTimes - new Date())/60000);

		if(remainingTimes > 0) {
			timeArea.text(remainingTimes+"分");
		} else {
			timeArea.text("オークション終了");
		}

	});

});

 </script>
			<form class="btn-group btn-block" method="get" action="MypageController">
	                	<input type="hidden" name="goods_id" value="${mypagesList.goods_id}">
	                	<input type="submit" class="btn btn-default btn-block"value="マイページへ">
	        </form>
    <div class="container">
    <h2>購入商品一覧ページ</h2>


    <div class="row">
        <div class="col-md-9  order-md-1">
        	<div class="row">
 			<c:forEach var="itemsList" items="${ goodslist }" >
	          <div class="col-md-3">
	            <img class="img-thumbnail" src="${itemsList.image_uri}">
	            	<p class="goods-title text-center"><c:out value= "${itemsList.goods_name}" /></p>
	            <div class="card-body">
	              <p class="goods-price text-center">開始価格：<strong><c:out value= "${itemsList.price}" />円</strong></p>
	              <c:choose>
	              	<c:when test="${itemsList.bid_price == 0}">
	              		<p class="goods-price text-center">現在未入札です</p>
	              	</c:when>
	              	<c:otherwise>
	              		<p class="goods-price text-center">現在最高価格：<strong><c:out value= "${itemsList.bid_price}" />円</strong></p>
	              	</c:otherwise>
	              </c:choose>
	              <p class="goods-price text-center">出品者：<strong><c:out value= "${itemsList.owner_name}" />さん</strong></p>
	              <p class="goods-price text-center">終了時刻：<strong><fmt:parseDate type="BOTH" value= "${itemsList.dead_time}" pattern="yyyy-MM-dd HH:mm:ss" var = "deadtime"   />
	              <fmt:formatDate value="${deadtime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></strong></p>


	              <p class="goods-price text-center">残り時間：<strong class="dead-time"><fmt:parseDate type="BOTH" value= "${itemsList.dead_time}" pattern="yyyy-MM-dd HH:mm:ss" var = "deadtime"   />
	              <fmt:formatDate value="${deadtime}" pattern="yyyy MM-dd HH:mm:ss" /></strong></p>

                <div class="d-flex justify-content-between align-items-center">

	                <form class="btn-group btn-block" method="post" action="/auction/BuyItemController">
	                	<input type="hidden" name="goods_id" value="${itemsList.goods_id}">
	                	<input type="submit" class="btn btn-danger"value="購入ページ">
	                </form>
	              </div>
	            </div>
	          </div>
			</c:forEach>

	        </div>
			</div>


			<div class="col-md-3 order-md-2">
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
            	<a href="../auction/BuyItemListController">購入一覧ページ</a>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
            	<a href="../auction/SellItemListController">出品一覧ページ</a>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">

            <form method="get" action="MypageController">
	                	<input type="hidden" name="goods_id" value="${mypagesList.goods_id}">
	                	<input type="submit" class="btn btn-primary"value="マイページへ">
	       </form>

            </li>
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Redeem</button>
              </div>
            </div>
          </form>
        </div>

</div>


      </div>
<br>
<br>

<a href="../auction/BuyItemListController" class = "btn btn-danger btn-block btn-buy">購入一覧ページ</a>

 <a href="../auction/SellItemListController" class = "btn btn-outline-info btn-block btn-sell">出品一覧ページ</a>


</main>

<jsp:include page="footer.jsp" />