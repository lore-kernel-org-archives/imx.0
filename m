Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF793C2B92
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913384; cv=none; b=TXiFUQXOlz+4M5hNob4DVyZyyxGAwMrCgiNt3IFfK4hLNyWz0x21D5ABZO8fK5He8PnsZIWuXZpMIMh/iDqgBBQIVWYWuZzi6wb81W24So7z/M1su1TRmkM9UY1aoKFxSQEwZoeilEjnFozpvM+PpHV59KO8mpuauaDPZJBLeqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913384; c=relaxed/simple;
	bh=CbsFlDNtFpz6GIRTFluFtkzC94Ozj0Tz3dlAQs/dCJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYFf/DwpxOvb3mM7qoVwcYMVEwvwcVZdw+7TAGKXODf4BcK5gZYrpIDy2xSeiMaIXfklPA1WxA6k2EuUXAfK1S2skDHdl0uF+BHRh10MzjP1bf9q/0PNy09HwMp66BeeM40Pg4Ngthw0ifr78bPc4ilKS9Sy7WqwGaaYne2Rqzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8G4QQn8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8G4QQn8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso31771365e9.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913381; x=1781518181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJZ2SsrLyYdhpaIk7NOSs9hYatpYCTJ+2tcOe2ZTmuE=;
        b=A8G4QQn8MPoRal0gXiPRJdyJ8QMQbbo7B4oziTIOJ2SudHaTxAIL2rVttyV+HDhMr9
         pogauXmr4wTm9hWNjefm+C1N+Cj3qc+Sm1ZBNUvMxMlmKZuvnTEUfHYB32zV2gashGhx
         QOnEjGYdGzhK0m5B7mnc21W+SGDBqcS13wq+8dabv5AL+y3X1ljpCk1z6jOIE2UCI9TM
         oJa7J7j3aUhFkp1zCf2a5VXyYA6ROs0JoFxojHT3wVGQ85t7KyRpP+dWjGAECRO0DyEH
         6p3zYdmQLZLCs0nAb/BJWgcoWbGroGSkl4kONWv+kLITn+IKIewUtvXo+SHnS/rx8HU0
         9VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913381; x=1781518181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJZ2SsrLyYdhpaIk7NOSs9hYatpYCTJ+2tcOe2ZTmuE=;
        b=stdAqRKu45F8LYeFAg7qMlKrB5zuSEwpQe4vygYe+lPIBddgN3BTt0LNUvFxU2cHmH
         uYBsAFfwFx3GsOT5yemReFG5C++EWmpp0YWzqXzxBvq4/CW1CgLkiay4Hun2Wqw9zHIZ
         CJKt7ODF9HJlB7XCveEwu+W5WLnf5kUUrn27J/2VgZJo/irHgiTylXlnnDi1+yICgUVN
         j8V9F+qhhsOWgHo8yDrKKIr8BaOiBeLADkc2MS/+1aN0/a86MzaAA8kQj/z86tmQMw6N
         b/KdL6SK7Ja05jCaEZWoLzh1sZ5Pm8mppXQYS1acU/DQBRHNg3Hyj31AKa96LMEy5JrP
         LZUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wZpLkF0yg6R6MokPA0ILj28Ke/VetyP13rIpFUhnZzFV0pKWSqIjG+hQW3PaIZ1/Dxcs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh8C6eV/ll/yQXH7vNYZpnJOzZ0v5Vel6f7rVNN18LZOf+d0ab
	I5z8164ZXLkTXkK/lnu3pAtr10wVx5/CsAc+rbkd0Vs0H2ZoDCGRSi4/
X-Gm-Gg: Acq92OFHE1ZBq2RannLQ+N4rOPmzkD0wnQ06hy5Dl8D396dUk3MrUkbm1FfnzhY8EUq
	sB8l0Bu9wAXg2yEN4NqMVJYw4T9+irqUSt6woN3qncXdvD91iQTSr7DjUA6qKDWS7PcILZKlPBO
	UvGfCQpIIgALW3JBW1hbgwDmczOMpL2ip0gFF68FSXNJYT4mtm8xFoCU/CbwAO8SodFhTeP2ahC
	YQHXCqNh6Q1ODqUSaPVf2Z8nrBWxn+pcTcdUUFPzkr108TkIsgbC9ahux63ZsRchs+ULNrU96G/
	aVuVxjP9rP6unV4gWrinNls5YWOSfHJD8FH/SB3vlj8Pgsa1IkwyPeMhDFx7Fl5uZ6uvHMtNvns
	UjneRK18OR8svNNXePITEvmJRYbQbvTUCrDBIPiRxfl8mmzdr8I6O1U4OvqULm0epJLORfLhj6T
	qPNAiYrt5dVh/vYAovnwYmMUriIAcBx0NPE4S9D50apUcZBShKe3p/gUdriWAB2JUcYBIup807k
	FbdOpMUt19D10F3ID5HlShV8WvhX9dx1lJH/6m6ON/S8g9N
X-Received: by 2002:a05:600c:8b70:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490c25c20e0mr231115895e9.24.1780913380888;
        Mon, 08 Jun 2026 03:09:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:40 -0700 (PDT)
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
Subject: [PATCH v4 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Mon,  8 Jun 2026 12:09:22 +0200
Message-ID: <d940e6d16047eefae56c866ff619fe952bbb89e9.1780912893.git.stefano.r@variscite.com>
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

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e9fcc491e5b2..7b839efdbcbc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

