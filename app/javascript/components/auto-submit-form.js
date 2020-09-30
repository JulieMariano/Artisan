// Function that submits a specific form (selectorForm) upon having a specific input field (selectorInput) 'blured'
function autoSubmitForm(selectorForm, selectorInput) {
  var formsList = document.querySelectorAll(selectorForm);

  for (let i = 0; i < formsList.length; i++) {
    formsList[i].querySelector(selectorInput).addEventListener('blur', () => {
      formsList[i].querySelector('[type="submit"]').click();
    });
  }
}

export { autoSubmitForm };
