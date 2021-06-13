const db = require('../db')

class TireController {
    getAllProducts(req, res) {
        try {
            db.query('SELECT ' +
                'idТовар as id, ' +
                'стоимость as price, ' +
                'описание as description, ' +
                'Имя as tireMakerName, ' +
                'производитель_шин.Страна as tireCountry, ' +
                'производитель_дисков.Страна as discCountry, ' +
                'Наименование as discMakerName,' +
                'производитель_дисков.id as discMakerId,' +
                'производитель_шин.id_vendor_psh as tireMakerId,' +
                'товар.id_шины as tireId,' +
                'товар.id_диски as discId ' +
                'FROM товар ' +
                'JOIN шины ON шины.idшины = товар.id_шины ' +
                'JOIN `производитель_шин` ON шины.id_производителя = производитель_шин.id_vendor_psh ' +
                'JOIN диски ON диски.idДиски = товар.id_диски ' +
                'JOIN `производитель_дисков` ON диски.idvendor = производитель_дисков.id ' +
                'where id_диски AND id_шины', function (err, results, fields) {
                if (err) return res.json(err)
                res.json(results)
            })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error getting tires'})
        }
    }

    getTire(req, res) {
        try {
            db.query(`
                SELECT 
                idТовар as id,
                стоимость as price,
                описание as description,
                Имя as tireMakerName,
                производитель_шин.Страна as tireCountry,
                производитель_дисков.Страна as discCountry,
                производитель_дисков.Наименование as discMakerName,
                параметры_шин.диаметр as tireDiametr,
                параметры_шин.ширина as tireWidth,
                высота as tireHeight,
                Сезон as tireSeason,
                тип_резины.Наименование as tireTypeName,
                размер_дисков.Диаметр as discDiametr,
                размер_дисков.Ширина as discWidth
                
                FROM товар JOIN шины ON шины.idшины = товар.id_шины 
                JOIN производитель_шин ON шины.id_производителя = производитель_шин.id_vendor_psh 
                JOIN параметры_шин ON шины.id_размеры = параметры_шин.id_параметров 
                JOIN тип_резины ON шины.id_резины = тип_резины.idРезины 
                JOIN диски ON диски.idДиски = товар.id_диски 
                JOIN производитель_дисков ON диски.idvendor = производитель_дисков.id 
                JOIN размер_дисков ON диски.idsize = размер_дисков.idРазмер 
                where id_диски AND id_шины AND idТовар= ${req.params.id}`,
                function (err, results, fields) {
                    if (err) {
                        console.log(err)
                        return res.json(err)
                    }
                    res.json(results)
                })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error getting tire'})
        }
    }

    getAllTires(req, res) {
        try {
            db.query('select id_размеры as tireSize, id_производителя as tireMakerId, id_резины as tireRubber, idшины as tireId from шины',
                function (err, results, fields) {
                    if (err) {
                        console.log(err)
                        return res.json(err)
                    }
                    res.json(results)
                })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error getting tire'})
        }
    }

    getTireMakers(req, res) {
        try {
            db.query('SELECT id_vendor_psh as tireMakerId, Имя as tireMakerName, Страна as tireMakerCountry FROM производитель_шин',
                function (err, results, fields) {
                    if (err) {
                        console.log(err)
                        return res.json(err)
                    }
                    res.json(results)
                })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error fetching tireMakers'})
        }
    }

    getDiscMakers(req, res) {
        try {
            db.query('SELECT id as discMakerId, Страна as discMakerCountry, Наименование as discMakerName FROM производитель_дисков',
                function (err, results, fields) {
                    if (err) {
                        console.log(err)
                        return res.json(err)
                    }
                    res.json(results)
                })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error fetching discMakers'})
        }
    }
    
    editProduct(req, res) {
        try{
            const {price, description, tireId, discId, id} = req.body
            console.log(req.body)
            db.query(`UPDATE товар set стоимость = ${price}, описание = ${description}, id_шины = ${tireId}, id_диски = ${discId} where idТовар = ${id}`,
                function (err, results, fields) {
                    if (err) {
                        console.log(err)
                        return res.json(err)
                    }
                    res.json(results)
                })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error editing product'})
        }
    }

    deleteProduct(req, res) {
        const id = req.params.id
        try {
            db.query(`DELETE from товар where idТовар = ${id}`,
                function (err, results, fields) {
                    if (err) {
                        console.log(err)
                        return res.json(err)
                    }
                    res.json(results)
                })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error deleting product'})
        }
    }

    createProduct(req, res) {
        console.log(req.body)
        const {price, description, tireId, discId} = req.body
        try {
            db.query(`INSERT INTO товар (стоимость, описание, id_шины, id_диски) VALUES (${price},'${description}',${tireId},${discId})`,
                function (err, results, fields) {
                    if (err) {
                        console.log(err)
                        return res.json(err)
                    }
                    console.log(results)
                    res.json(results)
                })
        } catch (e) {
            console.log(e)
            res.status(400).json({message: 'Error creating product'})
        }
    }
    
}

module.exports = new TireController()