function share_page(str) {
    if (navigator.share) {
        navigator.share({
            title: document.title,
            text: str,
            url: window.location.href,
        })
        .then(() => console.log('공유가 성공적으로 완료되었습니다.'))
        .catch(error => console.error('공유 중 오류가 발생했습니다:', error));
    } else {
        alert('공유 기능을 지원하지 않는 브라우저입니다.');
    }
}