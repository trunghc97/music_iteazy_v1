App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  received: function(data) {
    this.getNotifications();
  },

  getNotifications: function() {
    $.ajax({
      type: "GET",
      url: "/notifications",
      success: function(data) {}
    })
  }
});
