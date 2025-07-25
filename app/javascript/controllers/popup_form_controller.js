import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="popup-form"
export default class extends Controller {
  static targets = [
    "container",
    "startDateButton",
    "startDateCalendar",
    "endDateCalendar",
  ];
  connect() {}
  showForm(event) {
    console.log("pop the form");
    event.stopPropagation();
    this.containerTarget.classList.toggle("hidden");
  }
  toggleStartDate(event) {
    event.stopPropagation();
    this.startDateCalendarTarget.classList.toggle("hidden");
    this.endDateCalendarTarget.classList.add("hidden");
    const value = this.endDateCalendarTarget.value; // string: e.g. "2025-07-25"
    if (value) {
      console.log("End date selection:", value);
      // Do something with the date...
    } else {
      console.log("No end date selected yet");
    }
  }
  toggleEndDate(event) {
    event.stopPropagation();
    this.startDateCalendarTarget.classList.add("hidden");
    this.endDateCalendarTarget.classList.toggle("hidden");
  }
}
