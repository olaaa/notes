#ledger представляет собой последовательное и неизменяемое хранилище для сообщений.

# Create a tenant
bin/pulsar-admin tenants create edna

#посмотреть список тенантов
bin/pulsar-admin tenants list

# Create a namespace
#bin/pulsar-admin namespaces create edna/olga-namespace

#
bin/pulsar-admin namespaces list edna

# Create a topic
#bin/pulsar-admin topics create edna/olga-namespace/olga-topic

#
bin/pulsar-admin topics list edna/olga-namespace

# без этих настроек топик быстро удаляется
#bin/pulsar-admin namespaces set-retention edna/olga-namespace --time -1  --size 1T


#
bin/pulsar-admin topics stats edna/transport/WhatsappLicenseBillEvent


# "msgInCounter" : 3, — количество сообщений в топике

# write message
#bin/pulsar-client produce persistent://edna/olga-namespace/olga-topic --messages 'Hello Olga!'

#
#bin/pulsar-client consume persistent://edna/olga-namespace/olga-topic  -s 'my-subscription' -p Earliest -n 0

# [Pulsar stats | Apache Pulsar](https://pulsar.apache.org/docs/3.1.x/administration-stats/#topic-internal-stats)
bin/pulsar-admin topics stats-internal edna/transport/WhatsappLicenseBillEvent

# [Manage topics | Apache Pulsar](https://pulsar.apache.org/docs/3.1.x/admin-api-topics/#get-subscriptions)
bin/pulsar-admin topics subscriptions edna/transport/WhatsappLicenseBillEvent

#
#bin/pulsar compact-topic --topic persistent://edna/olga-namespace/olga-topic

#
bin/pulsar-admin broker-stats --help

## todo
    topicPolicies      Operations on persistent topics
      Usage: topicPolicies [options]

# для прода
bin/pulsar-admin topics stats persistent://ednav1/transport/rawOutSuperMessageEventPartitionedOld
bin/pulsar-admin topics stats-internal persistent://ednav1/transport/rawOutSuperMessageEventPartitionedOld