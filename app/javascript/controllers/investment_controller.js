import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["amount", "amountField", "price", "nbmonth"];
  connect() {
    console.log("i am in connect");
    const amount = 250000;
    this.change(amount);
  }

  change(amount) {
    console.log("i am in change");
    console.log(amount);
    amount = parseInt(this.amountTarget.value, 10);
    this.amountFieldTarget.value = amount;
  }
}
