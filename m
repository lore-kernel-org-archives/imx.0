Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7162DECA8
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982884; cv=none; b=kLE4fKsb3LLjoriv2zN844O/bNlo8HpXRrrHZqSQNOzOd50qPRWXQnLa8c5P6502jhkKUYFlx/ckc8aCx3oBxQVYP5d3V1cwl4rFlEtpeII2mvJG8n9Mg5fez3hBW4qMY+0fdrvsNiqUU+nwNRc35xcHPbcqncbT1a4hrW5pDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982884; c=relaxed/simple;
	bh=s5n1RdnAVao4nvr2l2RuxKi9utEkFRNfhVwnY8bc6fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7mUs6udqXMSiUzgPL104F2eAGXFftAA382krH0JamiW/gJ1Bpjjwo5mkZ6qNIa03n8ioUtW/GpW5Bfxp1wcSY1nwwO98h/DnlsDZFhdymbjD5rXD+hpYbGDEY27qjJpdZURlY9/RcVFRIlAoDc078daGPVtFow5lluMce8QTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWH8tkiy; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWH8tkiy"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so767693366b.2
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751982881; x=1752587681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q39+rmVt4A2B3V+dGS36sBW8bBHj4CY5V2BRog5QBms=;
        b=eWH8tkiy9eyXBka0RAx4d2mqKJ++yDUdOzcnVRzdyaBNI9ZEpXZLQsiM9CgRHXs6Oe
         98A1KTeTvJY2xzMkffw+vIDvYtjulHOeDtJSmhMvVKjkJMivbHmfLKTfnKPrz9SClTKN
         6wZshKN7RGgYAqUMMHKfY8JqMR45FN0EbNiUfBXjLvsCUYzVVx7argrMY3Gvc2KEf1+P
         o62mXLcSdmeEJagdoHgMNpTJ/NF1JLrEWoJoDZSBTpXLaJrZczL1LaxSJHHkfn18useR
         LR+fMeJIEXz6cdoq5k5qcKWLyDZ7MQ1vMwo8rr9Ov5PPQYOHQoYGNe1iNJ2UkA7FnsJ0
         JQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982881; x=1752587681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q39+rmVt4A2B3V+dGS36sBW8bBHj4CY5V2BRog5QBms=;
        b=xFlAZw8wCZPtwvvfHa1rl+3paDiwrbmlKAlsBcPNBh8kh4KAqxTyvXscOUhN68CHRb
         UQLD4v0S39o01PvAmT7ratLbAZtX9bNOVuWLiApqK6LEfzaynhNd1GZm6aFyMCjYhQy5
         /8EF3tFA9nSbDMTth73LIVmb5m2wXG5mJ8n1KF9WjnIz3Gu4Adq+WBP/NdXRH9KKD7mw
         0G/RpNmaD55YqrHcPagd3sI4Bayjs8tmAjSCAof3vTK7nj4Hk+RtHKU+J7709vOEFeQf
         0gC9UKl9KaxmU86mmnzKoAHisdX1HTHCpGDHwq05lVIrqzGQ4jdVf6AXa9WBLYUQbU2F
         jyKA==
X-Forwarded-Encrypted: i=1; AJvYcCVxnToUvm9ibv0N7tlocYD0g0bqMbAg6mKDGkmJPv4RgTW0jJbvtxB+BwbR0n5JsAmnuSI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLb+SYzgyliu3RGY8TTtOlmIHRn4rvVWYqyZT1EiRTVXFGKdxe
	x57pxnH94P2xAJubkPCC9Zg6CWoOwx/VZ17jHSJAgTizyXC47KDeyIey9Rzj8Q==
X-Gm-Gg: ASbGncs7EjuFm0BBfpnpflzh4fk0pQ376S84uu5S0cP/93wy9tOP0r0Qf4/coTz/TuP
	ZpXS0bU3ivTNgxO/h7A3c6okOdISyHcfP+BqSK6jumqJrUs7tG4Ijn4N2aHpIT4VYRXmBKvWjN/
	ar92G4cjqL+cNNYrdu+Nlggdg7/ZOmKl1A8wosypyaXhWIiuoc/vTcO4hcETth5weYkDKnaRNuy
	+ypSRzVtPvi5kL4J9tBDNsQTNtwxxLA71OlEvfgVBhhxWd8LSB6YBt5q0zMqgd8CThFU5grZWmh
	6+UkdV2RR3yYBeHp1a5suoBott2A1I+/dvaFc10LkSHXeDamUdsoFkOQuU5aN5V1hYVTntOrDbU
	CiszFk32yiPaYVoL8LjJ/jI3GH7D2RzdT7474CD+mnUB2uaWj3zY5eqE9coUADmPs
X-Google-Smtp-Source: AGHT+IEwKuGBUV6A52zfoY52+Yo41jVFUHAwMCF4D285FO0GiN1roY7nL5hI5r4cCSQtqUs421gD9g==
X-Received: by 2002:a17:906:f5a7:b0:ae3:f16e:4863 with SMTP id a640c23a62f3a-ae3fe64e8e6mr1665718566b.1.1751982880709;
        Tue, 08 Jul 2025 06:54:40 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac6641sm910431066b.99.2025.07.08.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:54:40 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-toradex-smarc: fix lvds dsi mux gpio
Date: Tue,  8 Jul 2025 15:51:41 +0200
Message-ID: <20250708135300.2855155-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250708135300.2855155-1-max.oss.09@gmail.com>
References: <20250708135300.2855155-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

The MUX which either outputs DSI or 2nd channel LVDS signals is part of
the SoM. Move the pinmuxing of the GPIO used for controlling the MUX
to the SoM dtsi file.

Fixes: 97dc91c04558 ("arm64: dts: freescale: add Toradex SMARC iMX8MP")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 5 -----
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi    | 2 ++
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 55b8c5c14fb4..d5fa9a8d414e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -102,11 +102,6 @@ &gpio1 {
 		    <&pinctrl_gpio13>;
 };
 
-&gpio3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lvds_dsi_sel>;
-};
-
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_gpio6>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 22f6daabdb90..11fd5360ab90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -320,6 +320,8 @@ &gpio2 {
 };
 
 &gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lvds_dsi_sel>;
 	gpio-line-names = "ETH_0_INT#", /* 0 */
 			  "SLEEP#",
 			  "",
-- 
2.42.0

