$(document).ready(function() {
  $('tr').click(function(){
    var target = $(this);
    var id = target.children('#id').text();
    var value = target.children('#value').text();
    var describe = target.children('#describe').text();
    $('form #name').val(value);
    $('form #id').val(id);
    $('form #describe').val(describe);
    if (id === ''){
      $('form')
        .attr('action', '/admin/author');
      $('#_method').attr('value', 'post')
    }
    else {
      $('form')
        .attr('action', '/admin/author/' + id);
      $('#_method').attr('value', 'put')
    }
  });
});
