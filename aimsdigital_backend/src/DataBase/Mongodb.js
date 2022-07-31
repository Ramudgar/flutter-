const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/aimsdigital', {
    useUnifiedTopology: true,
    useNewUrlParser: true,
    useFindAndModify:false,
    useCreateIndex:true,
   
}).then( db => console.log('Mongodb is connnected'))
.catch(err => console.log(err));


// mongoose.connect('mongodb://localhost:27017/products', (err, res) => {

//     if( err ) throw err;

//     console.log('Mongodb is connected');

// });
