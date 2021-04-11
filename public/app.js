

function something() 
{
    var x = window.localStorage.getItem('bbb');
    x = x * 1 + 1;
    window.localStorage.setItem('bbb', x);
    alert(x); 
     
}

function add_to_cart(id)
{
    var key = 'product_' + id;

    var x = window.localStorage.getItem(key);
    x = x * 1 + 1;
    window.localStorage.setItem(key, x);


    update_orders_input();
    update_order_button();
}

function update_orders_input()
{
    var orders = cart_get_orders();
    $('#oreders_input').val(orders);
}

function update_order_button()
{
    var item = 'Cart ' + ' (' + cart_get_numbers_of_item() + ')';
    $('#orders_button').val(item);
    return item; 
}

function cart_get_numbers_of_item()
{
    var cnt = 0

    for(var i = 0; i < window.localStorage.length; i++)
    {
        var key = window.localStorage.key(i);
        var value = window.localStorage.getItem(key);

        if(key.indexOf('product_') == 0)
        {
            cnt = cnt + value * 1;
        }
    }

    return cnt;

}

function cart_get_orders()
{
    var orders = 0

    for(var i = 0; i < window.localStorage.length; i++)
    {
        var key = window.localStorage.key(i);
        var value = window.localStorage.getItem(key);

        if(key.indexOf('product_') == 0)
        {
            orders = orders + key + "=" + value + ",";
        }
    }

    return orders;

}