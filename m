Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8D38B121
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535857; cv=none; b=JFtdZDyaZVIqNiFzGxWPI+NlsMavfKHlD61zBTkews1lZDkgmjH0Xzeq7usNLAUzpD3S7H5qRpce4cwrVBDsHjZsNoGNxmwNM0vEHAp+Nu/TCB+WR4D+ckSTcBKCm5FcHRhQfpRFjDvNDTQsjDiLK9+sxD23Hi8vumdvHeaJ/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535857; c=relaxed/simple;
	bh=tyKrl5KgYZLqKWTOXsIiUa4cYnc+3JmgWjtQ8z4GHtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1cIgtkc1v7AM32K432ila/sahb6B+L1VkEcWaWcfBCj2ajwayfsxMYFabz6gnMQ0W/Vf5PozYDzHKCVNEMG9OjkhI0I2WuH/7cpAO6MfWKOyfIOjSv70JCUQLO5/r0wJwI6GvaJf4QenGHsxVQy9yus5Kzt+VhCOXNy/ZKqXeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwzaY5D0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwzaY5D0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe655187so12153515e9.2
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535854; x=1775140654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jbxR9OjY5SiCxmkdnQnFn66JvcHpYqliCfFxb1VJog=;
        b=IwzaY5D0FP13zOSuSEe4uXEoeEnAUzKYTnbmL1bvvUADKEHFJnP0xqTpY7XJQ/F8y5
         NCRvkhnoaAzT40LtrXjSG7ioamhm4ol0/PQ2gX79lTB2rLGpvyQWWXp7Ji5bF1tbQvX3
         4M4KJcU/F1pcoCEUC282eSQwJVcRYTvk3vm4dhhZnvw8sUxY/XKvPygEEnta7A96FVt6
         rPwBZy6vR7KqUs213hoDAzMa9SocLV1mvx/9oUBSQiu74F2rfzCRGrzhZCYIeXGbT0qc
         PrVCTnebYKAHmvRbucdypgdgHtTJG6koXVmq/dgQ5Xzmt3vgnTdkwIfY3LCB0MwnriSB
         J0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535854; x=1775140654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jbxR9OjY5SiCxmkdnQnFn66JvcHpYqliCfFxb1VJog=;
        b=jRrvjf/kC4RA/RhDW+jbZmzIouA+cxSEmm46nz+IgTm0Qcgpmk8S5zf4uMzVfqcx/H
         95owNti5t40INciHkMmbT6fqX/6Ks/uXk15TvnYwppV6I576NHo1PcsHuBzSNvrJRwMR
         bB55ZdKhtoMRc46IXNJXSWgpXaa1zWLL3XiKTeIvxWliVzNv/ERPG6Jv5WnXgdVh+ykF
         U+T0XLURXtFSR22WltqOYuLYrKs9q7atmQF0G0qc+RlwZ/+ShaJz4s5REaxUVvB8F6vv
         Jp1JZvNSXGOkXd4sWuaVDbMwdsKq5VXwDoBUxJnrVFFe+YfUUr8v4UzkxORB1ykcWOTk
         ulkg==
X-Forwarded-Encrypted: i=1; AJvYcCU+C+cSDpe9UH5FIbjIpSCl+r8txRD+KrTYBauKVZN6Fzt2fIbdlLIYrmxpd8Iu5TT5znM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvJtLbUUSP0YovKYHsOyVri3VM+cZXg7KyWSdzL/pWhb39j65a
	6GOB0vatNELIdfiAMhc/rOO+bZRcqmgV3YpwVy9/IfwrZ6y/sJsFTzBk
X-Gm-Gg: ATEYQzy0WMFUefuut0+etmsal7tbzpNaUz6mZyYjMWoZNzrY8MYoUAGqQdpgm0eNNHb
	sgx15lfeQy7xGhclliTDtkxnOrXOnu0Tpa5XnJ/ulabeguVjh/KJQXMY7bx08WUFNMk2gLdqOdN
	GRUBkzNmf/Vu6vk31WWNBdqyqRGrG+uf5ZOkwEw6s7JbX/g0aL0l4YAHXIk7zCjyy52QVvQF8uy
	fzhb291FgundSQY0ZsJO7FLOYBdhAMkTt6/RBiL+hCVNnTEz9NeRB1vYOwQ1t4/2O4oP+wXKGDZ
	LY5MINWHdb9zDJb1dtOTA3KYbfZsWVpiW6i7D9wSLRVtD17NRpegI3wxGhP9aVQU2lRSOyDXEmj
	iAWEe1WvTU3hWWjB5Tgm7YJAw+etyqGLrIo9qKpacppILjX6gPi0fHGWO2yevMX6DwJulQvicgU
	tthnvJGwF6Qjl8cerbD3IvRqKJDzm2jDafFZNTwzSJ9/tt1dZr8099DCP4CuGbfiXIDxomq2Np6
	JK6QexMYK1+6BjRHo0RnRKacOMpL04iRrQCAAjppxvqAhZPSHVQGiICgPD5FTYF80A+AbhdQqKJ
	P7dQpj8akJsavBT9K8Jx
X-Received: by 2002:a05:600c:1f8e:b0:485:4006:960c with SMTP id 5b1f17b1804b1-4871605aa53mr122496665e9.16.1774535853676;
        Thu, 26 Mar 2026 07:37:33 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:33 -0700 (PDT)
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
Subject: [PATCH v2 1/3] arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
Date: Thu, 26 Mar 2026 15:37:04 +0100
Message-ID: <20260326143711.143462-2-fra.schnyder@gmail.com>
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

The Toradex SMARC iMX95 has four exposed serial interfaces, one of these
is SER2, which supports RTS/CTS.

Add UART support for SMARC SER2.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: no changes
---
 .../dts/freescale/imx95-toradex-smarc-dev.dts    |  5 +++++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi  | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 5b05f256fd52..7437e523ff63 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -210,6 +210,11 @@ &lpuart3 {
 	status = "okay";
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7a73958f6eec..1d369983cf7d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -22,6 +22,7 @@ aliases {
 		rtc1 = &scmi_bbm;
 		serial0 = &lpuart2;
 		serial1 = &lpuart1;
+		serial2 = &lpuart6;
 		serial3 = &lpuart3;
 	};
 
@@ -615,6 +616,13 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	uart-has-rtscts;
+};
+
 &mu7 {
 	status = "okay";
 };
@@ -1105,6 +1113,14 @@ pinctrl_uart3: uart3grp {
 			   <IMX95_PAD_GPIO_IO15__LPUART3_RX	0x31e>; /* SMARC P141 - SER3_RX */
 	};
 
+	/* SMARC SER2 */
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO34__LPUART6_CTS_B	0x31e>, /* SMARC P139 - SER2_CTS# */
+			   <IMX95_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e>, /* SMARC P138 - SER2_RTS# */
+			   <IMX95_PAD_GPIO_IO05__LPUART6_RX	0x31e>, /* SMARC P137 - SER2_RX   */
+			   <IMX95_PAD_GPIO_IO04__LPUART6_TX	0x31e>; /* SMARC P136 - SER2_TX   */
+	};
+
 	/* On-module eMMC */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>, /* SD1_CLK    */
-- 
2.43.0

