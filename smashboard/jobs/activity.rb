# Note: change this to obtain your chart data from some external source
labels = [ 'Active', 'Inactive' ]
data = [
  {
    data: Array.new(2) { rand(80) },
    backgroundColor: [
      '#46BFBD',
      '#F7464A',
    ],
    hoverBackgroundColor: [
      '#36A2EB',
      '#FF6384',
    ],
  },
]
options = { }

send_event('activity', { labels: labels, datasets: data, options: options })
