import pandas as pd
import pickle

# load .pkl file
with open("../data/player_stats_2424.pkl", "rb") as f:
    data = pickle.load(f)

# convert to DataFrame
df = pd.DataFrame(data)

# print data format
print(df.head())
