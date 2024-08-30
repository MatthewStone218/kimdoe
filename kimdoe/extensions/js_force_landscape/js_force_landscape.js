function force_landscape() {
    if (screen.orientation && screen.orientation.lock) {
        // Screen Orientation API를 사용하여 가로모드로 잠금
        screen.orientation.lock("landscape")
            .then(() => {
                console.log("가로모드로 잠금되었습니다.");
            })
            .catch(err => {
                console.error("화면 방향을 잠그는 데 실패했습니다:", err);
            });
    } else {
        console.log("Screen Orientation API가 지원되지 않습니다.");
    }
}