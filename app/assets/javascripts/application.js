// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require jquery_ujs
//= require bootstrap-sprockets
//= require recurring_select
//= require_tree .


// const 

// $('.simple_form.edit_post').submit('submit', function (e) {
//     e.preventDefault();
//     form = $(this).serialize();
//     $.ajax({
//         type: 'PATCH',
//         url: '/posts',
//         data: form,
//         dataType: 'JSON'
//     }).done(function (data) {
//         alert(data.notice);
//     }).fail(function (data) {
//         alert(data.alert);
//     });
// });

const itemToday = document.getElementById("item-today");

const markComplete = () => {
    console.log("Complete Task...");
    itemToday.classList.toggle("complete");
}

itemToday.addEventListener('click', markComplete);


// on page change save to db
// const ajaxRequest= () => {
//     console.log("AJAX Request");
// }