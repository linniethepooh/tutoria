import SmoothScroll from "smooth-scroll"


const homepageScroll = function () {
 const scroll = new SmoothScroll('a[href*="#"]', {
  speed: 2000,
 });
}

export { homepageScroll };
