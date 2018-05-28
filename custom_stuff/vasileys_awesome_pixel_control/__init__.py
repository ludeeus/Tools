"""
Add this to configuration.yaml

vasileys_awesome_pixel_control:
"""

import homeassistant.components.mqtt as mqtt

DEPENDENCIES = ['mqtt']

DOMAIN = 'vasileys_awesome_pixel_control'

ATTR_TOPIC = 'topic'
ATTR_RED = 'red'
ATTR_GREEN = 'green'
ATTR_BLUE = 'blue'
ATTR_FROM = 'from'
ATTR_TO = 'to'
ATTR_WHITE = 'white'

def setup(hass, config):
	def set_pixel_service(call):
		red = call.data.get(ATTR_RED)
		if red == None:
			red = "'r': 0,"
		else:
			red = "'r': " + str(red) + ","
		green = call.data.get(ATTR_GREEN)
		if green == None:
			green = "'g': 0,"
		else:
			green = "'g': " + str(green) + ","
		blue = call.data.get(ATTR_BLUE)
		if blue == None:
			blue = "'b': 0,"
		else:
			blue = "'b': " + str(blue) + ","
		white = call.data.get(ATTR_WHITE)
		if white == None:
			white = "'white_value': 255,"
		else:
			white = "'white_value': " + str(white) + ","
		start = call.data.get(ATTR_FROM)
		stop = call.data.get(ATTR_TO)
		topic = call.data.get(ATTR_TOPIC)
		mqtt.async_publish(hass, topic, "{'state': 'OFF'}", 1, False)
		count = start
		while (count <= stop):
			string_init = "{'state': 'ON', 'color': {"
			string_main = red + green + blue + white
			string_end = "'effect': 'pixel', 'pixel':" + str(count) + "}"
			payload = string_init + string_main + string_end
			mqtt.async_publish(hass, topic, str(payload), 1, False)
			count = count +1
	hass.services.register(DOMAIN, 'set_pixel', set_pixel_service)
	return True