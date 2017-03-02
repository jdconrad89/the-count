// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', function() {
  document.addEventListener('dragstart', function(e) {
    e.target.id = 'drag-' + new Date().getTime()
    e.dataTransfer.setData('source', e.target.id)
  })
  document.addEventListener('dragenter', function(e) {
    if (e.target.className === 'drop_box') {
      e.target.style.background = '#6CA6CD'
    }
  })
  document.addEventListener('dragover', function(e) {
    e.preventDefault()
  })
  document.addEventListener('dragleave', function(e) {
    if (e.target.className === 'drop_box') {
            e.target.style.background = ''
    }
  })
  document.addEventListener('drop', function(e) {
    if (e.target.className === 'drop_box') {
      var data = e.dataTransfer.getData('source')
      var element = document.getElementById(data)
      e.target.appendChild(element)
  }
})
