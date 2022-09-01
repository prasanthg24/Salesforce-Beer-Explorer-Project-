({
    init : function(component, event, helper)
    {
        component.set
        ('v.mapMarkers', 
        [
            {
                location:
                 {
                    City: 'Vadavalli',
                    State: 'TamilNadu',
                    Country: 'India',
                    Street:'NO 4 Marudham Nagar Extn',
                    PostalCode: '641041'
                }
            },
               { location:
                {
                    City: 'Podanur',
                    State: 'TamilNadu',
                    Country: 'India',
                    Street:'13 Amman Pudur',
                    PostalCode: '641023'
                },
                title :" Podanur "

            },
                {
                    location: {
                        City: 'Juan-les-Pins',
                        Country: 'France'
                    },
    
                    value: 'France6',
                    icon: 'custom:custom74',
                    title: 'Juan-les-Pins'
                },
                {
                    location: {
                        City: 'Cannes',
                        Country: 'France'
                    },
    
                    value: 'France7',
                    icon: 'custom:custom3',
                    title: 'Cannes'
                },
                {
                    location: {
                        City: 'Saint-Raphaël',
                        Country: 'France'
                    },
    
                    value: 'France8',
                    icon: 'custom:custom54',
                    title: 'Saint-Raphaël'
                },

            
        ] );
       
        
        component.set('v.zoomLevel', 10);
    }
})
