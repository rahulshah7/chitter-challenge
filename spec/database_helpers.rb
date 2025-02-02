# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'Cleaning database...'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE peeps;')
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
