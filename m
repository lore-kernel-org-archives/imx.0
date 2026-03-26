Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0E23FA5DE
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535857; cv=none; b=FFXUVJuOFEavIqMhKH2Ty3pooqAfIioRjluwoU/ls7DqOfRdfqNYa07jrXU5IL+jurRceJH5F6JPxxcHwI2P5pX3mf27gro7iGu1/XPPiVaX9FZiTBppeRvaQnG3SzcfWrEGu5wXTsKo6IocScS8duSITE7dMX8vUpDt2WNHkJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535857; c=relaxed/simple;
	bh=PmwkNaFjVaL9qgALK2SBvk6jTjb2dAHKjczGO3oQ4Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZxaehuJp3QQmDVw/vcdDAhHlDG6e8JtJgoid2dGVhPe05unxayLzFtjhDd5idTPatcaPjN3xpvtKguNNb60tVElZaA8IpDl9iBRzIpgadY9aiTHYwKNFVA16OvZXGnpW6vG3lNcZJXPXx4+1UxSOwW4HOrQyTnPDGnFoNmAxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lI2rCXa1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lI2rCXa1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso9518565e9.3
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535855; x=1775140655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voyTd2jlBJQRP74fcWPlpmyrOn7UyuGjlvcgxGUNLvA=;
        b=lI2rCXa1ApRy8uKPZ8CWrXCEXkzmIDOknc+x6Iapba70HrXXAyKikewMwTbUevUFNK
         Sv8dTdKdEbc3pDzeG2/NdIO++cRKpQQhZ2+Wd0B/pphK6boWg6S6WLMzWT3GqGjTXyeu
         z6QrSdyCPEwAOj4dhbPj6p0x5Ezkjj+L9+COrEfjN3GRMItd3p2X9R5xHpr3wagZOOxY
         N2VI+PExMmRMsnSVC+3PIjN8gG53evCnJSwYP7CVXLolza8InRKUT8FQ3Ul13iETmvpY
         r/c5iZf1Oy+dDtbXMql/REI7dlvMD/26jJn3XwUb2pFQ6+704I3vdbAqDvEpIcJHZ3n6
         PtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535855; x=1775140655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voyTd2jlBJQRP74fcWPlpmyrOn7UyuGjlvcgxGUNLvA=;
        b=XSUcMLcnfYiw2slf+hmi2tb/MarcaVEYELfa+D9Kf4yvTfMftsGA0n3irVL5+4cKWs
         LLYWCFbeGh7ZN79WuUiB9yW8rtsWCCeKZ9ooKfM+QsHjNXcloBCX5REzf9p6LXkWG5Uv
         dAs8TT+aLl22cEkorSBSQfBlFlAz7wQJDTaz3hiJFl32mQU7/6lYle0XaJgjoybSIV+E
         mWY5gGqfhjE6FzooZizEe3dRrfLKzp7lBqqck5QiIaO7qmGQNHZHDajsqvDfPvmYv9uq
         mqMTXCK7Urj9gNXxTrCOpWUbv/QnCwKeArsAAp0iKaghU/N3S0Y9uNCLzW6MSwDYrrNX
         n6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWGJ1X+F0orDkAek0S1jZ9e8oAZwt7FzfRxQq6slF0R3peCKf3x4ga35jpZ5t6oc+x/x0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoVlH/kaNJtQXVsORqDoYNonMHrAJa+CPT+PB5rly6BxvaC1l1
	2aHG3D1e8LeDo884bdGUA3dIE3ypPsJEzONECEng8+6OsawHwHdbTuJB
X-Gm-Gg: ATEYQzy+TiAkAmVusP9JSxJsNilBPcrn1KrU3HAvF8NeChrQvT702bOZGhEZXpC34+h
	TVKOwxxrcdFwuO208btpaqR+FjPWG8cOUm01syxYuYPdWSF63cRp/NhStp/pD2AYVvfhJyp9zR9
	vhGcbmdwARDCBhTp0MkaE38iPzaG5Bk3vhEWUSrraUadkiXwloBWNqzVWwkR+L9V56fxoKQM68b
	QdABfF937JrY//aqzRQXJSinkVciEx/E0B4AszAu/73AYwrnk+3PU/ubgS7S6aOPEpBHvb/lrDy
	D9kLPZtoO181nb/22yobbeOyZ/iSi+PfOJIaMsjTNBbrZbPWcm28t4ALaMGknsg6x5et7lX3KaJ
	AH97Mjnt93uZufotcop9g/LnFdHaMvVctMJ9i8Co0L2uoRxCGE54bc/Pxz9E8MZBMZL7FinZf9U
	SU9QM39lW1ZMEaLBrVXzKrmS+36d1gynDzVJqekXUJm10Y2R4bbuqH9fuytx6I4oQnn1N0o3hFN
	ltFTcV1WqgUlu3eFbtliVXeIOK/bOu0pd65GP5TgvIvroLSPfgn9i2cOqxDlMVMwD37ZADRb2fo
	3fbFt4QvNPXczov9NOlW
X-Received: by 2002:a05:600c:3516:b0:485:3bc7:a231 with SMTP id 5b1f17b1804b1-48716084829mr125286925e9.29.1774535854830;
        Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
Date: Thu, 26 Mar 2026 15:37:05 +0100
Message-ID: <20260326143711.143462-3-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 uses the MAYA-W260 WiFi/Bluetooth module, which
uses the UART interface for Bluetooth.

Add UART support to enable bluetooth functionality on the MAYA-W260.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Although Documentation/devicetree/bindings/dts-coding-style.rst
recommends an empty line between status and latest property, leave it
unchanged for consistency with the rest of the file.
v2: no changes
---
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 1d369983cf7d..a90edefc5197 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -616,6 +616,19 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* On-module Bluetooth */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_bt_uart>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <3000000>;
+	};
+};
+
 /* SMARC SER2 */
 &lpuart6 {
 	pinctrl-names = "default";
@@ -830,6 +843,14 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
+	/* On-module Bluetooth, UART pins shared with JTAG */
+	pinctrl_bt_uart: btuartgrp {
+		fsl,pins = <IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e>, /* WiFI_UART_RXD */
+			   <IMX95_PAD_DAP_TDI__LPUART5_RX		0x31e>, /* WiFI_UART_TXD */
+			   <IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e>, /* WiFI_UART_RTS# */
+			   <IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e>; /* WiFI_UART_CTS# */
+	};
+
 	/* SMARC CAM_MCK */
 	pinctrl_cam_mck: cammckgrp {
 		fsl,pins = <IMX95_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1	0x51e>; /* SMARC S6 - CAM_MCK */
-- 
2.43.0

