# Note: change this to obtain your chart data from some external source
labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
data = [
  {
    label: 'Current week',
    data: Array.new(labels.length) { rand(0..20) },
    backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
    borderColor: [ 'rgba(255, 99, 132, 1)' ] * labels.length,
    borderWidth: 1,
  }, {
    label: 'Previous Week',
    data: Array.new(labels.length) { rand(0..20) },
    backgroundColor: [ 'rgba(255, 206, 86, 0.2)' ] * labels.length,
    borderColor: [ 'rgba(255, 206, 86, 1)' ] * labels.length,
    borderWidth: 1,
  }
]
options = { }

send_event('barchart', { labels: labels, datasets: data, options: options })
