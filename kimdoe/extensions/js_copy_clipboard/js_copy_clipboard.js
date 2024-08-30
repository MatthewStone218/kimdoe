function copy_clipboard(str) {
    // 클립보드 권한 요청
    navigator.permissions.query({ name: "clipboard-write" })
        .then(permission => {
            if (permission.state === "granted" || permission.state === "prompt") {
                // 클립보드에 텍스트 쓰기
                navigator.clipboard.writeText(str)
                    .then(() => {
                        console.log("텍스트가 성공적으로 클립보드에 복사되었습니다.");
                    })
                    .catch(err => {
                        console.error("클립보드에 복사하는 중 오류가 발생했습니다:", err);
                    });
            } else {
                console.log("클립보드 복사 권한이 거부되었습니다.");
            }
        })
        .catch(err => {
            console.error("클립보드 권한 요청 중 오류가 발생했습니다:", err);
        });
}