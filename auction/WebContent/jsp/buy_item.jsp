<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />
<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">板橋オークション</h1>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-4">




 <!--    <form action="" method="get">		-->


            	 こちらの商品を購入でよろしいでしょうか？<br>



            	商品No:<c:out value= "${goods.goods_id}"/><!-- 商品ID	--><br>
            	商品名：<c:out value= "${goods.goods_name}"/><!-- 商品名	--><br>
	            商品画像：<img src = "${goods.image_uri}" width = "200px"><!-- 画像	--><br>

            	商品説明：<c:out value= "${goods.description}"/><!-- 商品説明	--><br>
            	<c:choose>
	              	<c:when test="${goods.bid_price == 0}">
	              		開始価格:<c:out value="${goods.price}"></c:out>円
	              	</c:when>
	              	<c:otherwise>
	              		入札最高額:<c:out value="${goods.bid_price}"></c:out>円
	              	</c:otherwise>
	              </c:choose>


				</div>


      </div>
    </div>
  </div>





       				購入金額を入力してください


<form method="post" action="/auction/BuyConfirmController">

					<c:choose>
	              		<c:when test="${goods.bid_price == 0}">
	              			<input type="text" name="price" value="${ goods.price+100 }" required="required">
	              		</c:when>

	              		<c:otherwise>
	              			<input type="text" name="price" value="${ goods.bid_price+100 }" required="required">
	              		</c:otherwise>
	              	</c:choose>




	                	<input type="submit" class="btn btn-danger"value="購入">
	                </form>

<br>
<br>

<a href="../auction/BuyItemListController" class = "btn btn-danger btn-block btn-buy">購入一覧ページ</a>

 <a href="../auction/SellItemListController" class = "btn btn-outline-info btn-block btn-sell">出品一覧ページ</a>





<!--  	                  		       <input type="text" name="price">
  		       <a class="btn btn-danger" href="buy_confirm.jsp">購入</a>
 -->
<!--
<input type="text" name="price">
<a href="buy_item.jsp">  <button type="submit" class="btn btn-danger">購入</button></a>

            </form>







            -->
<!--
<a href="buy_confirm.jsp">
buy_confirm.jspに飛びたい</a>
-->


</main>

<jsp:include page="footer.jsp" />