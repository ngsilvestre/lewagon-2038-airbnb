import { Controller } from "@hotwired/stimulus"

// data-controller="booking"
export default class extends Controller {
  static targets = ["price", "startDate", "endDate", "total", "breakdown"]

  connect() {
    console.log("Booking controller connected")
  }

  updateDates() {
    const pricePerNight = parseFloat(this.priceTarget.dataset.price)
    const startDate = new Date(this.startDateTarget.value)
    const endDate = new Date(this.endDateTarget.value)

    if (this.isValidDate(startDate) && this.isValidDate(endDate) && !isNaN(pricePerNight)) {
      const nights = this.calculateNights(startDate, endDate)

      if (nights > 0) {
        const total = nights * pricePerNight
        this.totalTarget.textContent = this.formatCurrency(total)
        this.breakdownTarget.textContent = `${this.formatCurrency(pricePerNight)} × ${nights} night${nights > 1 ? 's' : ''}`
      } else {
        this.totalTarget.textContent = "—"
        this.breakdownTarget.textContent = "End date must be after start date"
      }
    } else {
      this.totalTarget.textContent = "—"
      this.breakdownTarget.textContent = ""
    }
  }

  calculateNights(start, end) {
    const msInDay = 1000 * 60 * 60 * 24
    return Math.ceil((end - start) / msInDay)
  }

  isValidDate(date) {
    return date instanceof Date && !isNaN(date)
  }

  formatCurrency(amount) {
    return new Intl.NumberFormat('en-AU', {
      style: 'currency',
      currency: 'AUD'
    }).format(amount)
  }
}
