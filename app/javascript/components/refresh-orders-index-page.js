import { autoSubmitForm } from './auto-submit-form';

// Function that reloads the Orders#index page content
// Parameters: shoppingCart   content of the shopping cart section;
//             navbarCart     content of the navbar field for the cart;
function refreshOrdersIndexPage(shoppingCart, navbarCart) {
  // Refresh the Shopping Cart's content
  document.getElementById('shopping-cart').innerHTML = shoppingCart;

  // Update the number of orders in the Navbar's Cart
  document.querySelector('#cart-size a').innerHTML = navbarCart;

  // To submit the OrderItems#update form automatically
  autoSubmitForm('.edit_order_item', 'input.numeric');
}

export { refreshOrdersIndexPage }
