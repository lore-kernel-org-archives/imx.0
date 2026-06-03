Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C569477E40
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488009; cv=none; b=uPvS9v8v/rjMFh+NnlTCnJZJsS0nwXKIdIvS4DH2hOWRQJkw+RomMQS/qkr7kF4WjFtdtIH6GCqKLBTNoxgrqaxhcwhrJMYFNLRtLwVDmNd1UBFri+nO/fC1OHCs1mxbUbZ8ygHawf8ZrpxXkf64dL5hQ2C6AwWX1hEPQSBoMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488009; c=relaxed/simple;
	bh=IZ7OVFDg1SPJZmlT+8XPchCRyC9o8HHYM0iwe53Dulo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvQd4XkTs6u7Klcx2RshhAVc0N5RQhQq31JqU0JMgYbJXS/B9Hs8siiaot9/fHesiUFVjSb6Y7MFjIVkbOSYb9JnTJU/8Zplbc+C4vEJ2O1ZJQcwtEq/vDapGBQVKlkgzUjuT4CAEB8HuJcpOHskC+SCWCeFPCpgRFyYuMCdr3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHy4QrzA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHy4QrzA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b915ded5so4647075e9.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488006; x=1781092806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq/j8G3NT+tBoF6HRRNJiKlOu2gP9zRAiXpNDLBe0+E=;
        b=AHy4QrzApajT/vpWnjw++cG5qNBMYuKT6IS49Zr77HOReRshSSNvVwE8ynXTgX+SP5
         OBGWp39ACd2bVAQ2ezdRHYqVYkMeYD85s/D4tIv5KvN2xMr3fb6dd3uyFHx48zjkivib
         Smh0MIRzseYkMM4+rzEPgh+EcbbxQKqSpCJrPyGtwFBDV/YYxxI52G7wT4C8/aP2bFGA
         +0UNIM8lREaIUN4JF50ESVrbWiklbf6iixRBxSscwObNf1jGXCrJ19JhC9tNQK/gmrGh
         Ad2iUCp2vlxh7BMFaHMoluKmhRpNczrI4Irfu9k2QeTEhMjREMo16r/Wm5n0I3GvC9HS
         fuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488006; x=1781092806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cq/j8G3NT+tBoF6HRRNJiKlOu2gP9zRAiXpNDLBe0+E=;
        b=RTunhlA9sq/KDmobp4C4vdQHwwCko2Otq9iZoCfPM9jmDQZBcCAckkKspvTDEJTMzC
         uaYcjlMDtaPHx4NYTY4PCHv9BI23vntslZI5BK+ha6HB5OeMPuQIfEHohJXZSX0GF7+j
         wQG5BFLHNZ8J+fbltaPsBnN+NsLBN3YuMNdjYOEdnL58gAhHf3Lj719lfxQ3qjU9uX6Q
         myyuU9oqvY7j0NBDzkCj5D949U3um3biigGGkkZig26cTqDHaT/GRBocIQcAqiWq+9OW
         XBOuNMRzPPLWOur2ywwBxhJR4B0BelEEuZo8MX9eXVpIJQLNCy0WcOT5ByVmK6X6/RCH
         pseQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Xe7ovmXE4i8fgB38Wcl6EtqJir3EWsHVMT4r8bwEDS95ofsFijsn8+tKZJH4OCg6nfHU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwleJ/BdFyGUZiUntymV1p+hSt9aq7BRVJSKfB+FLCQPxmdzBMn
	KpyErXIPF9uWQK0OuLttNHzevWiVy6keisLQailD0P2rEF5u0MwOAW96
X-Gm-Gg: Acq92OGZqvTH7TBZkI8oC5gX3KEaqWgDKyC2u8JrlLme+q/PSAbfkA969rUbbaiQSCD
	ZhhyblKqs0u45y7wob9K2Hu/E5QkIhsSIDkAVw7X8y5ar53KwUD9EoY47JcxrOp60VIiX3lbcby
	Uas25tvqeQID5XUNh0rjHII3BfcTYv/oWtyO/kSGzMuZteVngsAKqoxqPAkuHruD5+iS1EqgOhp
	fd8o3Dq12HgOPKHt1YNKrNOCynu+YPHyAP7lnpeHz+5abzvPVTnbqGTZ5w06cFcB6oDRBMmowMW
	jaVDcaXjXWTT7kDGQLIqteoI1xxRYo8yBDR5ksnrQyeSnOc9YNTC1RVbydAPOsx45XgowsULKdl
	1bw+x8JF8xVgjNO9xHrM1t+6GXC3fKoC0z940MyWQxDBCErQiFuAFOppbpOyE+r/T5SNux4a9Xc
	QsMgrlvJIS1EbbbAAUZ8biVk4tiG3cpeW4l1pc+C/r1EQ12Ke9DADm7pDyxcsnAUehfzJxm5CQ6
	hFPvPm401W+xaHmnBemB8bWrBJtHj7zpuXbQMwmsGo/0DZY
X-Received: by 2002:a05:600c:4e87:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490b5ecfe9amr53048185e9.11.1780488005304;
        Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
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
Subject: [PATCH v1 05/12] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 13:55:43 +0200
Message-ID: <0f72ccc0fa5d7a40539fc25a07bfc57f4308f5a9.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 8f8c76993fb5..3dda28be92f8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3

