import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    // noCalendar: true,
    enableTime: true,
    time_24hr: true,
    minuteIncrement: 15,
    minDate: new Date()
  });
}

export { initFlatpickr };
