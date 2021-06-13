import React, { useEffect } from 'react';
import './ProductPage.css'
import { useDispatch, useSelector } from "react-redux";
import { getProduct } from "../../redux/actions/products";
import Loader from "../../components/Loader/Loader";
import { Table } from "react-bootstrap";

const url = 'https://kolesa-asb.ru/upload/robotyre/section_4683_800.jpg'

const ProductPage = (props) => {
    const id = props.match.params.id
    const dispatch = useDispatch()

    useEffect(() => {
        dispatch(getProduct(id))
    }, []);

    const {product, loading} = useSelector(state => state.products)
    console.log(product)

    return (
            <div className="container bootdey" style={{paddingTop: 250}}>
                {!loading ?
                <div className="col-md-10">
                    <section className="panel">
                        <div className="panel-body d-flex">
                            <div className="col-md-6">
                                <div className="pro-img-details">
                                    <img src={url} style={{width: 350}} alt="" />
                                </div>
                            </div>
                            <div className="col-md-6">
                                <h4 className="pro-d-title">
                                    <p href="#" className="">
                                        Комплект <b>диск {product.discMakerName} и покрышка {product.tireMakerName}</b> / {product.tireSeason && product.tireSeason}
                                    </p>
                                </h4>
                                <p>
                                    {product.description ? product.description : 'Описание к данному товару отсутствует.'}
                                </p>
                                <Table striped bordered hover>
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Бренд</th>
                                        <th>Страна производитель</th>
                                        <th>Диаметр</th>
                                        <th>Ширина</th>
                                        <th>Высота</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Покрышка</td>
                                        <td>{product.tireMakerName}</td>
                                        <td>{product.tireCountry}</td>
                                        <td>{product.tireDiametr}</td>
                                        <td>{product.tireWidth}</td>
                                        <td>{product.tireHeight}</td>
                                    </tr>
                                    <tr>
                                        <td>Диск</td>
                                        <td>{product.discMakerName}</td>
                                        <td>{product.discCountry}</td>
                                        <td>{product.discDiametr}</td>
                                        <td>{product.discWidth}</td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </Table>
                                <div className="m-bot15 mt-2"><strong>Price : </strong> <span className="pro-price"> ₽{product.price}</span></div>
                                <div className="form-group mt-2">
                                    <label>Quantity</label>
                                    <input type="quantiy" placeholder="1" className="form-control quantity" />
                                </div>
                                <p>
                                    <button className="btn btn-round btn-danger" type="button"><i
                                        className="fa fa-shopping-cart"></i> Add to Cart
                                    </button>
                                </p>
                            </div>
                        </div>
                    </section>
                </div>
                    : <Loader />
                }
            </div>
    );
};

export default ProductPage;
