import sys
import json

full_out = ""

for out_piece in sys.argv[:]:
    full_out = full_out + out_piece

full_out = full_out.split("\\n")

ret = {}
CARE_LIST = [
    "my_counter_metric",
    "my_counter_metric2",
    "my_gauge_metric",
    "my_histogram_metric",
    "my_summary_metric",
] 

for line in full_out:
    kv = line.split(" ")
    if kv[0] in CARE_LIST:
    # if len(kv) == 2 and kv[0] in CARE_LIST:
        ret[kv[0]] = kv[1]

print(json.dumps(ret))
