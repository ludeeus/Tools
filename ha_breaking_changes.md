#### Breaking changes in 0.64:
```
 - #12271 - Purge recorder data by default.
 - #12252 - Alph Vantage: Removed default sensor configuration.
 - #12315 - Updated RainMachine to play better with the entity registry.
 - #12319 - AirVisual: Entity Registry updates and cleanup.
 - #12463 - Update voluputous.
 - #12465 - bump usps version.
 - #12475 - LimitlessLED assumed state.
```
Blog post for this release: <https://home-assistant.io/blog/2018/02/26/release-64/#breaking-changes>


#### Breaking changes in 0.63:
```
 - #12084 - Updated Thahoma sensor name.
 - #11949 - Originally Canary camera is added per location and only displays an image that was captured due to motion. Now it is per device.
 - #12182 - The influxdb retry_queue_limit configuration variable no longer has any effect and can be removed
 - #12041 - Some spelling mistakes in default entity names have been fixed, Seven segments display, Rain Bird Switch, OpenEVSE Sensor, Fido.
 - #11976 - From version 0.64, Home Assistant will by default purge recorded state history that is older than 10 days. 
 - #12124 - Fix duplicate entity_ids in System Monitor.
 - #12237 - Developers only: Following EntityComponent methods have been removed: `extract_from_service`, `async_update_group`, `async_reset`, `prepare_reload`.
```
Blog post for this release: <https://home-assistant.io/blog/2018/02/10/release-63/#breaking-changes>


#### Breaking changes in 0.62:
```
 - #11547 - Tahoma platform will get new entity IDs
 - #11694 - Mold indicator: attribute names no longer include spaces or periods
 - #11691 - Custom component *devs only*.
```
Blog post for this release: <https://home-assistant.io/blog/2018/01/27/release-62>


#### Breaking changes in 0.61:
```
 - #11110 - Extend Threshold binary sensor to support ranges. This means that you can now set up and lower. 
 - #11182 - The Steam game platform contains changes
 - #11172 - The tile platform now shows only active Tiles by default; to show all Tiles, including expired/inactive ones, show_inactive must be True.
 - #11243 - The hidden_string feature has been removed from the isy994 component.
 - #11344 - he egardia alarm panel platform no longer a need the users to run a separate Egardiaserver component.
 - #11193 - The binary sensor platform of the DoorBird integration has been deleted, so remove DoorBird from your binary_sensor configuration.
 - #10979 - Some TP-Link switch and light platform have been renamed.
 - #11096 - Move IMAP Email Content body to an attribute.
 - #11345 - Automations which were using state that was returning target_temperature of the netatmo climate platform needs an update.
 - #11336 - The default availability payloads for the MQTT switch platform have changed from “ON” and “OFF” to “online” and “offline” (in order to match the majority of MQTT platforms that already supported availability reporting).
 - #11461 - Customizations for how entities are exposed to Alexa are no longer set via customize
 - #11427 - The extension of the alpha_vantage requires an update of the configuration as now are exchange data available as well.
 - #11159 - The prometheus component now supports pushing all sensors and fixes wrong metrics. If may require that you update your configuration.
 - #11088 - Insteon local devices will now use their address as the entity_id and name. 
 - #11499 - Google Assistant is no longer configured via customize but instead has its configuration under the google_assistant entry in your configuration.yaml.
 - #11579 - The climate.set_aux_heat service is no longer available for the Sensibo climate platform. Now call climate.turn_on or climate.turn_off.
 - #11677 - Release 0.61.0 introduced a lazy service loading strategy that relied on all components and platforms following our naming convention. After the release we realized that not all services did, which have been addressed by this fix
```
Blog post for this release: <https://home-assistant.io/blog/2018/01/14/release-61/#breaking-changes>


#### Breaking changes in 0.60:
```
 - #11020 - Update snips to listen on new mqtt topic and utilize rawValue.
 - #10691 - Refactor hue to split bridge support from light platform.
 - #10970 - Use luftdaten module.
 - #10805 - ISY994 sensor improvements.
 - #11156 - Homematic next.
```
Blog post for this release: <https://home-assistant.io/blog/2017/12/17/release-60/#breaking-changes>


