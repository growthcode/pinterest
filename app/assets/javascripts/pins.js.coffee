# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

$ ->
  $pins = $("#pins")
  $showPinDiv = $(".show-pic")  
  $showPicContainer = $(".show-pic-container")  
  $windowObj = $(window)

  $pins.imagesLoaded ->
    $pins.masonry
      itemSelector: ".box-index-pin"

  $showPinDiv.imagesLoaded ->
    $showPinDivHeight = $showPinDiv.outerHeight()
    $showPicContainer.height( $showPinDivHeight ) 

  adjustLayout = ->      
    $showPinDiv.css
      position: "absolute"
      left: ($(window).width() - $showPinDiv.outerWidth()) / 2

  $windowObj.imagesLoaded ->
    $windowObj.resize(adjustLayout).resize()
