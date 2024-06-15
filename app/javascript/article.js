window.addEventListener('turbo:load', function(){
  const articles = document.querySelectorAll(".item-lists>.list");
  const purchaseBtn = document.querySelector(".purchase-btn");

  articles.forEach(function(article){
    article.addEventListener("mouseover", function(){
      this.setAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.5);");
    });
    article.addEventListener('mouseout', function() {
      this.removeAttribute("style");
    });
  });

  purchaseBtn.addEventListener("mouseover", function(){
    this.setAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.5);");
  });
  purchaseBtn.addEventListener('mouseout', function() {
    this.removeAttribute("style");
  });
});