var VIEW = (function()
{
  FUNCTIONS = 
  {
    ChangeSrcAfterImageUpload: function(data)
      {
        $("#dis-img").attr("src", "/system/users/"+data.user+"/medium/"+data.img+"")
        $(".header-img .user-thumb").attr("src", "/system/users/"+data.user+"/thumb/"+data.img+"")

     },

    GetHtmlOfChatBox: function(value)
    {
      html = "<div id='chat-room'><div id='chat_header'>Chat </div><div id='message_display'></div><textarea cols='50' name='message' class='message_post' channel = "+value.attr('channel')+"> </textarea></div>"
      return html   
    }

  }
 return FUNCTIONS
})();
