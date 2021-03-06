$(document).ready(function () {

  $('.yearPicker').yearpicker({
    year: 2015,
    startYear: 1930,
    endYear: 2050
  });

  // $('#yearPicker').datetimepicker({
  //   format: 'YYYY',
  //   viewMode: 'years'
  // });

  // Activate tooltip
  $('[data-bs-toggle="tooltip"]').tooltip();


  // Select/Deselect choiceboxes
  var checkbox = $('table tbody input[type=checkbox]');
  $('#selectAll').click(function () {
    if (this.checked) {
      checkbox.each(function () {
        this.checked = true;
      });
    }
    else {
      checkbox.each(function () {
        this.checked = false;
      });
    }
  });

  checkbox.click(function () {
    if (!this.checked) {
      $('#selectAll').prop("checked", false);
    }
  });

});