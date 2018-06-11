package module;

public class Pet {
    private String petId;
    private String petName;
    private double petPrice;
    private String[] petImagePath;
    private String petDetails;
    private String phoneNumber;
    private String ownerName;

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    private String species;

    public String getPetId() {
        return petId;
    }

    public void setPetId(String petId) {
        this.petId = petId;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public double getPetPrice() {
        return petPrice;
    }

    public void setPetPrice(double petPrice) {
        this.petPrice = petPrice;
    }

    public String[] getPetImagePath() {
        return petImagePath;
    }

    public void setPetImagePath(String[] petImagePath) {
        this.petImagePath = petImagePath;
    }

    public String getPetDetails() {
        return petDetails;
    }

    public void setPetDetails(String petDetails) {
        this.petDetails = petDetails;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public Pet(){
        this.petName = "";
        this.petPrice = 0;
        this.petImagePath = new String[]{""};
        this.petDetails = "";
        this.phoneNumber = "";
        this.ownerName = "";
        this.species = "";
    }
}
