// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import "@fortawesome/fontawesome-free/css/all"  // it will work if it is placed at 1st line

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

global.$ = require("jquery")

import JQuery from 'jquery'
window.$ = window.JQuery = JQuery

import "bootstrap"
import 'bootstrap/dist/css/bootstrap'
import "../stylesheets/application"


import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"



Rails.start()
Turbolinks.start()
ActiveStorage.start()

