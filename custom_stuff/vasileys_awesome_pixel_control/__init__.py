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
			red = 0
		green = call.data.get(ATTR_GREEN)
		if green == None:
			green = 0
		blue = call.data.get(ATTR_BLUE)
		if blue == None:
			blue = 0
		white = call.data.get(ATTR_WHITE)
		if white == None:
			white = 0
		else:
			white = ""
		start = call.data.get(ATTR_FROM)
		stop = call.data.get(ATTR_TO)
		topic = call.data.get(ATTR_TOPIC)
		count = start
		while (count <= stop):
			string = {
                'state': 'ON',
				'color': {
					'r': red,
					'g': green,
					'b': blue
					},
                'white_value': white,
				'effect': 'pixel', 
				'pixel': count}
			mqtt.async_publish(hass, topic, str(string), 1, False)
			count = count +1
	hass.services.register(DOMAIN, 'set_pixel', set_pixel_service)
	return True