Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99663C3BFC
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913385; cv=none; b=QEiJaIM2YA17bM0es+NoRVjUOYxts7+urZGXP3qpqnADuDvJGph8PEh2RPMNBBCNn4FeZyyl0Ugt/mewYoojKUagHzZ9VJHH2z8gN0KXT56q8Mho8CyfMdf91FAgOWNxLijrr52tRKkOkwKaYczWn9Joc9UnChimW+BZKY8wvjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913385; c=relaxed/simple;
	bh=gAIPVBqy5x7vTMwPX6mzPu2b0xJQ5t5vdUnOfadu2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuBzYp1l3qN68kujbIzOUu6OwJpSYCGzf8WKqLy1StXK/kBTb7gQoLGBN8GHLYYPXzwSXgbvNNE5HjkVnXp0q2JBlMoyBiG11kJp/wsEMbIWV1z2oiTeMOWgoYPs/TP1dDr2uh/IeNaNJ0nCAeB+nHMI9IuwbCn45wV5cCAW278=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBb4pj4d; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBb4pj4d"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3707643f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913382; x=1781518182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyc6FtIc4DT7UgqHVYAGSMmfSKaHs4aR3RARI0nuwjM=;
        b=VBb4pj4dzzFirTT455CeWiGWYPJfO83dRxFqIhhh9jtdPWixeCpwj/V+kAlFWldcI7
         QpDY1s/FKmvH4RH6kIDQ0dISFwhUdr7wuLBg3lCkKAfwwPqPdVtiJbNFhyohAI/r0uv1
         De19dndgcajnBVRFboNe88mVlu5cO4vTydcmyVbF/1qODlItDBW8WnouYWE3gvNskbKo
         FowFYMSee+gaTX+JFlUOHf6vteuznognWGCJvN1dYIoNqsa5GOC3OXvzZfLZ846z2huW
         LzzAL4xUN/AKQJrGV3MfKLe8gzzjCY8U4K+0S2OeSrXUbSoWtz4+JRPzZ6abR1epILyI
         w43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913382; x=1781518182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyc6FtIc4DT7UgqHVYAGSMmfSKaHs4aR3RARI0nuwjM=;
        b=HLcZsdx3DB864IAXXmINhrraeXo3RkN3zm3TYQPYZ5Gk4RP0p5HmCK0hAlbGm53icn
         niUdJgR0oQB7z83ZBrcvHc5rKvLVhGojrlHMPlDhV1D2ZOqFWunhWjK0pqZY1pbxsl9f
         XZViLTpaMWlEUlzTaZJEqyJPmd75NPO1LLuJ9V97b+Io0ax7i836r76FazKc3TFIyyNR
         Pz7uFRY2FhkqwzqZlr+00uomj0tPBfAXGUvldVEXJ8NxVp+6G8qjyV2D55+2xjAEO0X2
         NmTw6bHcSK/wbN3YoDW0kD9mvlVvLp0aSgZsPH8zb5YTo5TCL8RmqyYsJJvwm72EAvzL
         68qA==
X-Forwarded-Encrypted: i=1; AFNElJ8kPszRyb/8JeWQOG4WfkZSjwCeqirwgd2s1cFuQw3Cd88R3pxq8e5ZDOJliCZs34M3AK8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3O3UTnFNlMyLgkoMlQIQzLnsyx/zSZ2sdHecjlQp+KWj/4zCA
	ZahaIuQgTTD+dQqxGT6fIFp4cIHT5GCkAU0v5Xf5PD4gevQuhHvrpCR8
X-Gm-Gg: Acq92OFQLtpGkeZ7xIWsLFadOwR4VikMb2JylQN7lvukSiVMRpUAKsepx0P/b9vaMk+
	VMhCNAjnBTLGCsow8j8/84+4rWXwNPJ4L3mE9gVCBrLO/7WbAKvZ4bmb9L/xRqqbmh/Oqa7/KzH
	fiaBI/GhSNvU/2Irp1yjpSlotI65GrL/edUIuvngRRCJve6ipsO5Re9cIHMUdrJ7CnX3WMRXwGc
	ZGridwrNSjfCdFwXkrunro0LG95jl/yEctGDxGx0G0CeCiDpIekHWjsYzugANws9+FSeF+cOR1M
	OOpnhDGoeuA7sLFrQkCcOfbbAFZNffdBhQD8Y7imEv6777ZwCH5ikYd5Nl64JfpKiBiDWDIcf+R
	H1vK2//l0g0O0AXWPlfnCfyJrJih8hrMPcA+JacjKtJkZFRdb9u4RxCzAhc3xY5Po+YCXGC2s72
	1mJFkgp/IfFid0JlL9IRdRpgk+YQxHMRP3xZ+3TnNDJ9M9tVS+ZrIzMllG+w5lIVkijJH/DIr0+
	vLqqs7WfBOiF7yQ9JvGFT6+a2YJ0Fs/nnRjvVvmkdH3MFHq
X-Received: by 2002:a5d:4285:0:b0:43f:e721:76b8 with SMTP id ffacd0b85a97d-46030624015mr16808494f8f.37.1780913382209;
        Mon, 08 Jun 2026 03:09:42 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:41 -0700 (PDT)
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
Subject: [PATCH v4 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Mon,  8 Jun 2026 12:09:23 +0200
Message-ID: <dded56bcf066056f56435e65ddf9d200b0d7046b.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7b839efdbcbc..34a956c98635 100644
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

