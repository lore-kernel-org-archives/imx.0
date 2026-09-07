Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201283FF1D0
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763651; cv=none; b=DlgCPX/YfsHHH9ZYzdMXPhrdUhjWbJdFG7oK1QZmcXQGlONiRabfnXKbYr3p+KUsfqMjfp4EJ1nhCz/6kP4QDyk9wnkZTJOJ84aUj33bqCORTi93p+DTQFTICPo/obbGrLem5PhZD3OmJgP10tADODaCbQg8U0Mj/BeneEHL+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763651; c=relaxed/simple;
	bh=4oyC3B9YoKBnvhj25xvdbfh1IDoKyEgUX7Ty0r+F0FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAxxRBICV4K/WjoRR+GRm2mX3PrmyjeNS/avv3iTqh16SP0s81RPpHP2oiHhmjDUBIKm7IISCG4FfaG6Hdd6w5p9/AZXL6QYacEpppbtyvtt4wmwvrGyFvzfbdHPQq8DjOGDpT1MgG6dVl8JT9yOZNxKKsG8/r75wA4nSO4zRiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irogwURR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irogwURR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso26941775e9.2
        for <imx@lists.linux.dev>; Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763648; x=1789368448; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=irogwURRV/OvkLbLSNVVvnIo2vMfQs1+8TkItr6bLU6/2Ty7FFxHnOp4Bkf+LujHsF
         ixoIgW+DUt5tWoWpogxw/W5nkEbu3ZqSXCUky+mLkVhBdjEX5z0GoS8F0tVqmachEc05
         OQLebvXtjfCY00vYHiaA5cb8UK2xGVuJWfc3EouyY5f27IQPOrm8LvK8R49shiHOJlgW
         iWXBDb2a22tYJ6PYGxfFCCaT8V0nrR8Ifivy5TGlp3nVbZ87uq88m89ENIIwdyH2+9m9
         ffoW8y+T5Ry6bVV97l1gVIYg9ml3pK/iazDseqHFnJPLBvVeeahqtmbU49qa+ucjDGI5
         mFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763648; x=1789368448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=mhUbJvqcFSATIem1ujcIJC73W5biIKxGkMl5E5owtcrdG69OvBpVvmY3bAdA7spRX6
         MMR87xlyXYLjBR891z0fH6zEO7ID/rKKWIb3Ea4wNSFvgzLo6q1ODHbao4b7JnZ6P/Hc
         tNqfxfLrauHAC2L1zKt0DqlipH4RMNqgOhV15Yf2yBdkOUxjXGJSbSAXKic3YLeaNBOo
         UNlpKv7akJQ5x9I+5jg9sFBoRr3dHjEN9KB/pT4U1JVorrAfVBne4kIFmTw/xaoolrgZ
         loA5/ybFwiVgM3YfGF8VWctZ7RcWkwjZsNWqad7RRA0iGuqS27PLAcFegOBfzKRenl1D
         UdhQ==
X-Forwarded-Encrypted: i=1; AKwUvByr4PE1aySiC8lsA8nUak7Ct1/hxivhfiK/834gfYO+d3wob0xfml+dUyRpvYldQycsFL0=@lists.linux.dev
X-Gm-Message-State: AFuF++nFNDEutaOOihdJd5Z+HXWC8a8KYtlIavli4XlHjyA9rFJaZCTZ
	GXz3qL5J6Dpem7kieKkQi/vE2ZMqaCXoXVqUc04kHDOSbfLWxtLDTe4S
X-Gm-Gg: AYBFou3qWYao9jx+NuQktJk6DGaLIpH7Vwj0Ht1RWwNmR3zTRH43PCkli+MmD067PsY
	O+xual639AL3rcmH8V8Z3HUWP6gf3U5rKYb/QavJQrxk33BK3voKM47BrlF+U/bokcOgt7iy6I5
	8fVsSc6IJVvPLg/yOt2Wj2oHetpk9SvhI1kJYTlZxNFLmSr4R4C7MELNaUtkfwRWbxD7/DcXrhW
	6X9JzTEnqJMP2L5ZrShC7M+9cnPZ9fbh6NagwRMrziRZ4m+rDOng9GT2aMStA4/qOeSOLZAVuXP
	aHbed9RpjgLlzNSrW1fLWLreRsBrBoGdFBULakUz50nG66MR4/+OnCeYPGaElSu94ym67W2zopZ
	R239e43XeTVGlWanDSesvDpaTZHLhlre2srMSNvfVhVYTKfo+jT8oPRGAt4Ty2waE1C9Vg1czS+
	MmoWXht4cg3co0XM3Vt7jsKMNFp9rpOvRx5Vxcb+jh2TKdgRa+BIuKMU/YGNFQmi9/ULvNmZHfz
	oLC3Ruu4/yyE9A0/Bt/zRqcK5OW1e3vvGONGM00FZ/Y9+qF6vj2/s2EnlXwwvn8jw9vrTHzOCZ+
	0+BuqjryIJOclXL9og68npj/wfMTnwelhVigcN40A6dzeLo7
X-Received: by 2002:a05:600c:4e45:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49cf81dc3ecmr232937625e9.1.1788763648275;
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:27 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:20 +0200
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add
 ENETC port 2 in SGMII mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-1-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

---
v2: no changes
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

