const {connection} = require('./index')
const Users = require('./models/users')
const Turns = require('./models/turns')

function deleteModels() {
    const models = [Users, Turns]
    return Promise.all(models.map(model => model.remove({})))
}

const setupSeed = async () => {
    console.log("SEED STARTING");
    const seedAdmin = {
        name: "Alejandro",
        lastName: "Rusinoff",
        province: "Buenos Aires",
        location: "Malvinas Argentinas",
        direction: "Mariano Boedo",
        description: "App para sacar turnos",
        email: "ale@gmail.com",
        password: "123",
    }
    return deleteModels().then(() => Users.create(seedAdmin))
}

try {
    connection.once("open", () =>
        setupSeed().then(() => {
        console.log("SEED TERMINADO");
        process.exit(0);
        })
    );
    } catch (err) {
    console.log("Somethin went wrong on the seed process", err.message);
    process.exit(1);
}
