import consumer from "./consumer"

consumer.subscriptions.create({ channel: "ChatroomChannel"}, {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  }
});
