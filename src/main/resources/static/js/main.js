function ajaxAddToCart(productId) {
    if (!document.getElementById('cart-button')) {
        document.location.href = "/user/profile";
        return;
    }
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    $.ajax({
        method: "GET",
        url: "/addtocart",
        data: {id: productId},
        dataType: 'json',
        success: function (data) {
            $("#cart-button").text(data['totalPrice'] + 'Р: ');
            var span = '<span class="badge badge-light">' + data['totalItems'] + '</span>';
            $("#cart-button").append(span);

        },
        error: function () {
            alert('error!');
        }
    });
}

function ajaxEmployerDelete(idEmp) {
    if (confirm('Are you sure?')) {
        $.ajax({
            method: 'POST',
            url: '/employers/ajax-delete',
            data: {id: idEmp},
            dataType: 'json',
            success: function () {
                ajaxAddToCart($('#employerFilter'));
            },
            error: function () {
                alert('Server error!');
            }
        });
    }
}

function ajaxDeleteCartItem(productId) {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    $.ajax({
        method: "GET",
        url: "/deletecartitem",
        data: {id: productId},
        dataType: 'json',
        success: function (data) {
            location.reload();
        },
        error: function () {
            alert('error!');
        }
    });
}

function changeProductAmount(input, productId) {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    if(input.value<1) {
        input.value=1;
    }


    $.ajax({
        method: "GET",
        url: "/changeamount",
        data: {id: productId, amount: input.value},
        dataType: 'json',
        success: function (data) {
            location.reload();
        },
        error: function () {
            alert('error!');
        }
    });
}

function changeExecutionStage(input, orderId) {

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    $.ajax({
        method: "GET",
        url: "/order/changeexecutionstage",
        data: {id: orderId, executionStage: input.value},
        dataType: 'json',
        success: function (data) {
            location.reload();
        },
        error: function () {
            alert('error!');
        }
    });
}