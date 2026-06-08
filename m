Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C293DA5D6
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929698; cv=none; b=pPwmQzaKisaExL672fekUUuFRwauk2xOJMW9bqfqybQod+6gEa5DGNBpQ7wQfqmiXsKrLL6FU6Rh3lsdUObgx2KMvaz4/LY7PLXYGeeZ6q31PbXtrYV0TYttOE8bEvx4YATMobo1C6W6/qgYnc6lme0OrTAEJ80O0yXGc4YLhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929698; c=relaxed/simple;
	bh=pnVS6NpVgr5Udx8TT470FrkIwhtnGokApzckgFTyCtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg5yoOws6bNV7bPXTy+sTRoYU+yV5Y6h8K7Gfbd8+2D7ITv4kRrEeE7xAYNAn90+ivRuWmkznZkFYoQqos8FdopMml7h7ssgqjNrQkr0dTFgJp4K+S2UeyBKJe6tydp4IRkx8/IL2naGz8nYtPdECEAcVSX2x8DEbjRX8NTepFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxtTiP/Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxtTiP/Y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490af320e2aso49379435e9.2
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929695; x=1781534495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSdVweeeqpqUp22S7ae+ncZRontrBojNHEK/UDtT8bg=;
        b=qxtTiP/YBwsRjiaZ7XA3V6C4BHmdIW/coZwshPuZTmv+v9MbvhQISmWWyHhkR71Xr1
         PsCAK+M4hVLJVbrr7zjzEBYLO8g/emYI2ijC5fYP2KBYHmUyVo0iNpdSf9rP4NsbWcFO
         iFzDE5m0/Sr1xEVYJARxDK8rrCuIOJ4nu4aXC3CCHqEMg36LQTSo9jXvvMetGPZo02nJ
         EiPQihmq6oDAnIaNlbpANzzbL2ULf2vmfIwoUyXeRK7HLjx4zJKfJH09ZFRJGpks5AT6
         hElZnwHsU+mP1qUC7ns2PEYlN8nv55EkH3HdALaeWEcr1uRxsJLOb0bFzLzjNkZaJGMR
         3p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929695; x=1781534495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YSdVweeeqpqUp22S7ae+ncZRontrBojNHEK/UDtT8bg=;
        b=gmbqULSxYJHiCtfnjz/errlJb2BzXOu/BfPZQp5KFu8byDwqkFn+P5m1Xwj8+UCzXF
         jwZSyzoxHQTZXZwM7lTeh+0kEP4HCfbQ92Qx+q5OXcjJMad7cKC27LywVsGDNoB0Vqd1
         7X2PCoVA7U8smMvLzsmH+uXjWwOVCH3Qb30jVQYbmHy+GLd4zD7g4VGe+Jc5ba5kBNsu
         CUU3aT3fz2981+aiGp+4oZemn/AjW1vO5FIODe88dcEj99zdjEDJbnsjlOma6AAiBaaG
         0R5S3QJF5XRZ5tCt/U6Zw/5JKZhavy+Vbq7ozxlrvb1GT4oPYRb0gbI0RZnIbv/mGqSS
         Fa7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/IFs+KAR5CspTaTbuetBIkZtBZG/W0s6dKWtKiJLjRgJCulGxVqIYZDKoTzXnU7/cm80E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRGW5MpkAPja09WxpYql+5mXqwHK0yQ1aA8Stmro6RA1mkekBb
	ikiEiMcig4dW473yBodRJEQn/aTgnsIS9fEG90QnQv+h6Fo9IzDGxF4g
X-Gm-Gg: Acq92OEpCeRE7RDcK6KbXXR29Njwt2aDkB/KaetcSoIkS/3OhPtInnQ0VahtK+SM2p7
	76jXOIUZRXrXhjuWj9Hlxvbon+q6aTa0+IJoC6kc+xe3hA8fLv00YPYGrAwTV4OIDuyLLkIvxgM
	vDbWGv0JmhQfbV7PcHoixo4TXmPNVbltYshjd/77vKt6y2FaVD/8c9ITEYvwg1xDRafhtnDl/tI
	nM/0Nj2BH5i33ABP98IQ2YvdFg9lDFBOPyjYFyv7h1UaHl0CZ/KHx0BnHG0aMyDOJXGOmcDs/p3
	iIEm8kWuW7D7+3gvWE7wHbS3Nj0URtoEs+OLF5NBOqXRrYCW3wi3Zvk7ojtGMB9hdL9EpIZBxlG
	GPGA0jHOJ/T/7k70dhJAivPqJY5sLTRcPoY4PAXhlrEo1vGK/AqA1H+n74NK+tDVstFJCeMovbe
	cdHzfcUTjX0qzahQy5qb3CVAjbtL5VCCHITtJR1Hi/xUZPN109TnUv2v/ohmqXI3HbCQit+6Rqp
	EnfIvVLjMpgbxlRxV6Fj3mw+KKVzPRW7qB1WKEM0jaJlFc0
X-Received: by 2002:a05:600c:34cf:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490c25b1243mr281916035e9.12.1780929694545;
        Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
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
Subject: [PATCH v5 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Mon,  8 Jun 2026 16:41:12 +0200
Message-ID: <909c174cdbf73440be3ffab5a7a2a60343c99940.1780929317.git.stefano.r@variscite.com>
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

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

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

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7f5109bb4182..54cb5725c4bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -247,6 +247,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -400,6 +406,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

