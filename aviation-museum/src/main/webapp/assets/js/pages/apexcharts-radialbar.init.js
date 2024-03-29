function getChartColorsArray(e) {
  if (null !== document.getElementById(e)) {
    var r = document.getElementById(e).getAttribute('data-colors')
    return (r = JSON.parse(r)).map(function (e) {
      var r = e.replace(' ', '')
      if (-1 == r.indexOf('--')) return r
      var a = getComputedStyle(document.documentElement).getPropertyValue(r)
      return a || void 0
    })
  }
}
var barchartColors = getChartColorsArray('basic_radialbar'),
  options = {
    series: [70],
    chart: { height: 350, type: 'radialBar' },
    plotOptions: { radialBar: { hollow: { size: '70%' } } },
    labels: ['Cricket'],
    colors: barchartColors,
  },
  chart = new ApexCharts(document.querySelector('#basic_radialbar'), options)
chart.render()
options = {
  series: class1_count,
  chart: { height: 350, type: 'radialBar' },
  plotOptions: {
    radialBar: {
      dataLabels: {
        name: { fontSize: '22px' },
        value: { fontSize: '16px' },
        total: {
          show: !0,
          label: 'Total',
          formatter: function (e) {
            return countryDataTotal
          },
        },
      },
    },
  },
  labels: class1_nm,
  colors: (barchartColors = getChartColorsArray('multiple_radialbar')),
}
;(chart = new ApexCharts(document.querySelector('#multiple_radialbar'), options)).render()
options = {
  series: [getWorkHistoryMonth, getWorkHistoryWeek, getWorkHistoryDay],
  chart: { height: 350, type: 'radialBar' },
  plotOptions: {
    radialBar: {
      offsetY: 0,
      startAngle: 0,
      endAngle: 270,
      hollow: { margin: 5, size: '30%', background: 'transparent', image: void 0 },
      dataLabels: { name: { show: !1 }, value: { show: !1 } },
    },
  },
  colors: (barchartColors = getChartColorsArray('circle_radialbar')),
  labels: ['월', '주', '일'],
  legend: {
    show: !0,
    floating: !0,
    fontSize: '16px',
    position: 'left',
    offsetX: 160,
    offsetY: 15,
    labels: { useSeriesColors: !0 },
    markers: { size: 0 },
    formatter: function (e, r) {
      return e + ':  ' + r.w.globals.series[r.seriesIndex]
    },
    itemMargin: { vertical: 3 },
  },
  responsive: [{ breakpoint: 480, options: { legend: { show: !1 } } }],
}
;(chart = new ApexCharts(document.querySelector('#circle_radialbar'), options)).render()
options = {
  series: [75],
  chart: { height: 350, type: 'radialBar', toolbar: { show: !1 } },
  plotOptions: {
    radialBar: {
      startAngle: -135,
      endAngle: 225,
      hollow: { margin: 0, size: '70%', image: void 0, imageOffsetX: 0, imageOffsetY: 0, position: 'front' },
      track: { strokeWidth: '67%', margin: 0 },
      dataLabels: {
        show: !0,
        name: { offsetY: -10, show: !0, color: '#888', fontSize: '17px' },
        value: {
          formatter: function (e) {
            return parseInt(e)
          },
          color: '#111',
          fontSize: '36px',
          show: !0,
        },
      },
    },
  },
  fill: {
    type: 'gradient',
    gradient: {
      shade: 'dark',
      type: 'horizontal',
      shadeIntensity: 0.5,
      gradientToColors: (barchartColors = getChartColorsArray('gradient_radialbar'))[1],
      inverseColors: !0,
      opacityFrom: 1,
      opacityTo: 1,
      stops: [0, 100],
    },
  },
  stroke: { lineCap: 'round' },
  labels: ['Percent'],
}
;(chart = new ApexCharts(document.querySelector('#gradient_radialbar'), options)).render()
options = {
  series: [67],
  chart: { height: 326, type: 'radialBar', offsetY: -10 },
  plotOptions: {
    radialBar: {
      startAngle: -135,
      endAngle: 135,
      dataLabels: {
        name: { fontSize: '16px', color: void 0, offsetY: 120 },
        value: {
          offsetY: 76,
          fontSize: '22px',
          color: void 0,
          formatter: function (e) {
            return e + '%'
          },
        },
      },
    },
  },
  fill: { type: 'gradient', gradient: { shade: 'dark', shadeIntensity: 0.15, inverseColors: !1, opacityFrom: 1, opacityTo: 1, stops: [0, 50, 65, 91] } },
  stroke: { dashArray: 4 },
  labels: ['Median Ratio'],
  colors: (barchartColors = getChartColorsArray('stroked_radialbar')),
}
;(chart = new ApexCharts(document.querySelector('#stroked_radialbar'), options)).render()
options = {
  series: [76],
  chart: { type: 'radialBar', height: 350, offsetY: -20, sparkline: { enabled: !0 } },
  plotOptions: {
    radialBar: {
      startAngle: -90,
      endAngle: 90,
      track: { background: '#e7e7e7', strokeWidth: '97%', margin: 5, dropShadow: { enabled: !0, top: 2, left: 0, color: '#999', opacity: 1, blur: 2 } },
      dataLabels: { name: { show: !1 }, value: { offsetY: -2, fontSize: '22px' } },
    },
  },
  grid: { padding: { top: -10 } },
  fill: { type: 'gradient', gradient: { shade: 'light', shadeIntensity: 0.4, inverseColors: !1, opacityFrom: 1, opacityTo: 1, stops: [0, 50, 53, 91] } },
  labels: ['Average Results'],
  colors: (barchartColors = getChartColorsArray('semi_radialbar')),
}
;(chart = new ApexCharts(document.querySelector('#semi_radialbar'), options)).render()
