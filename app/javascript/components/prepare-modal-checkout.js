// Function that prepares and opens the Checkout's Modal
function prepareModalCheckout(modalCheckout, stripeKey, orderSessionId) {
  document.querySelector('#ModalCheckout').innerHTML = modalCheckout;   // Refresh the Checkout's Modal content

  $("#ModalCheckout").modal('show');    // Use jQuery to open the Checkout's Modal

  // Make the 'pay' button redirect to the Stripe's payment page
  var paymentButton = document.getElementById('pay');
  paymentButton.addEventListener('click', () => {
    const stripe = Stripe(stripeKey);
    stripe.redirectToCheckout({
      sessionId: orderSessionId
    });
  });
}
