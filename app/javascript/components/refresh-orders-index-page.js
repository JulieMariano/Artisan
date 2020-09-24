import { autoSubmitForm } from './auto-submit-form';

// Function that reloads the Orders#index page content uppon it being updated in an AJAX request
function refreshOrdersIndexPage(shoppingCart, navbarCart) {
  // Refresh the Shopping Cart's content
  document.getElementById('shopping-cart').innerHTML = shoppingCart;

  // Update the number of orders in the Navbar's Cart
  document.querySelector('#cart-size a').innerHTML = navbarCart;

  // To submit the OrdersItems#update form automatically
  autoSubmitForm('.edit_orders_item', 'input.numeric');
}
