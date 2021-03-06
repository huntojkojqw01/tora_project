App.review = App.cable.subscriptions.create "ReviewChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connect_to_review_app")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("disconnect_from_review_app")
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel    
    if $("#app_"+data.app_id+"_reviews").find("div#review_"+data.review_id).length
      # $("div#review_"+data.review_id).replaceWith(data.review_template)
      $("div#review_"+data.review_id).remove()
    else
      # $("#app_"+data.app_id+"_reviews").append(data.review_template)
    $(data.review_template).prependTo($("#app_"+data.app_id+"_reviews")).hide().show(1500);
