import os
import time
import json

def get_cpu_usage():
    with open('/proc/stat', 'r') as f:
        lines = f.readlines()
    
    for line in lines:
        if line.startswith('cpu '):
            cpu_stats = line.split()
            break
    
    user = int(cpu_stats[1])
    nice = int(cpu_stats[2])
    system = int(cpu_stats[3])
    idle = int(cpu_stats[4])
    iowait = int(cpu_stats[5])
    irq = int(cpu_stats[6])
    softirq = int(cpu_stats[7])
    steal = int(cpu_stats[8])
    guest = int(cpu_stats[9])
    guest_nice = int(cpu_stats[10])
    
    total_cpu_time = user + nice + system + idle + iowait + irq + softirq + steal + guest + guest_nice
    
    idle_cpu_time = idle + iowait
    
    return total_cpu_time, idle_cpu_time

def track_cpu_usage():
    prev_total, prev_idle = get_cpu_usage()
    
    # Wait for a short period to calculate the usage
    time.sleep(1)
    
    # Get current CPU stats
    curr_total, curr_idle = get_cpu_usage()

    total_diff = curr_total - prev_total
    idle_diff = curr_idle - prev_idle

    if total_diff == 0:
        return 0.0
    
    cpu_usage_percentage = round(100 * (total_diff - idle_diff) / total_diff, 2)
    return cpu_usage_percentage

def get_memory_stat():
    with open('/proc/meminfo', 'r') as meminfo:
        meminfo_data = meminfo.readlines()

    meminfo_dict = {}
    for line in meminfo_data:
        key, value = line.split(':', 1)
        value = value.strip().split(' ')[0]
        meminfo_dict[key] = int(value)

    total_memory = meminfo_dict['MemTotal']
    available_memory = meminfo_dict['MemAvailable']

    avail_memory_percent = round((available_memory / total_memory) * 100, 2)

    available_memory_gb = round(available_memory / (1024 * 1024), 2)

    return avail_memory_percent, available_memory_gb

def get_loadavg():
    with open('/proc/loadavg', 'r') as loadavg:
        loadavg_data = loadavg.read()
    values = loadavg_data.split(' ')
    return values[0], values[1], values[2]


def write_log(log_str, log_dir):
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    
    log_file = os.path.join(log_dir, time.strftime('%Y-%m-%d-awesome-monitoring.log'))

    with open(log_file, 'a') as log:
        log.write(log_str)

def main():
    log_dir = '/var/log'
    timestamp = int(time.time())

    avail_memory_percent, available_memory_gb = get_memory_stat()
    cpu_load_1m, cpu_load_5m, cpu_load_15m = get_loadavg()
    cpu_usage_percent = track_cpu_usage()

    log_entry = {
        'timestamp': timestamp,
        'avail_memory_percent': avail_memory_percent,
        'available_memory_gb': available_memory_gb,
        'cpu_usage_percent': cpu_usage_percent,
        'cpu_load_1m': cpu_load_1m,
        'cpu_load_5m': cpu_load_5m,
        'cpu_load_15m': cpu_load_15m
    }
    log_str = json.dumps(log_entry) + '\n'

    write_log(log_str, log_dir)


if __name__ == "__main__":
    main()