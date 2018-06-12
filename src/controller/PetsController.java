package controller;

import module.Pet;
import util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PetsController {
    public static List<Pet> getPets(String species) {
        List<Pet> pets = new ArrayList<>();
        Connection connection = DBUtil.getConnection();
        try {
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM pets";
            switch (species){
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                    sql += " WHERE species='"+species+"';";
                    break;
                default:
                    sql += ";";
            }
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                Pet pet = new Pet();
                pet.setPetId(resultSet.getString("petid"));
                pet.setPetName(resultSet.getString("petname"));
                pet.setPetPrice(resultSet.getDouble("petprice"));
                String petImagePathString = resultSet.getString("petimgpath");
                String[] petImagePath = {};
                if(petImagePathString!=null){
                    petImagePath = petImagePathString.split("&");
                }
                pet.setPetImagePath(petImagePath);
                pet.setPetDetails(resultSet.getString("petdetails"));
                pet.setSpecies(resultSet.getString("species"));
                pet.setPhoneNumber(resultSet.getString("phonenumber"));
                pet.setOwnerName(resultSet.getString("ownername"));
                pets.add(pet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pets;
    }

    public static Pet getPetById(String petId){
        Pet pet = null;
        Connection connection = DBUtil.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM pets WHERE petid='"+petId+"';");
            if(resultSet.next()){
                pet = new Pet();
                pet.setPetId(resultSet.getString("petid"));
                pet.setPetName(resultSet.getString("petname"));
                pet.setPetPrice(resultSet.getDouble("petprice"));
                String petImagePathString = resultSet.getString("petimgpath");
                String[] petImagePath = {};
                if(petImagePathString!=null){
                    petImagePath = petImagePathString.split("&");
                }
                pet.setPetImagePath(petImagePath);
                pet.setPetDetails(resultSet.getString("petdetails"));
                pet.setSpecies(resultSet.getString("species"));
                pet.setPhoneNumber(resultSet.getString("phonenumber"));
                pet.setOwnerName(resultSet.getString("ownername"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pet;

    }
}