#### Breaking changes in 0.59:
```
 - #10656 - Added cycles config option to LaMetric notifications.
 - #10486 - Fix name collision when using multiple Hue bridges.
 - #10581 - Single LEDs in Blinkt support.
 - #10435 - Tellduslive update with support for auto config and Local api.
 - #10776 - Add useragent-based detection of JS version.
```
Blog post for this release: <https://home-assistant.io/blog/2017/12/03/release-59/#breaking-changes>


#### Breaking changes in 0.58:
```
 - #10305 - `hass.states.is_state_attr(entity_id, attribute, value` has been removed.
 - #9946  - Refactor Neato botvac components as a vacuum.
 - #10286 - Lutron released a firmware updated for the Caseta system which removed our ability to connect to and control the bridge device over SSH, breaking compatibility with pylutron_caseta and Home Assistant. Component has been updated to work again, please see the docs on how to set it up.
```
Blog post for this release: <https://home-assistant.io/blog/2017/11/18/release-58/#breaking-changes>


#### Breaking changes in 0.57:
```
 - #10282 - IKEA TRÅDFRI: We no longer support entering the key in the configuration.
 - #10006 - API.AI was renamed to Dialogflow.
 - #10277 - Wink: Removed support for entering your username and password in your config
 - #10021 - EmonCMS: Use feed name assigned in EmonCMS if there is one.
 - #10063 - The `namecheapdns` now uses `password` instead of `access_token` in the configuration.
 - #9696  - Fix recorder crash for long state string - enforce a maximum state of 255 characters at core level.
 - #10093 - CoinMarketCap sensor: The name of the sensor attribute ‘24h_volume_usd’ is changed to ‘24h_volume’.
 - #9872  - MQTT Statestream now serializes all data to JSON before publishing.
 - #9843  - Generic thermostat: the configuration option tolerance has been removed and has been replaced by cold_tolerance and hot_tolerance.
 - #9915  - Developers only: frontend has been refactored
```
Blog post for this release: <https://home-assistant.io/blog/2017/11/04/release-57/#breaking-changes>


#### Breaking changes in 0.56:
```
 - #9795 - Simplify track_same_state.
 - #9814 - Split map panel out into its own component.
 - #9817 - Fix ISY994 fan platform overwriting state property.
 - #9859 - Changing name of clicksendaudio component to clicksend_tts.
 - #9901 - Fix load of components without any config from packages.
 - #9916 - Fix the resource naming in the UI.
 - #9884 - Align away state tag with device_trackers.
 - #9879 - Moved siren to Wink from switch.
```
Blog post for this release: <https://home-assistant.io/blog/2017/10/21/release-56/#breaking-changes>


#### Breaking changes in 0.55:
```
 - history_graph component.
 - UPNP component: The external_port configuration option was removed.
 - New Wink services: All device attributes that are multi-words are now separated by “_” and no longer “ “.
 - TP-Link Switch: Attribute names now uses underscores and unnecessary capitalization was removed. 
 - Renamed input_slider to input_number
 - Recorder: Add new purge service and interval. 
 - OpenCV image processing: Typo in classifier was fixed.
 - Tradfri Lights: Async support with resource observation.
```
Blog post for this release: <https://home-assistant.io/blog/2017/10/07/release-55/#breaking-changes>


#### Breaking changes in 0.54:
```
 - Onewire: Added more devices and types, new naming structure.
 - Xiaomi: Renaming of platforms
 - Refactor Swiss Public Transport sensor
 - iOS: All category identifiers need to be lowercase.
```
Blog post for this release: <https://home-assistant.io/blog/2017/09/23/release-54/#breaking-changes>


#### Breaking changes in 0.53:
```
 - The new customize editor is using the file customize.yaml in your config folder. If you are using this file today for other config, make sure to rename it before using the new customize UI editor.
 - There was a breaking change in the way Custom UI is used.
 - The Egardia alarm control panel now defaults to port 52010 instead of 85.
 - The Homematic 'delay' option has been dropped because it is no longer necessary.
 - Switch - Dlink: Remove spaces and capital letters from attribute names for consistency.
```

#### Breaking changes in 0.52:
```
 - Remove spaces from Xiami switch attributes.
 - MQTT Switch: command and availability payload are now no longer linked. Command and availability payload default to ON/OFF and must be configured individually if custom values are required. 
 - Refactor USPS into component with Sensors+Camera.
 - eliqonline: The optional channel_id configuration variable of the Eliqonline sensor needs to be a positive integer.
 - Automatic has disabled password authentication on their API. Home Assistant will now use OAuth2 to authenticate accounts.
```

#### Breaking changes in 0.51:
```
 - Efergy sensors: change units from KW to W
 - Xiaomi vacuum is now a platform of new 'vacuum' component derived from ToggleEntity, and services 
```

#### Breaking changes in 0.50:
```
 - Automations: The state trigger keyword 'state' and the time trigger keyword 'after' were deprecated in 0.46. They have now been removed. Use 'to' and 'at' instead.
 - Wink: the component is no longer supporting the access_token in the config. Use the new OAuth authentication or add your username and password to the config.
 - Alexa/API.AI/Snips.ai/Conversation: configuring responses to intents/sentences has been moved to a new component called 'intent_script'.
 - Switch fritzdect: attributes have been renamed to use underscores and no capital letters.
 - Yahoo Weather: no longer allow configuring forecasts but include all instead.
 - The Home Assistant Z-Wave Cover implementation has been updated to support the latest development version of OpenZWave.
```

#### Breaking changes in 0.49:
```
 - UPC Connect component no longer needs a password passed into the configuration.
 - The Apple TV platform has been upgraded to a component and a remote platform has been added. This requires your Apple TV configuration to be moved to the new 'apple_tv' component.
 - Refactored Amcrest to use central hub component to prepare for future integrations. This requires your Amcrest configuration to be moved to the new 'amcrest' component.
```

#### Breaking changes in 0.48:
```
 - We have added a new option to whitelist folders that can be used as sources for sending files. You will need to use this option if you are using files with the telegram component.
 - Vera battery levels will no longer have the percent sign appended.
 - Notify - SMTP: Added SMTP SSL/TLS support so now you should specify which encryption to use. 
 - Light - LIFX: The 'lifx_effect_breathe' call was deprecated in version 0.47 and has now been removed. You can use 'lifx_effect_pulse' with 'mode: breathe' for the same effect
 - LimitlessLED: No longer automatically fades the lights when turning the light off. Can be restored with a new config option.
```

#### Breaking changes in 0.47:
```
 - Update opencv config to match other image processors.
 - Lutron: Add configuration check and use default var names.
 - Convert mailgun to component.
 - Z-Wave node and scene activated trigger events now use the full entity ID.
 - LIFX: add multiple modes to pulse effect. 
 - Use standard entity_ids for zwave entities. This also introduces a small API breakage, where EVENT_SCENE_ACTIVATED and EVENT_NODE_EVENT will no longer supply an object_id. They will now be tied to the node entity_id.
 - Fix attribute entities. Home Assistant will no longer filter out entities that are ‘falsey’. So you might see more entity attributes show up.
```

#### Breaking changes in 0.46:
```
 - The USPS sensor entity names have changed as there are now two. One for packages and one for mail. Config will now also use scan_interval instead of update_interval.
 - Automation state trigger: From/to checks will now ignore state changes that are just attribute changess.
 - Redesign monitored variables for hp_ilo sensor. monitored_variables is now a list of name and sensor_type values.
 - Automation - time: The after keyword for time triggers (not conditions) has been deprecated in favor of the at keyword. This resembles better what it does (old one still works, gives a warning).
 - Automation - numeric_state: above and below will no longer trigger if it is equal.
 - Broadlink switches: Entity ids will change for switches that don’t have a default name set. In this case the object_id is now used.
 - Disallow ambiguous color descriptors in the light.turn_on schema. This means that you can no longer specify both xy_color and rgb_color.
```

#### Breaking changes in 0.45:
```
 - PyPI Openzwave.
 - Remove listening to homeassistant_start with event automation.
```

#### Breaking changes in 0.44:
```
 - Python Open Z-Wave made a release that fixed string processing. This was backwards incompatible. We have updated our code so you’ll have to update to the latest Python Open Z-Wave with this release. You can also wait one release, as next release we’ll introduce automatic installing of Python Open Z-Wave. 
 - InfluxDB configuration to blacklist domains has been updated to allow more features.
 - The Automatic device tracker has been converted from polling to websocket push. This requires you to make a change in your Automatic account, see our documentation for instructions.
 - The LimitlessLED color temperatures have been turned around to work like other lights. To maintain previous colors you must adjust the color_temp value in your light.turn_on calls to 654 minus your old value (for example, 280 becomes 374).
 - Joao apps will now require an API key to be set for all commands.
```
