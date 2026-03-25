Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E63D39FCD2
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432244; cv=none; b=FL4u9Jy7GGHideyarvYaoWGS5CYngv0P1ipQ9i+zBQWyJd7aj/be3IQRg+s034H4P6qwqGcqg/qS8zrjoDwcMbfE+dKUk0O6eaX/CN22E1ZLJObtRPEvGUTApZ0fizlr0DHahQE7+FHx+dCSUsNP2MJIDNsy4UA/M0nXMlyV9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432244; c=relaxed/simple;
	bh=uoakx01xCZbpN07NnILah4RhFwsBs37YreFODQ1tNu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/yey9DfnXkPEBnkWb7IweuD4gRLvCveqO2l+IcGJaQ5WHh9aCGcMnaeFXUudDcFMEprYTbtQUgSi2gIl3UldfBd/ustS2Q0l/tkqrMmhEKcuMlGAKNZ+MnWFzlTaHpOQGVVkZtIQinBjXNsxR+lSWHhiTSrYkZPYyGUhfppRPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXa2aLWk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXa2aLWk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so49454655e9.2
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432240; x=1775037040; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8v8tAbQoKbSTjNpEbNtHGD1YISjFB6GU03P9dCTjvKk=;
        b=HXa2aLWkOB/SISbk0cqRQ3GaPzJZ6JAFr/66stXVXGKL+CsrQ432kn/g8hOCa6ks7c
         PAaV7q69lHInXEbFc9sx6FVWabJf2iLmKdjJbIxhKDrXWkod/gw6QIgO64wzc4yjKIGz
         7dTN7RQPvpK+D35PHRK+rwGtQGhlOcGv7Q5PhhVlWkuN7CUMAEi8URfwfcTILaBkpjWG
         ss5GnXG6wEHrpUIvnPS5ZsrHqHWLSzP5K4ZY+cOT261DyssLaSfJeGt7E9FngKdlTnwd
         iV+HKELSLSTjmB/NYlHD+4X5S6drqdhPJyYrTkw/ZjfNQ7IKOsM9VOZ+YnA9E+4K1eee
         zZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432240; x=1775037040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8v8tAbQoKbSTjNpEbNtHGD1YISjFB6GU03P9dCTjvKk=;
        b=gAdGivDBR60WFIjJ7eP2AtdaXTuFzkZzVeHUoWlzSOqNoHKKijcAyK0OqN+vUJPqvX
         L1wA3J4lslQESyP1e+XtYTDijEEs7lQjQIPGaknaBH1t9PRCcemIcJmgBUw7AABkqBM1
         OHU1mLDCutRGtrcJjShCUwweWku6ETjZLRiHW7+uamQUgXXdG3i3LNtKEE24RJa2k38u
         5XsZu2U4MIw3FezcYBYd6gcycCOjF3exFDd10ZKwOZUsC3M/xjAUtChUBsRXtU715SWK
         wMo+JDdepZhXOYbPZLdCzFFuWeHxg0tGPhrr+S847/arMF/dSK1PY154R1U2ZkhpE4MH
         Wifw==
X-Forwarded-Encrypted: i=1; AJvYcCWWu7BeKd4STAoK2wzgSQIH7IkXg3tLUrPX1CIcMuBxarYvnZZx4ETDrZ141N8x9u/6ZPg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzuxcushrd9Pv90r6FicdGIyituQwN/NCR0xW6mZQd+GAO7vTqz
	FcFQsTje4vKVqAmw1SVulmpWiaCA0RVcPh2iH1Zc04UtBdk0zPCER32V
X-Gm-Gg: ATEYQzzE+9kmMR4WFCLejV8sT0BILV/C3fv2aRYU4sObfy/VqfJWr/Q81lMI8yPRF2H
	bYe9hscWyP89zgrGpjD/x1ri9sYumCDhDwlK36dOZ8XMboYjLdNJcJp/mHSB+4FSnz/KpOmlcUE
	sQmK2eYB4Uu1vq1JRcjQAngJ28aehJPjEnlzldeP/MYUAu1RymDwNFEvcOvsUcTZrtG2zSEW9xu
	lX48r/AURpTjhqvbIlb+kqGK41/H0nO1ZRgI4m3M4sySyhuNlbPKAgeem/1Sy6ReME7ngPHWTSd
	IDxGM+1Sbw1RpAd2/E4/ni9AA7jf05b5RzHzvomKfeM9tnZOLjALXMzBosPC8ssvXhxrEmswwom
	WkttgcgWqoC0Go2DrOq8KiOCDQHoANnZJUrkt+fYp7cu5NAAKEEIVIqdAEY/6g41D8nsYIuN06z
	3u2+E/GTwKWP2N3KSglFZ4+HoSqcCiNmOspVaRy0MeQTrD9M2cuSZu6Fy8N9Zzl3lk+xQwj1v6a
	AVhwv/5uxhc51r6puX8Q9Aiy7lIXSSW8f8DMcgqCTGmYpYVZqO4g3T09OA4Juy4QBmAfs5L+NVa
X-Received: by 2002:a05:600d:8449:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-487160afe8cmr30769345e9.33.1774432240097;
        Wed, 25 Mar 2026 02:50:40 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:39 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 25 Mar 2026 10:50:21 +0100
Subject: [PATCH 2/3] arm64: dts: freescale: imx95-toradex-smarc: Enable
 bluetooth on lpuart5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mainline-update-imx95-v1-2-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 uses the MAYA-W260 WiFi/Bluetooth module, which
uses the UART interface for Bluetooth.

Add the missing UART support to enable bluetooth functionality on the
MAYA-W260.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Although Documentation/devicetree/bindings/dts-coding-style.rst
recommends an empty line between status and latest property, leave it
unchanged for consistency with the rest of the file.
---
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi     | 21 +++++++++++++++++++++
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

