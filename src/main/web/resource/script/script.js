$(function () {
   // function addProduct(){
        // var imagesrc = $("#productImage").val();
        // var price = $("#productPrice").val();
        // var description = $("#productDesc").val();
        $.get('/API/product', parseData,"json");
   // };

    function parseData(data) {
        console.log(data.picture);
        for(var i=0; i<data.length;i++){
           // console.log(data[i].price);
            var imagesrc = $("#productImage").txt(data[i].picture);
            var price = $("#productPrice").text(data[i].price);
            var description = $("#productDesc").text(data[i].description);
            var  listItem = $("#appendData").append(imagesrc).append(price).append(description);
            $("#showData").append(listItem);
        }

    };
});