extends AudioStreamPlayer2D

func _ready():
    pass

var fight_music = preload("res://Sound Effect - Gladiaturtles/fight music.wav")
var trumpets = preload("res://Sound Effect - Gladiaturtles/final music.wav")

func play_music() -> void:
    self.stream = fight_music
    self.play()

func play_trumpets() -> void:
    self.stream = trumpets
    self.play()

func stop_music() -> void:
    self.stop()
