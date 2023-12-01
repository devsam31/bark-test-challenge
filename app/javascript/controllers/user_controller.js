import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "email", "passwordConfirmation", "feedback"]

  validate() {
    let password = this.inputTarget.value;
    let messages = [];
    
    if (!/[0-9]/.test(password)) {
      messages.push("Password must include at least one number.");
    }
    if (password.length < 8) {
      messages.push("Password must be at least 8 characters long.");
    }
    if (!/[a-z]/.test(password)) {
      messages.push("Password must include at least one lowercase letter.");
    }
    if (!/[A-Z]/.test(password)) {
      messages.push("Password must include at least one uppercase letter.");
    }
    if (!/[\!\@\#\$\%\^\&\*\(\)\_\+\-\=\[\]\{\}\;\:\'\"\,\<\.\>\/\?]/.test(password)) {
      messages.push("Password must include at least one special character.");
    }

    this.updateFeedback(messages, "Password Strength");

    if (messages.length === 0) {
      this.passwordConfirmationTarget.disabled = false;
    } else {
      this.passwordConfirmationTarget.disabled = true;
    }
  }

  validatePasswordConfirmation() {
    let password = this.inputTarget.value;
    let confirmation = this.passwordConfirmationTarget.value;
    let messages = [];

    if (password !== confirmation) {
      messages.push("Password confirmation does not match.");
    }

    this.updateFeedback(messages, "Password");
  }

  validateEmail() {
    let email = this.emailTarget.value;
    let messages = [];

    if (!/\S+@\S+\.\S+/.test(email)) {
      messages.push("Email must be a valid email address.");
    }

    this.updateFeedback(messages, "Email");
  }

  updateFeedback(messages, field) {
    if (messages.length === 0) {
      this.feedbackTarget.innerHTML = `<p class='text-success'>${field} is good.</p>`;
    } else {
      this.feedbackTarget.innerHTML = `<ul class='text-danger'>${messages.map(message => `<li>${message}</li>`).join("")}</ul>`;
    }
  }

  submit(event) {
    event.preventDefault();
    this.element.submit();
  }
}
