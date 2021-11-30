# https://kafka.apache.org/quickstart

topic=$1

# Create a topic to store your events
docker exec -it kafka-server kafka-topics.sh --create --topic ${topic} --partitions 1 --replication-factor 1 --bootstrap-server localhost:9092

# Write some events into the topic
docker exec -it kafka-server kafka-console-producer.sh --topic ${topic} --bootstrap-server localhost:9092
# This is my first event
# This is my second event

# Read the events
docker exec -it kafka-server kafka-console-consumer.sh --topic ${topic} --from-beginning --bootstrap-server localhost:9092
