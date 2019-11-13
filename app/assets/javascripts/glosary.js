$( document ).ready(function() {
  $( "#addTerm" ).click(function() {
    $( "#addTermForm" ).fadeToggle();
    $( ".src_term" ).focus();
    $( ".src_term" ).scroll(); 
  });
});