function autoSubmitOrdersItemForm() {
  var editOrdersItemForms = document.querySelectorAll('.edit_orders_item');
  
  for (let i = 0; i < editOrdersItemForms.length; i++) {
    editOrdersItemForms[i].querySelector('input.numeric').addEventListener('blur', () => {
      editOrdersItemForms[i].querySelector('[type="submit"]').click();
    });
  }
}

export { autoSubmitOrdersItemForm };
