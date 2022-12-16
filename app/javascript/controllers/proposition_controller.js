import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["input"]
  connect() {
    console.log("ok")
  }

  click() {
    window.location.href = "?proposition=" + this.inputTarget.value;
  }
}
