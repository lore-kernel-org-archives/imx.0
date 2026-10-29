Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297376;
	b=bcnePUZ5eUg4NCsTX5Mxp5/ITViiNNPuRhIqxtt3hBcgAHrMSjIXyDTFSVj0REmWCzF1
	 LdPzgsMEWaE9tzypX6eh4L8IdNo2wVgS/65jH0U5rN3NRxuq9e9RsFy/8aZTKidoEUERR
	 K6v8D/6y1/bL623KYhQt0/vJ2kw8Yl4a5nPYlFd7q81/JMXts0b2Pbcp4Hjf6Mxs7MrqN
	 obYGB+KUySdgy4WEOw1qOOLPK7iszZ1ackfAatbJzdRl40a8wW+4G6F2nEk81BWYJ18x7
	 iBqaFAuusPufAu/gHizUoDvqEW6hQ8hYvwTIPHNcIf/W9engrzExItMldAhZHwdpf1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297376;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=pqGz8QoD0yES0N8UDw6ipHv3HkyvECu9QbozjFVBkhc=;
	b=q6mMSnMrAmyirtL12+7HX28QJgb7rzYlLnA2xB/AazVU54QhogysFp76nRAUhodLoZVJ
	 rvWJ3TMrjyv0NnW7gfrHFs9Fw0Jn8DcefqVDX83yKEWQfT0HP7U27kQQ2gzBPPtDks8Sp
	 k+vkbkp2aLu5ye+ygZMxemWqzKRii14MKSUBhn1N4hgypF5lJ0jVEZOy26bL2yWWwvMBw
	 AalTKX3CdeoW3ebnrDQcTw11u9E01BrWq0JcfbgEXwt6eAQQj2xEOzvT5lRyK3rfoB3aZ
	 tGv7QGAa3Yhdl3qcYbrbyzjAz60ByZq/hObXjRlyeWJV1IXQcq6YhN/SJHNgsV3vIzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=FZShw0L2;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC9606A31E
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 18:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCC9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=FZShw0L2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2898B10BEB9;
	Thu, 29 Oct 2026 19:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793297369; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=pqGz8QoD0yES0N8UDw6ipHv3HkyvECu9QbozjFVBkhc=;
	b=FZShw0L2ZrAj0ygKjJWNIs1LDysfLDl1rVYnzQikBBHIUg9FYWgV/NhmmIcIvH1njprlp8
	GvpEaAsqkB/rQbU8rB68T8RAk8P3p3RYon52zkkXTBtIcX0olwy9LExjCl8oGUmGX4bB4P
	HFN279psgGaWDlvePnfg81uV726GBKCcCVr8AFQpSa1Q+SOLx28XVWJo6psUY6KB+UxeN4
	jVPqUTUfMqPec2RdP5EkvMWdLfjvRCDfUYVUsYtcr1im6HoRiisD81ypb5r1j35WvLDC8a
	qh7WOXoTBIMlZ0yrFCxdRxfZILgpufznzwsKacjwtDUFmuAMowfJAMKw6O0tcQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mxsfb: Update MAINTAINERS entry
Date: Thu, 29 Oct 2026 19:08:55 +0100
Message-ID: <20261029180925.26792-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Fill in updated email address, no functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75ef3d1aa9d6e..fa4dee57bcf8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19168,7 +19168,7 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/mxl5007t.*
 
 MXSFB DRM DRIVER
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.53.0

