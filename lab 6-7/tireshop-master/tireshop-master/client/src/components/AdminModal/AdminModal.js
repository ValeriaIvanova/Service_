import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { createDiscs, getDiscMakers, getDiscSizes, updateDiscs } from "../../redux/actions/products";
import { Button, Form, Modal } from "react-bootstrap";

const AdminModal = (props) => {
    const dispatch = useDispatch()

    useEffect(() => {
        dispatch(getDiscMakers())
        dispatch(getDiscSizes())
    }, []);

    const {discMakers, discSizes, adminModalType, editItem} = useSelector(state => state.products)

    const SubmitHandler = event => {
        event.preventDefault()

        const vendor = data.vendor.split(' - ')
        const size = data.size.split(' - ')
        console.log(vendor)
        console.log(size)

        const vendorId = discMakers.find(maker => maker.discMakerName === vendor[0] && maker.discMakerCountry === vendor[1]).discMakerId
        const sizeId = discSizes.find(elem => elem.discDiametr === +size[0] && elem.discWidth === +size[1]).idDiscSize

        console.log(vendorId)
        console.log(sizeId)

        const finishData = {
            vendorId, sizeId
        }

        console.log(finishData)
        if (adminModalType === 0)
            dispatch(createDiscs(finishData))
        else
            dispatch(updateDiscs(editItem, finishData))

        props.onHide()
    }


    const [data, setData] = useState({
        vendor: '', size: ''
    })

    const changeHandler = event => {
        setData({...data, [event.target.name]: event.target.value})
        console.log(data)
    }

    const onClose = () => {
        props.onHide()
    }

    const Validation = () => {
        return data.vendor.length > 0 && data.size.length > 0
    }

    return (
        <Modal
            {...props}
            size="lg"
            aria-labelledby="contained-modal-title-vcenter"
            centered
        >
            <Modal.Header closeButton>
                <Modal.Title id="contained-modal-title-vcenter">
                    {adminModalType === 0 ? 'Создание нового диска' : `Редактирование диска ${editItem}`}
                </Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form onSubmit={SubmitHandler} style={{
                    margin: '0 auto',
                    maxWidth: '400px'
                }}>
                    <Form.Group size="lg" controlId="vendor">
                        <Form.Label>Производитель</Form.Label>
                        <Form.Control
                            as="select"
                            name="vendor"
                            autoFocus
                            type="text"
                            onChange={changeHandler}
                        >
                            <option></option>
                            {discMakers.map((elem, index) => <option
                                key={index}>{elem.discMakerName} - {elem.discMakerCountry}</option>)}
                        </Form.Control>
                    </Form.Group>
                    <Form.Group size="lg" controlId="size">
                        <Form.Label>Размеры</Form.Label>
                        <Form.Control
                            as="select"
                            name="size"
                            type="text"
                            onChange={changeHandler}
                        >
                            <option></option>
                            {discSizes.map((elem, index) => <option
                                key={index}>{elem.discDiametr} - {elem.discWidth}</option>)}
                        </Form.Control>
                    </Form.Group>
                    {adminModalType === 0 ?
                        <Button variant="info" block size="lg" type="submit" disabled={!Validation()}>
                            Создать
                        </Button>
                        :
                        <Button variant="info" block size="lg" type="submit" disabled={!Validation()}>
                            Применить
                        </Button>
                    }
                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={onClose}>Отмена</Button>
            </Modal.Footer>
        </Modal>
    );
};

export default AdminModal;
