import consumer from "./consumer"

consumer.subscriptions.create({ channel: "ChatroomChannel"}, {
  connected() {
    $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#chat-container').append(data.mod_message);
    $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight);
  }
});
