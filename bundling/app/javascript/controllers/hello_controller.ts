import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(): void {
    // this.element.textContent = "Hello again !!!"
  }

  click(): void {
    console.log('clicked');
  }
}
