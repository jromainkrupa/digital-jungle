import * as LottiePlayer from "@lottiefiles/lottie-player";

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["check", "container"];
  connect() {
    const alpha = document.querySelector("#check-0");
    const bravo = document.querySelector("#check-1");
    const charlie = document.querySelector("#check-2");
    const delta = document.querySelector("#check-3");
    setTimeout(() => alpha.play(), 10);
    setTimeout(() => bravo.play(), 1000);
    setTimeout(() => charlie.play(), 2000);
    setTimeout(() => delta.play(), 3000);
  }
}
