command: "osascript -e 'tell application \"Finder\" to get posix path of (get desktop picture as alias)'"

refreshFrequency: 500

render: (output) ->
  """
  <div class="themeable block block-1x2 theme">
    <p></p>
  </div>
  """

update: (output, domEl) ->

  themePath = output.split "/"
  imageName = themePath[themePath.length - 1].split(".")[0].split('-')
  isThemeNamePresent = imageName.length > 1

  if output.includes "green"
    themeName = if isThemeNamePresent then imageName[1] else 'Lily'
    @changeUi("green", themeName)
  
  if output.includes "red"
    themeName = if isThemeNamePresent then imageName[1] else 'Rose'
    @changeUi("red", themeName)

  if output.includes "pink"
    themeName = if isThemeNamePresent then imageName[1] else 'Soft'
    @changeUi("pink", themeName)
  
  if output.includes "yellow"
    themeName = if isThemeNamePresent then imageName[1] else 'Melt'
    @changeUi("yellow", themeName)

# --
# -- Handle theme switching
# -- This works by overloading CSS variables
# -- based on the name of the desktop image
# --

changeUi: (color, uiName) ->
  @addColor(color)
  $(".theme").text(uiName)

addColor: (colorToBeAdded) ->
  colors = ['green', 'pink', 'yellow', 'red']
  colorsToBeRemoved = colors.filter (color) -> color isnt colorToBeAdded

  for color in colorsToBeRemoved
    $(".themeable").removeClass(color)

  $(".themeable").addClass(colorToBeAdded)


