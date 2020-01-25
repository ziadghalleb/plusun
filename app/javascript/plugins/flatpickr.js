import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

console.log(document.querySelector(".datepicker"));


const a = JSON.parse(document.getElementById('essaiT').dataset.dates_enable);
const b = JSON.parse(document.getElementById('essaiT').dataset.dates_disable);
console.log(a);
console.log(b);


if (a && a.length) {
  console.log("rempli")
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
}
else
  {
    console.log("vide")
flatpickr("#range_start", {
    "plugins": [new rangePlugin({ input: "#secondRangeInput"})],
    enableTime: true,
    minDate: "today",
    dateFormat: "Y-m-d H:i",
    disable: [
        function(date) {
            // disable every multiple of 8
            return !(date.getDate() % 1);
        }
    ],
});

flatpickr("#availabilityStart", {
    "plugins": [new rangePlugin({ input: "#availabilityEnd"})],
    enableTime: true,
    inline: true,
    showMonths: 2,
    minDate: "today",
    dateFormat: "Y-m-d H:i",
     disable: [
        function(date) {
            // disable every multiple of 8
            return !(date.getDate() % 1);
        }
    ],
});
}




// const dateInputs = () => {
//   const dateLoading = document.querySelector('.widget-content')
//   if (dateLoading) {
//     const unavailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable);
//     flatpickr(".datepicker", {minDate: 'today', disable: unavailableDates})
//   };
// }



console.log('toto')
