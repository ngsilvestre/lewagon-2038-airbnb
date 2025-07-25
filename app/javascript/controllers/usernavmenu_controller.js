import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="usernavmenu"
export default class extends Controller {
  static targets = ["panel"];
  connect() {}

  toggle() {
    this.panelTarget.classList.toggle("hidden");
  }
}
