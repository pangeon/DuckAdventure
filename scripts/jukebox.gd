extends Node

var music_player: AudioStreamPlayer = AudioStreamPlayer.new()
var sound_player: AudioStreamPlayer = AudioStreamPlayer.new()

func play_music(music_path: String, volume: int, player_name: String):
	if music_player.get_parent() != null:
		music_player.get_parent().remove_child(music_player)
	
	music_player.stream = load(music_path)
	music_player.volume_db = volume
	music_player.name = player_name
	add_child(music_player)
	music_player.play()
	
	await music_player.finished
	music_player.play()

func play_sound(sound_path: String, player_name: String):
	sound_player.stream = load(sound_path)
	music_player.name = player_name
	add_child(sound_player)
	sound_player.play()
	
	await sound_player.finished
	remove_child(sound_player)
