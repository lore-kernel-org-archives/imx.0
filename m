Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594513ADBA5
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049477; cv=none; b=JiOrKDZYVVeqTprSiTzcQuOzDcu772lkY+V+Cn7fQAb+/T/IpXrSUNTKmO9p3/SlFtUygcI0yEBfNZXn3dZB/IgGPzUT1t5M1PLG51D9e9Ylx7DzcTQxE1z0Db5QsQGMN8/cXq30bcVnlGJIpeaa7b2DGoXo0425C38gGE0XQy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049477; c=relaxed/simple;
	bh=u3Kn3BbHopgZ8N1at/4YA4/kx1F3tekLTMf7nyhiL+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZDD6Pn/3UzADffPQMTPPQi5n75tzBymnVguuWo7+vfXPj+lAw+PczmSaVED28kaRkscdoHRgtxdOs/DFwgWq2PCgKFicM1aX6UZh94UXpAFcZGlOLjUcAEOZcM8/KuM5Zg9Vt33/b1JVlA313mvPa0lO5BTsU1Ecdvt5t9V8Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krxrBVmu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krxrBVmu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so92067425e9.1
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049472; x=1780654272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct19hsseUzI7/PXjrkjuwXhkiCOgWFxKkE4ghLuPimI=;
        b=krxrBVmubz7/4kTsI/u4cREKMlFnLr93DW/WmwmnwNhUAxmza8ppq0gtWzBvb9rqHl
         gZGbdF+5YR9nmTiyr/88EVoYR0oayVaI9NqCysw5zl/58PYCshm2cVOqhSo2CWBw1Va1
         Kr7/xfwSccqOUrO00tt4qFhZmQBtRUMYNvW0G9Ke3zzvKWD32gU1yGAwqeP9ET9BLJHb
         ZYYISV66+kelDsgsPqpfrVqbLKNMIW8Xp7sLq3Q7M7xqZBIoxdoOM651PaTyTZFCwBSq
         1W/YUtmq4y41f510l6ea/BgUDH2WjWxfPPiQ+dVSD25Ey39Hg+1G63/EYOM6thDDWvpd
         lSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049472; x=1780654272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ct19hsseUzI7/PXjrkjuwXhkiCOgWFxKkE4ghLuPimI=;
        b=r67ae3eT9vfdjlcQGWSs1ssDyXnP4/ggR3WZ1rgyWK5S6QWxRlujHjzVgKBNXUig5V
         VVJZuZ2mxV4gJJn7GZ+YLhenIeSWfBrurAtErEHVbBkpamZeZYDQcETAtea34qboLa2v
         3pBi3FTaRC41/oeyrkUQE1J8+BAAdjPHek49rY0sRudu5xXNYkW3CB5MKHANmsrvfLOm
         IKk/lzzUZvhCiBS3ZH0HM5N29l6B/5ayLJf+f5wf9bPnZcaexuTaPWR+UZPHCo7dXVIA
         W4fXN1eXldjgtk/uVynTsOIy4APB1FlRxfKz0EjhG29GjSv/hxuNwG/8jWmkUMO/IBTn
         cnyA==
X-Forwarded-Encrypted: i=1; AFNElJ/M/sDtBHRH9VFkTzdJkj9CAnZQxjrg1/gOCTIJEe5p+1OQ0xYgYqMpku3BKL9/5HwJuT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGB7JgrPY9ZmTLQnl4JQXtS/ha4s+yLIVodikG53uWXIxkc/4a
	Z1trBELAMJAKS3WGBCKkmDMPwL2pEmVSVgw9IckZbB8U2JLbj+Imlz72
X-Gm-Gg: Acq92OFVPiDE3w6owJ5QZXxq1B8Pa0eEHYDCrqSBNvSXfxC1N8GS+MyMd0vNR6/lEA8
	FlQYw/XJDA5rWGmVlumtCWSt51GaKezWnmj6jc4F5DEQu9iqi+YlOlcyViuAXpvzwkc1l/jOtZl
	FqC/meZa9QVywenbwefXevQGJw2ac9t6eiT62B0kqCIZEXIRrTS1KtdXK/8kOykwj5A9wGjXzqZ
	U2DkQDMPX1p+etBP/2KV9/UiPJ1XXlo0L8SU6Uu6Hk7LS4kxakZl/sOuWeFb8PQrGvbce+AoeOK
	3D6Nxn/blppTtwTjG3O0XtVdREQ1GMERuTQrjtIFULBHHFp0PJKAbn5m8dHJlZ5qTsIuBXc8uIT
	l1EzawFosg3YP2odfK6W7OMCG5Jt5pXwl2RjsVLQHY6vayliTOhEr+HY+mIBg+5iiuNP/wWsH9F
	HP4QR60LStamjhcsnZFFIDfQmo/ewltc+n2sGz+/KvlDc+QXpsZhBAfniPPxc3YvxlzxPglwaeO
	u9fRTxuya6osH5elPMd38Li+ftxBTMymntr8oqI5mQsZ+E=
X-Received: by 2002:a05:600c:4fd1:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-4909c0f1062mr36191365e9.32.1780049472453;
        Fri, 29 May 2026 03:11:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:12 -0700 (PDT)
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
Subject: [PATCH v1 2/4] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Fri, 29 May 2026 12:10:49 +0200
Message-ID: <bdb099af08657e35b81a15bf9dc7ae2b5328c612.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index ea996a36b022..a5fe8432ae59 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -310,6 +311,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -446,6 +453,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3

