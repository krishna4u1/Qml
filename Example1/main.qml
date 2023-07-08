import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Resizable & Dragable rectangle")


    Rectangle
    {
        id: mainRect

        width: 100
        height: 100

        x: parent.width/2 - (width/2)
        y: parent.height/2 - (height/2)

        border {
            color: "red"
            width: 2
        }

        Drag.active: mouseArea.drag.active

        MouseArea
        {
            id: mouseArea

            anchors.fill: parent
            drag.target: mainRect
        }
    }

    Circle {
        id: left

        anchors {
            horizontalCenter: mainRect.left
            verticalCenter: mainRect.verticalCenter
        }
        MouseArea {

            anchors.fill: parent

            onMouseXChanged: {
                mainRect.x = mainRect.x + mouseX
                mainRect.width = mainRect.width - mouseX
                if(mainRect.width < 5)
                {
                    mainRect.width = 5
                }
            }
        }
    }

    Circle {
        id: right

        anchors {
            horizontalCenter: mainRect.right
            verticalCenter: mainRect.verticalCenter
        }

        MouseArea {
            anchors.fill: parent
            onMouseXChanged: {
                mainRect.width = mainRect.width + mouseX
                if(mainRect.width < 5)
                {
                    mainRect.width = 5
                }
            }
        }
    }

    Circle {
        id: top

        anchors {
            horizontalCenter: mainRect.horizontalCenter
            verticalCenter: mainRect.top
        }

        MouseArea {
            anchors.fill: parent
            onMouseYChanged: {
                mainRect.y = mainRect.y + mouseY
                mainRect.height = mainRect.height - mouseY
                if(mainRect.height < 5)
                {
                    mainRect.height = 5
                }
            }
        }
    }

    Circle {
        id: bottom

        anchors
        {

            horizontalCenter: mainRect.horizontalCenter
            verticalCenter: mainRect.bottom
        }

        MouseArea {
            anchors.fill: parent
            onMouseYChanged: {
                mainRect.height = mainRect.height + mouseY
                if(mainRect.height < 5)
                {
                    mainRect.height = 5
                }
            }
        }
    }
}
