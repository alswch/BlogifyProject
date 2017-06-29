$(document).ready(function($) {
  console.log("jQuery ready");
  $('#deleteBtn').on('click', function(){
    console.log("delete button");
    var user = $('#current_user_id').val();
    $.get("/deleteuser", {id:user});

  })
}); //CLOSES JQUERY
