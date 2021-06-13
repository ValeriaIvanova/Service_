import React, { useState } from 'react';
import ProductList from "../ProductList/ProductList";
import PaginationComp from "../Pagination/Pagination";
import { useDispatch, useSelector } from "react-redux";
import ModalWindow from "../Modal/ModalWindow";
import { setModal } from "../../redux/actions/products";

const Catalog = () => {
    const {loading, modal, modalId} = useSelector(state => state.products)
    const dispatch = useDispatch()
    console.log(modal)
    return (
            <div style={{marginTop: 20}}>
                {modal && <ModalWindow show={modal} onHide={() => dispatch(setModal(false))} id={modalId} />}
                {!loading && <PaginationComp/>}
                <ProductList/>
                {!loading && <PaginationComp/>}
            </div>
    );
};

export default Catalog;
