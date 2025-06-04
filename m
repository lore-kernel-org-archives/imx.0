Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1DE280321
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032326; cv=none; b=FkrbwiSQQytwBeHfd12R6ulgWgJFugyPxzd5BllBXrqkMCib3FV9+hmXVFoX4hGHOpX2J0z71GkUlDyB2hnazrLDIQt3UneDmM7fhjEqsCZP5nd3m1YhwpuIH5rSCUnGnIvSk4alDY5lpNm0VaBYM/89h/6ZP1BL99id5U280Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032326; c=relaxed/simple;
	bh=Bm8soP7Oh+7RxN1Mwzt9wZsPcD/JPA1v0GHaXhVDUvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gq/Th9zwZ3mZHY/xXMog3JCGk97EgaaBEQ+gv4XrZElauWhy6g1neuWFN2lyylg64BL9C5MIhsxH65WRm8lCGE6nOZ+wasiRk2BSrb8o0BH9Z6AbwL6oNOXvYafq56nA4rpxTZrhVWOMvYw1znT0bQmBJHfHcZuLL+zPFlZut5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eKuqdkpL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eKuqdkpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=aqqVqhjIn/qLsrw7WRb3mCG8m2QvWy6ovxJwUgCCw/g=; b=eKuqdk
	pLVDYlZRqGowZbRtqeUMVVpd/YvikmqaWS2zJIo4ymnRiR6N5GbmNxXw1B0m4Ywd
	litNkMzQe7IrbQiN5T618I9EujZ/ZN41r4kmRVttpIEEWBR48wuADCAP1Su9n/bw
	UGDKhagz7j/KbitjVemAVSL1El7cg6y/TkesjzggqPvvrFFNp/Uc4W0XAy/WNGQY
	KKjlafw74ONgRCTB6jyzv977ikkV2AGDSWeOLU7720fdfkPcKgFbYKZvU9Hux1uN
	OUbw5Qq5K5FMGnuuOekxix4IlkvreEhJ454bJDuZwovLpDwFhqZG6S+PvtZfaZxq
	Izc/vmL5CYz1JjiQ==
Received: (qmail 629272 invoked from network); 4 Jun 2025 12:18:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 12:18:39 +0200
X-UD-Smtp-Session: l3s3148p1@5rcTUrw2nqogAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	imx@lists.linux.dev
Subject: [PATCH 4/4] i3c: master: svc: use adapter timeout value for I2C transfers
Date: Wed,  4 Jun 2025 12:18:30 +0200
Message-ID: <20250604101831.56585-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C adapters have their own timeout value which can be changed by
userspace if desired. Use it for I2C transfers. The default is 1Hz, so
the default behaviour is unchanged.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7e1a7cb94b43..6d0eea80ea34 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1708,7 +1708,7 @@ static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 
 	mutex_lock(&master->lock);
 	svc_i3c_master_enqueue_xfer(master, xfer);
-	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
+	if (!wait_for_completion_timeout(&xfer->comp, m->i2c.timeout))
 		svc_i3c_master_dequeue_xfer(master, xfer);
 	mutex_unlock(&master->lock);
 
-- 
2.47.2

