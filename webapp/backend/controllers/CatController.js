const Cat = require('../models/CatModel')
const mongoose = require('mongoose')

// GET ALL CATS
const getAllCats = async (req, res) => {
    const cats = await Cat.find({}).sort({Breed: 1})
    return res.status(200).json(cats)
}

// GET A SINGLE CAT
const getCatById = async (req, res) => {
    const { id } = req.params

    if (!mongoose.Types.ObjectId.isValid(id)){
        return res.status(400).json({error: "Invalid Cat ID (getCatById)"})
    }

    const cat = await Cat.findById(id)

    if (!cat){
        return res.status(404).json({error: "No such cat (getCatById)"})
    }

    return res.status(200).json(cat)
}

// INSERT A SINGLE CAT
const insertCat = async (req, res) => {
    const { Breed, length, origin, min_life_expectancy, max_life_expectancy, min_weight, max_weight,
        family_friendly, shedding, general_health, playfulness, children_friendly, grooming, intelligence,
        other_pets_friendly, friendly_toward_strangers, tendency_to_vocalize } = req.body;

    try {
        const cat = await Cat.create({ Breed, length, origin, min_life_expectancy, max_life_expectancy,
            min_weight, max_weight, family_friendly, shedding, general_health, playfulness, children_friendly,
            grooming, intelligence, other_pets_friendly, friendly_toward_strangers, tendency_to_vocalize })
        return res.status(200).json(cat)
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
}

// DELETE A SINGLE CAT
const deleteCatById = async (req, res) => {
    const { id } = req.params

    if (!mongoose.Types.ObjectId.isValid(id)){
        return res.status(400).json({error: "Invalid Cat ID (deleteCatById)"})
    }

    const cat = await Cat.findOneAndDelete({_id: id})

    if (!cat){
        return res.status(404).json({error: "No such cat (deleteCatById)"})
    }

    return res.status(200).json(cat)
}

// UPDATE A SINGLE CAT
const updateCatById = async (req, res) => {
    const { id } = req.params

    if (!mongoose.Types.ObjectId.isValid(id)){
        return res.status(400).json({error: "Invalid Cat ID (deleteCatById)"})
    }

    const cat = await Cat.findOneAndUpdate({_id: id}, {...req.body})

    if (!cat){
        return res.status(404).json({error: "No such cat (deleteCatById)"})
    }

    return res.status(200).json(cat)
}

// QUERY

module.exports = {
    getAllCats,
    getCatById,
    insertCat,
    deleteCatById,
    updateCatById
}