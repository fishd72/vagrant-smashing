# Note: change this to obtain your chart data from some external source
labels = [ 'DEP', 'Manual' ]
data = [
  {
    data: Array.new(2) { rand(80) },
    backgroundColor: [
      '#BCBC49',
      '#49BC9F',
    ],
    hoverBackgroundColor: [
      '#959537',
      '#37957D',
    ],
  },
]
options = { }

send_event('enrolment', { labels: labels, datasets: data, options: options })
