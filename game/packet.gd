extends Object

var action: String
var payloads: Array

func _init(_action: String, _payloads: Array):
	action = _action
	payloads = _payloads


func tostring() -> String:
	var serialize_dict: Dictionary = {"a": action}
	for i in range(len(payloads)):
		serialize_dict["p%d" % i] = payloads[i]
	var data: String = JSON.stringify(serialize_dict)
	return data


static func json_to_action_payloads(json_str: String) -> Array:
	var action: String
	var payloads: Array = []
	var obj_dict: Dictionary = JSON.parse_string(json_str)

	for key in obj_dict.keys():
		var value = obj_dict[key]
		if key == "a":
			action = value
		elif key[0] == "p":
			var index: int = key.split_floats("p", true)[1]
			payloads.insert(index, value)
	return [action, payloads]
