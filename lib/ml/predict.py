import sys, json, pickle

with open('./ml/model.pkl', 'rb') as f:
    model = pickle.load(f)

marks = list(map(int, sys.argv[1:]))
prediction = model.predict([marks])[0]
proba = max(model.predict_proba([marks])[0])

print(json.dumps({
    "predicted_field": prediction,
    "confidence": round(proba, 2)
}))
