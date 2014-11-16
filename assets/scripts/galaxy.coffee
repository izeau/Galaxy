rotate = ($elem, value, max) ->
  angle = value * 360 / max
  $elem.style.WebkitTransform = "rotateZ(#{angle}deg)"

now      = new Date

$galaxy  = document.querySelector ".galaxy"
$battery = $galaxy.querySelector ".battery"
$month   = $galaxy.querySelector ".month"
$day     = $galaxy.querySelector ".day"
$weekday = $galaxy.querySelector ".weekday"
$hours   = $galaxy.querySelector ".hours"
$minutes = $galaxy.querySelector ".minutes"
$seconds = $galaxy.querySelector ".seconds"

$display        = document.querySelector ".display"
$displayHours   = $display.querySelector ".hours"
$displayMinutes = $display.querySelector ".minutes"

batteryLevel = groovyAPI.getBatteryLevel()

$battery.style.width = $battery.style.height = "#{batteryLevel * 20}%"

rotate($month, now.getMonth(), 12)
rotate($weekday, now.getDay(), 7)
rotate($day, now.getDate() - 1, new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate() - 1)
rotate($hours, now.getHours(), 24)

$minutes.style.WebkitAnimationDelay = "#{-now.getMinutes() * 60}s"
$seconds.style.WebkitAnimationDelay = "#{-now.getSeconds()}s"

do update = ->
  now = new Date
  $displayHours.innerHTML = "0#{now.getHours()}".slice(-2)
  $displayMinutes.innerHTML = "0#{now.getMinutes()}".slice(-2)

setInterval update, 10 * 1000
