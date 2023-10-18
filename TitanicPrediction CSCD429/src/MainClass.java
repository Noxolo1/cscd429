import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.functions.Logistic;

public class MainClass {

    public static void main(String args[]){

        try{

            // load training data
            Instances data = DataSource.read("C:\\Users\\Nate\\Documents\\GitHub\\cscd429\\TitanicPrediction CSCD429\\Data\\train.csv");
        }
        catch(Exception e){

            throw new IllegalArgumentException("File could not be opened.");
        }


    }
}
