/*document.addEventListener("DOMContentLoaded", function(event) { 
  let circle = document.querySelector('circle');
  console.log(circle)
  let radius = circle.r.baseVal.value;
  let circumference = radius * 2 * Math.PI;

  circle.style.strokeDasharray = `${circumference} ${circumference}`;
  circle.style.strokeDashoffset = `${circumference}`;

  function setProgress(percent) {
    console.log("in progress")
    const offset = circumference - percent / 100 * circumference;
    circle.style.strokeDashoffset = offset;
  }
  console.log(circle.classList[1])
  setProgress(parseInt(circle.classList[1]));
});*/