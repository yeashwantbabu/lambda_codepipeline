import pandas as pd

def lambda_handler(event, context):
    d = {'col1': [1,3], 'col2': [6,7]}
    df = pd.DataFrame(data=d)
    print(df)
    print('Done x1.2')