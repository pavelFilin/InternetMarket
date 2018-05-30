function ajaxAddToCard(productId) {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e,xhr, options){
        xhr.setRequestHeader(header, token);
    });

    $.ajax({
        method: "GET",
        url: "/addtocart",
        data: { id: productId},
        dataType: 'json',
        success: function(data) {
            alert("success")
        },
        error: function() {
            alert('error!');
        }
    });

}

function ajaxEmployerDelete(idEmp) {
    if(confirm('Are you sure?')) {
        $.ajax({
            method: 'POST',
            url: '/employers/ajax-delete',
            data: { id: idEmp },
            dataType: 'json',
            success: function() {
                ajaxAddToCard($('#employerFilter'));
            },
            error: function() {
                alert('Server error!');
            }
        });

    }
}