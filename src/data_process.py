import pickle

# anti-serialize .pkl file
with open('../data/player_stats_2424.pkl', 'rb') as file:
    loaded_data = pickle.load(file)

print("Loaded Data:", loaded_data)
