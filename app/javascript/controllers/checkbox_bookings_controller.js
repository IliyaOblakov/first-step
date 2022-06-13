import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["conditionCheckbox", "form"];

  user_conditions = [];

  test(){

    this.conditionCheckboxTargets.forEach( checkbox => {

      if (checkbox.checked == true && this.user_conditions.includes(checkbox.nextElementSibling.firstElementChild.textContent) == false){
        this.user_conditions.push(checkbox.nextElementSibling.firstElementChild.textContent);
      }

      if (checkbox.checked == false && this.user_conditions.includes(checkbox.nextElementSibling.firstElementChild.textContent) == true ){
        const delete_condition_index = this.user_conditions.indexOf(checkbox.nextElementSibling.firstElementChild.textContent)
        this.user_conditions.splice(delete_condition_index, 1);
      }

    })

    // console.log(this.user_conditions)
    const content = this.user_conditions.join(", ");
    const form = document.querySelector(".form-control.text");
    form.textContent = content
    // console.log(form.textContent)
  }



}
