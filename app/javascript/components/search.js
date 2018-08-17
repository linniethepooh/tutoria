const dashboardSearch = function() {
  const input = document.getElementById ('tutorial_query');
  const form = document.getElementById ('search-form');
  input.addEventListener('keyup', () => {
    // "tutorial[query]"
    Rails.fire(form, 'submit');
  })
};

export { dashboardSearch };
