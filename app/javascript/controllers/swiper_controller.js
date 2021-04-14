import { Controller } from "stimulus";
import Swiper from "swiper";
import SwiperCore, { Navigation, Pagination } from "swiper/core";

// configure Swiper to use modules
SwiperCore.use([Navigation, Pagination]);
import "swiper/swiper-bundle.css";

export default class extends Controller {
  connect() {
    console.log("creating swiper instance");
    const swiper = new Swiper(".swiper-container", {
      // Optional parameters
      direction: "horizontal",
      centeredSlides: true,
      centeredSlidesBounds: true,
      spaceBetween: 20,

      loop: false,

      // If we need pagination
      pagination: {
        el: ".swiper-pagination",
      },

      // Navigation arrows
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },

      // And if we need scrollbar
      scrollbar: {
        el: ".swiper-scrollbar",
      },
    });
  }
}
