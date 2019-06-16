$(document).ready(function () {

    $(".btn-minus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $(".section > div > input").val(now);
        }else{
            $(".section > div > input").val("1");
        }
    })
    $(".btn-plus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            $(".section > div > input").val(parseInt(now)+1);
        }else{
            $(".section > div > input").val("1");
        }
    })

});
$(function (){
    function initialize(){
        let urlpath = window.location.href;
        let url = new URL(urlpath);
        let id = url.searchParams.get("id");
        console.log(id);
        $.get('/API/product?id=' + id,showImage,"json");
    }

    initialize();
    function showImage(data) {

        console.log(data);

        let content = `<div class="col-xs-4 item-photo">
                           <img src="${data[0].picture}" alt="${data[0].name}" />
                        </div>
                         <h3>Name: ${data[0].name}</h3>
                         <h3>Price: $ ${data[0].price}</h3>
                        <div class="col-xs-9">
                            <h3>Product Description:</h3>
                            <p class="card-text">
                                 ${data[0].description}
                            </p>
                        </div>
                        <div class="section">
                            <a href="/checkout?id=${data[0].id}" class="btn btn-success">
                                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                               </span> Add to cart
                            </a>
                         </div>`;
        let div = $("<div>").innerHTML = content;
        console.log(data[0].description);


        $("#addClass").append(div);
    }

});