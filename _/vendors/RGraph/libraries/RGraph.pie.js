// Version: 2021-01-02
//
    // o--------------------------------------------------------------------------------o
    // | This file is part of the RGraph package - you can learn more at:               |
    // |                                                                                |
    // |                         https://www.rgraph.net                                 |
    // |                                                                                |
    // | RGraph is licensed under the Open Source MIT license. That means that it's     |
    // | totally free to use and there are no restrictions on what you can do with it!  |
    // o--------------------------------------------------------------------------------o

    RGraph = window.RGraph || {isrgraph:true,isRGraph:true,rgraph:true};

    //
    // The pie chart constructor
    //
    RGraph.Pie = function (conf)
    {
        var id     = conf.id,
            canvas = document.getElementById(id),
            data   = conf.data;

        // Get the canvas and context objects
        this.id                = id;
        this.canvas            = canvas;
        this.context           = this.canvas.getContext ? this.canvas.getContext("2d", {alpha: (typeof id === 'object' && id.alpha === false) ? false : true}) : null;
        this.canvas.__object__ = this;
        this.total             = 0;
        this.subTotal          = 0;
        this.angles            = [];
        this.data              = data;
        this.properties        = [];
        this.type              = 'pie';
        this.isRGraph          = true;
        this.isrgraph          = true;
        this.rgraph            = true;
        this.coords            = [];
        this.coords.key        = [];
        this.coordsSticks      = [];
        this.coordsText        = [];
        this.uid               = RGraph.createUID();
        this.canvas.uid        = this.canvas.uid ? this.canvas.uid : RGraph.createUID();
        this.colorsParsed      = false;
        this.original_colors   = [];
        this.firstDraw         = true; // After the first draw this will be false
        this.exploding         = null;





        //
        // Convert strings to numbers
        //
        this.data = RGraph.stringsToNumbers(this.data);







        this.properties =
        {
            centerxAdjust:                  0,
            centeryAdjust:                  0,

            colors:                         ['red', '#ccc', '#cfc', 'blue', 'pink', 'yellow', 'black', 'orange', 'cyan', 'purple', '#78CAEA', '#E284E9', 'white', 'blue', '#9E7BF6'],
            colorsStroke:                   'white',

            linewidth:                      3,

            labels:                         [],
            labelsFont:                     null,
            labelsSize:                     null,
            labelsColor:                    null,
            labelsBold:                     null,
            labelsItalic:                   null,
            labelsSticks:                   false,
            labelsSticksLength:             7,
            labelsSticksColors:             null,
            labelsSticksLinewidth:          1,
            labelsSticksHlength:            5,
            labelsList:                     true,
            labelsIngraph:                  null,
            labelsIngraphColor:             null,
            labelsIngraphFont:              null,
            labelsIngraphSize:              null,
            labelsIngraphBold:              null,
            labelsIngraphItalic:            null,
            labelsIngraphBounding:          true,
            labelsIngraphBoundingFill:      'rgba(255,255,255,0.85)',
            labelsIngraphBoundingStroke:    'rgba(0,0,0,0)',
            labelsIngraphSpecific:          null,
            labelsIngraphUnitsPre:          '',
            labelsIngraphUnitsPost:         '',
            labelsIngraphPoint:             '.',
            labelsIngraphThousand:          ',',
            labelsIngraphDecimals:          0,
            labelsIngraphRadius:            null,
            labelsCenter:                   null,
            labelsCenterSize:               26,
            labelsCenterFont:               null,
            labelsCenterColor:              null,
            labelsCenterItalic:             null,
            labelsCenterBold:               null,

            marginLeft:                     35,
            marginRight:                    35,
            marginTop:                      35,
            marginBottom:                   35,

            title:                          '',
            titleBackground:                null,
            titleHpos:                      null,
            titleVpos:                      0.5,
            titleBold:                      null,
            titleFont:                      null,
            titleSize:                      null,
            titleColor:                     null,
            titleItalic:                    null,
            titleX:                         null,
            titleY:                         null,
            titleHalign:                    null,
            titleValign:                    null,

            shadow:                         true,
            shadowColor:                    '#aaa',
            shadowOffsetx:                  0,
            shadowOffsety:                  0,
            shadowBlur:                     15,

            textBold:                       false,
            textItalic:                     false,
            textSize:                       12,
            textColor:                      'black',
            textFont:                       'Arial, Verdana, sans-serif',
            textAccessible:                 true,
            textAccessibleOverflow:         'visible',
            textAccessiblePointerevents:    false,

            contextmenu:                    null,

            tooltips:                       [],
            tooltipsEvent:                  'onclick',
            tooltipsEffect:                 'fade',
            tooltipsCssClass:               'RGraph_tooltip',
            tooltipsCss:                    null,
            tooltipsHighlight:              true,
            tooltipsFormattedThousand:      ',',
            tooltipsFormattedPoint:         '.',
            tooltipsFormattedDecimals:      0,
            tooltipsFormattedUnitsPre:      '',
            tooltipsFormattedUnitsPost:     '',
            tooltipsFormattedKeyColors:     null,
            tooltipsFormattedKeyColorsShape: 'square',
            tooltipsFormattedKeyLabels:     [],
            tooltipsFormattedListType:  'ul',
            tooltipsFormattedListItems: null,
            tooltipsFormattedTableHeaders: null,
            tooltipsFormattedTableData: null,
            tooltipsPointer:            true,
            tooltipsPositionStatic:     true,

            highlightStyle:                 '2d',
            highlightStyleTwodFill:         'rgba(255,255,255,0.7)',
            highlightStyleTwodStroke:       'rgba(255,255,255,0.7)',
            highlightStyleTwodLinewidth:    0,
            highlightStyleOutlineWidth:     null,

            centerx:                        null,
            centery:                        null,
            radius:                         null,

            border:                         false,
            borderColor:                    'rgba(255,255,255,0.5)',

            key:                            null,
            keyBackground:                  'white',
            keyPosition:                    'graph',
            keyHalign:                      'right',
            keyShadow:                      false,
            keyShadowColor:                 '#666',
            keyShadowBlur:                  3,
            keyShadowOffsetx:               2,
            keyShadowOffsety:               2,
            keyPositionGutterBoxed:         false,
            keyPositionX:                   null,
            keyPositionY:                   null,
            keyColorShape:                  'square',
            keyRounded:                     true,
            keyLinewidth:                   1,
            keyColors:                      null,
            keyInteractive:                 false,
            keyInteractiveHighlightChartStroke: 'black',
            keyInteractiveHighlightChartFill: 'rgba(255,255,255,0.7)',
            keyInteractiveHighlightLabel:   'rgba(255,0,0,0.2)',
            keyLabelsColor:                 null,
            keyLabelsFont:                  null,
            keyLabelsSize:                  null,
            keyLabelsBold:                  null,
            keyLabelsItalic:                null,
            keyLabelsOffsetx:               0,
            keyLabelsOffsety:               0,

            annotatable:                    false,
            annotatableColor:               'black',

            variant:                        'pie',
            variantDonutWidth:              null,
            variantThreedDepth:             20,

            exploded:                       [],

            effectRoundrobinMultiplier:     1,

            centerpin:                      null,
            centerpinFill:                  'gray',
            centerpinStroke:                'white',

            origin:                         0 - (Math.PI / 2),

            clearto:                        'rgba(0,0,0,0)',
            events:                         true,
            
            images:                         null // This is only used for the ActivityMeter variant
        }



        //
        // Calculate the total
        //
        for (var i=0,len=data.length; i<len; i++) {
            this.total += data[i];
            
            // This loop also creates the $xxx objects - this isn't related to
            // the code above but just saves doing another loop through the data
            this['$' + i] = {};
        }




        // Easy access to  properties and the path function
        var properties = this.properties;
        this.path      = RGraph.pathObjectFunction;
        
        
        
        //
        // "Decorate" the object with the generic effects if the effects library has been included
        //
        if (RGraph.Effects && typeof RGraph.Effects.decorate === 'function') {
            RGraph.Effects.decorate(this);
        }
        
        
        
        // Add the responsive method. This method resides in the common file.
        this.responsive = RGraph.responsive;








        //
        // A generic setter
        //
        this.set = function (name)
        {
            var value = typeof arguments[1] === 'undefined' ? null : arguments[1];

            // the number of arguments is only one and it's an
            // object - parse it for configuration data and return.
            if (arguments.length === 1 && typeof arguments[0] === 'object') {
                for (i in arguments[0]) {
                    if (typeof i === 'string') {
                        this.set(i, arguments[0][i]);
                    }
                }

                return this;
            }

            properties[name] = value;

            return this;
        };








        //
        // A generic getter
        //
        this.get = function (name)
        {
            return properties[name];
        };








        //
        // This draws the pie chart
        //
        this.draw = function ()
        {
            //
            // Fire the onbeforedraw event
            //
            RGraph.fireCustomEvent(this, 'onbeforedraw');



            // Translate half a pixel for antialiasing purposes - but only if it hasn't been
            // done already
            //
            // MUST be the first thing done!
            //
            if (!this.canvas.__rgraph_aa_translated__) {
                this.context.translate(0.5,0.5);
            
                this.canvas.__rgraph_aa_translated__ = true;
            }

            // NB: Colors are parsed further down so that the center X/Y can be used
    



            //
            // Make the margins easy ro access
            //
            this.marginLeft   = properties.marginLeft;
            this.marginRight  = properties.marginRight;
            this.marginTop    = properties.marginTop;
            this.marginBottom = properties.marginBottom;

            this.radius     = this.getRadius();// MUST be first
            this.centerx    = (this.graph.width / 2) + this.marginLeft + properties.centerxAdjust;
            this.centery    = (this.graph.height / 2) + this.marginTop + properties.centeryAdjust;
            this.subTotal   = properties.origin;
            this.angles     = [];
            this.coordsText = [];

            //
            // Allow specification of a custom radius & center X/Y
            //
            if (typeof properties.radius === 'number')  this.radius  = properties.radius;
            if (typeof properties.centerx === 'number') this.centerx = properties.centerx;
            if (typeof properties.centery === 'number') this.centery = properties.centery;

    
            if (this.radius <= 0) {
                return;
            }
    
            //
            // Parse the colors for gradients. Its down here so that the center X/Y can be used
            //
            if (!this.colorsParsed) {
    
                this.parseColors();
    
                // Don't want to do this again
                this.colorsParsed = true;
            }


            if (properties.variant.indexOf('3d') > 0) {
                return this.draw3d();
            }




            //
            // Draw the title
            //
            RGraph.drawTitle(
                this,
                properties.title,
                (this.canvas.height / 2) - this.radius - 5,
                this.centerx,
                properties.titleSize ? properties.titleSize : properties.textSize
            );

            //
            // The total of the array of values
            //
            this.total = RGraph.arraySum(this.data);
            var tot    = this.total;
            var data   = this.data;

            for (var i=0,len=this.data.length; i<len; i++) {
                
                var angle = ((data[i] / tot) * RGraph.TWOPI);
    
                // Draw the segment
                this.drawSegment(angle,properties.colors[i],i == (len - 1), i);
            }

            RGraph.noShadow(this);

            //
            // Redraw the seperating lines
            //
            if (properties.linewidth > 0) {
                this.drawBorders();
            }

            //
            // Now draw the segments again with shadow turned off. This is always performed,
            // not just if the shadow is on.
            //
            var len = this.angles.length;
            var r   = this.radius;

            
            for (var action=0; action<2; action+=1) {
                for (var i=0; i<len; i++) {
    
                    this.context.beginPath();
     
                    var segment = this.angles[i];
            
                        if (action === 1) {
                            this.context.strokeStyle = typeof properties.colorsStroke == 'object' ? properties.colorsStroke[i] : properties.colorsStroke;
                        }
                        properties.colors[i] ?  this.context.fillStyle = properties.colors[i] : null;
                        this.context.lineJoin = 'round';
                        
                        this.context.arc(
                            segment[2],
                            segment[3],
                            r,
                            (segment[0]),
                            (segment[1]),
                            false
                        );
                        if (properties.variant == 'donut') {
        
                            this.context.arc(
                                segment[2],
                                segment[3],
                                typeof properties.variantDonutWidth == 'number' ? r - properties.variantDonutWidth : r / 2,
                                (segment[1]),
                                (segment[0]),
                                true
                            );
                            
                        } else {
                            this.context.lineTo(segment[2], segment[3]);
                        }
                    this.context.closePath();
                    action === 0 ? this.context.fill() : this.context.stroke();
                }
            }
            

    

            //
            // Draw label sticks
            //
            if (properties.labelsSticks) {
                
                this.drawSticks();
    
                // Redraw the border going around the Pie chart if the stroke style is NOT white
                var strokeStyle = properties.colorsStroke;
            }

            //
            // Draw the labels
            //
            if (properties.labels) {
                this.drawLabels();
            }
            
            
            //
            // Draw centerpin if requested
            //
            if (properties.centerpin) {
                this.drawCenterpin();
            }
    
    
    
    
            //
            // Draw ingraph labels
            //
            if (properties.labelsIngraph) {
                this.drawInGraphLabels();
            }
    
    
    
    
            //
            // Draw the center label if requested
            //
            if (typeof properties.labelsCenter === 'string') {
                this.drawCenterLabel(properties.labelsCenter);
            }
    
            
            //
            // Setup the context menu if required
            //
            if (properties.contextmenu) {
                RGraph.showContext(this);
            }
    
    
    
            //
            // If a border is pecified, draw it
            //
            if (properties.border) {
                this.context.beginPath();
                this.context.lineWidth = 5;
                this.context.strokeStyle = properties.borderColor;
    
                this.context.arc(
                    this.centerx,
                    this.centery,
                    this.radius - 2,
                    0,
                    RGraph.TWOPI,
                    0
                );
    
                this.context.stroke();
            }

            //
            // Draw the kay if desired
            //
            if (properties.key && properties.key.length) {
                RGraph.drawKey(this, properties.key, properties.colors);
            }
    
            RGraph.noShadow(this);
    
            
            //
            // This function enables resizing
            //
            if (properties.resizable) {
                RGraph.allowResizing(this);
            }
    
    
            //
            // This installs the event listeners
            //
            if (properties.events == true) {
                RGraph.installEventListeners(this);
            }
    

            //
            // Fire the onfirstdraw event
            //
            if (this.firstDraw) {
                this.firstDraw = false;
                RGraph.fireCustomEvent(this, 'onfirstdraw');
                this.firstDrawFunc();
            }




            //
            // Fire the RGraph draw event
            //
            RGraph.fireCustomEvent(this, 'ondraw');

            return this;
        };








        //
        // Used in chaining. Runs a function there and then - not waiting for
        // the events to fire (eg the onbeforedraw event)
        // 
        // @param function func The function to execute
        //
        this.exec = function (func)
        {
            func(this);
            
            return this;
        };








        //
        // Draws a single segment of the pie chart
        // 
        // @param int degrees The number of degrees for this segment
        //
        this.drawSegment = function (radians, color, last, index)
        {
            // IE7/8/ExCanvas fix (when there's only one segment the Pie chart doesn't display
            //if (RGraph.ISOLD && radians == RGraph.TWOPI) {
            //    radians -= 0.0001;
            //} else if (RGraph.ISOLD && radians == 0) {
            //    radians = 0.001;
            //}

            var subTotal = this.subTotal;
                radians  = radians * properties.effectRoundrobinMultiplier;
    
            this.context.beginPath();
    
                color ? this.context.fillStyle   = color : null;
                this.context.strokeStyle = properties.colorsStroke;
                this.context.lineWidth   = 0;
    
                if (properties.shadow) {
                    RGraph.setShadow(
                        this,
                        properties.shadowColor,
                        properties.shadowOffsetx,
                        properties.shadowOffsety,
                        properties.shadowBlur
                    );
                }
    
                //
                // Exploded segments
                //
                if ( (typeof properties.exploded == 'object' && properties.exploded[index] > 0) || typeof properties.exploded == 'number') {
                    
                    var explosion = typeof properties.exploded == 'number' ? properties.exploded : properties.exploded[index];
                    var x         = 0;
                    var y         = 0;
                    var h         = explosion;
                    var t         = subTotal + (radians / 2);
                    var x         = (Math.cos(t) * explosion);
                    var y         = (Math.sin(t) * explosion);
                    var r         = this.radius;
                
                    this.context.moveTo(this.centerx + x, this.centery + y);
                } else {
                    var x = 0;
                    var y = 0;
                    var r = this.radius;
                }
    
                //
                // Calculate the angles
                //
                var startAngle = subTotal;
                var endAngle   = ((subTotal + radians));
    
                this.context.arc(this.centerx + x,
                       this.centery + y,
                       r,
                       startAngle,
                       endAngle,
                       0);
    
                if (properties.variant == 'donut') {
    
                    this.context.arc(
                        this.centerx + x,
                        this.centery + y,
                        typeof properties.variantDonutWidth == 'number' ? r - properties.variantDonutWidth : r / 2,
                        endAngle,
                        startAngle,
                        true
                    );
                } else {
                    this.context.lineTo(this.centerx + x, this.centery + y);
                }
    
            this.context.closePath();
    
    
            // Keep hold of the angles
            this.angles.push([
                subTotal,
                subTotal + radians,
                this.centerx + x,
                this.centery + y
            ]);
    
    
            
            //this.context.stroke();
            this.context.fill();
    
            //
            // Calculate the segment angle
            //
            this.subTotal += radians;
        };








        //
        // Draws the graphs labels
        //
        this.drawLabels = function ()
        {
            // New way of spacing labels out
            if (properties.labels.length && properties.labelsList) {
                return this.drawLabelsList();
            }

            var hAlignment = 'left',
                vAlignment = 'center',
                labels     = properties.labels,
                context    = this.context,
                font       = properties.textFont,
                bold       = properties.labelsBold,
                text_size  = properties.textSize,
                cx         = this.centerx,
                cy         = this.centery,
                r          = this.radius;

            //
            // Turn the shadow off
            //
            RGraph.noShadow(this);
            
            this.context.fillStyle = 'black';
            this.context.beginPath();
    
            //
            // Draw the labels
            //
            if (labels && labels.length) {
                
                var textConf = RGraph.getTextConf({
                    object: this,
                    prefix: 'labels'
                });
    
                for (i=0; i<this.angles.length; ++i) {
                
                    var segment = this.angles[i];
                
                    if (typeof labels[i] != 'string' && typeof labels[i] != 'number') {
                        continue;
                    }
    
                    // Move to the centre
                    this.context.moveTo(cx,cy);
                    
                    var a     = segment[0] + ((segment[1] - segment[0]) / 2),
                        angle = ((segment[1] - segment[0]) / 2) + segment[0];

                    //
                    // Handle the additional "explosion" offset
                    //
                    if (typeof properties.exploded === 'object' && properties.exploded[i] || typeof properties.exploded == 'number') {
    
                        var t          = ((segment[1] - segment[0]) / 2),
                            seperation = typeof properties.exploded == 'number' ? properties.exploded : properties.exploded[i];
    
                        // Adjust the angles
                        var explosion_offsetx = (Math.cos(angle) * seperation),
                            explosion_offsety = (Math.sin(angle) * seperation);
                    } else {
                        var explosion_offsetx = 0,
                            explosion_offsety = 0;
                    }

                    //
                    // Allow for the label sticks
                    //
                    if (properties.labelsSticks) {
                        explosion_offsetx += (Math.cos(angle) * (typeof properties.labelsSticksLength === 'object' ? properties.labelsSticksLength[i] : properties.labelsSticksLength) );
                        explosion_offsety += (Math.sin(angle) * (typeof properties.labelsSticksLength === 'object' ? properties.labelsSticksLength[i] : properties.labelsSticksLength) );
                    }
    
                    //
                    // Coords for the text
                    //
                    var x = cx + explosion_offsetx + ((r + 10)* Math.cos(a)) + (properties.labelsSticks ? (a < RGraph.HALFPI || a > (RGraph.TWOPI + RGraph.HALFPI) ? 2 : -2) : 0),
                        y = cy + explosion_offsety + (((r + 10) * Math.sin(a)));




                    //
                    //  If sticks are enabled use the endpoints that have been saved
                    //
                    if (this.coordsSticks && this.coordsSticks[i]) {
                        var x = this.coordsSticks[i][4][0] + (x < cx ? -5 : 5),
                            y = this.coordsSticks[i][4][1];
                    }


                    //
                    // Alignment
                    //
                    //vAlignment = y < cy ? 'center' : 'center';
                    vAlignment = 'center';
                    hAlignment = x < cx ? 'right' : 'left';
    
                    this.context.fillStyle = properties.textColor;
                    //if (   typeof properties.labelsColors === 'object' && properties.labelsColors && properties.labelsColors[i]) {
                    //    this.context.fillStyle = properties.labelsColors[i];
                    //}

                        RGraph.text({
                            
                           object: this,
                             
                             font: textConf.font,
                             size: textConf.size,
                            color: textConf.color,
                             bold: textConf.bold,
                           italic: textConf.italic,
    
                                 x: x,
                                 y: y,
                              text: labels[i],
                            valign: vAlignment,
                            halign: hAlignment,
                               tag: 'labels'
                        });
                }
                
                this.context.fill();
            }
        };








        //
        // A newer way of spacing out labels
        //
        this.drawLabelsList = function ()
        {
            var segment      = this.angles[i],
                labels       = properties.labels,
                labels_right = [],
                labels_left  = [],
                left         = [],
                right        = [],
                centerx      = this.centerx,
                centery      = this.centery,
                radius       = this.radius,
                offset       = 50 // This may not be used - see the endpoint_outer var below








            //
            // Draw the right hand side labels
            //
            for (var i=0; i<this.angles.length; ++i) {
            
                // Null values do not get labels displayed
                if (RGraph.isNull(this.data[i])) {
                    continue;
                }

                var angle          = this.angles[i][0] + ((this.angles[i][1] - this.angles[i][0]) / 2), // Midpoint
                    endpoint_inner = RGraph.getRadiusEndPoint(centerx, centery, angle, radius + 5),
                    endpoint_outer = RGraph.getRadiusEndPoint(centerx, centery, angle, radius + 30),
                    explosion      = [
                        (typeof properties.exploded === 'number' ? properties.exploded : properties.exploded[i]),
                        (Math.cos(angle) * (typeof properties.exploded === 'number' ? properties.exploded : properties.exploded[i])),
                        (Math.sin(angle) * (typeof properties.exploded === 'number' ? properties.exploded : properties.exploded[i]))
                    ]

                var textConf = RGraph.getTextConf({
                    object: this,
                    prefix: 'labels'
                });

                
                

                if (angle > (-1 * RGraph.HALFPI) && angle < RGraph.HALFPI) {
                    labels_right.push([
                        i,
                        angle,
                        labels[i] ? labels[i] : '',
                        endpoint_inner,
                        endpoint_outer,
                        textConf.color,
                        RGraph.arrayClone(explosion)
                    ]);
                } else {
                    labels_left.push([
                        i,
                        angle,
                        labels[i] ? labels[i] : '',
                        endpoint_inner,
                        endpoint_outer,
                        textConf.color,
                        RGraph.arrayClone(explosion)
                    ]);
                }
            }


            
            
            //
            // Draw the right hand side labels first
            //


            // Calculate how much space there is for each label
            var vspace_right = (this.canvas.height - properties.marginTop - properties.marginBottom) / labels_right.length

            for (var i=0,y=(properties.marginTop + (vspace_right / 2)); i<labels_right.length; y+=vspace_right,i++) {
                
                if (labels_right[i][2]) {

                    var x          = this.centerx + this.radius + offset,
                        idx        = labels_right[i][0],
                        explosionX = labels_right[i][6][0] ? labels_right[i][6][1] : 0,
                        explosionY = labels_right[i][6][0] ? labels_right[i][6][2] : 0

                    var ret = RGraph.text({
                        
                        object: this,
                        
                        font:   textConf.font,
                        size:   textConf.size,
                        color:  textConf.color,
                        bold:   textConf.bold,
                        italic: textConf.italic,

                        x:      x + explosionX,
                        y:      y + explosionY,
                        text:   labels_right[i][2],
                        valign: 'center',
                        halign: 'left',
                        tag:    'labels',
                        color:  labels_right[i][5]
                    });
                    
                    if (ret && ret.node) {
                        ret.node.__index__ = labels_right[i][0];
                    }

                    // This draws the stick
                    this.path(
                        'lc round lw % b m % % qc % % % % s %',
                        properties.labelsSticksLinewidth,
                        labels_right[i][3][0] + explosionX,labels_right[i][3][1] + explosionY,
                        labels_right[i][4][0] + explosionX,labels_right[i][4][1] + explosionY,ret.x - 5 ,ret.y + (ret.height / 2),
                        labels_right[i][5]
                    );

                    
                    // Draw a circle at the end of the stick
                    this.path(
                        'b a % % 2 0 6.2830 false, f %',
                        ret.x - 5,ret.y + (ret.height / 2),
                        labels_right[i][5]
                    );
                }
            }









            //
            // Draw the left hand side labels
            //
            
            

            
            
            // Calculate how much space there is for each label
            var vspace_left = (this.canvas.height - properties.marginTop - properties.marginBottom) / labels_left.length

            for (var i=(labels_left.length - 1),y=(properties.marginTop + (vspace_left / 2)); i>=0; y+=vspace_left,i--) {

                if (labels_left[i][2]) {

                    var x = this.centerx - this.radius - offset,
                        idx        = labels_left[i][0],
                        explosionX = labels_left[i][6][0] ? labels_left[i][6][1] : 0,
                        explosionY = labels_left[i][6][0] ? labels_left[i][6][2] : 0
                    
                    var ret = RGraph.text({
                        
                        object: this,
                        
                        font:   textConf.font,
                        size:   textConf.size,
                        color:  textConf.color,
                        bold:   textConf.bold,
                        italic: textConf.italic,

                        x:      x + explosionX,
                        y:      y + explosionY,
                        text:   labels_left[i][2],
                        valign: 'center',
                        halign: 'right',
                        tag:    'labels'
                    });
                    
                    if (ret && ret.node) {
                        ret.node.__index__ = labels_left[i][0];
                    }
    
                    this.path(
                        'lw % b m % % qc % % % % s %',
                        properties.labelsSticksLinewidth,
                        labels_left[i][3][0] + explosionX,labels_left[i][3][1] + explosionY,
                        labels_left[i][4][0] + explosionX,Math.round(labels_left[i][4][1] + explosionY),ret.x + 5 + ret.width,ret.y + (ret.height / 2),
                        labels_left[i][5]
                    );

                    
                    // Draw a circle at the end odf the stick
                    this.path(
                        'b a % % 2 0 6.2830 false, f %',
                        ret.x + 5 + ret.width,ret.y + (ret.height / 2),
                        labels_left[i][5]
                    );
                }
            }
        };








        //
        // This function draws the pie chart sticks (for the labels)
        //
        this.drawSticks = function ()
        {
            var offset    = properties.linewidth / 2,
                exploded  = properties.exploded,
                sticks    = properties.labelsSticks,
                colors    = properties.colors,
                cx        = this.centerx,
                cy        = this.centery,
                radius    = this.radius,
                points    = [],
                linewidth = properties.labelsSticksLinewidth

            for (var i=0,len=this.angles.length; i<len; ++i) {
            
                var segment = this.angles[i];
    
                // This allows the labelsSticks to be an array as well as a boolean
                if (typeof sticks === 'object' && !sticks[i]) {
                    continue;
                }
    
                var radians = segment[1] - segment[0];
    
                this.context.beginPath();
                this.context.strokeStyle = typeof properties.labelsSticksColors === 'string' ? properties.labelsSticksColors : (!RGraph.isNull(properties.labelsSticksColors) ? properties.labelsSticksColors[i] : 'gray');
                this.context.lineWidth   = linewidth;
                
                if (typeof properties.labelsSticksColor === 'string') {
                    this.context.strokeStyle = properties.labelsSticksColor;
                }
    
                var midpoint = (segment[0] + (radians / 2));
    
                if (typeof exploded === 'object' && exploded[i]) {
                    var extra = exploded[i];
                } else if (typeof exploded === 'number') {
                    var extra = exploded;
                } else {
                    var extra = 0;
                }
                
                //
                // Determine the stick length
                //
                var stickLength = typeof properties.labelsSticksLength === 'object' ? properties.labelsSticksLength[i] : properties.labelsSticksLength;
                

                points[0] = RGraph.getRadiusEndPoint(cx, cy, midpoint, radius + extra + offset);
                points[1] = RGraph.getRadiusEndPoint(cx, cy, midpoint, radius + stickLength + extra - 5);
                
                points[2] = RGraph.getRadiusEndPoint(cx, cy, midpoint, radius + stickLength + extra);
                
                points[3] = RGraph.getRadiusEndPoint(cx, cy, midpoint, radius + stickLength + extra);
                points[3][0] += (points[3][0] > cx ? 5 : -5);
                
                points[4] = [
                    points[2][0] + (points[2][0] > cx ? 5 + properties.labelsSticksHlength : -5 - properties.labelsSticksHlength),
                    points[2][1]
                ];


                this.context.moveTo(points[0][0], points[0][1]);
                this.context.quadraticCurveTo(
                    points[2][0],
                    points[2][1],
                    points[4][0],
                    points[4][1]
                );
    
                this.context.stroke();
                
                //
                // Save the stick end coords
                //
                this.coordsSticks[i] = [
                    points[0],
                    points[1],
                    points[2],
                    points[3],
                    points[4]
                ];
            }
        };








        //
        // The (now Pie chart specific) getSegment function
        // 
        // @param object e The event object
        //
        this.getShape = function (e)
        {
            // The optional arg provides a way of allowing some accuracy (pixels)
            var accuracy = arguments[1] ? arguments[1] : 0;
    
            var canvas      = this.canvas;
            var context     = this.context;
            var mouseCoords = RGraph.getMouseXY(e);
            var mouseX      = mouseCoords[0];
            var mouseY      = mouseCoords[1];
            var r           = this.radius;
            var angles      = this.angles;
    
            for (var i=0,len=angles.length; i<len; ++i) {

                // Draw the segment again so that it can be tested
                this.path(
                    'b ss rgba(0,0,0,0) a % % % % % false',
                    angles[i][2],angles[i][3],this.radius,angles[i][0],angles[i][1]
                );
                    
                if (this.type === 'pie' && properties.variant.indexOf('donut') !== -1) {
                    this.path(
                        'a % % % % % true',
                        angles[i][2],angles[i][3],(typeof properties.variantDonutWidth == 'number' ? this.radius - properties.variantDonutWidth : this.radius / 2),angles[i][1],angles[i][0]
                    );
                } else {
                    this.path(
                        'l % %',
                        angles[i][2],angles[i][3]
                    );
                }
                
                this.path('c');
                    
                if (!this.context.isPointInPath(mouseX, mouseY)) {
                    continue;
                }

                if (angles[i][0] < 0) angles[i][0] += RGraph.TWOPI;
                if (angles[i][1] > RGraph.TWOPI) angles[i][1] -= RGraph.TWOPI;
                
                //
                // Get the tooltip for the returned shape
                //
                if (RGraph.parseTooltipText && properties.tooltips) {
                    var tooltip = RGraph.parseTooltipText(properties.tooltips, i);
                }

                return {
                   object: this,
                        x: angles[i][2],
                        y: angles[i][3],
                   radius: this.radius,
               angleStart: angles[i][0],
                 angleEnd: angles[i][1],
                    index: i,
                  dataset: 0,
          sequentialIndex: i,
                    label: properties.labels && typeof properties.labels[i] === 'string' ? properties.labels[i] : null,
                  tooltip: typeof tooltip === 'string' ? tooltip : null
                };
            }
            
            return null;
        };








        this.drawBorders = function ()
        {
            if (properties.linewidth > 0) {
    
                this.context.lineWidth = properties.linewidth;
                this.context.strokeStyle = properties.colorsStroke;
                
                var r = this.radius;
    
                for (var i=0,len=this.angles.length; i<len; ++i) {
                
                    var segment = this.angles[i];

                    this.context.beginPath();
                        this.context.arc(segment[2],
                               segment[3],
                               r,
                               (segment[0]),
                               (segment[0] + 0.001),
                               0);
                        this.context.arc(segment[2],
                               segment[3],
                               properties.variant == 'donut' ? (typeof properties.variantDonutWidth == 'number' ? this.radius - properties.variantDonutWidth : r / 2): r,
                               segment[0],
                               segment[0] + 0.0001,
                               0);
                    this.context.closePath();
                    this.context.stroke();
                }
            }
        };








        //
        // Returns the radius of the pie chart
        // 
        // [06-02-2012] Maintained for compatibility ONLY.
        //
        this.getRadius = function ()
        {
            this.graph = {
                width: this.canvas.width - properties.marginLeft - properties.marginRight,
                height: this.canvas.height - properties.marginTop - properties.marginBottom
            };
    
            if (typeof properties.radius == 'number') {
                this.radius = properties.radius;
            } else {
                this.radius = Math.min(this.graph.width, this.graph.height) / 2;
            }
    
            return this.radius;
        };








        //
        // A programmatic explode function
        // 
        // @param object obj   The chart object
        // @param number index The zero-indexed number of the segment
        // @param number size  The size (in pixels) of the explosion
        //
        this.explodeSegment = function (index, size)
        {
            if (typeof this.exploding === 'number' && this.exploding === index) {
                return;
            }

            //this.set('exploded', []);
            if (!properties.exploded) {
                properties.exploded = [];
            }
            
            // If exploded is a number - convert it to an array
            if (typeof properties.exploded === 'number') {
    
                var original_explode = properties.exploded;
                var exploded = properties.exploded;
    
                properties.exploded = [];
                
                for (var i=0,len=this.data.length; i<len; ++i) {
                    properties.exploded[i] = exploded;
                }
            }
            
            properties.exploded[index] = typeof original_explode == 'number' ? original_explode : 0;

            this.exploding = index;
            var delay = RGraph.ISIE && !RGraph.ISIE10 ? 25 : 16.666;
            var obj = this;

            for (var o=0; o<size; ++o) {
    
                setTimeout(
                    function ()
                    {

                        properties.exploded[index] += 1;
                        RGraph.clear(obj.canvas);
                        RGraph.redrawCanvas(obj.canvas);
                    }, o * delay);
            }
            
            var obj = this;
            setTimeout(function ()
            {
                obj.exploding = null;
            }, size * delay);
        };








        //
        // This function highlights a segment
        // 
        // @param array segment The segment information that is returned by the pie.getSegment(e) function
        //
        this.highlight_segment = function (segment)
        {
            this.context.beginPath();
                this.context.strokeStyle = properties.highlightStyleTwodStroke;
                this.context.fillStyle   = properties.highlightStyleTwodFill;
                this.context.moveTo(segment[0], segment[1]);
                this.context.arc(segment[0], segment[1], segment[2], this.angles[segment[5]][0], this.angles[segment[5]][1], 0);
                this.context.lineTo(segment[0], segment[1]);
            this.context.closePath();
            
            this.context.stroke();
            this.context.fill();
        };








        //
        // Each object type has its own Highlight() function which highlights
        // the appropriate shape
        // 
        // @param object shape The shape to highlight
        //
        this.highlight = function (shape)
        {
            if (properties.tooltipsHighlight) {
                
                if (typeof properties.highlightStyle === 'function') {
                    (properties.highlightStyle)(shape);









                //
                // Inverted style of highlighting
                //
                } else if (properties.highlightStyle === 'invert') {

                    // Loop through all of the segments
                    for (var i=0; i<this.angles.length; ++i) {

                        if (i !== shape.index) {
                            this.path(
                                'b lw % m % % a % % % % % false c s % f %',
                                properties.highlightStyleTwodLinewidth,
                                this.angles[i][2], this.angles[i][3],
                                this.angles[i][2], this.angles[i][3],shape.radius, this.angles[i][0], this.angles[i][1],
                                properties.highlightStyleTwodStroke,
                                properties.highlightStyleTwodFill
                            );
                        }
                    }

                    //this.context.beginPath();
    
                    //    this.context.strokeStyle = properties.highlightStyleTwodStroke;
                    //    this.context.fillStyle   = properties.highlightStyleTwodFill;

                    //    if (properties.variant.indexOf('donut') > -1) {
                    //        this.context.arc(shape.x, shape.y, shape.radius, shape.angleStart, shape.angleEnd, false);
                    //        this.context.arc(shape.x, shape.y, typeof properties.variantDonutWidth == 'number' ? this.radius - properties.variantDonutWidth : shape.radius / 2, shape.angleEnd, shape.angleStart, true);
                    //    } else {
                    //        this.context.arc(shape.x, shape.y, shape.radius + 1, shape.angleStart, shape.angleEnd, false);
                    //        this.context.lineTo(shape.x, shape.y);
                    //    }
                    //this.context.closePath();
        
                    //this.context.stroke();
                    //this.context.fill();














                //
                // 3D style of highlighting
                //
                } else if (properties.highlightStyle == '3d') {

                    this.context.lineWidth = 1;
                    
                    // This is the extent of the 2D effect. Bigger values will give the appearance of a larger "protusion"
                    var extent = 2;
            
                    // Draw a white-out where the segment is
                    this.context.beginPath();
                        RGraph.noShadow(this);
                        this.context.fillStyle   = 'rgba(0,0,0,0)';
                        this.context.arc(shape.x, shape.y, shape.radius, shape.angleStart, shape.angleEnd, false);
                        if (properties.variant == 'donut') {
                            this.context.arc(shape.x, shape.y, shape.radius / 5, shape.angleEnd, shape.angleStart, true);
                        } else {
                            this.context.lineTo(shape.x, shape.y);
                        }
                    this.context.closePath();
                    this.context.fill();
        
                    // Draw the new segment
                    this.context.beginPath();
        
                        this.context.shadowColor   = '#666';
                        this.context.shadowBlur    = 3;
                        this.context.shadowOffsetX = 3;
                        this.context.shadowOffsetY = 3;
        
                        this.context.fillStyle   = properties.colors[shape.index];
                        this.context.strokeStyle = properties.colorsStroke;
                        this.context.arc(shape.x - extent, shape.y - extent, shape.radius, shape.angleStart, shape.angleEnd, false);
                        if (properties.variant == 'donut') {
                            this.context.arc(shape.x - extent, shape.y - extent, shape.radius / 2, shape.angleEnd, shape.angleStart,  true)
                        } else {
                            this.context.lineTo(shape.x - extent, shape.y - extent);
                        }
                    this.context.closePath();
                    
                    this.context.stroke();
                    this.context.fill();
                    
                    // Turn off the shadow
                    RGraph.noShadow(this);
        
                    //
                    // If a border is defined, redraw that
                    //
                    if (properties.border) {
                        this.context.beginPath();
                        this.context.strokeStyle = properties.borderColor;
                        this.context.lineWidth = 5;
                        this.context.arc(shape.x - extent, shape.y - extent, shape.radius - 2, shape.angleStart, shape.angleEnd, false);
                        this.context.stroke();
                    }
                



                // Outline style of highlighting
                } else if (properties.highlightStyle === 'outline') {
            
                    var tooltip = RGraph.Registry.get('tooltip'),
                        index   = tooltip.__index__,
                        coords  = this.angles[index],
                        color   = this.get('colors')[index]
                        width   = this.radius / 12.5;

                    // Allow custom setting of outline
                    if (typeof properties.highlightStyleOutlineWidth === 'number') {
                        width = properties.highlightStyleOutlineWidth;
                    }



                    this.path(
                        'ga 0.25 b a % % % % % false a % % % % % true c f % ga 1',
                        coords[2],
                        coords[3],
                        this.radius + 2 + width,
                        coords[0],
                        coords[1],
                        
                        coords[2],
                        coords[3],
                        this.radius + 2,
                        coords[1],
                        coords[0],
                        color
                    );
        
        
        
        
        
        
                // Default 2D style of  highlighting
                } else {

                    this.context.beginPath();
    
                        this.context.strokeStyle = properties.highlightStyleTwodStroke;
                        this.context.fillStyle   = properties.highlightStyleTwodFill;

                        if (properties.variant.indexOf('donut') > -1) {
                            this.context.arc(shape.x, shape.y, shape.radius, shape.angleStart, shape.angleEnd, false);
                            this.context.arc(shape.x, shape.y, typeof properties.variantDonutWidth == 'number' ? this.radius - properties.variantDonutWidth : shape.radius / 2, shape.angleEnd, shape.angleStart, true);
                        } else {
                            this.context.arc(shape.x, shape.y, shape.radius + 1, shape.angleStart, shape.angleEnd, false);
                            this.context.lineTo(shape.x, shape.y);
                        }
                    this.context.closePath();
        
                    this.context.stroke();
                    this.context.fill();
                }
            }
        };








        //
        // The getObjectByXY() worker method. The Pie chart is able to use the
        // getShape() method - so it does.
        //
        this.getObjectByXY = function (e)
        {
            if (this.getShape(e)) {
                return this;
            }
        };








        //
        // Draws the centerpin if requested
        //
        this.drawCenterpin = function ()
        {
            if (typeof properties.centerpin === 'number' && properties.centerpin > 0) {
            
                var cx = this.centerx;
                var cy = this.centery;
            
                this.context.beginPath();
                    this.context.strokeStyle = properties.centerpinStroke ? properties.centerpinStroke : properties.colorsStroke;
                    this.context.fillStyle = properties.centerpinFill ? properties.centerpinFill : properties.colorsStroke;
                    this.context.moveTo(cx, cy);
                    this.context.arc(cx, cy, properties.centerpin, 0, RGraph.TWOPI, false);
                this.context.stroke();
                this.context.fill();
            }
        };








        //
        // This draws Ingraph labels
        //
        this.drawInGraphLabels = function ()
        {
            var context = this.context;
            var cx      = this.centerx;
            var cy      = this.centery;
            var radius  = properties.labelsIngraphRadius;
            
            //
            // Is the radius less than 2? If so then it's a factor and not n exact point
            //
            if (radius <= 2 && radius > 0) {
                radiusFactor = radius;
            } else {
                radiusFactor = 0.5;
            }

            if (properties.variant == 'donut') {
                var r = this.radius * (0.5 + (radiusFactor * 0.5));
                
                if (typeof properties.variantDonutWidth == 'number') {
                    var r = (this.radius - properties.variantDonutWidth) + (properties.variantDonutWidth / 2);
                }
            } else {
                var r = this.radius * radiusFactor;
            }

            if (radius > 2) {
                r = radius;
            }
    
            for (var i=0,len=this.angles.length; i<len; ++i) {
    
                // This handles any explosion that the segment may have
                if (typeof properties.exploded == 'object' && typeof properties.exploded[i] == 'number') {
                    var explosion = properties.exploded[i];
                } else if (typeof properties.exploded == 'number') {
                    var explosion = parseInt(properties.exploded);
                } else {
                    var explosion = 0;
                }
    
                var angleStart  = this.angles[i][0];
                var angleEnd    = this.angles[i][1];
                var angleCenter = ((angleEnd - angleStart) / 2) + angleStart;
                var coords      = RGraph.getRadiusEndPoint(
                    this.centerx,
                    this.centery,
                    angleCenter,
                    r + (explosion ? explosion : 0)
                );

                var x           = coords[0];
                var y           = coords[1];
    
                var text = properties.labelsIngraphSpecific && typeof properties.labelsIngraphSpecific[i] == 'string' ? properties.labelsIngraphSpecific[i] : RGraph.numberFormat({
                    object:    this,
                    number:    this.data[i].toFixed(properties.labelsIngraphDecimals),
                    unitspre:  properties.labelsIngraphUnitsPre,
                    unitspost: properties.labelsIngraphUnitsPost,
                    point:     properties.labelsIngraphPoint,
                    thousand:  properties.labelsIngraphThousand
                });
    
                if (text) {
                    this.context.beginPath();
                        
                        var textConf = RGraph.getTextConf({
                            object: this,
                            prefix: 'labelsIngraph'
                        });
    
                        RGraph.text({
                            
                       object: this,

                         font: textConf.font,
                         size: textConf.size,
                        color: textConf.color,
                         bold: textConf.bold,
                       italic: textConf.italic,

                            x:              x,
                            y:              y,
                            text:           text,
                            valign:         'center',
                            halign:         'center',
                            bounding:       properties.labelsIngraphBounding,
                            boundingFill:   properties.labelsIngraphBoundingFill,
                            boundingStroke: properties.labelsIngraphBoundingStroke,
                            tag:            'labels.ingraph'
                        });
                    this.context.stroke();
                }
            }
        };








        //
        // Draws the center label if required
        //
        this.drawCenterLabel = function (label)
        {
            var textConf = RGraph.getTextConf({
                object: this,
                prefix: 'labelsCenter'
            });

            RGraph.text({
                
           object: this,

             font: textConf.font,
             size: textConf.size,
            color: textConf.color,
             bold: textConf.bold,
           italic: textConf.italic,

                x: this.centerx,
                y: this.centery,

                halign: 'center',
                valign: 'center',

                text: label,
                
                bounding: true,
                boundingFill: 'rgba(255,255,255,0.7)',
                boundingStroke: 'rgba(0,0,0,0)',

                tag: 'labels.center'
            });
        };








        //
        // This returns the angle for a value based around the maximum number
        // 
        // @param number value The value to get the angle for
        //
        this.getAngle = function (value)
        {
            if (value > this.total) {
                return null;
            }
            
            var angle = (value / this.total) * RGraph.TWOPI;
    
            // Handle the origin (it can br -HALFPI or 0)
            angle += properties.origin;
    
            return angle;
        };








        //
        // This allows for easy specification of gradients
        //
        this.parseColors = function ()
        {
            // Save the original colors so that they can be restored when the canvas is reset
            if (this.original_colors.length === 0) {
                this.original_colors.colors                    = RGraph.arrayClone(properties.colors);
                this.original_colors.keyColors                 = RGraph.arrayClone(properties.keyColors);
                this.original_colors.colorsStroke              = RGraph.arrayClone(properties.colorsStroke);
                this.original_colors.highlightStroke           = RGraph.arrayClone(properties.highlightStroke);
                this.original_colors.highlightStyleTwodFill    = RGraph.arrayClone(properties.highlightStyleTwodFill);
                this.original_colors.highlightStyleTwodStroke  = RGraph.arrayClone(properties.highlightStyleTwodStroke);
                this.original_colors.labelsIngraphBoundingFill = RGraph.arrayClone(properties.labelsIngraphBoundingFill);
                this.original_colors.labelsIngraphColor        = RGraph.arrayClone(properties.labelsIngraphColor);
            }

            for (var i=0; i<properties.colors.length; ++i) {
                properties.colors[i] = this.parseSingleColorForGradient(properties.colors[i]);
            }
    
            var keyColors = properties.keyColors;
            if (keyColors) {
                for (var i=0; i<keyColors.length; ++i) {
                    keyColors[i] = this.parseSingleColorForGradient(keyColors[i]);
                }
            }
    
            properties.colorsStroke                = this.parseSingleColorForGradient(properties.colorsStroke);
            properties.highlightStroke             = this.parseSingleColorForGradient(properties.highlightStroke);
            properties.highlightStyleTwodFill    = this.parseSingleColorForGradient(properties.highlightStyleTwodFill);
            properties.highlightStyleTwodStroke  = this.parseSingleColorForGradient(properties.highlightStyleTwodStroke);
            properties.labelsIngraphBoundingFill = this.parseSingleColorForGradient(properties.labelsIngraphBoundingFill);
            properties.labelsIngraphColor         = this.parseSingleColorForGradient(properties.labelsIngraphColor);
        };








        //
        // Use this function to reset the object to the post-constructor state. Eg reset colors if
        // need be etc
        //
        this.reset = function ()
        {
        };








        //
        // This parses a single color value
        //
        this.parseSingleColorForGradient = function (color)
        {
            if (!color || typeof color != 'string') {
                return color;
            }
    
            if (color.match(/^gradient\((.*)\)$/i)) {

                // Allow for JSON gradients
                if (color.match(/^gradient\(({.*})\)$/i)) {
                    return RGraph.parseJSONGradient({object: this, def: RegExp.$1});
                }

                var parts = RegExp.$1.split(':');
    
                // If the chart is a donut - the first width should half the total radius
                if (properties.variant == 'donut') {
                    var radius_start = typeof properties.variantDonutWidth == 'number' ? this.radius - properties.variantDonutWidth : this.radius / 2;
                } else {
                    var radius_start = 0;
                }

                // Create the gradient
                var grad = this.context.createRadialGradient(
                    this.centerx,
                    this.centery,
                    radius_start,
                    this.centerx,
                    this.centery,
                    Math.min(this.canvas.width - properties.marginLeft - properties.marginRight,
                    this.canvas.height - properties.marginTop - properties.marginBottom) / 2
                );
    
    
                var diff = 1 / (parts.length - 1);
    
                grad.addColorStop(0, RGraph.trim(parts[0]));
    
                for (var j=1; j<parts.length; ++j) {
                    grad.addColorStop(j * diff, RGraph.trim(parts[j]));
                }
            }
    
            return grad ? grad : color;
        };








        //
        // This function handles highlighting an entire data-series for the interactive
        // key
        // 
        // @param int index The index of the data series to be highlighted
        //
        this.interactiveKeyHighlight = function (index)
        {
            if (this.angles && this.angles[index]) {

                var segment = this.angles[index];
                var x = segment[2];
                var y = segment[3];
                var start = segment[0];
                var end   = segment[1];
                
                this.context.strokeStyle = properties.keyInteractiveHighlightChartStroke;
                this.context.fillStyle   = properties.keyInteractiveHighlightChartFill;
                this.context.lineWidth   = 2;
                this.context.lineJoin    = 'bevel';
                
                this.context.beginPath();
                this.context.moveTo(x, y);
                this.context.arc(x, y, this.radius, start, end, false);
                this.context.closePath();
                this.context.fill();
                this.context.stroke();
            }
        };








        //
        // Using a function to add events makes it easier to facilitate method chaining
        // 
        // @param string   type The type of even to add
        // @param function func 
        //
        this.on = function (type, func)
        {
            if (type.substr(0,2) !== 'on') {
                type = 'on' + type;
            }
            
            if (typeof this[type] !== 'function') {
                this[type] = func;
            } else {
                RGraph.addCustomEventListener(this, type, func);
            }
    
            return this;
        };








        //
        // This function runs once only
        // (put at the end of the file (before any effects))
        //
        this.firstDrawFunc = function ()
        {
        };









        //
        // Draw a 3D Pie/Donut chart
        //
        this.draw3d = function ()
        {
            var scaleX            = 1.5,
                depth             = properties.variantThreedDepth,
                prop_shadow       = properties.shadow,
                prop_labels       = properties.labels,
                prop_labelsSticks = properties.labelsSticks

            this.set({
                labels: [],
                labelsSticks: false,
                strokestyle: 'rgba(0,0,0,0)'
            });
            
            //
            // Change the variant so that the draw function doesn't keep
            // coming in here
            //
            this.set({
                variant: this.get('variant').replace(/3d/, '')
            });
            
            this.context.setTransform(scaleX, 0, 0, 1, (this.canvas.width * (scaleX) - this.canvas.width) * -0.5, 0);
            
            for (var i=depth; i>0; i-=1) {
                
                this.set({
                    centeryAdjust: i
                });
                
                if (i === parseInt(depth / 2) ) {
                    this.set({
                        labels: prop_labels,
                        labelsSticks: prop_labelsSticks
                    });
                }
                
                if (i === 0) {
                    this.set({
                        shadow: prop_shadow
                    });
                }

                this.draw();

                // Turn off the shadow after the bottom pie/donut has
                // been drawn
                this.set('shadow', false);

                //
                // If on the middle pie/donut turn the labels and sticks off
                //
                if (i <= parseInt(depth / 2) ) {
                    this.set({
                        labels: [],
                        labelsSticks: false
                    });
                }

                //
                // Make what we're drawng darker by going over
                // it in a semi-transparent dark color
                //
                if (i > 1) {
                    if (properties.variant.indexOf('donut') !== -1) {

                        for (var j=0; j<this.angles.length; ++j) {

                            var x  = this.angles[j][2];
                            var y  = this.angles[j][3];
                            var r1 = this.radius;
                            var r2 = this.radius / 2;
                            var a1 = this.angles[j][0];
                            var a2 = this.angles[j][1];

                            this.path(
                                'b a % % % % % false a % % % % % true f rgba(0,0,0,0.15)',
                                x, y, r1, a1, a2,
                                x, y, r2, a2, a1
                            );
                        }

                    // Draw the pie chart darkened segments
                    } else {

                        for (var j=0; j<this.angles.length; ++j) {

                            var x  = this.angles[j][2];
                            var y  = this.angles[j][3];
                            var r1 = this.radius;
                            var r2 = this.radius / 2;
                            var a1 = this.angles[j][0];
                            var a2 = this.angles[j][1];

                            this.path(
                                'b m % % a % % % % % false f rgba(0,0,0,0.15)',
                                x, y,
                                x, y, r1 + 1, a1, a2
                            );
                        }
                    }
                }
            }

            //
            // Reset the variant by adding the 3d back on
            //
            this.set({
                variant: this.get('variant') + '3d',
                shadow: prop_shadow,
                labels: prop_labels,
                labelsSticks: prop_labelsSticks
            });

            // Necessary to allow method chaining
            return this;
        };








        //
        // Pie chart explode
        // 
        // Explodes the Pie chart - gradually incrementing the size of the explode property
        // 
        // @param object     Options for the effect
        // @param function   An optional callback function to call when the animation completes
        //
        this.explode = function ()
        {
            var obj            = this;
            var opt            = arguments[0] ? arguments[0] : {};
            var callback       = arguments[1] ? arguments[1] : function () {};
            var frames         = opt.frames ? opt.frames : 30;
            var frame          = 0;
            var maxExplode     = Number(typeof opt.radius === 'number' ? opt.radius : Math.max(this.canvas.width, this.canvas.height));
            var currentExplode = Number(obj.get('exploded')) || 0;
            var step           = (maxExplode - currentExplode) / frames;
            
            // Lose the labels
            this.set('labels', null);

            // exploded option
            var iterator = function ()
            {
                obj.set('exploded', currentExplode + (step * frame) );

                RGraph.clear(obj.canvas);
                RGraph.redrawCanvas(obj.canvas);
    
                if (frame++ < frames) {
                    RGraph.Effects.updateCanvas(iterator);
                } else {
                    callback(obj);
                }
            }
            
            iterator();
            
            return this;
        };








        //
        // Pie chart grow
        // 
        // Gradually increases the pie chart radius
        // 
        // @param object   OPTIONAL An object of options
        // @param function OPTIONAL A callback function
        //
        this.grow = function ()
        {
            var obj      = this;
            var canvas   = obj.canvas;
            var opt      = arguments[0] ? arguments[0] : {};
            var frames   = opt.frames || 30;
            var frame    = 0;
            var callback = arguments[1] ? arguments[1] : function () {};
            var radius   = obj.getRadius();


            properties.radius = 0;

            var iterator = function ()
            {
                obj.set('radius', (frame / frames) * radius);
                
                RGraph.redrawCanvas(canvas);
    
                if (frame++ < frames) {
                    RGraph.Effects.updateCanvas(iterator);
                
                } else {

                    RGraph.redrawCanvas(obj.canvas);


                    callback(obj);
                }
            };
    
            iterator();
            
            return this;
        };








        //
        // RoundRobin
        // 
        // This effect does two things:
        //  1. Gradually increases the size of each segment
        //  2. Gradually increases the size of the radius from 0
        // 
        // @param object OPTIONAL Options for the effect
        // @param function OPTIONAL A callback function
        //
        this.roundRobin = function ()
        {
            var obj      = this,
                opt      = arguments[0] || {},
                callback = arguments[1] || function () {},
                frame    = 0,
                frames   = opt.frames || 30,
                radius   =  obj.getRadius(),
                labels   =  obj.get('labels')
            
            obj.set('events', false);
            obj.set('labels', []);

            var iterator = function ()
            {
                obj.set(
                    'effectRoundrobinMultiplier',
                    RGraph.Effects.getEasingMultiplier(frames, frame)
                );

                RGraph.redrawCanvas(obj.canvas);

                if (frame < frames) {
                    RGraph.Effects.updateCanvas(iterator);
                    frame++;
                
                } else {

                    obj.set({
                        events: true,
                        labels: labels
                    });

                    RGraph.redrawCanvas(obj.canvas);
                    callback(obj);
                }
            };
    
            iterator();
            
            return this;
        };









        //
        // Pie chart implode
        // 
        // Implodes the Pie chart - gradually decreasing the size of the exploded property. It starts at the largest of
        // the canvas width./height
        // 
        // @param object     Optional options for the effect. You can pass in frames here - such as:
        //                   myPie.implode({frames: 60}; function () {alert('Done!');})
        // @param function   A callback function which is called when the effect is finished
        //
        this.implode = function ()
        {
            var obj         = this,
                opt         = arguments[0] || {},
                callback    = arguments[1] || function (){},
                frames      = opt.frames || 30,
                frame       = 0,
                explodedMax = Math.max(this.canvas.width, this.canvas.height),
                exploded    = explodedMax;
    
    
    
            function iterator ()
            {
                exploded =  explodedMax - ((frame / frames) * explodedMax);

                // Set the new value
                obj.set('exploded', exploded);
    
                RGraph.clear(obj.canvas);
                RGraph.redrawCanvas(obj.canvas);

                if (frame++ < frames) {
                    RGraph.Effects.updateCanvas(iterator);
                } else {
                    RGraph.clear(obj.canvas);
                    RGraph.redrawCanvas(obj.canvas);
                    callback(obj);
                }
            }
            
            iterator();

            return this;
        };








        //
        // A worker function that handles Bar chart specific tooltip substitutions
        //
        this.tooltipSubstitutions = function (opt)
        {
            return {
                  index: opt.index,
                dataset: 0,
        sequentialIndex: opt.index,
                  value: this.data[opt.index],
                 values: [this.data[opt.index]]
            };
        };








        //
        // A worker function that returns the correct color/label/value
        //
        // @param object specific The indexes that are applicable
        // @param number index    The appropriate index
        //
        this.tooltipsFormattedCustom = function (specific, index, colors)
        {
            var color = colors[specific.index];
            var label = ( (typeof properties.tooltipsFormattedKeyLabels === 'object' && typeof properties.tooltipsFormattedKeyLabels[specific.index] === 'string') ? properties.tooltipsFormattedKeyLabels[specific.index] : '');

            return {
                color: color,
                label: label
            };
        };








        //
        // This allows for static tooltip positioning
        //
        this.positionTooltipStatic = function (args)
        {
            var obj      = args.object,
                e        = args.event,
                tooltip  = args.tooltip,
                index    = args.index,
                canvasXY = RGraph.getCanvasXY(obj.canvas)
                segment  = this.angles[args.index],
                angle    = ((segment[1] - segment[0]) / 2) + segment[0],
                multiplier = 0.5;

            //
            // Determine the correct radius to use when calculating the
            // coordinates of the tooltip
            //
            if (properties.variant.indexOf('donut') >= 0) {

                // Determine the radius
                if (RGraph.isNull(properties.variantDonutWidth)) {
                    var radius = (this.radius / 2) + (this.radius / 4);
                } else {
                    var radius = (this.radius - properties.variantDonutWidth) + (properties.variantDonutWidth / 2);
                }

            } else {
                var radius = this.radius * multiplier;
            }

            var explosion = typeof properties.exploded == 'number' ? properties.exploded : properties.exploded[index];
            var endpoint = RGraph.getRadiusEndPoint(
                this.centerx,
                this.centery,
                angle,
                radius + (explosion || 0)
            );

            // Allow for the 3D stretching of the canvas
            if (properties.variant.indexOf('3d') > 0) {
                var width = properties.variantDonutWidth === 'number' ? properties.variantDonutWidth : this.radius / 2;
                endpoint[0] = (endpoint[0] - this.centerx) * 1.5 + this.centerx;
            }


            // Position the tooltip in the X direction
            args.tooltip.style.left = (
                  canvasXY[0]                    // The X coordinate of the canvas
                + endpoint[0]                      // The X coordinate of the shape on the chart
                - (tooltip.offsetWidth / 2)      // Subtract half of the tooltip width
                + obj.properties.tooltipsOffsetx // Add any user defined offset
            ) + 'px';

            args.tooltip.style.top  = (
                  canvasXY[1]                    // The Y coordinate of the canvas
                + endpoint[1]                      // The Y coordinate of the shape on the chart
                - tooltip.offsetHeight           // The height of the tooltip
                + obj.properties.tooltipsOffsety // Add any user defined offset
                - 10                             // Account for the pointer
            ) + 'px';
        };








        //
        // Now need to register all chart types. MUST be after the setters/getters are defined
        //
        RGraph.register(this);








        //
        // This is the 'end' of the constructor so if the first argument
        // contains configuration data - handle that.
        //
        RGraph.parseObjectStyleConfig(this, conf.options);
    };








    //
    // A specific class to make creating and showing Horseshoe
    // Meter charts very easy.
    //
    RGraph.HorseshoeMeter = function (conf)
    {
        this.draw = function ()
        {
            var width          = typeof conf.options.width === 'number' ? conf.options.width : 5,
                fgColor        = typeof conf.options.colors === 'object' && typeof conf.options.colors[0] === 'string' ? conf.options.colors[0] : 'black',
                bgColor        = typeof conf.options.colors === 'object' && typeof conf.options.colors[1] === 'string' ? conf.options.colors[1] : '#ddd',
                capRadius      = typeof conf.options.capRadius === 'number' ? conf.options.capRadius : (width + 5),
                capFill        = conf.options.capFill ? conf.options.capFill : fgColor,
                capStroke      = conf.options.capStroke ? conf.options.capStroke : 'white',
                label          = (typeof conf.options.label === 'string' || typeof conf.options.label === 'number') ? String(conf.options.label) : null,
                labelUnitsPre  = typeof conf.options.labelUnitsPre === 'string' ? conf.options.labelUnitsPre : '',
                labelUnitsPost = typeof conf.options.labelUnitsPost === 'string' ? conf.options.labelUnitsPost : '',
                labelDecimals  = typeof conf.options.labelDecimals === 'number' ? conf.options.labelDecimals : 0,
                labelPoint     = typeof conf.options.labelPoint === 'string' ? conf.options.labelPoint : '.',
                labelThousand  = typeof conf.options.labelThousand === 'string' ? conf.options.labelThousand : ',';


            // Bounds checking
            conf.value = Math.max(conf.value, conf.min);
            conf.value = Math.min(conf.value, conf.max);

            var obj = new RGraph.Pie({
                id: conf.id,
                data: [conf.value - conf.min, conf.max - conf.value],
                options: {
                    centerx:        conf.options.centerx,
                    centery:        conf.options.centery,
                    radius:         conf.options.radius,
                    marginLeft:     conf.options.marginLeft || 25,
                    marginRight:    conf.options.marginRight || 25,
                    marginTop:      conf.options.marginTop || 25,
                    marginBottom:   conf.options.marginBottom || 25,
                    shadow:         false,
                    variant:        'donut',
                    variantDonutWidth: width,
                    colors:         [fgColor, 'transparent'],
                    colorsStroke:   'rgba(0,0,0,0)',
                    contextmenu:    conf.options.contextmenu
                }
            }).draw();
            
            obj.on('beforedraw', function (obj)
            {
                // Draw the background gray circle
                obj.path(
                    'b lw % a % % % 0 6.2830 false a % % % 6.2830 0 true f %',
                    width,
                    obj.centerx,
                    obj.centery,
                    obj.radius,
                    obj.centerx,
                    obj.centery,
                    obj.radius - width,
                    bgColor
                );
            }).on('draw', function (obj)
            {
                if (typeof capRadius === 'number' && capRadius > 0) {

                    // Draw the circle at the start of the Pie chart
                    obj.path(
                        'b a % % % 0 6.2830 false f % s %',
                        obj.centerx,
                        obj.centery - obj.radius + (width / 2),
                        capRadius,
                        capFill,
                        capStroke
                    );
        
                    // Get the coordinates to the end point of the donut chart
                    var coords = RGraph.getRadiusEndPoint(
                        obj.centerx,
                        obj.centery,
                        obj.angles[0][1],
                        obj.radius - (width / 2)
                    );
                    
                    // Draw the circle at the end of the Pie chart
                    obj.path(
                        'b a % % % 0 6.2830 false f % s %',
                        coords[0],
                        coords[1],
                        capRadius,
                        capFill,
                        capStroke
                    );
                }


               // The draw event adds the text that sits in the center of the donut.
                // Because it's in the draw event it gets redrawn on every frame.
                RGraph.text({
                    
                    object:  obj,

                    size:    typeof conf.options.textSize   === 'number' ? conf.options.textSize    : 60,
                    font:    typeof conf.options.textFont   === 'string' ? conf.options.textFont    : 'Arial',
                    color:   typeof conf.options.textColor  === 'string' ? conf.options.textColor   : 'black',
                    bold:    typeof conf.options.textBold   === 'boolean' ? conf.options.textBold   : false,
                    italic:  typeof conf.options.textItalic === 'boolean' ? conf.options.textItalic : false,

                    text:    typeof label === 'string'
                                ? conf.options.label
                                : RGraph.numberFormat({
                                      object:    obj,
                                      number:    (conf.min + (conf.value * obj.get('effectRoundrobinMultiplier'))).toFixed(labelDecimals),
                                      unitspre:  labelUnitsPre,
                                      unitspost: labelUnitsPost,
                                      point:     labelPoint,
                                      thousand:  labelThousand
                                  }),
                    x:       obj.centerx,
                    y:       obj.centery,
                    halign:  'center',
                    valign:  'center'
                });
            });

            RGraph.clear(obj.canvas);
            
            // Now draw the Meter
            if (conf.roundRobin) {
                obj.roundRobin(
                    conf.options.animationOptions,
                    conf.options.animationCallback
                );
            } else {
                obj.draw();
            }
            
            return obj;
        };








        //
        // The roundfRobin animation
        //
        this.roundRobin = function ()
        {
            conf.roundRobin = true;
            if (arguments[0]) {conf.options.animationOptions  = arguments[0];}
            if (arguments[1]) {conf.options.animationCallback = arguments[1];}

            this.draw();
        };
    };








    //
    // Producew an ActivityMeter like chart. This is a shortcut class
    //
    RGraph.ActivityMeter = function (conf)
    {
        this.id      = conf.id;
        this.config  = conf.config;
        this.objects = [];
        this.options = {
            variantDonutWidth: 50, // Default width
            animation:         null
        };
        
        // Set all of the options that have been set in the config
        for (var i in conf.options) {
            if (typeof i === 'string') {
                this.options[i] = conf.options[i];
            }
        }







        //
        // Draw the ActivityMeter
        //
        this.draw = function (obj)
        {
            var activityMeter = this;

            // Go through the rings that have been defined and create
            // the Donut charts based on it.
            for (var i=0; i<this.config.length; ++i) {

                // This Pie chart acts as the darker background to the ring.
                var pie = new RGraph.Pie({
                    id: activityMeter.id,
                    data: [1],
                    options: {
                        colors: [this.config[i].color],
                        colorsStroke: 'rgba(0,0,0,0)',
                        shadow: false,
                        variant: 'donut',
                        variantDonutWidth: this.options.variantDonutWidth
                    }
                }).on('draw', function (obj)
                {
                    obj.path(
                        'b a % % % % % false a % % % % % true f rgba(0,0,0,0.45)',
                        obj.centerx, obj.centery, obj.radius, 0, 2 * Math.PI,
                        obj.centerx, obj.centery, obj.radius - obj.properties.variantDonutWidth, 2 * Math.PI, 0
                    );
                });

                // Apply any options to the background Pie chart
                for (var name in this.options) {
                    if (typeof name === 'string' && name !== 'labels') {
                        pie.set(name, this.options[name]);
                    }
                }

                // This facilitates the nesting of the Pie charts
                if (i > 0) {
                    pie.set('radius',this.objects[0][0].radius - (this.options.variantDonutWidth * i) - (3 * i));
                }

                pie.draw();











                // Now draw the Donut chart that you can see.
                var pie2 = new RGraph.Pie({
                    id: activityMeter.id,
                    data: [this.config[i].value,100 - this.config[i].value],
                    options: {
                        index: i, // A custom property
                        variant: 'donut',
                        variantDonutWidth: this.options.variantDonutWidth,
                        colors: [
                            this.config[i].color,
                            'rgba(0,0,0,0)'
                        ],
                        colorsStroke: 'rgba(0,0,0,0)',
                        shadow: false
                    }
                }).on('draw', function (obj)
                {
                    var halfWidth = obj.get('variantDonutWidth') / 2;
    
                    var context   = obj.context,
                        endpoint1 = RGraph.getRadiusEndPoint(obj.centerx, obj.centery, RGraph.PI + RGraph.HALFPI, obj.radius);
                        endpoint2 = RGraph.getRadiusEndPoint(obj.centerx, obj.centery, obj.angles[0][1], obj.radius - halfWidth);
    
                    // The rounded end is drawn by drawing a full circle at the
                    // end of the Donut.
                    obj.path(
                        'b a % % % % % false f %',
                        endpoint1[0],
                        endpoint1[1] + halfWidth,
                        halfWidth,
                        0,
                        RGraph.TWOPI,
                        obj.get('colors')[0]
                    );
    
                    // The obj.path() function is used to draw the rounded
                    // end of the other side of the donut.
                    obj.path(
                        'b a % % % % % false f %',
                        endpoint2[0],
                        endpoint2[1],
                        halfWidth,
                        0,
                        RGraph.TWOPI,
                        obj.get('colors')[0]
                    );



                    // Draw the label if its stipulated
                    if (activityMeter.config[obj.index].label) {
                         RGraph.text({
                            object:  obj,
                            text:    activityMeter.config[obj.index].label || '',
                            x:       obj.centerx,
                            y:       obj.centery - obj.radius + (obj.properties.variantDonutWidth / 2),
                            halign:  'left',
                            valign:  'center',
                            color:   activityMeter.options.labelColor || 'black',
                            size:    activityMeter.options.labelSize || 20,
                            font:    activityMeter.options.labelFont || 'Arial,sans-serif',
                            bold:    activityMeter.options.labelBold || false,
                            italic:  activityMeter.options.labelItalic || false
                        });
                    }
                    
                    

                    // Draw the image if its specified
                    if (typeof activityMeter.config[obj.index].image === 'string') {
                        obj.properties.image = new Image();
                        obj.properties.image.src = activityMeter.config[obj.index].image;

                        obj.properties.image.onload = function ()
                        {
                            var maxWidth   = obj.properties.variantDonutWidth * 0.75;
                            var imageWidth = obj.properties.image.width;
                            var width      = imageWidth > maxWidth ? maxWidth : imageWidth;

                            obj.context.drawImage(
                                obj.properties.image,
                                obj.centerx - 10,
                                obj.centery - obj.radius + (obj.properties.variantDonutWidth / 2) - (width / 2),
                                width, // Same as height
                                width // Same as width
                            );
                        };
                    }
                });








                
                // Apply any options to the background Pie chart    
                for (var name in this.options) {
                    if (typeof name === 'string' && name !== 'labels') {
                        pie2.set(name, this.options[name]);
                    }
                }

                // This facilitates the nesting of the Pie charts
                if (i > 0) {
                    pie2.set('radius',this.objects[0][0].radius - (this.options.variantDonutWidth * i) - (3 * i));
                }


                pie2.index = (function (index) {return index;})(i);
                if (this.options.animationEffect === 'roundRobin') {
                    pie2.roundRobin(this.options.animationEffectOptions, this.options.animationEffectCallback);
                } else {
                    pie2.draw();
                }
                
                // Store the RGraph objects as a class property
                this.objects[i] = [pie, pie2];
            }
            
            return this;
        };








        //
        // A roundRobin effect
        //
        this.roundRobin = function ()
        {
            var args = RGraph.getArgs(arguments, 'options,callback');

            this.options.animationEffect         = 'roundRobin';
            this.options.animationEffectOptions  = args.options;
            this.options.animationEffectCallback = args.callback;
            
            // Draw the charts
            this.draw();
            
            return this;
        };
    };







    //
    // A SegmentedMeter class that makes use of the Pie chart. This was
    // formerly a demo but the code for it has been put into its own class
    // so that it's easier for you to implement.
    //
    RGraph.SegmentedMeter = function (conf)
    {
        //
        // If the value is over the max, set it to the max
        //
        if (conf.value > conf.max) {
            conf.value = conf.max;
        }

        // The value that will be reresented on the meter
        var value = conf.value / conf.max;
        this.value = conf.value;
        conf.data = [value, 1 - value];

        // Set some default options that setup the appearance
        var options = {
            backgroundColor: 'black',
            
            // Show the center value by default
            value:           true,
            valuePercentage: true,

            valueUnitsPre:   '',
            valueUnitsPost:  '',
            valueDecimals:   0,
            
            valueSize:       50,
            valueBold:       null,
            valueItalic:     null,
            valueFont:       null,
            valueColor:      null,
            
            variant:         'donut',
            variantDonutWidth: 40,
            
            colors:          ['red', 'white'],
            colorsStroke:    'transparent',
            
            shadow:      false
        };
        
        // Add the options that were specified in the config to the
        // options block.
        for (var i in conf.options) {
            if (typeof i === 'string') {
                options[i] = conf.options[i];
            }
        }

        // Set the options that were given in the config on to the Pie chart.
        // The default options that setup the donut appearance are included
        // in this.
        for (var i in options) {
            if (typeof i === 'string') {
                conf.options[i] = options[i];
            }
        }

        this.pie = new RGraph.Pie(conf).on('beforedraw', function (obj)
        {
            RGraph.clear(obj.canvas, obj.properties.backgroundColor);

        }).on('draw', function (obj)
        {
            // This controls the width of the segments
            var width = 5;

            // Go around in a circle and add lines that emanate from the
            // center and go outwards.
            for (var i=0; i<360; i+=10) {
                obj.path(
                    'b a % % % % % false l % % c f %',
                    obj.centerx,obj.centery,obj.radius + 2,RGraph.toRadians(i - (width / 2)),RGraph.toRadians(i + (width / 2)),
                    obj.centerx,obj.centery,
                    conf.options.backgroundColor || 'white'
                );
            }

            // This is the value that is shown in the center
            if (obj.properties.valuePercentage) {
                var value = (obj.get('effectRoundrobinMultiplier') * obj.data[0] * 100).toFixed(obj.properties.valueDecimals);
            } else {
                var value = (obj.get('effectRoundrobinMultiplier') * conf.value).toFixed(obj.properties.valueDecimals);
            }

            // Draw the text in the center
            if (obj.properties.value) {

                RGraph.text({
                    object: obj,
                    
                    x: obj.centerx,
                    y: obj.centery,
                    
                    text: obj.properties.valueUnitsPre + value + obj.properties.valueUnitsPost,
                    
                    font:   typeof obj.properties.valueFont   === 'string'  ? obj.properties.valueFont   : obj.properties.textFont,
                    size:   typeof obj.properties.valueSize   === 'number'  ? obj.properties.valueSize   : obj.properties.textSize,
                    color:  typeof obj.properties.valueColor  === 'string'  ? obj.properties.valueColor  : obj.properties.textColor,
                    bold:   typeof obj.properties.valueBold   === 'boolean' ? obj.properties.valueBold   : obj.properties.textBold,
                    italic: typeof obj.properties.valueItalic === 'boolean' ? obj.properties.valueItalic : obj.properties.textItalic,
                    
                    valign: 'center',
                    halign: 'center'
                });
            }
        });
        
        return this.pie;
    };
    
    
    
    
    
    
    

    //
    // A shortcut RadialProgress Meter
    //
    RGraph.RadialProgress = function (conf)
    {
        this.conf = conf;
        
        // This is used later in the Pie chart draw events
        var radialProgressObject = this;

        // A getter
        this.get = function (name)
        {
            return this.conf.options[name];
        }








        // A setter
        this.set = function (conf)
        {
            if (typeof conf === 'object') {
                for (i in conf) {
                    if (typeof i === 'string') {
                        this.set(i, conf[i]);
                    }
                }

                return;
            }

            this.conf.options[conf] = arguments[1];

            return this;
        }








        // Draw the chart
        this.draw = function ()
        {
            //
            // If the value is over the max, set it to the max
            //
            for (var i=0; i<this.conf.data.length; ++i) {
                if (this.conf.data[i] > this.conf.max) {
                    this.conf.data[i] = this.conf.max;
                }
            }











            // Set some default values
            var defaults = {
                margin:          5,

                colors:          ['green','black','blue','red','orange','brown','black','blue','red','orange','brown'],
                
                labels:          [],
                labelsColor:     'black',
                labelsFont:      'Arial',
                labelsSize:      12,
                labelsBold:      false,
                labelsItalic:    false,
                
                tooltips:        [],
                tooltipsOffsetx: 0,
                tooltipsOffsety: 0,
                tooltipsEffect:             'fade',
                tooltipsCssClass:           'RGraph_tooltip',
                tooltipsCss:                null,
                tooltipsEvent:              'onclick',
                tooltipsHighlight:          true,
                tooltipsHotspotXonly:       false,
                tooltipsFormattedThousand:  ',',
                tooltipsFormattedPoint:     '.',
                tooltipsFormattedDecimals:  0,
                tooltipsFormattedUnitsPre:  '',
                tooltipsFormattedUnitsPost: '',
                tooltipsFormattedKeyColors: null,
                tooltipsFormattedKeyColorsShape: 'square',
                tooltipsFormattedKeyLabels: [],
                
                textAccessible: true,
                textAccessibleOverflow: true,
                textAccessiblePointerevents: false,
                
                animation:         '',
                animationOptions:  {},
                animationCallback: null
            };

            for (i in defaults) {
                if (typeof i === 'string' && typeof this.conf.options[i] === 'undefined') {
                    this.set(i, defaults[i]);
                }
            }













    
            // The Rose chart is used to draw the background grid only
            var rose = new RGraph.Rose({
                id: this.conf.id,
                data: [],
                options: {
                    marginLeft:   radialProgressObject.conf.options.marginLeft,
                    marginRight:  radialProgressObject.conf.options.marginRight,
                    marginTop:    radialProgressObject.conf.options.marginTop,
                    marginBottom: radialProgressObject.conf.options.marginBottom,

                    colors: ['rgba(0,0,0,0)'],
                    labelsAxes: '',
                    backgroundGridCirclesCount: radialProgressObject.conf.data.length,
                }
            }).on('draw', function (obj)
            {
                // This path hides the inner-most grid circle - that's all
                //obj.path(
                //    'b a % % 30 0 6.28 false f white',
                //    obj.centerx, obj.centery
                //);
            }).draw();







            // Now draw the "bars" which are Pie charts where the colors are set to
            // the desired color and transparent
            for (var i=0; i<radialProgressObject.conf.data.length; i++) {

                var pie = new RGraph.Pie({
                    data: [
                        radialProgressObject.conf.data[i],
                        radialProgressObject.conf.max - radialProgressObject.conf.data[i]
                    ],
                    id: this.conf.id,
                    options: {
                        index: i,

                        marginLeft:                      radialProgressObject.conf.options.marginLeft,
                        marginRight:                     radialProgressObject.conf.options.marginRight,
                        marginTop:                       radialProgressObject.conf.options.marginTop,
                        marginBottom:                    radialProgressObject.conf.options.marginBottom,
                        
                        textAccessible:                  radialProgressObject.conf.options.textAccessible,
                        textAccessibleOverflow:          radialProgressObject.conf.options.textAccessibleOverflow,
                        textAccessiblePointerevents:     radialProgressObject.conf.options.textAccessiblePointerevents,

                        variant:                         'donut',
                        variantDonutWidth:               (rose.radius / (this.conf.data.length) ) - this.conf.options.margin,
                        
                        radius:                          ((rose.radius / this.conf.data.length) * (i+1) ) - (this.conf.options.margin / 2),
                        shadow:                          false,
                        
                        colors:                          this.conf.options.colorsSequential
                                                             ? [this.conf.options.colors[i], 'transparent']
                                                             : [this.conf.options.colors[0], 'transparent'],
                        colorsStroke:                    'rgba(0,0,0,0)',
                        
                        tooltips:                        this.conf.options.tooltips,
                        tooltipsCss:                     this.conf.options.tooltipsCss,
                        tooltipsOffsetx:                 this.conf.options.tooltipsOffsetx,
                        tooltipsOffsety:                 this.conf.options.tooltipsOffsety,
                        tooltipsEffect:                  this.conf.options.tooltipsEffect,
                        tooltipsCssClass:                this.conf.options.tooltipsCssClass,
                        tooltipsCss:                     this.conf.options.tooltipsCss,
                        tooltipsEvent:                   this.conf.options.tooltipsEvent,
                        tooltipsHighlight:               this.conf.options.tooltipsHighlight,
                        tooltipsHotspotXonly:            this.conf.options.tooltipsHotspotXonly,
                        tooltipsPointer:                 this.conf.options.tooltipsPointer,
                        tooltipsPositionStatic:          this.conf.options.tooltipsPositionStatic,
                        tooltipsFormattedThousand:       this.conf.options.tooltipsFormattedThousand,
                        tooltipsFormattedPoint:          this.conf.options.tooltipsFormattedPoint,
                        tooltipsFormattedDecimals:       this.conf.options.tooltipsFormattedDecimals,
                        tooltipsFormattedUnitsPre:       this.conf.options.tooltipsFormattedUnitsPre,
                        tooltipsFormattedUnitsPost:      this.conf.options.tooltipsFormattedUnitsPost,
                        tooltipsFormattedKeyColors:      this.conf.options.tooltipsFormattedKeyColors,
                        tooltipsFormattedKeyColorsShape: this.conf.options.tooltipsFormattedKeyColorsShape,
                        tooltipsFormattedKeyLabels:      !RGraph.isNull(this.conf.options.tooltipsFormattedKeyLabels) && typeof this.conf.options.tooltipsFormattedKeyLabels === 'object' && typeof this.conf.options.tooltipsFormattedKeyLabels[i] === 'string'
                                                             ? [this.conf.options.tooltipsFormattedKeyLabels[i]]
                                                             : this.conf.options.tooltipsFormattedKeyLabels
                   }
               }).on('tooltip', function (obj)
               {
                   if (RGraph.Registry.get('tooltip').__index__ === 1) {
                       RGraph.Registry.get('tooltip').style.display = 'none';
                   }
               }).on('draw', function (obj)
               {
                   // These are the text labels that sit on the left of the 'North' axis
                   if (    typeof radialProgressObject.conf.options.labels === 'object'
                       && radialProgressObject.conf.options.labels.length
                      ) {
                      
                        rose.properties.textAccessiblePointerevents = radialProgressObject.conf.options.textAccessiblePointerevents

                       RGraph.text({
                            object:         rose,
                            
                            x:              rose.centerx - 2,
                            y:              obj.centery - obj.radius + obj.properties.variantDonutWidth / 2,
                            
                            text:           radialProgressObject.conf.options.labels[obj.properties.index],
                            
                            halign:         'right',
                            valign:         'center',
                            
                            font:           radialProgressObject.conf.options.labelsFont || 'Arial',
                            size:           radialProgressObject.conf.options.labelsSize || 12,
                            color:          radialProgressObject.conf.options.labelsColor || 'black',
                            bold:           typeof radialProgressObject.conf.options.labelsBold === 'boolean' ? radialProgressObject.conf.options.labelsBold : false,
                            italic:         typeof radialProgressObject.conf.options.labelsItalic === 'boolean' ? radialProgressObject.conf.options.labelsItalic : false,
                            
                            bounding:       true,
                            boundingFill:   'rgba(255,255,255,0.5)',
                            boundingStroke: 'rgba(255,255,255,0)',
                            
                            accessible:     radialProgressObject.conf.options.textAccessible
                       });
                    }
                });
               
                //
                // Determine whether to animate the pies or simply draw them.
                //
                if (this.conf.options.animation === 'grow') {
                    pie.roundRobin(
                        this.conf.options.animationOptions,
                        this.conf.options.animationCallback
                    );
                } else {
                    pie.draw();
                }
            }
            
            return this;
        };








        // Makes the various Pies grow() function instead of a regular draw().
        this.grow = function ()
        {
            this.conf.options.animation = 'grow';
            this.draw();
            
            return this;
        }
    };