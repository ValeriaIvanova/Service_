import React, { useEffect, useState } from 'react';
import { Button, Table } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
import {
    deleteDisc,
    getAllDiscs, getDiscMakers, getDiscsCountByBrand, getDiscsCountByCountry,
    setAdminModal,
    setAdminModalType,
    setEditItem,
} from "../../redux/actions/products";
import Loader from "../../components/Loader/Loader";
import AdminModal from "../../components/AdminModal/AdminModal";

const AdminPage = () => {
    const dispatch = useDispatch()

    useEffect(() => {
        dispatch(getAllDiscs())
        dispatch(getDiscMakers())
        dispatch(getDiscsCountByCountry(''))
        dispatch(getDiscsCountByBrand(''))
    }, []);

    const {discs, adminLoading, adminModal, discMakers, discsCountByCountry, discsCountByBrand} = useSelector(state => state.products)

    const countrys = []
    const brands = []

    discMakers.forEach(elem => {
        !countrys.includes(elem.discMakerCountry) && countrys.push(elem.discMakerCountry)
    })
    discMakers.forEach(elem => {
        !brands.includes(elem.discMakerName) && brands.push(elem.discMakerName)
    })

    const openModal = (type, idDisc) => {
        dispatch(setAdminModalType(type))
        dispatch(setEditItem(idDisc))
        dispatch(setAdminModal(true))
    }

    const countryChangeHandler = event => {
        const country = event.target.value
        console.log(country)
        dispatch(getDiscsCountByCountry(country))
    }

    const brandChangeHandler = event => {
        const brand = event.target.value
        console.log(brand)
        dispatch(getDiscsCountByBrand(brand))
    }

    return (
        <>
            {adminModal && <AdminModal show={adminModal} onHide={() => dispatch(setAdminModal(false))}/>}
            {!adminLoading ?
                <>
                    <h1 style={{fontSize: 25}}>Страница редактирования ассортимента дисков</h1>
                    <h3 style={{fontSize: 15, textAlign: 'center'}}>Поиск дисков по стране и наименованию производителя</h3>
                    <div style={{display: 'flex', justifyContent: 'space-around'}}>
                        <div style={{marginBottom: 20, width: 300}}>
                            <div style={{fontSize: 18, marginBottom: 5}}>Выберите страну производителя</div>
                            <select className="form-control mb-1" onChange={countryChangeHandler}>
                                <option></option>
                                {countrys.map((elem, index) => <option key={index}>{elem}</option>)}
                            </select>
                            <div style={{fontSize: 18}}>Найдено {discsCountByCountry} дисков</div>
                        </div>
                        <div style={{marginBottom: 20, width: 300}}>
                            <div style={{fontSize: 18, marginBottom: 5}}>Выберите бренд</div>
                            <select className="form-control mb-1" onChange={brandChangeHandler}>
                                <option></option>
                                {brands.map((elem, index) => <option key={index}>{elem}</option>)}
                            </select>
                            <div style={{fontSize: 18}}>Найдено {discsCountByBrand} дисков</div>
                        </div>
                    </div>
                    <Table striped bordered hover>
                        <thead>
                        <tr>
                            <th>#</th>
                            {/*<th>Id</th>*/}
                            <th>Страна</th>
                            <th>Производитель</th>
                            <th>Диаметр</th>
                            <th>Ширина</th>
                        </tr>
                        </thead>
                        <tbody>
                        {discs.map((elem, index) =>
                            <tr key={index}>
                                <td>
                                    {elem.idDisc}
                                    <Button size="sm" onClick={() => dispatch(deleteDisc(elem.idDisc))}
                                            style={{marginLeft: 7}} variant="danger">Delete</Button>
                                    <Button onClick={() => openModal(1, elem.idDisc)} style={{marginLeft: 7}} size="sm"
                                            variant="success">Edit</Button>
                                </td>
                                {/*<td>{elem.idDisc}</td>*/}
                                <td>{elem.vendorCountry}</td>
                                <td>{elem.vendorName}</td>
                                <td>{elem.discDiametr}</td>
                                <td>{elem.discWidth}</td>
                            </tr>
                        )}
                        </tbody>
                    </Table>
                    <>
                        <Button onClick={() => openModal(0)} variant="success">Добавить</Button>
                    </>
                </>
                :
                <Loader/>}</>
    );
};

export default AdminPage;
