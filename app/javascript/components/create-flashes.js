// Function that creates and appends a type of alert (alertType) with a certain text (text) to the
// body of the document
function createFlashes(alertType, text) {
  // Create alert 'div'
  var div = document.createElement('div');
  div.classList = `alert ${alertType} alert-dismissible fade show m-1`;
  div.setAttribute("role", "alert");

  // Add text to the alert
  var alert = document.createTextNode(text);
  div.appendChild(alert);

  // Create closing button
  var button = document.createElement('button');
  button.setAttribute("type", "button");
  button.classList = 'close';
  button.setAttribute("data-dismiss", "alert");
  button.setAttribute("aria-label", "Close");

  // Button 'X' symbol
  var span = document.createElement('span');
  span.setAttribute("aria-hidden", "true");
  span.innerHTML = '&times;';

  button.appendChild(span);
  div.appendChild(button);

  // Append 'div' to the body of the document
  document.body.appendChild(div);
}

export { createFlashes };
