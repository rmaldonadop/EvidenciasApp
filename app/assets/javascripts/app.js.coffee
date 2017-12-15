$ = jQuery

$(document).on "ready page:load", ->
  $('#myInput').on "keyup", ->
    value = $(this).val().toLowerCase()
    $("#myTable tr").each ->
      $(this).toggle $(this).text().toLowerCase().indexOf(value) > -1
      return
    return
  return
