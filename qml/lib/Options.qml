import QtQuick 2.0
import Sailfish.Silica 1.0

PersistentObject {
    id: options
    objectName: 'options'
    storeSettings: ['Talefish','1.0','Options', objectName]
    doPersist: true
    function getHome() {
        var dirOnly = StandardPaths.documents.split('/'); dirOnly.pop(); dirOnly = dirOnly.join('/');
        return dirOnly || StandardPaths.documents;
    }
    //happens in OptionsPage, so it does not get called so often: onDirectory Changed should rescan for files, put path for audio component in there
    property string directory: getHome()


    property bool playNextFile: true //automatically play next file

    //milliseconds:
    property int skipBackTrackThreshold: 2000//2s has to be played to just skip to track beginning
    property int skipDurationSmall: 10000 //10s
    property int skipDurationNormal: 60000 //1m
    property string externalCommandSkipDuration: '0' // '0': skip to track beginning, 'small'/'normal': use set durations

    property real playbackRate:1

    //open files
    property bool scanCoverForFilenames: true
    property bool showEnqueuePulley: false
//    property bool resortNaturally: false

    //playback page options

    property bool playerSwipeForNextPrev: true
    property bool playerDisplayDirectoryProgress: true
    property bool playerDisplayDirectoryName: true

    //animation options
    property bool cassetteUseDirectoryDurationProgress: false
    property bool useAnimations: true
    property bool usePlayerAnimations: true
    property bool useCoverAnimations: true

    //misc
    property bool useHeadphoneCommands: false
    property string headphoneCallButtonDoes: 'playPause' //'', 'prev', 'next', 'playpause', 'stop'
    property string headphoneCallButtonLongpressDoes: 'next' //'', 'prev', 'next', 'playpause', 'stop'
    property string secondaryCoverAction: 'prev' //'', 'prev', 'next'
    property bool saveProgressPeriodically: false
    property bool doLog: false
    property int keepUnopenedDirectoryProgressDays: 30

    //slumber integration
    property bool autoStartSlumber: false
    property bool autoStartSlumberInTimeframe: false
    property bool autoStartSlumberAndRefocusTalefish: true
    property date autoStartSlumberAfterTime: new Date(1970,0,1,21,0)
    property date autoStartSlumberBeforeTime: new Date(1970,0,1,6,0)

    // LEGACY   ))
//    property bool appCoverAnimateEnabled: true
    Component.onCompleted: {
        // update old default:
        skipBackTrackThreshold = 2000
    }
}
