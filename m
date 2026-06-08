Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6173D3CF0
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929692; cv=none; b=mXacK7bsjmYtmyo8dlB9Uo5jmUPQ5Qqv8OVS0zSlD9Pj8+g8a6XJmH0RkJgKp6G5pnTbxN6ua7xSVWmVELWnSdUgexGCorhFDPxlDFuIYPOgA9kQhWcKa7Zbd25pVxw/9jvsvgNf8O5aha/9Hinl2C4f1BA7Mb1RY7qhQCPC/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929692; c=relaxed/simple;
	bh=wrgqTfxN1F3zY1MtlVaY5Ac6wpqX6/a4+r0hTloIR3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTuCSuboxx8qL1AW396sHJ91Kvx4y5uD6YqIUvx4WCTkW1IwkA/49B9ifL638MJBdQjDfPwGGZ+mFsV1ZSpMKBywbskVIFO7TwX333FfBQqFDxPsUPe8FEEWeXQHKMpUKxsxtw0ycMb0icNcaaMKg5BV4t19qlnYwyEpHrCMWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1tNc8HD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1tNc8HD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eec22fab7so2232376f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929689; x=1781534489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm/AWXQd/K6rTr19dM+wodz40FWVmC3MrTz5s7TrMzM=;
        b=D1tNc8HDSebz0EHJTBjs+sP0F1qDgMvNMiWdp6825Za1DgIY2ApvNT6BHRblQYOxOL
         8viDl5UCjDFHqRTYbagNz+Hb4nxjmRfHj3xXPn/zkvBicyN609DsT9Nr69YwllWTSakT
         +T1eF+wWzoZGE4loSTRf/IRRaxJhPNo3BCizqBv3sjLnEOlqYq2MAI93BOxGPequENoh
         mQruqaCxnTGPr/FdYVBq0DBtX5jUNQmvJc6++vFu5saFzq/zIpJWAO5gWPL75HMd4xFI
         G+DVFeKxZ3Zo1WOLTfxeTH7IGqIhJXmHNpjPd2ugiEBE1H6hd3cq83d9xmqRvFdBh/A2
         5HeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929689; x=1781534489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lm/AWXQd/K6rTr19dM+wodz40FWVmC3MrTz5s7TrMzM=;
        b=EAL1VkN1YpTVPuX/JAbKxllNHrTUQW+Jy9N18fBxPlYQbDxeAtDrfkitB1IaANgtYA
         Ux0LQIi+RTJS/g3/sf83b47mUOaVEEcuz9/cWA8BmNgR2g+d92k40RqFXiyzqTu/4NsZ
         FCH7HXJjOU4IbUHnZ4WCSr9SlnP+UXilM98yWeY4IDAmyy1+crTYk2/bq9/S9Ue4K4fI
         FtwdjnhHV0NmJkRFlDXwtyW+4b5+WCo9VMBwenWMJZBR4meQez4FzMf/ev8EB6gCtTcs
         HzdVOOvTjFFPtrfpFsm9WO/k3DjHlY2r4GvN0DRjvP5NY8xBlZu//DvM3yh5DZwl6ZPM
         Nr4A==
X-Forwarded-Encrypted: i=1; AFNElJ9iphWMQj1LDnyCuhj9KhAkNmuX0xUtrgnWG1gegLAIMAaC29ZZtz4ZOPfDiYp55PY0ce0=@lists.linux.dev
X-Gm-Message-State: AOJu0YygBCwakVMFf/wjUZm6xFdtXRsbnKc0LJSA6ynMsAH6Jt4paPbI
	gom5nk19yFKnSsSS0KNYHyHC5cwj9r1d9W4vJZ3qpNUnvbC9rwKe1qQ7
X-Gm-Gg: Acq92OFueNtbdm2YFWBa0cVxsKoExICfsEbTAAvAsDanBrFysF12srGxLoFIbGqbWkq
	k7nwi/+o1mzGsKheXF0abfUo3yHZTEmgZpUGz8gc1deebU7hG/vce/MrBfdRhtPFQy0bNugzpwQ
	vvIju/4rmS0Z4QwNjC4R/VsF8Cqk0uiqqkjQckPfN8N2FwN0rtSpsl8oTopvHu0mT8JnriQpetZ
	TyCO3v24G4eM/GIbqXz1jBmCeaTHyZ4qR0DGeN7NKB2oqheucTiVGwcUqV/LVBbqByVXJdkFvqk
	BJEn48ZR2BQuG1EtH/O3RPm19kMCoh3M80323dWIyLI71tvsVkkX2XeZyto3JukFBqP9hAs5app
	2F+SE4WZ4kFeyUTsFuBSlxvtYriC1zswPYePAoylKiJ83IbEE2c/4FG2eX730TWYuYmDZa3Qx6/
	bUo74enV4va1O4w2vOtNmV2DiOihp2EQP6NdaWARaXMN9JOgShvNGYMysxPBJ0xF3VNZgBSRBDD
	LP5W0u0az+C83brPOKrNOwvj+pTGkzecu2kvBamLOpA/6uW
X-Received: by 2002:a05:6000:4810:b0:460:31d1:74de with SMTP id ffacd0b85a97d-46031d17543mr22898424f8f.10.1780929688812;
        Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
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
Subject: [PATCH v5 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Mon,  8 Jun 2026 16:41:06 +0200
Message-ID: <9999286d70381eb6637b3d1779197b6be0c8c6ab.1780929317.git.stefano.r@variscite.com>
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index cb3348aafa07..fdac4ceb4c19 100644
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

