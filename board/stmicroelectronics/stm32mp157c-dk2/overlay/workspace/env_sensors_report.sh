#!/bin/sh

#echo "George"
hum=$(cat /sys/bus/iio/devices/iio\:device0/in_humidityrelative_input)
press=$(cat /sys/bus/iio/devices/iio\:device0/in_pressure_input)
temp=$(cat /sys/bus/iio/devices/iio\:device0/in_temp_input)
i2cset -y 2 0x10 0x00 0x00
lighthex=$(i2cget -y 2 0x10 0x04 w)

light=$(( $lighthex ))

##i2cset -y 2 0x10 0x00 0x01

#echo "Temperature is $temp"
#echo "Pressure is $press"
#echo "Humidity is $hum"
#echo "Light is $lighthex $light"

#echo '{"temperature":"'$temp'"}'
#echo '{"humidity":"'$hum'"}'
#echo '{"pressure":"'$press'"}'
#echo '{"light":"'$light'"}'
echo '{"temperature":"'$temp'","humidity":"'$hum'","pressure":"'$press'","light":"'$light'"}'

curl --location --request POST 'http://pilones.de:8080/api/v1/12345678901234567890/telemetry' \
--header 'X-Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MjE1ODM2MzEsIm5iZiI6MTYyMTU4MzY0MSwiZXhwIjoxNjUzMTE5NjMxLCJpc3MiOiJtYXBpdjQtYXV0aCIsImRhdGEiOnsic3NpZCI6ImFhYjJhODhiLTRiMDMtNGMwZS1iYzNlLTE0MGM0YTJjOTFiMiIsInByaXZhdGUiOiJLbzJTbi9UcDJFTWZ5U0xwMlFyMTlCbWM0cHhYWlZUSkwzeXR4aDlOS3Z3U0I3TURWcE9VM29ZTUozK3pHV2lOQ0s4eDBWcGZ0T1o3d3BaNnRWUnluRUxPTS9MelFKOURPemZ4REdXWGt2YjBuVFZmb0wxRlN0WVhxSEt0M2hldzB5c01ycWdUQk8vV3BLcWg5VzJaby9qaG5tRmpVV0hYbzBGcnIyNmEwc1N3bXdhTG1wQkNNUGJYZzhabC9wOUhMd2QvQzhXbG9oWVNmLzl0QWE2N092Qkg4UVZoM2JXNnhqZmFvQWRkMThqaHVlbW1iSG1KN2dxRnRlVnBscWJtTmsvaUZBNFpGQjRNOFgyU1drc01LK3o0Yng4NHhnQnVBMDg0MHV4MlZOTHJaY0FxZkcyZEgxOFJhYVBLdHV2Q3JpeUhRRE1HK2s0Wk5vNHBZK3JiQURzZTZMeHArbzZyREVRVzRwOGZWblA0TnpzVEFRRTdhT1BWRjN2RldYOUN0TFJCMW1zQmx1dzlRYWNVU3VnUm1RZUg2WVV2SHVWUllLZUNVa1pMSmhNMVQyWWtxNk5FaEZJdEdWangyWXg3aHBzOTIveERiRXpxZ2tFNjZkeVpoYjcyUkdubE9JQjAwWXMyVkpCZi9CMGxMb0c2T1lnRWl6TXVuMjJqTG9mdyJ9fQ.jArV_1bGLaM4xVNEeTXdTodERhgFcs5ESAZddyvtC9c' \
--header 'Content-Type: application/json' \
--data-raw '{"temperature":"'$temp'","humidity":"'$hum'","pressure":"'$press'","light":"'$light'"}'
