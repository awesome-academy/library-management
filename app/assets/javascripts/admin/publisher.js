$(document).ready(function() {
  $('tr').click(function(){
    var target = $(this);
    var id = target.children('#id').text();
    var value = target.children('#value').text();
    $('form #name').val(value);
    $('form #id').val(id);
    if (id === ''){
      $('form')
        .attr('action', '/admin/publisher');
      $('#_method').attr('value', 'post')
    }
    else {
      $('form')
        .attr('action', '/admin/publisher/' + id);
      $('#_method').attr('value', 'put')
    }
  });
});
