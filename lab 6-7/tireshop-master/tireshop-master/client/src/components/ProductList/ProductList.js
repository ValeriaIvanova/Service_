import React, { useEffect } from 'react';
import classes from "../../App.module.css";
import Product from "../Product/Product";
import { useDispatch, useSelector } from "react-redux";
import { getAllProducts, setModal, setModalType } from "../../redux/actions/products";
import Loader from "../Loader/Loader";
import Card from "react-bootstrap/Card";

const ProductList = () => {
    const dispatch = useDispatch()
    const {products, currentPage, perPage, loading} = useSelector(state => state.products)
    const {role} = useSelector(state => state.user)
    console.log(products)

    const perPageNew = role === 0 ? 36 : 35

    useEffect(() => {
        dispatch(getAllProducts())
    }, []);

       const openCreateModal = () => {
           console.log('OPEN')
            dispatch(setModalType(1))
            dispatch(setModal(true))
        }

    return (
        <div className={classes.CardWrap}>
            {role === 1 && !loading && <Card className="Product_card__GCMRh card" style={{width: 350, height: 451, cursor: 'pointer'}}>
                <Card.Body onClick={openCreateModal}>
                    <p style={{fontSize: 300, textAlign: 'center', lineHeight: 1, color: '#187A64'}}>+</p>
                </Card.Body>
                <Card.Footer>
                    <div>
                        <small className="text-muted">Добавить товар</small>
                    </div>
                </Card.Footer>
            </Card>}
            {!loading ? products.map((elem, index) => {
                    if (index < currentPage * perPageNew && index >= (currentPage - 1) * perPageNew)
                        return <Product id={elem.id} description={elem.description} price={elem.price}
                                        tire={{name: elem.tireMakerName, country: elem.tireCountry}}
                                        disc={{name: elem.discMakerName, country: elem.discCountry}} key={index}/>
                }
                ) :
                <Loader/>
            }
        </div>
    );
};

export default ProductList;
