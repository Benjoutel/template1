var cards = document.querySelectorAll(".card-event-timeline-middle");

cards.forEach(function (card){
  card.addEventListener("click", function (event) {
    var middle = card.querySelector(".card-event-timeline-description p");
    console.log(middle);
    console.log(middle.style.getPropertyValue("width"));
    // if (middle.style.getPropertyValue('text-overflow') == "ellipsis") {
      // middle.style.textOverflow = "unset";
      // middle.style.overflow = "unset";
      // middle.style.width = "unset";
      // middle.style.height = "unset";
      // middle.style.whiteSpace = "unset";
    // }
  // else if (middle.style.textOverflow === "unset") {
  //     middle.style.textOverflow = "ellipsis";
  //     middle.style.overflow = "hidden";
  //     middle.style.width = "300px;";
  //     middle.style.height = "42px;";
  //     middle.style.whiteSpace = "nowrap";
  // }

  });
});
