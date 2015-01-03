# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

# pins on index page
$ ->
  $pins = $("#pins")
  $pins.imagesLoaded ->
    $pins.masonry
      itemSelector: "#boxIndexPin"

# Pin Show page
$(window).load ->
  # set jQuery object variables
  $windowObj = $(window)
  $showPinContainer = $("#showPinContainer")
  $showPin = $("#showPin")
  $showPinRow = $("#showPinRow")
  $showPinImg = $("#showPin img")
  $showPinHeight = $("#showPin").outerHeight()
  $showPinImgWidth = $showPinImg.outerWidth()

  setShowPinContainerHeight = ->
    if $showPinHeight < 450
      $showPinContainer.outerHeight( 450 )

  setShowPinContainerWidth = ->
    if $showPinImgWidth < 200
      $showPin.outerWidth( 200 )
    else if $showPinImgWidth > 700
      $showPinImg.outerWidth( 700 )
    else
      $showPinContainer.outerWidth( $showPinImgWidth )

  setShowPinContainerSize = ->
    setShowPinContainerWidth()
    setShowPinContainerHeight()

  adjustLayout = ->
    setShowPinContainerSize()
    $showPinContainer.offset
      left: ($showPinRow.width() - $showPin.outerWidth()) / 2

  $windowObj.resize(adjustLayout).resize()



# ===============
  # TODO: create fade in animation when show is clicked.
  # $showPinContainer.fadeIn(1500)
