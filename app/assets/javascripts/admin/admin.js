$(document).ready(function() {
  $('#export').click(function(){
    var searchText = $('#q_username_cont').val();
    var searchRole = $('#q_is_admin_eq').val();
    var url = './users.csv?q[username_cont]='+searchText+'&q[is_admin_eq]='+searchRole;
    window.open(url, '_blank');
  });
});
