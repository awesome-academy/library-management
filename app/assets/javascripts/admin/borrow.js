$('.accordian-body').on('show.bs.collapse', function () {
  $(this).closest('table')
    .find('.collapse.in')
    .not(this)
    .collapse('toggle')
});

$(function () {
  $('#selectFrom').datetimepicker({
    format: 'YYYY-MM-DD'
  });
  $('#selectTo').datetimepicker({
    format: 'YYYY-MM-DD',
    useCurrent: false
  });
  $('#selectFrom').on('dp.change', function (e) {
    $('#selectTo').data('DateTimePicker').minDate(e.date);
  });
  $('#selectTo').on('dp.change', function (e) {
    $('#selectFrom').data('DateTimePicker').maxDate(e.date);
  });
});

$('#export').click(function() {
  $('#borrow_search').attr('action', '/admin/borrows.csv').submit();
});
