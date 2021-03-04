import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    // noCalendar: true,
    minDate: 'today',
    maxDate: new Date().fp_incr(14), // 14 days from now works well but not when you add enableTime...
    enableTime: true,
    // time_24hr: true,
    // defaultMinute: 0,
    minuteIncrement: 15,
    // disableMobile: true
  });
}

export { initFlatpickr };
