let data;
const searchField = document.getElementById('search_field');
const catalogWrapper = document.querySelector('.catalog__wrapper.content__wrapper');

async function searchArticles() {
    const query = searchField.value.toLowerCase();

    try {
        const response = await fetch(`/posts/search?query=${encodeURIComponent(query)}`);
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        data = await response.json();

        // Очистка существующих элементов
        catalogWrapper.innerHTML = '';

        // Добавление новых элементов
        data.forEach(article => {
            const cardItem = document.createElement('a');
            cardItem.classList.add('cards__item', 'card', 'card--long');
            cardItem.dataset.id = article.id;
            cardItem.innerHTML = `
                <a href="/posts/${article.content_link}">
                <img class="card__img img__diana" src="${article.post_image.large.url}" alt="">
                <h2 class="card__title">${article.title}</h2>
                <p class="card__text">${article.description}</p>
                </a>
            `;
            catalogWrapper.appendChild(cardItem);
        });
    } catch (error) {
        console.error('Ошибка при выполнении запроса:', error);
    }
}

searchField.addEventListener('input', searchArticles);
