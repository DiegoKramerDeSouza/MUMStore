$(function () {

    setTimeout(() => $("#msg-success").slideUp(300), 1500);
    setTimeout(() => $("#msg-error").slideUp(300), 1500);
    $.get('/API/product', parseData,"json");

    function parseData(data) {
        console.log(data.picture);
        for(var i=0; i<data.length;i++){
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
                        <form action="/API/product" method="post">
                          <input type="hidden" value="1" name="qtd" />
                          <input type="hidden" value="${data[0].name}" name="name" />
                          <input type="hidden" value="${data[0].id}" name="id" />
                          <input type="hidden" value="${data[0].price}" name="price" />
                          <input type="hidden" value="${data[0].picture}" name="pic" />
                          <input type="hidden" value="${data[0].description}" name="desc" />
                          <input type="hidden" value="${data[0].type}" name="type" />
                          <input type="submit"  class="btn btn-success" value="Add to Cart">
                         </form>
                        </div>
                    </div>
                   </div>`;



            let div = $("<span>").innerHTML = content;
            $("#appendData").append(div);

        }
    };

});