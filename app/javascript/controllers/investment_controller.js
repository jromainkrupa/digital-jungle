import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["amount", "amountField", "price", "nbmonth"];

  change() {
    let amount = 45000;
    amount = parseInt(this.amountTarget.value, 10);
    this.amountFieldTarget.value = amount;
  }
}
