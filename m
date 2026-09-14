Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D71C471258
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390412; cv=none; b=KjhwFeHqcoxKV2AmR9bu3uBhL/oOfNyjNJxqwMTtjMbhTUV1vITQJ6L9Dtv+O/wxgRiF7/5JDKlTjr2Oj/ojwY8Bx3izpCFAEBExQGEAykfcxxQmB7AgMizMnO1AVb9DFiBHU6RE7exJ1WHqp9LvYUHwWl1UwliS1AOk5cpVWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390412; c=relaxed/simple;
	bh=9MU3GlGUB1OPK/XpXe4SqAgEDW6zxQdlcL04VkOQLyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQLSuV7NCmO6eco8d+xV4lPN5m0T9T4Dg8yw6eCFbMf1X+v814lnnYB/s5DKlMA4oN2Uody57lgMzwDlFDEUifQTfIery5gse9EQvDwd8lDWisNGKUZ+bA9cymMwkMgA8kf+ohjeR6R0Kx7Ssm9jukR/COjD9+RMFgpJ3aWx9gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoRENNmo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoRENNmo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso11148425e9.2
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390408; x=1789995208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=OoRENNmoCLtIC5uGi9NDCkya1KKagZEji9YkiLUnGdOthq0IYIlnS5wkdMRiWGAGJg
         U2vZGXWTCAlciTvUQXq9TkIoXvODFuS2eMBNiSPfNGKxDI6dBa4k4v3P17pHyELzScbI
         ZW8RHuFOwiZG6l/OBXjh71Ewhpd10AQTV5vxvjTAar5FK2W19qe+1pXi3Mz1Y6cngWWh
         A5DjiMRVhpqX8wxWDOvjmtEzkNlWxOkvF9LIFbU8kSDsgY5L31v+KPGLhhtA3+2fCWXx
         TqO3R0bdLTTWxF8RCri+a1ZUIbBa498RFYvZcfwvmIvCndxjCDJzMvFyrI1UwC5WTL8H
         XN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390408; x=1789995208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=XKXTfzmH4TuOnj82q0pAJBosy8z86ZJWFiEvexPEm0UfJv4jkyerg1gAU5qgZUz9Ck
         ldFkm1sYVGK4AXBxxWFgffy0fWfjJ2m0IN6g6O34pvJ/P66wiFGMoo1tBPphnRz5k0I/
         3YmXgnoqPQiS+1GNfU/JbSP1zF/dvcYYvc45Tc3TrowQ7yqFDnbTEe1WLgWYRpvK0gYd
         9eO67ZAgGRbGa0INjAjuVB6ARoc6zd9z2oQodYLSToW2Vr2DwhDNrqTf16l5ViMxlweQ
         ZSrZMlu9vR4rg2sKJwAZx6T55m3oCNlspkz3SdO4UUtTUpBfJrUNjybdTJgJbFOMpiTL
         /2rw==
X-Forwarded-Encrypted: i=1; AKwUvBxDsAu/aJxuzi0JNDXLTv8VfK2UoNov7zHYuPmJvE62BaCCb5/VWrdEBTxbHCgiVk1gGP4=@lists.linux.dev
X-Gm-Message-State: AFuF++nYTMmD5XM7hsIgwwtO9yBhgbq11budHJX88AVfNoaEgCxyB2aq
	HmQjj8HNBT8detbVEIx8v/Gdc6McsJTuvDSAbKIzNdwE7cUSfB8HShZs
X-Gm-Gg: AYBFou1PL+t/A/exFUmcdcZIEu0RYKHyyloq8A0+7iAzbgXAROq1mSgFwcz91F84ZZB
	roYX8tbvIoAQXrJKV4IrDvA1niYA43RXsJ3yvOuX0/qjhZ5WBTvCpTF6bV5vdGgmmSS5+TtAVRb
	rWOHk9wM5hcu6xd+0OQ8x9UZ+nY8ih2g6yJhtl1t0SCcKfyygvAjD1FFXv3gXS0IVsdu9KiYYWV
	A7rl9znNgDYwGpdjefMqzYSo54mpmj+B43CDRJ6jD+gLq8yEMS0mYrUUme2kqBQWYOX+op1Y0ul
	EWMSoMz4TQGgJTMeNjGCwsjbscRj00AENc/r8QQGsT7rmYVj+VMP5XPWfd/DrATAUjgU1llove4
	LffMpGgfN6R/59C6+wvVuo/h6o5EYgL5aggm8Quxch+lFH2Es5nP0G9ymk9EzXCjwjbk2NtbuLW
	Hdnw4lgjDTSQf9i90LLALmIQJ/SRQQzmEtxp1O6a4o6/+rWMC35LTIpIO9v7leaclYGptHYZzlZ
	N6IzqG1WWn1XAjdFSETYwjHECpO24VzywXrYau5JrS7lFPHrH/ShooMaqApcQ0bGwiUs1B33vt4
	N1QBEsLnfCRXEZjB
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr30526925e9.19.1789390408188;
        Mon, 14 Sep 2026 05:53:28 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm320954365e9.9.2026.09.14.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:53:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Natasha Kovalenko <natasha.k@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
Date: Mon, 14 Sep 2026 14:53:11 +0200
Message-ID: <20260914125311.8354-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Correct the UART8 header reference from J12 to J6 on the DART-MX95
Sonata carrier board.

This is a documentation-only fix and does not change the hardware
configuration.

Co-developed-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 3479abc25df2..9344a0d99418 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -336,7 +336,7 @@ &lpuart1 {
 	status = "okay";
 };
 
-/* Header (J12.4, J12.6) */
+/* Header (J6.4, J6.6) */
 &lpuart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart8>;
-- 
2.47.3

