// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require rails-jquery-tokeninput
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment

//= require bootstrap-datetimepicker
//= require_tree .

/* tabs handling */

function openCity(evt, aboutname) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(aboutname).style.display = "block";
    evt.currentTarget.className += " active";
}

$(document).ready(function() {
/*
var id = $('#eventdata').data('event')
  var startday = id;
  var dealEndDate = new Date();
  dealEndDate = new Date(startday);
  $('#countDownTimer').countdown({until: dealEndDate});
*/
/* set campus */
var ele = $('#Campuses');
var campus =  ele.data('campus')
ele.val(campus)
$('#campusbtn').removeClass('disabled')
$(document).on('click','#campusbtn',function(){
    var e = document.getElementById("Campuses");
    $(this).addClass('disabled')
    var strUser = e.options[e.selectedIndex].text;
   location.href = "http://localhost:3000/explore/"+strUser
   
});



/* Enter to br in text box */
$('#contentbox').on('keypress' , function(e){
  if(e.which == 13){

    var textarea = $('#contentbox').val();
    textarea = textarea + "\n*";
  }

});



$(document).on("keypress" , '.comment_ta', function(e){

    if (e.which == 13) {
     
       $(this).closest('form').submit();
    }

});

$('.sugremove').on('click',function(event){

$(this).parent().parent().fadeOut();

});
 

var h = $(window).height();
$('.home_div').height(h/1.9);

$(window).scroll(function(){

var wscroll = $(this).scrollTop();
$('.home_title').css({
  'transform' : 'translate(0px, '+wscroll/2+'%)'
});

});

setTimeout(function(){
    $('.hr1').addClass('grow');
}, 1000);

});


$(document).ready(function() {
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url;
      url = void 0;
      url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 500) {
        $('.pagination').html('<img src = \'/uploads/loader/loader.gif\' alt=\'loading...\'/>');
          return $.getScript(url);
      }
    });

    return $(window).scroll();
  }
});


$(document).ready(function() {
  if ((window.location.href.indexOf('confessions') > -1)  || (window.location.href.indexOf('clubs') > -1 ) || (window.location.href.indexOf('events') > -1 ) || (window.location.href.indexOf('photos') > -1 )){
var rightBarControl;

rightBarControl = function() {
  var rightBarHeight, rightBarOffset, rightBarTop, rightBarWidth, scrollHeight, windowHeight;
  windowHeight = $(window).height();
  scrollHeight = $(window).scrollTop();
  rightBarWidth = $('#index_top_confession_div').width();
  rightBarHeight = $('#index_top_confession_div').outerHeight();
  rightBarOffset = $('#index_confessions').offset().left + $('#index_confessions').outerWidth();
  rightBarTop = 75;

  if (windowHeight - 75 < rightBarHeight) {
    rightBarTop = windowHeight - rightBarHeight;
  }
  if (windowHeight + scrollHeight - 75 >= rightBarHeight) {
    $('#index_top_confession_div').css({
      position: 'fixed',
      left: rightBarOffset,
      top: rightBarTop
    });
  } else {
    $('#index_top_confession_div').css({
      position: 'static',
      left: rightBarOffset,
      top: rightBarTop
    });
  }
};
}

$(window).scroll(rightBarControl);

$(window).resize(rightBarControl);


$('#search').addClass('form-control');
});


(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var panel = $(this).parent().parent();
    var messages_list = panel.find('.messages-list');

    panel.find('.panel-body').toggle();
    panel.attr('class', 'panel panel-default');

    if (panel.find('.panel-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();


// AJAX REQUESTS

$(document).ready(function() {

function getEventTarget(e) {
    e = e || window.event;
    return e.target || e.srcElement; 
}
$(document).on('click' ,'#index_follow_form', function(event) {
    var target = getEventTarget(event);
    
  var id = $(target).parent().parent().data('sug-id');
  var currentid = $(target).parent().parent().data('current-id');
  $('.follow_form_'+id).addClass('disabled');

 $.ajax({
    url : "http://localhost:3000/relationships",
    type: "POST",
    data : {followed_id: id , follower_id: currentid},
    success: function(data, textStatus, jqXHR)
    {
      $('.follow_form_'+id).replaceWith('<p class="btn disabled btn-default"><span class="glyphicon glyphicon-ok"><span/> Following </p>');
        //data - response from server
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
 
    }
});

});

$(document).on('click' ,'#send_invite_btn', function(event) {
  var target = getEventTarget(event);
    
  var id = $(target).parent().parent().data('invite-link-id');
  var clubid = $(target).parent().parent().data('club-id');
  var notif = $(target).parent().parent().data('notif')
  $('.invite_btn_'+id).addClass('disabled');

 $.ajax({
    url : "http://localhost:3000/clubmembers?amitian_id="+id+"&club_id="+clubid,
    type: "POST",
    data : {amitian_id: id , club_id: clubid , notif_id: notif},
    success: function(data, textStatus, jqXHR)
    {
      $('.invite_btn_'+id).replaceWith('<p class="btn disabled btn-default"><span class="glyphicon glyphicon-ok"><span/> Invitation Sent </p>');
        //data - response from server
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
 
    }
});

});

$(document).on('click','#send_notif',function(e){
  var amitian = $(this).data('amitian');
  var club = $(this).data('club-id');
  var owner = $(this).data('owner');
   $(this).addClass('disabled');
  $.ajax({
    url: "http://localhost:3000/notifications",
    type: "POST",
    data: {notice_type: "ask_invite" , notified_by_id: amitian , club_id: club , amitian_id: owner},

    success: function(data,Status,jqXHR){
      $('#send_notif_'+club).parent().replaceWith('<p class="btn disabled btn-default"><span class="glyphicon glyphicon-ok"><span/> Request Sent </p>');
    }
  });
});

$(document).on('click' ,'#hotlist_form', function(event) {
    var target = getEventTarget(event);
  var id = $(target).parent().parent().data('female-id');
  var currentid = $(target).parent().parent().data('current-id');
  $('#hotlist_'+id).addClass('disabled');

 $.ajax({
    url : "http://localhost:3000/hotlists",
    type: "POST",
    data : {hotlisted_id: id , hotlister_id: currentid},
    success: function(data, textStatus, jqXHR)
    {
      $('#hotlist_'+id).replaceWith('<p class="btn disabled btn-default"><span class="glyphicon glyphicon-ok"><span/> Added to your list </p>');
        //data - response from server
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
 
    }
});

});
  
  });

