function destroy_action(url, data){
  if(confirm("Are you sure?")){
    $.ajax({type: "DELETE",
        'url': url,
        'data': data,
        'dataType': 'script'});
  }
}


function create_action(url, data){
  $.ajax({type: "POST",
      'url': url,
      'data': data,
      'dataType': 'script'});
}

function update_action(url, data){
  $.ajax({type: "PUT",
      'url': url,
      'data': data,
      'dataType': 'script'});
}

function destroy_for(resource, data){
  destroy_action(url_for(resource), data);
}

function url_for(resource){
  resource.unshift('');
  return resource.join('/');
}

function remove_fields(sel) {
  $('[rel=' + sel + ']').remove();
}

function remove_fields_with_destroy(link, sel) {
  /*
  var hidden_field = $(link).prev();
	avoid inherired_redources bug on rails 2.3.9
  */

  var hidden_field = $('[rel=' + sel + ']:last a').prev();
  if (hidden_field) {
    hidden_field.val(true);
  }
  $('[rel=' + sel + ']').replaceWith(hidden_field.clone());
}
