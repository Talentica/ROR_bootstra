var API =  (function()
 {
  UTILS =
  {
    CheckEmailAvailability: function()
     {
       user_email = $( ".new_user #user_email" ).val()
       $.post( "check_availability/email", { email: user_email },function(data){
       $('#inprogress').remove()
       $('.new_user #commit').removeAttr('disabled');
            node = "<td><span class = 'email-validation' id = "+data.notice_class+" > "+data.message+" </span></td>"
             $('#validation').append(node);
        });
     },
    
    UpdateUserImageFromFb: function()
     {
        $.post( "getuser/image", function( data ) {
          alert( "Image updated successfully" );
          VIEW.ChangeSrcAfterImageUpload(data)
        });

     },

     RemoveUser: function(value)
      {
       $.post( "/check/to_delete_id/" , { key: value }, function(data){
       $('#'+data).remove();
       $('#usere-'+data).remove();
      });
      },
 
   SendRequest: function(uri, data = "some default data")
   {
     $.get("/chatroom", function(data){
       SenderId = data.user
       notification = "Some notification"
       $.post("/notifications", { url: uri, data: notification, sender: SenderId }, function(){
       })
     })
   },

   GetNotifications: function()
   {
    $.get("/getnotifications", function(data){
      console.log(data)
    })
   }
   
    
  }
 return UTILS;
})();
