Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDE3C2797
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913389; cv=none; b=ZJzA/Wu/FVLVP97mMVMHobq+7Peg72GLg+k3KVbM8XeWBojOgggtTSEMLcU1y+/N7R9zs6A5Qt3kjxIRtHd5U8rA53xByRSJVVfgI2IAS411nDHHtyHeriSYfLBW/k8/1CXIeaL42GZUId82f2olr3JAXXSWeLOVchRjYXx8ROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913389; c=relaxed/simple;
	bh=YSnkVAoOrBbPmRqat+kAffrtxCW463tFUuzW9G14zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oM5FLs2Y6Zhfbk5nJ/MbBSQMbUNoppFk9Gg2aYh2VwxkzKKxek949kVMdxVtZPk9QuD1KQi61Sc2PdacwJc9JiR585YSYluvNonN5Ns7ekG2ApsmovrGx6ggQkS5qY0m77ZtGHdmxhiIpZfsulqwVyIu5QaWhV8u22K73SEWX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auVjDXBN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auVjDXBN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4602e2a0372so2865359f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913386; x=1781518186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDq94AE2COVyqj0eDLL5JsdTWnDOBQADgtFT6pcEChc=;
        b=auVjDXBN8jcA6GffxSwe74Mh1iTjnwjp0IuujFguXEoPhuiuLwEW9JnQwTDv7UBDyd
         nIZ4jdX+JHXFgPgE7Raaa8Jh6om5QhGuXie7Bms+4OwTyPicippLfmr0ZmRXc/bZCEso
         Krq8A9Jb+hMPcPy2kvFN/z96OTL9emh/AP5Nhl8ttsJgtVje2Rz2t9pty/sxKOTkeXIq
         R/dHnlOcgCtgK/ZLx9+s9i1dZ5ewTC62VMPzf1CJ7uqvlDBYXlJ8e0yQKZeAkdeoTlvX
         Ah2wh7HcqNjT6bLTGCphWxUuSgFHGFjMA/mCyePqt0zPN54tcjllFsSLZHohgXKuk5A6
         0XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913386; x=1781518186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDq94AE2COVyqj0eDLL5JsdTWnDOBQADgtFT6pcEChc=;
        b=AjW8ABBRZAo9sDat63OMyW+tgUhrFMhsW3fP8Myj5OLJ14DHdttTw+PlI9FHxKRkYE
         7EnZtE8y6Oez4Y7gWHIDIyNXHs8cFuVSzlq14ITHUw7UadcZlfPUxph3d7/bx24LBizK
         JH2SoFNY62D2mi9sVXAwyRLOm8AQhJt41XPQcd9x3fsHTjxdTqM6B8xXUMhyPLsmg7wJ
         iBgqksw74772O1HTKgArMZc8NMndHCWrOMPKiGx+e1Bh8o9FIz0D55YudRVhkAOuJwtj
         Fc9neSTGmvIK58ECVppPui2KV1ohHAiEfiVDDIiRx5S6l62kRuBbZ9xn/LZKyLgryGyS
         n1jg==
X-Forwarded-Encrypted: i=1; AFNElJ9IQE8m981COIZQ494SU2a2xCxkBf6XcLyL08UnG6CNJyJa1/FDDdl8UoBwIXPbc+TFQm8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUDgCQdpN5e05Iz+4Kr9fUwXSttw5NPD7mlyfiZ/lcjSW/XAD/
	r55b2j0ZMWaF07teXDunz2M9ClleXGaJnbPGUpeOmmcsEUVsaPqp4Ya0KukRQQ==
X-Gm-Gg: Acq92OH/y4eWg2jBpJgr0v3m7tvoaMthg8ZJH8DfJd9PhEHCeYWI+t63G9+2DYY8JUU
	mQwDiKR/j1ayKRC5sK4J5aT4G/rmDBRUq1oUhTnse2/7UBzYX9CiA3bRFAF++ni5VjoA4HppyOk
	aq+vwsSi/XE/aL6vTnYyuaxl0s2x8FNZTaR40RfSg8nWHN3NWwAzwo9N5kMoCjBDS/LnO9id1f4
	mnSDepEkMLJbRf0dxpPFq/L+lZE2za/Y5u7MTMMmJUW758FGpCvYqPq1lLvPD2UFe4VQgp5TvcE
	Z90/VEgg9XzbjTiWOyR+/e35mFRYrb1GIsgiBL697q+r+vlpt4IJL+L4NWizY/DuO6Hc1amBJ/D
	GaQ5zudbB4LTF7DPTfuixVQAaiJRmfSWodysssvSUbXBQdF5s9eWIW4gXItNMc1BRCa4UofXx+p
	U1RcZHrqu2Q0BsyuzJXfET7bHo2DIFRHLANOk9mI1BAc/V7v+71RaNQ1Evu4JKEUI/F52VaXrqU
	LbLkQwob07vUj3HWtrQkDwpvP1jFqqHDjQ6Z54fbflo03hc
X-Received: by 2002:a5d:58f8:0:b0:460:42c:1133 with SMTP id ffacd0b85a97d-46030510ae2mr17045022f8f.14.1780913385911;
        Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
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
Subject: [PATCH v4 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Mon,  8 Jun 2026 12:09:26 +0200
Message-ID: <4159f23a5a3e52edb49964b7b3dbdc7ff4b83f50.1780912893.git.stefano.r@variscite.com>
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

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f27ba602c743..bac3de6e1530 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -306,6 +321,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

