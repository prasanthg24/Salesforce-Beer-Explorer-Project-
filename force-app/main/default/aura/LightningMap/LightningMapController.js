({
    init : function(component, event, helper)
    {
        component.set('v.mapMarkers', [
            {
                location: {
                    Street: 'Badrakaliamman Real-estate',
                    City: 'Podanur',
                    PostalCode: '641023',
                    State: 'TamilNadu',
                    Country: 'India'
                },

                title: 'The White House',
                description: 'Landmark, historic home & office of the United States president, with tours for visitors.'
            }
        ]);
        component.set('v.zoomLevel', 16);
    }
})
