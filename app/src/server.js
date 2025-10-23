const express = require('express');
const { MongoClient } = require('mongodb');

const app = express();
app.use(express.json());

const mongoUri = process.env.MONGO_URI || 'mongodb://mongo:27017/devdb';

let db;
MongoClient.connect(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(client => {
    db = client.db();
    console.log('Connected to MongoDB');
  })
  .catch(err => {
    console.warn('Mongo connection failed:', err.message);
  });

app.get('/health', (req, res) => res.json({ status: 'ok', ts: Date.now() }));
app.get('/items', async (req, res) => {
  if (!db) return res.status(500).json({ error: 'db-not-ready' });
  const items = await db.collection('items').find().toArray();
  res.json(items);
});

app.post('/items', async (req, res) => {
  const doc = req.body;
  const result = await db.collection('items').insertOne(doc);
  res.status(201).json({ id: result.insertedId });
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`App listening on ${port}`));
