const Router = require('express')
const router = new Router()

const tireRouter = require('./tire.routes')
const discRouter = require('./disc.routes')

router.use('/tire', tireRouter)
router.use('/disc', discRouter)

module.exports = router