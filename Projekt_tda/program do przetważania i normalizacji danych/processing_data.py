import pandas as pd

def get_club(file_name):
    return pd.read_csv('clubs/' + file_name)

def get_clubs(names):
    clubs = []
    # zamienianie nazwy np. z 'Manchester City' na 'Manchester-City'
    names = [name.replace(' ', '-') for name in names]
    for name in names:
        clubs.append(get_club(name + '.csv'))
    return clubs

def get_club_names():
    stats = get_club("TeamStats.csv")
    return list(stats["Club"])

def sort_by_value(data, value = 'Goals', value2 = 'Appearances'):
    return data.sort_values([value, value2], ascending=False)[:10]

def filter_data(data, conditions):
    new_data = data[conditions]
    new_data.fillna(0, inplace=True)
    return new_data

def find_max(clubs):
    # słownik zawierający nazwę_kolumny: aktualnie maksymalną wartość
    max_value_columns = {}

    # iterowanie po nazwach kolumn w klubie
    for col in clubs[0]:
        # utworzenie nazw kolumn w słowniku
        max_value_columns[col] = 0

    # iterowanie po wszystkich klubach
    for club in clubs:
        # iterowanie po kluczach słownika
        for index_col in max_value_columns:
            # maksymalna wartość dla konkretnej kolumny w konkretnym klubie
            max_value_in_column = club[index_col].max()
            # jeżeli wartość w kolumnie jest większa niż w słowniku, zostaje przypisana do słownika
            if max_value_in_column > max_value_columns[index_col]:
                max_value_columns[index_col] = max_value_in_column

    return max_value_columns

def scale(value, low, high):
    return (value - low) / (high - low)

def normalize(data, low=0, high=0):
    column = data.copy()
    column = [scale(record, low, high) for record in column]
    return column

def normalize_club(club, low, high_dictonary):
    club_data = club.copy()

    # iterowanie po słowniku
    for key in high_dictonary:
        # przekazanie do funkcji normalize: kolumny, min = 0 i  maksymalnej wartości dla kolumny
        club_data[key] = normalize(club_data[key], 0, high_dictonary[key])

    return club_data

def save_clubs_to_csv(clubs, names):
    for i in range(len(clubs)):
        clubs[i].to_csv('clubs_csv/' + names[i] + '_version_2.csv', sep=',', encoding='utf-8', index=False)

def main():
    names = get_club_names()
    clubs = get_clubs(names)
    top_players_clubs = list(map(sort_by_value, clubs))

    conditions = ["Goals", "Shots", "Passes", "Shots on target", "Shooting accuracy %", "Big chances created"]

    skills_players_clubs = list(map(lambda club: filter_data(club, conditions), top_players_clubs))
    max_values_in_columns = find_max(skills_players_clubs)

    normalized_clubs = [normalize_club(club, 0, max_values_in_columns) for club in skills_players_clubs]
    save_clubs_to_csv(normalized_clubs, names)


main()
