# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.


$ ->
  # pins on index page
  $pins = $("#pins")
  $pins.imagesLoaded ->
    $pins.masonry
      itemSelector: "#boxIndexPin"

$ ->
  # Pin show/edit page
  $windowObj = $(window)
  $showPinRow = $("#showPinRow")
  $showPinContainer = $("#showPinContainer")
  $showPin = $("#showPin")
  $showPinWidth = $("#showPin img").outerWidth()
  $showPinHeight = $("#showPin").outerHeight()

  setShowPinContainerSize = ->
    if $showPinHeight > 400 
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


  adjustLayout()
