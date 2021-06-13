const Router = require('express')
const router = new Router()
const discController = require('../controllers/disc.controller')

router.get('/', discController.getAllDiscs)
router.get('/sizes', discController.getDiscSizes)
router.get('/country', discController.getDiscsCountByCountry)
router.get('/brand', discController.getDiscsCountByBrand)
router.post('/create', discController.createDisc)
router.delete('/:id', discController.deleteDisc)
router.put('/edit', discController.updateDisc)

module.exports = router