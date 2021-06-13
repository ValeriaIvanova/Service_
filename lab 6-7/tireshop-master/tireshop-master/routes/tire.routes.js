const Router = require('express')
const router = new Router()
const tireController = require('../controllers/tire.controller')

router.get('/getTireMakers', tireController.getTireMakers)
router.get('/getDiscMakers', tireController.getDiscMakers)
router.get('/', tireController.getAllProducts)
router.get('/tires', tireController.getAllTires)
router.get('/:id', tireController.getTire)
router.put('/edit', tireController.editProduct)
router.delete('/:id', tireController.deleteProduct)
router.post('/create', tireController.createProduct)

module.exports = router