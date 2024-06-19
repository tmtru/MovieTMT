
document.addEventListener("click", function (e) {
  var myTargetElement = e.target;
  var selector, mainElement;
  if (
    myTargetElement.classList.contains("search-toggle") ||
    (myTargetElement.parentElement &&
      myTargetElement.parentElement.classList.contains("search-toggle")) ||
    (myTargetElement.parentElement &&
      myTargetElement.parentElement.parentElement &&
      myTargetElement.parentElement.parentElement.classList.contains(
        "search-toggle"
      ))
  ) {
    if (myTargetElement.classList.contains("search-toggle")) {
      selector = myTargetElement.parentElement;
      mainElement = myTargetElement;
    } else if (
      myTargetElement.parentElement.classList.contains("search-toggle")
    ) {
      selector = myTargetElement.parentElement.parentElement;
      mainElement = myTargetElement.parentElement;
    } else if (
      myTargetElement.parentElement.parentElement.classList.contains(
        "search-toggle"
      )
    ) {
      selector = myTargetElement.parentElement.parentElement.parentElement;
      mainElement = myTargetElement.parentElement.parentElement;
    }
    document.querySelectorAll(".navbar-right li").forEach(function (elem) {
      if (elem !== selector) {
        elem.classList.remove("iq-show");
        // elem.querySelector(".search-toggle").classList.remove("active");
      }
    });

    if (
      !mainElement.classList.contains("active") &&
      document.querySelector(".navbar-list li .active")
    ) {
      document.querySelectorAll(".navbar-right li").forEach(function (elem) {
        elem.classList.remove("iq-show");
        elem.classList.remove("active");
      });
    }

    selector.classList.toggle("iq-show");
    mainElement.classList.toggle("active");
    e.preventDefault();
  } else if (myTargetElement.classList.contains("search-input")) {
    // Do nothing if clicking on search-input
  } else {
    document.querySelectorAll(".navbar-right li").forEach(function (elem) {
      elem.classList.remove("iq-show");
    });
    document
      .querySelectorAll(".navbar-right li .search-toggle")
      .forEach(function (elem) {
        elem.classList.remove("active");
      });
  }
});


//Thanh scroll ngang
let numberOfItem;
let progressBar, lastBar;
function numberOfItems(handle) {
  numberOfItem = getComputedStyle(
    handle.closest(".slide-movie")
  ).getPropertyValue("--number-of-item");
  return numberOfItem;
}
function calculateProgressBar(handle) {
  const slider = handle.closest(".slide-movie").querySelector(".slider");
  const itemWidth = slider.querySelector(".movie-item").offsetWidth;
  numberOfItem = numberOfItems(handle);
  const allItemWidth = itemWidth * numberOfItem + 50;
  let vpWidth = slider.offsetWidth;
  console.log(vpWidth);
  progressBar = Math.floor(allItemWidth / vpWidth);
  lastBar = allItemWidth / vpWidth - progressBar;
  // if (progressBar % 2 == 0) {
  //   progressBar = progressBar * 2;
  //   if (lastBar > 0.5) lastBar = lastBar + 0.5;
  // } else {
  //   progressBar = progressBar * 2 - 1;
  // }
  console.log(lastBar);
  if (lastBar < 0.5 && lastBar !== 0) {
    progressBar = progressBar - 0.5;
    console.log(lastBar);
  } else if (lastBar > 0.5) {
    lastBar -= 0.5;
  }
}
addEventListener("load", (event) => {
  let handleLeft = document.querySelectorAll(".left-handle");
  let handleRight = document.querySelectorAll(".right-handle");
  handleLeft.forEach((item) => {
    item.style.opacity = "0";
  });
  handleRight.forEach((item) => {
    calculateProgressBar(item);
    if ((progressBar == 0.5 && lastBar == 0) || progressBar < 0.5) {
      item.style.opacity = "0";
    }
  });
});
document.addEventListener("click", (e) => {
  let handle;
  if (e.target.matches(".handle")) {
    handle = e.target;
  } else {
    handle = e.target.closest(".handle");
  }
  if (handle != null) onHandleClick(handle);
});
function onHandleClick(handle) {
  let handleLeft = handle.closest(".slide-movie").querySelector(".left-handle");
  calculateProgressBar(handle);
  const slider = handle.closest(".slide-movie").querySelector(".slider");
  const sliderIndex = parseFloat(
    getComputedStyle(slider).getPropertyValue("--slider-index")
  );
  if (handle.classList.contains("left-handle")) {
    if (sliderIndex - 0.5 <= 0) {
      slider.style.setProperty("--slider-index", 0);
      handle.style.opacity = "0";
    } else {
      slider.style.setProperty("--slider-index", sliderIndex - 0.5);
    }
  }
  if (handle.classList.contains("right-handle")) {
    if (sliderIndex + 0.5 > progressBar) {
      slider.style.setProperty("--slider-index", 0);
      handleLeft.style.opacity = "0";
    } else if (sliderIndex + 0.5 == progressBar) {
      handleLeft.style.opacity = "0.7";
      slider.style.setProperty("--slider-index", sliderIndex + lastBar);
    } else {
      handleLeft.style.opacity = "0.7";
      slider.style.setProperty("--slider-index", sliderIndex + 0.5);
    }
  }
}

//icons like, save
document.addEventListener("click", function (e) {
  if (
    e.target.parentElement.classList.contains("icons") &&
    !e.target.parentElement.classList.contains("non-action")
  ) {
    element = e.target.parentElement.querySelectorAll("i");
    element.forEach((item) => {
      console.log(item);
      if (item.classList.contains("select")) {
        console.log(1);
        item.classList.remove("select");
      } else {
        item.classList.toggle("select");
        console.log(2);
      }
    });
  }
});
