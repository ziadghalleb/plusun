import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

console.log(document.querySelector(".datepicker"))


flatpickr("#range_start", {
    "plugins": [new rangePlugin({ input: "#secondRangeInput"})],
    enableTime: true,
    minDate: "today",
    dateFormat: "Y-m-d H:i",

});

console.log('toto')
