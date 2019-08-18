<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">板橋オークション</h1>
    </div>
  </section>

    <div class="container">
      <div class="row">
        <div class="col-md-12">
                 <h2 class="text-center">現在、おめでとうございます！！！あなたが最高入札者です！！！</h2>
        		 <p class="text-center"><img src = "${goods.image_uri}" width = "200px"></p>
        </div>
      </div>
    </div>
    <a href="../auction/BuyItemListController" class = "btn btn-danger btn-block btn-buy">購入一覧ページ</a>

 <a href="../auction/SellItemListController" class = "btn btn-outline-info btn-block btn-sell">出品一覧ページ</a>
</main>

<jsp:include page="footer.jsp" />