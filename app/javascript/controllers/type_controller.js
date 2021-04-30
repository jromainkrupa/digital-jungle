import { Controller } from "stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed("#banner-typed-feedback", {
      strings: ["likes", "investments", "feedbacks"],
      typeSpeed: 110,
      loop: false,
      startDelay: 40,
    });
  }
}
