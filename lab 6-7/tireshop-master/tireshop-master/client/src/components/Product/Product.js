import React, { useContext } from 'react';
import Card from "react-bootstrap/Card";
import { Link } from "react-router-dom";
import classes from './Product.module.css'
import { Button, ListGroup } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
import { deleteProduct, setModal, setModalType } from "../../redux/actions/products";

const urls = [
    // 'https://kolesa-asb.ru/upload/robotyre/65784_800.jpg',
    'https://kolesa-asb.ru/upload/robotyre/section_4683_800.jpg',
    // 'https://kolesa-asb.ru/upload/robotyre/section_4950_800.jpg'
//    urls[Math.round(Math.random() * 2)]
]

const Product = ({id, price, description, tire, disc}) => {
    const {role} = useSelector(state => state.user)
    const {modal} = useSelector(state => state.products)
    const dispatch = useDispatch()

    const openEditModal = () => {
        dispatch(setModalType(0))
        dispatch(setModal(!modal, id))
    }

    return (
        <Card className={classes.card}>
            <Link style={{textAlign: 'center'}} to={{pathname: `/product/${id}`}}>
                <Card.Img style={{width: 220, height: 220, margin: '0 auto', paddingTop: 10}} variant="top"
                          src={urls[0]}/>
            </Link>
            <Link to={{pathname: `/product/${id}`}}>
                <Card.Body>
                    <Card.Title>Комплект:</Card.Title>
                    <ListGroup variant="flush">
                        <ListGroup.Item style={{paddingLeft: 0}}><b>Диск:</b> {disc.name}, {disc.country}
                        </ListGroup.Item>
                        <ListGroup.Item style={{paddingLeft: 0}}><b>Покрышка:</b> {tire.name}, {tire.country}
                        </ListGroup.Item>
                        <ListGroup.Item style={{paddingLeft: 0}}></ListGroup.Item>
                    </ListGroup>
                    <Card.Text>
                        {description ? description : 'Описание к данному товару отсутствует.'}
                    </Card.Text>
                </Card.Body>
            </Link>
            <Card.Footer>
                <div className={role === 1 ? 'd-flex justify-content-between align-items-center' : ''}>
                    <small className="text-muted">Цена: {price} ₽</small>
                    {role === 1 && <div>
                        <Button onClick={openEditModal} variant="secondary">✏️</Button>
                        <Button onClick={() => {dispatch(deleteProduct(id))}} style={{marginLeft: 5}} variant="danger">🗑️</Button>
                    </div>}
                </div>
            </Card.Footer>
        </Card>
    );
};

export default Product;
