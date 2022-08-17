import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "message" ]

  initialize() {
    this.username = document.cookie.split(/=/).at(0) === "username" ? document.cookie.split(/=/).at(1) : "guest"
  }

  messageTargetConnected() {
    $(this.element).scrollTop($(this.element)[0].scrollHeight)
  }
}
