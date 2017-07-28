json.articles do
  json.array!(@articles) do |article|
    json.name article.title
    json.url article_path(article)
  end
end

json.recipes do
  json.array!(@recipes) do |recipe|
    json.name recipe.name
    json.url recipe_path(recipe)
  end
end
