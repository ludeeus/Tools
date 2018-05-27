"""
Add this to configuration.yaml

vasileys_awesome_pixel_control:
"""

import subprocess

DOMAIN = 'vasileys_awesome_pixel_control'

ATTR_RED = 'red'
ATTR_GREEN = 'green'
ATTR_BLUE = 'blue'
ATTR_FROM = 'from'
ATTR_TO = 'to'

MQTT_SERVER = '172.17.0.1'
MQTT_TOPIC = '"led/kitchen/set"'

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
		start = call.data.get(ATTR_FROM)
		stop = call.data.get(ATTR_TO)
		count = start
		while (count <= stop):
			string = {
                'state': 'ON',
				'color': {
					'r': red,
					'g': green,
					'b': blue
					},
				'effect': 'pixel', 
				'pixel': count}
			subprocess.call(['mosquitto_pub', '-h',
                MQTT_SERVER, '-t', MQTT_TOPIC, '-m', str(string)])
			count = count +1
	hass.services.register(DOMAIN, 'set_pixel', set_pixel_service)
	return True