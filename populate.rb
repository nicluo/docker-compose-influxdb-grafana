require "influxdb"

module InfluxDB
  module Playground
    class Populator
      HOST     = "192.168.99.100"
      PORT     = "8086"
      DATABASE = "testgrafana"
      USER     = "root"
      PASSWORD = "root"

      def write_data_points
        client.write_points(data_points)
      end

      private

      def client
        @client ||= InfluxDB::Client.new(
          host: HOST,
          port: PORT,
          database: DATABASE,
          user: USER,
          password: PASSWORD
        )
      end

      def data_points
        [
          {
            series: "score",
            values: { value: rand(200) }
          },
          {
            series: "searches",
            values: { value: rand(200) }
          }
        ]
      end
    end
  end
end

populator = InfluxDB::Playground::Populator.new
populator.write_data_points