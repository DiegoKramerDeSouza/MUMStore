
$(window).scroll(function() {
    $("#theFixed").css("top", Math.max(0, 850 - $(this).scrollTop()));

});

    $(function () {
        $.get('/API/product', parseData, "json");

        function parseData(data) {
            console.log(data.picture);
            for (var i = 0; i < data.length; i++) {
                console.log(data[i].price);
                //console.log(data[i].picture);

                let content =
                    `<div class="col-sm-12 col-md-6 col-lg-4">
                    <div class="card h-100">    
                        <a href="/product?id=${data[i].id}">
                          <p><img id="productImage_${i}" class="card-img-top" src="${data[i].picture}" alt="${data[i].name}"/></p>
                        </a>
                        <div class="card-body">
                          <h4 class="card-title">
                            <a href="#">${data[i].name}</a>
                          </h4>
                          <p><h5 id="productPrice">$ ${data[i].price} </h5></p>
                          <p class="card-text text-truncate" id="productDesc" title="${data[i].description}">
                            ${data[i].description}
                          </p>
                        </div>
                        <div class="card-footer">
                          <a href="/checkout?id=${data[i].id}" class="btn btn-success">Add to Cart</a>
                        </div>
                    </div>
                   </div>`;


                let div = $("<span>").innerHTML = content;
                $("#appendData").append(div);

            }
        };

    });


