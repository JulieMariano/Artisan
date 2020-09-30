// Function that makes the pagination anchors scroll up to the beginning of the Paid Orders list
function smoothPagination() {
  const anchors = document.getElementsByClassName("page-link"); // Get the anchors of the pagination

  // For each of the anchors do...
  for (let anchor of anchors) {
    const anchorRef = anchor.href;

    // Make sure the anchor has a page destination
    if (typeof anchorRef !== "undefined") {
      anchor.setAttribute("data-remote", "true"); // Ajaxify the anchor

      // Upon clicking on the anchor...
      anchor.addEventListener('click', (event) => {
        event.preventDefault(); // Prevent the anchor's default click behavior

        // Use jQuery to perform a scrolling animation to the top of the Paid Orders list
        $("html, body").animate( {
          scrollTop: $('#paid-orders').offset().top - 68  // 52px (height of the navbar) plus 16px of margin
        }, 250);
      });
    }
  }
}

export { smoothPagination };
