import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;
import java.util.Scanner;

public class KMeansCluster {

    public static ArrayList<DataPoint> kMeans(int k) {

        // load data from input file
        ArrayList<DataPoint> data = importData();

        // arbitrarily select k objects from D as the initial cluster mean (centroids)
        ArrayList<DataPoint> centroids = selectInitialCentroids(data, k);

        // repeat until convergence
        boolean converged = false;
        while (!converged) {

            // reassign each object to the cluster to which it is most similar
            ArrayList<ArrayList<DataPoint>> clusters = assignToClusters(data, centroids);

            // update cluster centroids using data points in each cluster
            ArrayList<DataPoint> newCentroids = updateCentroids(clusters);

            // check for convergence
            converged = hasConverged(centroids, newCentroids);

            // update centroids for the next iteration
            centroids = newCentroids;
        }

        return centroids;
    }

    private static ArrayList<DataPoint> importData(){

        ArrayList<DataPoint> data = new ArrayList<>();

        try {
            File file = new File("C:\\Users\\Nate\\Documents\\GitHub\\cscd429\\hw3\\synthetic_control_data.txt");
            Scanner kb = new Scanner(file);

            while (kb.hasNext()) {
                String line = kb.nextLine();

                // some numbers in file have 2,3, or 4 decimals
                // which in turn creates more space between characters,
                // so we use \s+ to account for this
                String[] numbers = line.split("\\s+");

                // array for all 60 attributes
                double[] attributes = new double[60];

                for (int i = 0; i < numbers.length && i < attributes.length; i++) {
                    attributes[i] = Double.parseDouble(numbers[i]);
                }

                // create new data point and add to data list
                data.add(new DataPoint(attributes));
            }

            kb.close();
        } catch (FileNotFoundException f) {
            f.printStackTrace();
        }

        return data;
    }

    // choose arbitrary initial centroids
    private static ArrayList<DataPoint> selectInitialCentroids(ArrayList<DataPoint> data, int k) {

        ArrayList<DataPoint> initialCentroids = new ArrayList<>();
        ArrayList<DataPoint> shuffledData = new ArrayList<>(data);

        // randomly permute data points
        Collections.shuffle(shuffledData, new Random());

        // choose k points
        for (int i = 0; i < k; i++) {
            initialCentroids.add(shuffledData.get(i));
        }

        return initialCentroids;
    }

    // assign data points to clusters
    private static ArrayList<ArrayList<DataPoint>> assignToClusters(ArrayList<DataPoint> data, ArrayList<DataPoint> centroids) {

        ArrayList<ArrayList<DataPoint>> clusters = new ArrayList<>();

        // add new array list to hold data points
        // for each centroid
        for (int i = 0; i < centroids.size(); i++) {
            clusters.add(new ArrayList<>());
        }

        // assign each data point to the nearest cluster
        for (DataPoint dataPoint : data) {
            int nearestClusterIndex = findNearestCluster(dataPoint, centroids);
            clusters.get(nearestClusterIndex).add(dataPoint);
        }

        return clusters;
    }

    // calculate nearest cluster
    private static int findNearestCluster(DataPoint dataPoint, ArrayList<DataPoint> centroids) {

        double minDistance = Double.MAX_VALUE;
        int nearestClusterIndex = -1;

        // check every centroid
        for (int i = 0; i < centroids.size(); i++) {

            // calculate distance between current data point and centroids,
            // and determine the nearest centroid
            double distance = calculateEuclideanDistance(dataPoint, centroids.get(i));
            if (distance < minDistance) {
                minDistance = distance;
                nearestClusterIndex = i;
            }
        }

        return nearestClusterIndex;
    }


    // calculate distance between two data points
    private static double calculateEuclideanDistance(DataPoint p1, DataPoint p2) {
        double sum = 0.0;
        for (int i = 0; i < p1.attributes.length; i++) {
            sum += Math.pow(p1.attributes[i] - p2.attributes[i], 2);
        }

        return Math.sqrt(sum);
    }

    // update centroids
    private static ArrayList<DataPoint> updateCentroids(ArrayList<ArrayList<DataPoint>> clusters) {

        ArrayList<DataPoint> newCentroids = new ArrayList<>();

        // check every cluster
        for (ArrayList<DataPoint> cluster : clusters) {

            // if the cluster isn't empty, calculate new centroids based
            // off of current data points in cluster
            if (!cluster.isEmpty()) {
                DataPoint centroid = calculateCentroid(cluster);
                newCentroids.add(centroid);
            }
        }

        return newCentroids;
    }

    // calculate cluster centroid using the mean
    private static DataPoint calculateCentroid(ArrayList<DataPoint> cluster) {

        double[] centroidAttributes = new double[cluster.get(0).attributes.length];

        // iterate through every attribute
        for (int i = 0; i < cluster.get(0).attributes.length; i++) {

            double sum = 0.0;

            // add the current attribute values for every data point in the cluster
            for (DataPoint dataPoint : cluster) {
                sum += dataPoint.attributes[i];
            }

            // calculate current attributes mean
            // for the new centroid
            centroidAttributes[i] = sum / cluster.size();
        }

        return new DataPoint(centroidAttributes);
    }

    // method to check for convergence (no redistribution of objects in any cluster)
    private static boolean hasConverged(ArrayList<DataPoint> centroids1, ArrayList<DataPoint> centroids2) {

        // check every centroid
        for (int i = 0; i < centroids1.size(); i++) {

            double[] attributes1 = centroids1.get(i).attributes;
            double[] attributes2 = centroids2.get(i).attributes;

            // check every attribute
            for (int j = 0; j < attributes1.length; j++) {
                if (attributes1[j] != attributes2[j]) {
                    return false;
                }
            }
        }
        return true;
    }

    /* method to write to file
    private static void writeClustersToFile(ArrayList<DataPoint> centroids, ArrayList<ArrayList<DataPoint>> clusters) {
        for (int i = 0; i < centroids.size(); i++) {

            String fileName = "cluster_" + (i + 1) + ".txt";
            try (FileWriter writer = new FileWriter(fileName)) {

                for (DataPoint dataPoint : clusters.get(i)) {
                    // Concatenate attributes and write as a single line
                    String line = "";
                    for (double attribute : dataPoint.attributes) {
                        line += attribute + " ";
                    }
                    writer.write(line.trim() + "\n");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }*/

    
    public static void main(String[] args) {

        // run k-means clustering
        ArrayList<DataPoint> centroids = KMeansCluster.kMeans(6);

        // get the clusters
        ArrayList<ArrayList<DataPoint>> clusters = assignToClusters(importData(), centroids);

        // write clusters to files
        //writeClustersToFile(centroids, clusters);
    }
}