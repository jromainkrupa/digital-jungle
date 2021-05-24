import * as LottiePlayer from "@lottiefiles/lottie-player";

import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("in lottie");
    console.log(LottiePlayer);
  }
  open() {
    console.log("open!");
  }
}
