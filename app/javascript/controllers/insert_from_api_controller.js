// import { Controller } from "@hotwired/stimulus"


// // Connects to data-controller="insert-from-api"
// export default class extends Controller {
//   static values = {
//     apiKey: "NHS_API_KEY",
//   }
//     connect() {
//       // const apikey = ENV['NHS_API_KEY']
//       console.log(this.apiKeyValue)
//       const url = "https://api.nhs.uk/mental-health"
//       fetch(url, { method: 'GET', headers: {'Accept': 'application/json','subscription-key': this.apiKeyValue}
//       })
//       .then(response => response.json())
//       .then((data) => {
//         console.log(data)
//       })
//     }
// }
