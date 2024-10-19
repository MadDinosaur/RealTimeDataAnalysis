# Create user 'debezium' with role 'olist-reader' and respective permissions
CREATE USER 'debezium'@'localhost' IDENTIFIED BY 'debezium-pwd';

CREATE ROLE 'olist-reader';

GRANT SELECT,
	  RELOAD, 
      SHOW DATABASES, 
      REPLICATION SLAVE, 
      REPLICATION CLIENT 
      ON *.* TO 'olist-reader';

GRANT 'olist-reader' TO 'debezium'@'localhost';

SELECT user FROM mysql.user;

# Check if binary logging (bin-log) is on
SELECT variable_value as "BINARY LOGGING STATUS (log-bin) ::"
FROM performance_schema.global_variables WHERE variable_name='log_bin';

# Check if global transaction identifiers (gtid_mode, enforce_gtid_consistency) are on
show global variables like '%GTID%';

# Check if binlog_row_value_options is not set to PARTIAL_JSON (connector might fail to consume UPDATE events)
show global variables where variable_name = 'binlog_row_value_options';
