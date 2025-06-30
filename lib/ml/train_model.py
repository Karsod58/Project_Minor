# train_model.py

import pandas as pd
import random
import pickle
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report

# Generate synthetic dataset
def generate_dataset(num_samples=200):
    data = []
    fields = ['Engineering', 'Medical', 'Commerce']

    for _ in range(num_samples):
        math = random.randint(30, 100)
        physics = random.randint(30, 100)
        chemistry = random.randint(30, 100)
        biology = random.randint(30, 100)
        cs = random.randint(30, 100)
        english = random.randint(30, 100)

        # Rule-based field assignment (you can tweak logic)
        if math + cs > biology + chemistry:
            field = 'Engineering'
        elif biology + chemistry > math + cs:
            field = 'Medical'
        else:
            field = 'Commerce'

        data.append([math, physics, chemistry, biology, cs, english, field])

    df = pd.DataFrame(data, columns=['Math', 'Physics', 'Chemistry', 'Biology', 'CS', 'English', 'Field'])
    return df

# Generate data
df = generate_dataset()

# Split features and labels
X = df.drop('Field', axis=1)
y = df['Field']

# Train/test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train model
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Evaluation (Optional)
print("Classification Report:\n")
print(classification_report(y_test, model.predict(X_test)))

# Save the model
with open('model.pkl', 'wb') as f:
    pickle.dump(model, f)

print("✅ Model trained and saved to model.pkl")
