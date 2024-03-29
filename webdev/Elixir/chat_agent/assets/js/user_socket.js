// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// Bring in Phoenix channels client library:
import { Socket, Presence } from "phoenix"

// And connect to the path in "lib/chat_agent_web/endpoint.ex". We pass the
// token for authentication. Read below how it should be used.
let socket = new Socket("/socket", { params: { token: window.userToken } })
let channel = socket.channel("room:lobby", {
  name: window.location.search.split("=")[1],
})
let presence = new Presence(channel)

function renderOnlineUsers(presence) {
  let response = ""

  presence.list((id, { metas: [first, ...rest] }) => {
    let count = rest.length + 1
    response += `<li>${id} (count: ${count})</li>`
  })

  document.querySelector("#logged-users").innerHTML = response
}

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "lib/chat_agent_web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "lib/chat_agent_web/templates/layout/app.html.heex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/3" function
// in "lib/chat_agent_web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket, _connect_info) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1_209_600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, connect to the socket:
socket.connect()
presence.onSync(() => renderOnlineUsers(presence))
// Now that you are connected, you can join channels with a topic.
// Let's assume you have a channel with a topic named `room` and the
// subtopic is its id - in this case 42:
var chatInput = document.querySelector("#chat-input")
var sendButton = document.querySelector("#send-button")
var messagesContainer = document.querySelector("#messages")

socket.onOpen((ev) => console.log("OPEN", ev))
socket.onError((ev) => console.log("ERROR", ev))
socket.onClose((e) => console.log("CLOSE", e))

chatInput.addEventListener("keypress", (event) => {
  sendMessage(event)
})

sendButton.addEventListener("click", (event) => {
  sendMessage(event)
})

// channel.on("new_msg", (payload) => {
//   let messageItem = document.createElement("p")
//   messageItem.innerText = `[${Date()} ${payload.user}]: ${payload.body}`
//   messagesContainer.appendChild(messageItem)
// })

channel.on("new_msg", (msg) => {
  let messageItem = document.createElement("p")
  messageItem.innerText = Chat.messageTemplate(msg)
  messagesContainer.appendChild(messageItem)
  scrollTo(0, document.body.scrollHeight)
})

channel.on("user_entered", (msg) => {
  var username = Chat.sanitize(msg.user || "anonymous")
  if (username == "anonymous") {
    messagesContainer.append(`Agent Connected.`)
  }
})

channel
  .join()
  .receive("ok", (resp) => {
    console.log("Joined successfully", resp)
  })
  .receive("error", (resp) => {
    console.log("Unable to join", resp)
  })

const Chat = {
  sanitize: (html) =>
    document.createElement("div").appendChild(document.createTextNode(html))
      .parentNode.innerHTML,

  messageTemplate: (msg) => {
    const username = Chat.sanitize(msg.user || "anonymous")
    const body = Chat.sanitize(msg.body)
    const currentDate = new Date()

    // Format the date to short date format
    const shortDate = currentDate.toLocaleDateString()

    return `${shortDate} [${username}]: ${body} `
  },
}

function sendMessage(event) {
  if (event.key === "Enter") {
    channel.push("new_msg", { user: username.value, body: chatInput.value })

    chatInput.value = ""
  }
}

export default socket
