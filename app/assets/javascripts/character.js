$( document ).ready(function() {
  $( "#addCharacterTag" ).click(function() {
    $( "#addCharacterTagForm" ).fadeToggle();
    $( ".chr-term" ).focus();
    $( ".chr-term" ).scroll(); 
  });
});