document.addEventListener('turbolinks:load', function() {
  const mypageBtnContainer = document.getElementById('mypageBtnContainer');
  const mypageDropdown = document.getElementById('mypageDropdown');
  const btn = document.getElementById('btn');
    
    if (mypageBtnContainer) {
      mypageBtnContainer.addEventListener('click', function() {
        if ('true' !== btn.getAttribute( 'aria-expanded' )) {
          btn.setAttribute( 'aria-expanded', 'true' );
          mypageDropdown.style.display = 'block';
        } else {
          btn.setAttribute( 'aria-expanded', 'false' );
          mypageDropdown.style.display = 'none';
        }
      });
    }
  });