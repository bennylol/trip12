require 'cucumber'
require 'rest-client'
require 'net/http'
require 'json-schema'

# Конфиг
$config = YAML::load_file(File.join('config.yml'))

$suggest_request = $config['env']['SUGGEST_REQUEST_URL']