# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

# pins on index page
$ ->
  $pins = $("#pins")
  $pins.imagesLoaded ->
    $pins.masonry
      itemSelector: "#boxIndexPin"

# Pin show/edit page
$ ->
  # set jQuery object variables
  $windowObj = $(window)
  $showPinContainer = $("#showPinContainer")
  $showPin = $("#showPin")
  $showPinImg = $("#showPin img")
  $showPinHeight = $("#showPin").outerHeight()
  $showPinImgWidth = $showPinImg.outerWidth()

  setShowPinContainerHeight = ->
    if $showPinHeight > 450
      $showPinContainer.outerHeight( $showPinHeight )
    else
      $showPinContainer.outerHeight( 450 )

  setShowPinContainerWidth = ->
    if $showPinImgWidth < 200
      $showPinImg.outerWidth( 200 )
    else if $showPinImgWidth > 300 
      $showPinImg.outerWidth( 300 )

  setShowPinContainerSize = ->
    setShowPinContainerHeight()
    setShowPinContainerWidth()

  setShowPinContainerSize()



















# ====================================
  # TODO: use resize to center show div
  # put ShowPinDiv in middle screen; adjusts if screen is resized
  
  # adjustLayout = ->
  #   setShowPinContainerSize()
  #   $showPinContainer.offset
  #     left: ($showPinRow.width() - $showPin.outerWidth()) / 2

  # $windowObj.resize(adjustLayout).resize()

# ===============
  # TODO: create fade in animation when show is clicked.
  # $showPinContainer.fadeIn(1500)
