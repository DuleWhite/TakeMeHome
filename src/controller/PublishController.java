package controller;

import module.Pet;
import util.DBUtil;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PublishController {

    public static void publish(Pet pet, String username){
        Connection connection = DBUtil.getConnection();
        StringBuilder imagePath = new StringBuilder();
        String[] imagePaths = pet.getPetImagePath();
        imagePath.append(imagePaths[0]);
        for(int i=1;i<imagePaths.length;i++){
            imagePath.append("&");
            imagePath.append(imagePaths[i]);
        }
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO `pets`(species,petname,petprice,petimgpath,petdetails,phonenumber,ownername,publisherusername) VALUES ('"+pet.getSpecies()+"', '"+pet.getPetName()+"', '"+pet.getPetPrice()+"', '"+imagePath+"', '"+pet.getPetDetails()+"', '"+pet.getPhoneNumber()+"', '"+pet.getOwnerName()+"','"+username+"');");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void publish(String petId, Pet pet){
        Connection connection = DBUtil.getConnection();
        StringBuilder imagePath = new StringBuilder();
        String[] imagePaths = pet.getPetImagePath();
        imagePath.append(imagePaths[0]);
        for(int i=1;i<imagePaths.length;i++){
            imagePath.append("&");
            imagePath.append(imagePaths[i]);
        }
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE `pets` SET species='"+pet.getSpecies()+"',petname='"+pet.getPetName()+"',petprice='"+pet.getPetPrice()+"',petimgpath='"+imagePath+"',petdetails='"+pet.getPetDetails()+"',phonenumber='"+pet.getPhoneNumber()+"',ownername='"+pet.getOwnerName()+"' WHERE petid='"+petId+"';");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Pet> getPublish(String username){
        List<Pet> publishList = new ArrayList<>();
        Connection connection = DBUtil.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM pets WHERE publisherusername='"+username+"';");
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
                publishList.add(pet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publishList;
    }
}
