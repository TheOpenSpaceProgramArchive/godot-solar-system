# Real time is a measure of real world time. The delta parameter describes
# the time elapsed since the previous call to _process().

extends Label

var accum = 0

func _ready():
    set_process(true)

func _process(delta):
    accum += delta
    set_text("Real Time : " + str("%.1f" % accum) + " s")
