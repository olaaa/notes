# Create a tenant
bin/pulsar-admin tenants create olga-tenant

#посмотреть список тенантов
bin/pulsar-admin tenants list

# Create a namespace
bin/pulsar-admin namespaces create olga-tenant/olga-namespace

#
bin/pulsar-admin namespaces list olga-tenant

# Create a topic
bin/pulsar-admin topics create olga-tenant/olga-namespace/olga-topic

#
bin/pulsar-admin topics list olga-tenant/olga-namespace

# без этих настроек топик быстро удаляется
bin/pulsar-admin topics update-properties olga-tenant/olga-namespace/olga-topic -p persistence.inactiveTopicRetentionTimeInSeconds=8640000

 bin/pulsar-admin namespaces set-retention olga-tenant/olga-namespace --time -1  --size 1T


#
bin/pulsar-admin topics stats persistent://olga-tenant/olga-namespace/olga-topic
bin/pulsar-admin topics stats olga-tenant/olga-namespace/olga-topic
# "msgInCounter" : 3, — количество сообщений в топике

# write message
bin/pulsar-client produce persistent://olga-tenant/olga-namespace/olga-topic --messages 'Hello Olga!'

#
bin/pulsar-client consume persistent://olga-tenant/olga-namespace/olga-topic  -s 'my-subscription' -p Earliest -n 0

# [Pulsar stats | Apache Pulsar](https://pulsar.apache.org/docs/3.1.x/administration-stats/#topic-internal-stats)
bin/pulsar-admin topics stats-internal persistent://olga-tenant/olga-namespace/olga-topic

# [Manage topics | Apache Pulsar](https://pulsar.apache.org/docs/3.1.x/admin-api-topics/#get-subscriptions)
bin/pulsar-admin topics subscriptions persistent://olga-tenant/olga-namespace/olga-topic

#
bin/pulsar compact-topic --topic persistent://olga-tenant/olga-namespace/olga-topic

#
bin/pulsar-admin broker-stats --help

## todo
    topicPolicies      Operations on persistent topics
      Usage: topicPolicies [options]
