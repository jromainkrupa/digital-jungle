import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["amount", "amountField"];

  change(amount) {
    console.log("i am in change");
    console.log(amount);
    amount = parseInt(this.amountTarget.value, 10);
    this.amountFieldTarget.value = amount;
  }
}
