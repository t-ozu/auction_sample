<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<style>

.sell-btn {
	font-size: 2rem;
	font-weight: bold;
}

.sell-btn:hover {
	text-decoration: none;
}

.sell-thumb{
	height: 200px;
	overflow: hidden;
}

</style>

<main role="main">
  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">板橋オークション</h1>
    </div>
  </section>

<div class="album py-5 bg-light">
    <div class="container">
    <h2>お客様の出品一覧</h2>

    <div class="row">
		<c:forEach var="sellinglistitem" items="${sellinglist}">
		        <div class="col-md-3">
		          <div class="card mb-3 shadow-sm">
		            <img class="sell-thumb" src="${sellinglistitem.image_uri}">
						<p class="text-center"><strong><c:out value="${sellinglistitem.goods_name}"/></strong></p>
		            <div class="card-body">
		              <p class="card-text"><c:out value="${sellinglistitem.description}"/></p>
			             <a class="btn btn-block btn-secondary" href="SellControlController?goods_id=${sellinglistitem.goods_id}">管理する</a>
		            </div>
		          </div>
		        </div>
		</c:forEach>
	</div>


 <a href="jsp/sell_item.jsp"><button type="submit" class="btn btn-danger btn-block sell-btn">新規出品</button></a>





      </div>
    </div>


</main>

<jsp:include page="footer.jsp" />