$('#export').click(function() {
  $('form').attr('action', '/admin/books.csv').submit();
});
