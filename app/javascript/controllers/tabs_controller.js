import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "content"]

  connect() {
    console.log('Connected')
    this.showTab("pending")
  }

  change(event) {
    const name = event.currentTarget.dataset.tabsName
    this.showTab(name)
  }

  showTab(name) {
    this.tabTargets.forEach(tab => {
      const isActive = tab.dataset.tabsName === name
      tab.classList.toggle("border-gray-600", isActive)
      tab.classList.toggle("text-gray-600", isActive)
      tab.classList.toggle("border-transparent", !isActive)
      tab.classList.toggle("text-gray-500", !isActive)
    })

    this.contentTargets.forEach(content => {
      const isVisible = content.dataset.tabsName === name
      content.classList.toggle("hidden", !isVisible)
    })
  }
}
