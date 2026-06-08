Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F343DBD53
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929698; cv=none; b=QruCzBygf10XsmUnImQzzdDvIpqe70TK7bGlRUs4kI3uj63UoLkjg8CIOLemszBZZHBSeXqHIymy9NRTSI4gp9pPB3UWkxzMMIFHUz+pHCGHo/pj7SUu4yT/AejcH2nJtL+fXw7fq9VKuHTfrSWmB+OUMWKhfrKyVUgbmhgrmjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929698; c=relaxed/simple;
	bh=KLUkwej3UFTg+1N+K7eXfy+hjIqtltojznrXTKWXmKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qq8xfoNtPZgcoz8WJR/44wlGnLEMhmEAbSJEg5zUKJsrT59A9S0p0Pgg768IyXx/+NOriOuCpBhS2sXFEP/B0hnEp4HB45n+F0m8D8LUr1/hLr8I/N3ezb6i0P2iwwYqKnMxhGS4t3ve49rlMxKc1xceDpig8qj1Qyia6DzYYS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFTTrCzQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFTTrCzQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b915ded5so37577355e9.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929695; x=1781534495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86A87/9ws/VtdQEI7PHXUYpQ1ohvjyghc4NfnHpdryg=;
        b=eFTTrCzQ4aWIsDez6LASGzWP4VAbmh7Qkd1z1hulN+K2ALlvofAgvwndF/SIic5KHi
         j0kHrQ10pAgWEX3RE2I67REbDCTUlVjidcLVzNt73WqA0PpqrFwP61Ypa1J4YX6vRBxi
         AV6C3hJ3mxJPvHT5IX9Zo4aDYg0QQZx5SCRgUSoQ/T1eFuM4zsZp1HPHoFgzjVzfNkI0
         +xphix6aMN/+oFA8EUz48Ebmti+nAeQR7AKKaExgtIZDu7yHDbUlDxmgvP3ZoFmO7NWF
         P4UZuwME5InkQt8hI3wOLnFSBqeGDWO3qttuaMatpT69FM2Qrlr94tIkkzH82BLyfjdD
         2xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929695; x=1781534495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86A87/9ws/VtdQEI7PHXUYpQ1ohvjyghc4NfnHpdryg=;
        b=M8Oq+tPisjI/1zzLAfIL1oRWJwx+No4hD7dJIeR5/Gr5I/2sD/nXmyPIAgXMlXoXPp
         nt9YWaJoJMwpia9z0w+mfKpJ3l4WBAkccanA6c4WtlwUn7vzCdxn1iulLuom6cIkKX/h
         WJO1ZWff6L/INYs1sjt8hrNKO4v8BhBm9qJhlMtkKiqyPxJwigxyMo/I7KIwyyZtqCZd
         J1V8+ZkXYCEh3d6BlJ3zm9tSKyElgfs7eZIf6j2WcQifdwiARr58zAwJowSVLjLLZhE1
         2XhzAGK100b7PoMAOhrVmPSgnDahOoN8U3WBNxrO0akMaEci5jW1ci7tn4oSUVEhV6Ws
         AUYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OevN7Ktnm3E3SJVnG9LnBZsv0QolgY9gAos9hAwJSIaggLVuuN6B7TfgtbruHIqf4bu8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRguwm+Nh+L8C7mWOGZXQnkboeKsT3fu29Ys/Wx/P26Z0vcvFf
	Sbzm6tq6tZo6dZDmwvK6Qf4hRGV072zIzu1AOQrDtkQPc2uPPXSzFywH
X-Gm-Gg: Acq92OGtwvexOZWDt4bAalBm2cHXA4BqMQ8e37byYWmdxOM8R1GbORkzw7so7jID7qS
	Z5yWxneD+jt5M7/DXT8EXSswHrTOsjMDPEH7WbT4fYZKfiFi1QVYGtagYyL2VutgeeGRzLPA0Hg
	n9CQJ+tOZSRQLXNhoRK7b+chZMgtKihNGtX05+eiLHXBK4kJZhPUFWzSQ5uK+lZIvMKJdgLb6fc
	fgWY+0ZjSllpmyNwvs3AAUpkyPPRJVIq5Bh/N6ChenE4GQTrof03862vwDjCXBP0d8ZgocDazDZ
	EXNbVyxINqErB3gcMoU7+sNAKlc0TkzpCOXTqcIc8/xR4P1eav8v1w7bGNlUlGKkBtvL7GVL2RN
	GH7OJTd5CfvtTWSjemSaQ9+3UXt/AozPwY4VLmg1qfMYOxHokd1FrKBsKAM5ueRcEhiHNiRbROB
	WAen4lMgUYSGg8oAPhe8+lEfsQW6anPGPGsdf6dWj8fx5UiV9yUb41F5kPiDJ7Cnb4ngtAOfdQV
	WTFEwlrAzAmsuAGHFWIGH+2EEQRoStMofogJNyvfVp/gzAhYs5chMjDFdI=
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490c25b39fdmr290218685e9.2.1780929695456;
        Mon, 08 Jun 2026 07:41:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:35 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
Date: Mon,  8 Jun 2026 16:41:13 +0200
Message-ID: <8447a8d766e54ce8daf108caa28cd3546e4f4729.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexCAN2 controller on the Symphony carrier board and add the
corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - Add FlexCAN2 controller support

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 54cb5725c4bf..93dee9ec0b9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -106,6 +106,12 @@ &ecspi2 {
 	status = "okay";
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -357,6 +363,13 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX					0x154
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

