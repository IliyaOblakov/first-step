import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "chatroom_title", "authors", "messages_container", "guide"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)
      }
      )
      this.moveRight()
    }

    #insertMessageAndScrollDown(data) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data)
      this.moveRight()
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    }

    resetForm(event) {
      event.target.reset()
    }
    disconnect() {
      console.log("Unsubscribed from the chatroom")
      this.channel.unsubscribe()
    }

    moveRight(){
      // move messages right
      let message_containers = document.querySelectorAll('.messages_container')
      let message_containers_array = Array.from(message_containers)
      // console.log(this.guideTarget.innerText)
      message_containers_array.forEach(container => {
        if (container.firstElementChild.firstElementChild.firstElementChild.innerText == this.chatroom_titleTarget.innerText.split(" ")[1].slice(0,-1)) {
          container.classList.add("move_right");
          container.firstElementChild.classList.add("user_seeker")
        } else if (this.guideTarget.innerText == container.firstElementChild.firstElementChild.firstElementChild.innerText) {
          container.classList.add("move_right")
          container.firstElementChild.classList.add("user_seeker")
        }
      })
    }

}
