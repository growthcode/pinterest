# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.


$ ->
  $windowObj = $(window)
  $showPinRow = $("#showPinRow")
  # pins on index page
  $pins = $("#pins")
  $showPinContainer = $("#showPinContainer")
  $pins.imagesLoaded ->
    $pins.masonry
      itemSelector: ".box-index-pin"



  # Pin show/edit page
  $showPin = $("#showPin")
  $showPinImgWidth = $("#showPin img").outerWidth()
  $showPinImgHeight = $("#showPin img").outerHeight()
  $showPinWidth = $showPinImgWidth
  $showPinHeight = $("#showPin").outerHeight()

  setShowPinContainerSize = ->
    if $showPinImgHeight > 400 
      $showPinContainer.outerWidth( $showPinWidth )
      $showPinContainer.outerHeight( $showPinHeight )
    else
      $showPinContainer.outerWidth( $showPinWidth )
      $showPinContainer.outerHeight( 400 )


  adjustLayout = ->
    setShowPinContainerSize()
    $showPin.offset
      left: ($showPinRow.width() - $showPin.outerWidth()) / 2

  $showPin.imagesLoaded ->
    $showPinWidth = $("#showPin img").outerWidth()
    $showPinHeight = $("#showPin").outerHeight()
    setShowPinContainerSize()
    $showPinContainer.animate 
      opacity: 1
    , 800
    adjustLayout()
    $windowObj.resize(adjustLayout).resize()


