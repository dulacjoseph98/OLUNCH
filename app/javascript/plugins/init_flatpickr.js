import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    noCalendar: true,
    enableTime: true,
    time_24hr: true
  });
}

export { initFlatpickr };