a = Channel.from( [ 'lolo', [1, 3, 5, 7, 9]], ['lala', [11, 12, 12, 11, 10]] )

process getCsvRow {
  tag "$y"
  publishDir 'results/files'

  input:
  set val(y), val(x) from a
  echo true

  output:
  file "${y}.csv" into result

  """
  echo $x |  sed 's/[][]//g' |   sed 's/[[:space:]]//g' > ${y}.csv
  cat ${y}.csv
  """
}

process bindCsvRows {
  input:
  file(them_files) from result.collect()
  echo true
  publishDir 'results/'

  output:
  file 'master.csv' into lalal

  """
  for file in $them_files; do cat \$file >> master.csv; done
  cat master.csv
  """
}
