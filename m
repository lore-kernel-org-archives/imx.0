Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904E9225A20
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032326; cv=none; b=t3DpS8SRUxN1q+L3FgY16Z4UEM9uueyTVzPzO0d2GyfYWYs6zUHRcYt1mBhseIKvoO2GjuHJlxZr/gI2vGpuxJI/dbO2pdCoqgMo8jl6pHF+rixcShY1NaTrWadllJU57iUaxTqXgGKJFGpKSMnYJNRxWlS3w/VjzB0TUffgddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032326; c=relaxed/simple;
	bh=REOQw6a3f1fYJjhQf0S/Rjdc02Lkuwh6/OHFyd/LA5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MT7L/UPwlPF3eoNG88nG32y0pCmqpxAZPioUZe4BT2Yefhly4Yewcf4OyrtObJj6vYpFAXFrmLCTQo0hxlkDPTeLWZVYVpSEJ03amUv5P6Q+QTE1Ox1pGfKW/hybC4FD0nQtAsfSHJ/4rkNxRdjRVrpvEX5PKfbEGQIfMazS0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IW72XARO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IW72XARO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=u/cBSgvybZqoNv
	0F8wSCxbActKREl9YM8Rj729Qsdww=; b=IW72XARO9Hh4cKEDK/yQbafMlgAtdE
	5fHXmI76kTHfwCnIsxG03NpSw1zcwIdWpxYbqOs/3PR716KAXoKYuc5x/f13q6dj
	tivo2pjdswolG4ZFR0sC6k5zrcYhribJL+24DM6Bi9aefV1BHhTDK23sbpUufh+o
	aYTI9mul0a3Ks87JvTNlxG47vEISQnAPIgJuaEEiNaOqh6tkwTT/oLoPuW/Vkk4A
	9nxq51OxFnnkaAhn+VLMfwHAkmvKwVdpUJQA6Y7iuhtlxZAcC69NCp+OxheiSBMZ
	QrmAtKf+CIsmqsrvxNLPVFXcVyb6zkZXbTqx+hdSW5Sb3t14y5Iz3mvg==
Received: (qmail 629158 invoked from network); 4 Jun 2025 12:18:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 12:18:36 +0200
X-UD-Smtp-Session: l3s3148p1@WCLjUbw2hqogAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH 0/4] i3c: use adapter timeout value for I2C transfers
Date: Wed,  4 Jun 2025 12:18:26 +0200
Message-ID: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All I3C adapters so far use a timeout of 1 second for I2C transfers. I2C
adapters have their own timeout value which can be changed by userspace
if desired. Use it for I2C transfers. The default is 1Hz, so the default
behaviour is unchanged.

Found while finalizing the RFC for the upcoming Renesas I3C driver.
Looking forward to comments, tests...

Wolfram Sang (4):
  i3c: dw: use adapter timeout value for I2C transfers
  i3c: master: cdns: use adapter timeout value for I2C transfers
  i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers
  i3c: master: svc: use adapter timeout value for I2C transfers

 drivers/i3c/master/dw-i3c-master.c     | 2 +-
 drivers/i3c/master/i3c-master-cdns.c   | 2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 drivers/i3c/master/svc-i3c-master.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.2

