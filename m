Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E3E16132E
	for <imx@lists.linux.dev>; Mon, 27 May 2024 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825858; cv=none; b=oYA8dq2Zb1LPX5yR5eXEPvMW/CwJMgxps9Hx0N3ENbt3GNUEaJoT/etWD3bxPyiPSbLOc63oHto9kupZHqXrMdf6CzoDkiM/9+Whsi6EpkjGIF9m7M+IGhWLh+W9swCV5AMs5pFVy4jlG5DtWcade8ip/UjcAVPbNX+hkS/9+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825858; c=relaxed/simple;
	bh=L+gu2PKI59dIpxrARh9V0V6BqbRaGAiOSnYT14Qdn+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPcsZRLwBM7EoptYeVXZU/jSWIbBIeQV8o4+hIIi78Vx3GdUNmDA6jp2pqOwlk8AdL/kNCasTJX1XMMS/FR/7938nuj70W5cCvghKnIJFBOFKQaP/QGvKrS6EvmZ2SXlhVvF8pend9wy7x4FgrF5vJRooiGazSNwE4M/yZaYaQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COgZ4vRd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COgZ4vRd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4202ca70270so63495265e9.3
        for <imx@lists.linux.dev>; Mon, 27 May 2024 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716825856; x=1717430656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beAo2V97IysZU2zPgVb+0hz2tpF1/iEIksP9hejwZuk=;
        b=COgZ4vRdHHarGN9T9wRTwud5kYlSQtUD6GEZWGdkfQl6herG3xY8gldKNWU/0fAdFS
         ecl1DCmSJuMVrPvHfwnWvRCmszMAJ7WZiPrHlRSgaDIdJPrrV7Q5YVgXAw7Izdeijp7a
         J1w1ZkbaCCv/LEUfjMQ1+dj0+qWewxW67pU9a4NIpIBYqBHA64zSGblO7g1bi0e+9nwh
         R4d8e7TFWkHzk/yhc3xuv4Ay4VScLf2T7q6I1CRuDNDVa/ZLXGUEN+ZZmfYXBfgK36cS
         O4aSRkM5UMH50n3ldvgB572g9FiMOA5iz7wcTMcd2EHy4lXX+EcDeeQRsV+OJzOsLaGZ
         NTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716825856; x=1717430656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beAo2V97IysZU2zPgVb+0hz2tpF1/iEIksP9hejwZuk=;
        b=Iq93A0X2MJDObz7GBTdxl2rSGEapG0p8IXK9eUfhm7MIRWJB8VOJjojbar6Oe3q830
         bDWFeGVWx0aec35p6b4yyFk03nbSJlLAXc4yHB+o/p6ug+D3oBpPXO0jA5g8DTx2iuCK
         Y5yQUHfcjZ1Rlej+PpqhG+HGA/SRihnBftmb+WLDcPc5il7E8KqIsDu1OVSI5HEVr1u2
         p69VjBKpGHhMlgJ7ZubY18PZd0GiMncPG04e7eRPwacBQFody1Nno9DiVaGg0ncMJaBL
         8+PkBgtyQYTkLsOM2dIlRZJ95pA7Qt/TH1HTFbE7hy5nAdcE1i10s8egpn3XU99CIAOp
         NSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgEpprqbO0KqcSFTsO9PKCNbiiSrmCeRk6XKjfwAnKksaYAPm/Oy/SLV7p+dI36GXryNJ/7jGuNFz39cFCP7KOAal0
X-Gm-Message-State: AOJu0YwICDT5y9mXE8i/NiptQZnwqH4fPXz9zAy9N0QVxFLDAifFB3xZ
	U5WQgikEnUE1KbhidFALz5qg6h/foep6LQwycjjIXgdQOyCaF9M7
X-Google-Smtp-Source: AGHT+IHV+7uj3oNwhQkFI8e8byFtEGjCoG+5dXKJN7KLcse27lqAdteZi9rMrKfCv6MfKNFAZTeWNw==
X-Received: by 2002:a5d:6109:0:b0:354:c2c3:a319 with SMTP id ffacd0b85a97d-3552fe17d7fmr8085671f8f.61.1716825855678;
        Mon, 27 May 2024 09:04:15 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579f96519sm9349394f8f.26.2024.05.27.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:04:15 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mm-verdin: don't limit i2c2 max. clock
Date: Mon, 27 May 2024 18:03:45 +0200
Message-ID: <20240527160359.1965512-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240527160359.1965512-1-max.oss.09@gmail.com>
References: <20240527160359.1965512-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Verdin I2C2 may be used to access other I2C devices apart from serving
as an HDMI DDC channel.
Thus do not limit the used I2C clock frequency to 10kHz in the module
specific device tree part.
If an overlay configures i2c2 as DDC the overlay is also responsible
to cope with an appropriate I2C clock.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4768b05fd765..82bbcec525d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -547,7 +547,7 @@ eeprom@50 {
 
 /* Verdin I2C_2_DSI */
 &i2c2 {
-	clock-frequency = <10000>;
+	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	pinctrl-1 = <&pinctrl_i2c2_gpio>;
-- 
2.42.0

