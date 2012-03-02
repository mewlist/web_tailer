# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require_tree .

class WebTailer
  last_inner_height: 0
  run: () =>
    setTimeout( @poll, 1000 )

  poll: () =>
    path = $.url().param('path')
    url = 'web_tailer/log.json'
    url += '?path='+path if path
    $.ajax(
      type: 'GET'
      url: url
      success:  @onSuccess
      error:    @onError
      complete: @onComplete
      timeout:  @timeout
    )

  onSuccess: (result) =>
    el = $('#web_tailer')
    log_el = $('#web_tailer_logs')
    log_el.append(result.log)
    unless el.scrollTop() + $('body').height() < @last_inner_height
      @last_inner_height = log_el.innerHeight()
      el.animate({ scrollTop: @last_inner_height+"px" }, 'fast')

  onComplete: (xhr) =>
    @run()

  onError: (xhr) =>
    #

$(document).ready () ->
  tailer = new WebTailer
  tailer.run()
