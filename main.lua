composer = require('composer')

native.setProperty('windowMode', 'fullscreen')

require('config.variables')
require('components.functions.GotoScene')

gotoScene('views.load')