$(function () {
  $('#selectFrom').datetimepicker({
    format: 'L'
  });
  $('#selectTo').datetimepicker({
    format: 'L',
    useCurrent: false
  });
  $('#selectFrom').on('dp.change', function (e) {
    $('#selectTo').data('DateTimePicker').minDate(e.date);
  });
  $('#selectTo').on('dp.change', function (e) {
    $('#selectFrom').data('DateTimePicker').maxDate(e.date);
  });
});
