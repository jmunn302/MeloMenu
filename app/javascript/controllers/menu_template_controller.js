import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "section-1", "section-2", "section-3", "section-4"]

  connect() {
    console.log(this.contentTarget)
  }
}
