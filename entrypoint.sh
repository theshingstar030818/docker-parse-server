#!/bin/sh

# not start livequery by default
LIVE_QUERY_OPTIONS="false"

if [[ "$PARSE_SERVER_LIVE_QUERY_CLASSNAMES" != "" && "$PARSE_SERVER_LIVE_QUERY_REDIS_URL" != "" ]]; then
    # @TODO will work on others livequery options later
    LIVE_QUERY_OPTIONS="{\"redisURL\": \"$PARSE_SERVER_LIVE_QUERY_REDIS_URL\"}"
fi

exec parse-server \
    --liveQuery.classNames="$PARSE_SERVER_LIVE_QUERY_CLASSNAMES" \
    --liveQuery.redisURL="$PARSE_SERVER_LIVE_QUERY_REDIS_URL" \
    --liveQueryServerOptions="$LIVE_QUERY_OPTIONS"
