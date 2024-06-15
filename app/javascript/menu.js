window.addEventListener('turbo:load', function(){
  const nav = document.getElementsByClassName('nav')[0];

  nav.addEventListener('mouseover', (e) => {
    if (e.target.matches('.login, .sign-up, .logout')) {
      e.target.setAttribute("style", "background-color: #3CCACE; color: white;");
    }
  });

  nav.addEventListener('mouseout', (e) => {
    if (e.target.matches('.login, .sign-up, .logout')) {
      e.target.removeAttribute("style");
    }
  });
});