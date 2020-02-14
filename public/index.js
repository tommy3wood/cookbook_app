axios.get("http://localhost:3000/api/recipes").then(function(response) {
  var recipes = response.data;
  console.log(recipes);

  var axiosRecipesElement = document.querySelector('#axios-recipes');
  console.log(axiosRecipesElement);
  axiosRecipesElement.innerHTML = recipes;[0].title;
});

// var recipes = response.data;
// console.log(response);