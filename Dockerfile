# Use the specified version of PostgreSQL
FROM postgres:16.2-alpine3.19

# Install build dependencies
RUN apk add --no-cache git make gcc libc-dev postgresql-dev

# Clone the jalali_utils repository
RUN git clone https://github.com/teamappir/jalali_utils.git /jalali_utils

# Build and install the extension
RUN cd /jalali_utils && make && make install

# Cleanup to reduce image size
RUN apk del git make gcc libc-dev


