Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED783F2109
	for <imx@lists.linux.dev>; Thu, 28 May 2026 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984254; cv=none; b=jJolnRI38QCEP/QQz48BVdPFJ45Y0Hed4Tn5t7tx5IA/7MYKDj+FsrC7qoy8YhiqQQQ0JUOBbr/oefXVHQ1uAwRyNYIaXvekHxZAN4zNO+GJ+9ZArx+b6RHQxSzJE4rRukyp0kr5aQPf6Ysjb3z9C8INLVAXPzto3SsryDZIU6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984254; c=relaxed/simple;
	bh=K1bvRYc9rbfL8YZFGffVYMdywl1qHroIrZdxg0Pfm+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MefoNCfV/H7+4F+0nPDZvMFogbylMm9LPWgSDqIuFg//csTBWhH9I2z8rMyHnlNvI4cdF8EODAlG6F2pktTL26ITSt1JaX1B40IWRtIe0U5Z6LGnNNRAs1uD2zuR+LnBHeIPLivgmrBE1ljtXdOHaDGIZkjne6d5BYz+8OEwvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXCRh9FD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXCRh9FD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso70257965e9.3
        for <imx@lists.linux.dev>; Thu, 28 May 2026 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779984251; x=1780589051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nqRvMLH1H04JcRW0z+OzS66kEwfQAxvc1wieYDRlYE=;
        b=QXCRh9FDO8MQZ8pZX2Badc17t8EbDT58U1puhnFZOk6ggXVb5ku10Hz0Q4v9KdGzLN
         vLgOWA2G/BdDDKcioF1h2Kpzkdy4w7eDuhQh2eVdRiBTfHnhBx1tlUSx3QZdVwBjymJ1
         BSak6Hwr1uMs8sqRI42iLLL2eCXPun2tzqjdYTypVzxtx/8U/NsNdzexaX6x9E04k9zp
         fzM5Dpf/++5tvnt2u+gL7aHXCJBEDQcsH+cJUsBTfJPU2V25/z/i4ob6ljZA84gvp7V6
         jpYBgF8I6D+pn/Xon+xPfuLO4+i4as396Q6eXvSf/TPr7tqWhbrQhC6NQW/7hH+jKU7m
         tIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984251; x=1780589051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nqRvMLH1H04JcRW0z+OzS66kEwfQAxvc1wieYDRlYE=;
        b=NgyJE2HQfBQfbuVayqFUE09mdSM24EIXUqwH5KOHMANiilk+nVLBrJ7KhSH+0RGPL4
         PdHQdJ9jIqSEuzZOyRgDYqgJxpkLwaUU3fur4C3muFRVL3qMPwgxLtsJD5zuQKnzIl/3
         MkXC6Ks9sGcgP97HHfV96lN2WgdJfTK6AN/zPwI7mBTTHFa9/cGgeEThJsb3dJmx/qs4
         8qf6uNRtz+qr71M2Ig5kJvukf/5dbQwgLmS0uY+UdVKa5KLo/nvhUkT7H+53wvrlUmVv
         KAzRAq8XsCazVlSFzuk/EYldIJE/Nl29gMSbyTl4MUtNb7fxcHpd/VSJjMk8QNusOzsW
         XOow==
X-Forwarded-Encrypted: i=1; AFNElJ8FGjzb3rDB8ZkccLGsGzLWhzmllz5fSedUZxxaP5se3o7TutxXC4FRGc4Nu3xhy471odk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLWghZSHvy7n5JZPKRBsFr4y94RnTdL64QSrOBx8/LvE9ZGvHm
	jHdt7lUyra0HtuxCj3KHj++sShN9mzS8qaoOzKnfPaJ9rhbr9iHvra3z
X-Gm-Gg: Acq92OGMz/q4bjx2UZbXZqdIJ7Eb8/fNYyY3vOW9MMgbve5L2bKgWHRSqR2dGWHByXj
	lXZU9BITwU2GH8TIpMf4usnOEyCtM9M/LtmCZA2oKcifPKQFkheo2M31R8MUiA8njGx62WO3KXM
	mFwvadtOC48WxXjsUkhzfL9RgP5JDoQfzq1t+uh+AJ3jwLD7KkqydHIyTraAasrPJ0S/xCXsfvz
	XVwYiGhdytvT6u0FZ28eX4PhCl3ILxs5d9/HrRXG5YXfjAB+jPUscDUiv9XW4IsUdPQUFu2LIF8
	aJ5YokRUJcK+6NLCWSqwCL2eTRIPd2LsLGGeciV8q2qVpQaoV9LoJiMrZmMCbMo73eqTqrHWNRm
	KvDkXosFobZRovn3F+hgqbb+NGr5nfzZetK4BMl1Dt0e5kf+b5UVGzfb3jx5BkQn8d4sJsNsz9G
	gWoYf6B208QVv4/fo8TxKWVQFk916gxg5k7rNfTxYZhjnjPBqqve81RhT4VklithyPipfq71LIA
	Kv16Y704JRn5MIDfiNLuS9OyTOSPf2qMBuzuAVYR0v6w5rT
X-Received: by 2002:a05:600c:c168:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-49042268d98mr482071085e9.0.1779984250724;
        Thu, 28 May 2026 09:04:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908d9fb1b8sm34979495e9.2.2026.05.28.09.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:04:10 -0700 (PDT)
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
Subject: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
Date: Thu, 28 May 2026 18:03:58 +0200
Message-ID: <20260528160358.19006-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the MCP251xFD CAN controller connected to LPSPI7 chip select 1 on
the Sonata carrier board.

Add the second SPI chip select GPIO and describe the CAN interrupt and
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx95-var-dart-sonata.dts   | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 0f3d2e488f4a..7985a42f5785 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -168,6 +168,10 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio1 {
+	status = "okay";
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio", "sleep";
@@ -280,7 +284,8 @@ st33ktpm2xi2c: tpm@2e {
 &lpspi7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpspi7>;
-	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>,
+		   <&gpio1 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	/* Resistive touch controller */
@@ -306,6 +311,19 @@ ads7846: touchscreen@0 {
 		ti,settle-delay-usec = /bits/ 16 <150>;
 		ti,keep-vref-on;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk_osc_can0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <12000000>;
+	};
 };
 
 /* Console */
@@ -442,6 +460,13 @@ IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
 		>;
 	};
 
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__GPIO5_IO_BIT15				0x31e
+			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22				0x31e
+		>;
+	};
+
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
-- 
2.47.3

