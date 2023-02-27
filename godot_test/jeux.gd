extends Control

var random_index = 0
var nb_clic = 0
var q = 0
var phrases = [
	"Le temps ne respecte pas ce qui se fait sans lui.",
	"Tout le monde savait que c'était impossible à faire. Puis un jour quelqu'un est arrivé qui ne le savait pas, et il l'a fait.",
	"Le véritable amour commence là où on ne cherche plus à en trouver.",
	"Les grands esprits ont toujours rencontré une opposition farouche des esprits médiocres.",
	"La perfection est atteinte, non pas lorsqu'il n'y a plus rien à ajouter, mais lorsqu'il n'y a plus rien à retirer.",
	"Le succès n'est pas final, l'échec n'est pas fatal : c'est le courage de continuer qui compte.",
	"Un échec est simplement l'opportunité de recommencer, cette fois plus intelligemment.",
	"L'imagination est plus importante que le savoir.",
	"Le bonheur n'est pas quelque chose de prêt à l'emploi. Il provient de vos propres actions.",
]
var reponse = [
	"1", "2", "3", "4", "5", "6", "7", "8", "9",
]

var prenom = [
	"ethan", "michel", "jean"
]

func _ready():
	var button = $Button
	button.connect("pressed", self, "nouvelle_phrase")

func nouvelle_phrase():
	nb_clic += 1
	if(nb_clic > 10):
		$Label.text = "Game over"
		get_tree().change_scene("res://menu.tscn")
	if (q == 0):	
		print_random_line()
	else:
		var random_line = reponse[random_index]
		$Label.text = random_line
		q = 0
	
func print_random_line():
	if phrases.size() > 0:
		random_index = randi() % phrases.size()
		var prenom_index = randi() % prenom.size()
		var random_line = phrases[random_index]
		$Label.text = str(prenom[prenom_index])+" "+str(random_line)
		#phrases.remove(random_line)
		print(random_line)
		q = 1
	else:
		$Label.text = "Il n'y a plus de phrases disponibles."
