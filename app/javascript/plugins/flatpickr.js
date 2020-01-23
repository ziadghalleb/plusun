import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

console.log(document.querySelector(".datepicker"))

const a = ["2020-01-30", { from: "2020-02-02", to: "2020-02-07" },"2020-02-21", "2025-03-08", new Date(2025, 4, 9) ]



flatpickr("#range_start", {
    "plugins": [new rangePlugin({ input: "#secondRangeInput"})],
    enableTime: true,
    minDate: "today",
    dateFormat: "Y-m-d H:i",
    enable: a,
});



flatpickr("#availabilityStart", {
    "plugins": [new rangePlugin({ input: "#availabilityEnd"})],
    enableTime: true,
    inline: true,
    showMonths: 2,
    minDate: "today",
    dateFormat: "Y-m-d H:i",
    enable: a,
});


console.log('toto')
