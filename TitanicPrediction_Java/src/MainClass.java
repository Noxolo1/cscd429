import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.functions.Logistic;
import weka.gui.explorer.Explorer;


public class MainClass {

    public static void main(String args[]){

        DataSource source;
        Instances data;

        try{

            // load training data
            source = new DataSource("C:\\Users\\Nate\\Documents\\GitHub\\cscd429\\TitanicPrediction CSCD429\\Data\\train.csv");
            data = source.getDataSet();

        }
        catch(Exception e){

            throw new IllegalArgumentException();
        }
        
    }
}
