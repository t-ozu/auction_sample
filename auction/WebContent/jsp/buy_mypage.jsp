<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

.goods-price{
  font-size: 1.3rem;
 }

.goods-title{
margin: 0;
}

.goods-price:before{
 content: "¥ "
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

    <div class="container">
    <h2>マイページ</h2>
        <div class="col-md-12">
        <h3>現在入札中の商品一覧</h3>
        	<div class="row">
 			<c:forEach var="mypageList" items="${ bidlist }" >

	          <div class="col-md-3">

	            <img class = "img-thumbnail" src="${mypageList.image_uri}">
	            	<p class="goods-title text-center"><c:out value= "${mypageList.goods_name}" /></p>
	            <div class="card-body">
	              <p class="goods-price text-center"><strong><c:out value= "${mypageList.bid_price}" /></strong></p>
                <div class="d-flex justify-content-between align-items-center">
	                <form class="btn-group btn-block" method="post" action="/auction/BuyItemController">
	                	<input type="hidden" name="goods_id" value="${mypageList.goods_id}">
	                	<input type="submit" class="btn btn-danger"value="再購入ページ">
	                </form>
	              </div>
	            </div>
	          </div>
			</c:forEach>
			<form class="btn-group btn-block" method="get" action="/auction/BuyItemListController">
	                	<input type="hidden" name="goods_id" value="${itemsList.goods_id}">
	                	<input type="submit" class="btn btn-primary"value="戻る">
	                </form>

	        </div>



			</div>
      </div>


</main>

<jsp:include page="footer.jsp" />