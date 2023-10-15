const express = require("express");
const app = express();
const authRouter = require("./routes/auth");
const db = require('./config/db');
const storyRouter = require("./routes/story");
const userRouter = require("./routes/user");

const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(authRouter);
app.use(storyRouter);
app.use(userRouter);

app.listen(PORT, () => {
    console.log(`Server is Listening on ${PORT}`);
});