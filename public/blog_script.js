$(document).ready(function($) {
  console.log("jQuery ready");

  $('#signin-submit').on('click', function(){
    if ($('.signin-input').val() == ""){
      alert('Please enter a Username and password.');
      return false
    }
  });

  $('#registration-submit').on('click', function(){
    if ($('.registration-input').val() == ""){
      alert('You must fill out all fields.');
      return false
    } else {
      var x = $('#registration-email').val();
      var atpos = x.indexOf("@");
      var dotpos = x.lastIndexOf(".");
      if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Please enter a valid email address");
        return false;
      }
    }
  });
});
