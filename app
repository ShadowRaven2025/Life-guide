function searchAdvice() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const resultsContainer = document.getElementById('results');
    resultsContainer.innerHTML = '';

    if (!searchTerm) {
        resultsContainer.innerHTML = '<p>Введите вопрос</p>';
        return;
    }

    const foundAdvice = adviceDatabase.filter(item => 
        item.question.toLowerCase().includes(searchTerm) || 
        item.answer.toLowerCase().includes(searchTerm)
    );

    if (foundAdvice.length === 0) {
        resultsContainer.innerHTML = '<p>Советы не найдены. Попробуйте другой вопрос.</p>';
        return;
    }

    foundAdvice.forEach(advice => {
        const card = document.createElement('div');
        card.className = 'advice-card';
        card.innerHTML = `
            <h3>${advice.question}</h3>
            <p><em>Категория: ${advice.category}</em></p>
            <p>${advice.answer}</p>
        `;
        resultsContainer.appendChild(card);
    });
}
