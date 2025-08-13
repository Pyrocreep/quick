extends Node

##Returns an array of all resources found at the folder path.
func get_resources(folder_path: String) -> Array[Resource]:
	var resources: Array[Resource]
	var dir: DirAccess = DirAccess.open(folder_path)
	var paths = dir.get_files()
	for path: String in paths:
		var trimmed_path: String = path.trim_suffix(".remap")
		var full_path: String = "%s/%s" % [folder_path, trimmed_path]
		resources.append(load(full_path))
	print("%d resources found in %s" % [paths.size(), folder_path]);
	return resources;

##Returns a number with excess decimal places clipped off.
func round_to_places(value: float, places: int) -> float:
	var factor = pow(10, places)
	return round(value * factor) / factor

##Returns a random position inside a circle.
##If no RandomNumberGenerator is given, uses global random.
func random_point_in_circle(radius: float, rng: RandomNumberGenerator = null) -> Vector2:
	var random_range: float
	var random_float: float
	if rng:
		random_range = rng.randf_range(0.0, TAU)
		random_float = rng.randf()
	else:
		random_range = randf_range(0.0, TAU)
		random_float = randf()
	var angle = random_range
	var r = radius * sqrt(random_float)
	return Vector2(cos(angle), sin(angle)) * r

##Returns the amount of decimal places a number has.
func decimal_places(number: float) -> int:
	var string = str(number)
	if "." in string:
		return string.split(".")[1].length()
	return 0

##Returns an array of all the cardinal directions.
func cardinals() -> Array[Vector2]:
	return [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

##Returns a random value from an enum.
##If no RandomNumberGenerator is given, uses global random.
func random_enum(enum_name: Dictionary, rng: RandomNumberGenerator = null):
	var random_int: int
	if rng:
		random_int = rng.randi()
	else:
		random_int = randi()
	var values = enum_name.values()
	var random_index = random_int % values.size()
	return values[random_index]
