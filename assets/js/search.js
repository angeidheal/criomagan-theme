// Search functionality
document.addEventListener('DOMContentLoaded', function() {
  const searchInput = document.getElementById('search-input');
  const searchResults = document.getElementById('search-results');
  let searchIndex;
  let searchData;

  // Load the search data
  fetch('/search.json')
    .then(response => response.json())
    .then(data => {
      searchData = data;
      searchIndex = lunr(function() {
        this.field('title');
        this.field('content');
        this.field('categories');
        this.field('tags');

        data.forEach((doc, index) => {
          doc.id = index;
          this.add(doc);
        });
      });
    });

  searchInput.addEventListener('input', function() {
    const query = this.value;

    if (query.length < 2) {
      searchResults.innerHTML = '';
      return;
    }

    try {
      const results = searchIndex.search(query);
      displayResults(results);
    } catch (e) {
      console.error('Search error:', e);
    }
  });

  function displayResults(results) {
    if (results.length === 0) {
      searchResults.innerHTML = `<p class="text-gray-500 dark:text-gray-400 text-sm">${window.siteTranslations.no_results}</p>`;
      return;
    }

    const resultsHtml = results
      .slice(0, 5)
      .map(result => {
        const doc = searchData[result.ref];
        return `
          <a href="${doc.url}" class="block p-4 hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors duration-300 rounded-lg -mx-4">
            <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-1">${doc.title}</h3>
            <time class="text-sm text-gray-500 dark:text-gray-400">${doc.date}</time>
          </a>
        `;
      })
      .join('');

    searchResults.innerHTML = resultsHtml;
  }
}); 