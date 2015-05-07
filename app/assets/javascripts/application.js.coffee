#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require turbolinks
#= require jquery.turbolinks
#= require holder
#= require analytics
#= require_self

ready = ->

  $("form input:enabled:visible:first").focus()
  Holder.run()


$ ->
  ready()