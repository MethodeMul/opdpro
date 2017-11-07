
$(document).ready(function() {
// Datepicker Popups calender to Choose date.
$(function() {
$("#datepicker3").datepicker();
// Pass the user selected date format.
$("#format").change(function() {
$("#datepicker3").datepicker("option", "dateFormat", "dd/mm/yy");
});
});
});