<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Notícias sobre Pets</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&family=Roboto:wght@400&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            font-size: 2rem;
            color: #230735;
            margin-top: 20px;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        #news-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            justify-content: center;
            padding: 20px 0;
        }

        @media (max-width: 768px) {
            #news-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 480px) {
            #news-container {
                grid-template-columns: 1fr;
            }
        }

        .article {
            background-color: #f9f9f9;
            border-radius: 11px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            text-align: center;
            height: 400px;
            transition: transform 0.6s ease, opacity 0.6s ease;
            position: relative;
            opacity: 0;
            transform: translateY(30px);
        }

        .article.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .article:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .article img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-bottom: 4px solid #230735;
        }

        .article h2 {
            font-size: 1rem;
            margin: 15px;
            color: #230735;
            font-weight: bold;
            max-height: 3em;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        .article p {
            font-size: 0.8rem;
            margin: 10px 20px;
            color: #666;
            line-height: 1.6;
            max-height: 6.2em;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;
        }

        .article a {
            font-size: 1rem;
            color: #230735;
            font-weight: bold;
            text-decoration: none;
            margin: 0 auto 20px;
            padding: 10px 15px;
            border-radius: 8px;
            background-color: #f1f1f1;
            display: inline-block;
            transition: background-color 0.3s, color 0.3s;
            align-self: center;
            margin-top: auto;
        }

        .article a:hover {
            background-color: #9C0376;
            color: #fff;
        }

        .description {
            text-align: center;
            font-size: 1rem;
            color: #666;
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            padding: 1px 100px;

        }

    </style>
</head>
<body>
<header>
    <%@ include file="components/header.jsp" %>
</header>
<main class="container"><br><br><br><br><br><br><br>
    <h1>Fique por Dentro das Últimas Notícias Sobre o Mundo Animal</h1><br>
    <p class="description">Descubra as novidades mais incríveis sobre pets, bem-estar animal e dicas essenciais para cuidar do seu bichinho de estimação. Atualizações diárias com tudo o que você precisa saber sobre o universo animal!</p><br><br><br>
    <div id="news-container">
    </div>
</main>
<footer>
    <%@ include file="components/footer.jsp" %>
</footer>
<script>
    const url = `https://newsapi.org/v2/everything?q=pets AND animais -política -tecnologia -morte&language=pt&sortBy=relevancy&apiKey=45a0adc539714a30b2b0a59c8aec57e0`;
    const EIGHT_HOURS = 8 * 60 * 60 * 1000;

    function renderArticles(articles) {
        const newsContainer = document.getElementById('news-container');
        newsContainer.innerHTML = '';

        articles.forEach(article => {
            const articleElement = document.createElement('div');
            articleElement.className = 'article';

            const image = document.createElement('img');
            image.src = article.urlToImage;
            image.alt = 'Imagem do artigo';

            const title = document.createElement('h2');
            title.textContent = article.title;

            const description = document.createElement('p');
            description.textContent = article.description;

            const link = document.createElement('a');
            link.href = article.url;
            link.target = '_blank';
            link.textContent = 'Leia mais';

            articleElement.appendChild(image);
            articleElement.appendChild(title);
            articleElement.appendChild(description);
            articleElement.appendChild(link);

            newsContainer.appendChild(articleElement);
        });


        const observerOptions = {
            root: null,
            threshold: 0.5
        };

        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);


        const articlesElements = document.querySelectorAll('.article');
        articlesElements.forEach(article => {
            observer.observe(article);
        });
    }


    function fetchArticles() {
        const storedData = localStorage.getItem('articles');
        const storedTimestamp = localStorage.getItem('timestamp');
        const now = Date.now();

        if (storedData && storedTimestamp && now - storedTimestamp < EIGHT_HOURS) {
            const articles = JSON.parse(storedData);
            renderArticles(articles);
        } else {
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    const articles = data.articles;
                    renderArticles(articles);
                })
                .catch(error => {
                    console.error('Erro ao buscar notícias:', error);
                });
        }
    }

    fetchArticles();
</script>

</body>
</html>
