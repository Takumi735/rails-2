// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "../stylesheets/application"

// Import necessary libraries for Bootstrap Material Datetimepicker
import $ from "jquery"
import moment from "moment"
import "bootstrap-material-datetimepicker"

// Initialize datepickers
$(document).on("turbolinks:load", function () {
  $(".datepicker").bootstrapMaterialDatePicker({
    format: "YYYY-MM-DD",
    clearButton: true,
    weekStart: 1,
    time: false,
  });
});
