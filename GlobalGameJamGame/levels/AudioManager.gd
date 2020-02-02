extends AudioStreamPlayer2D

func _ready():
    pass

var fight_music = preload("res://Sound Effect - Gladiaturtles/fight music.wav")

func play_music() -> void:
    self.stream = fight_music
    self.play()

func stop_music() -> void:
    self.stop()
