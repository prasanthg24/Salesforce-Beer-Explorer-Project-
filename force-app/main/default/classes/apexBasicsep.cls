public with sharing class apexBasicsep {
    public apexBasicsep() {

        System.debug('Welcome to Apex Basics class');
        List<Integer> IntList =new List<Integer>{123, 123, 123, 123};
        for(Integer i : IntList)
        {
            System.debug('Numbers =' + i);
        }
    }
}
