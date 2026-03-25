Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B33D16EA
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439738; cv=none; b=sOU2b6rqu5veaS4D3AY0+5AJuilTutz/bGxoo4qnF/hQwZX8P3JkAte0OirJ5ZAOr8KwSrMCA4N3AmXU0w5tpCdIGplktBYo7zXs4aSYr5H/WM79B9JNZJ4oKIkw0MnPK1XyHfo4yYLYes528xOO16NWEGKsAeseWUta0RgRuVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439738; c=relaxed/simple;
	bh=tr97VAsx+STGWIgq9u0NL64qefYSNwCZv34gxQAE/Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdhvU/nJMfYc3a6PkP8v6RZ52QDiybawKLh2shKooHtxKWDekG9xsmO4mBsYMIBwV2DU+y6b7dQ/TZbivkKxRF8UcH4kQaIFSoStjQdrBpeqvQPRTwYlospSDQhfHJdfVtJGt8X+kphELaxSx5LxOUmuKEdiHomfW0Ez2UWW9dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoUJsJOd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoUJsJOd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486ff201041so44336345e9.1
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439734; x=1775044534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=;
        b=XoUJsJOdrtB+g75MTQyI967ZuGUHzTjCME6IUgSbogP4aEEY1QEZzZmUUrOjm41fK/
         y8WWNTJvWC6jPBX9DzV+tPaeTEvKQ1BbzfwQ4STzm4aQH5ktsBUbKYrzmmhOBh5OyiTO
         Y8D9ZljN5v2F+tJXzYjH2zjsQU+Dz7H70o+6ef+OWaQ94jtVnJJ+R+j1EAFL6wrR7MnP
         oBHQWkUAVR1bdfroJdG5dkRW/bTqMvvechmFqmYrjG6fZVoBPZ+yoPb0Cb5+ETrfYIc0
         hlxIqeSO9dnlZMqMnz3qxJPHpxEvHcmq9+rqn0leW5NeGu8iiApyBN+nnSzYDyMvUQqs
         aYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439734; x=1775044534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=;
        b=AkmO7N9rv6snCpd4VFZXRumcR8RMNcsebu45hmoi4Ins0DXhyZATioGhabV8Pqmn9J
         yyLJqB8taO7HUNzc8c3yvT3xITr9OdJwua90nut/G0vsGRFHSTQfWH26k+dCh82uxEv1
         FyMshsyHquy2BOS2sc6nKI60oSwzPu91/IZOZA3fexCYOr/6zKyD+t/eL6opwocf6sPF
         3FR3Gv/QqgRG3FJ/De+IKrGkjAiJ+2zyUDXwYTlVM5T2q8KwE52dm1cfUX0nBqOT9wIx
         4pr//MFCBjVMYv22BW80FO6l8RZzFA+4SCxDXIADhD8oygKszCRjXxw7050zDn8R2+Ed
         WqDg==
X-Forwarded-Encrypted: i=1; AJvYcCW5GOAafQ5Lp2sv85RLoMyrEe87mgr81WK70saki52rM1fXN1HYYy9OHjF76e6n3dyQ5PQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/REnrOOZgQzSwPHnpuudCEKRRFOHBy5G+tCOJrwU+64eW5pD4
	tbkyQy0/8JT74c2uajSQ2VECxNw0jpfPaS1GrYXR37KAQjmlXVLBAQI3
X-Gm-Gg: ATEYQzxIM4maJmBG1J2zih3FeYDjhG589qbgIdn9cb8JB3PjPtwlMnEbD7TZH1EZGBN
	ELjKXUgS44hiTDy3BADQTOg3oQUJuDUCzTLhAHW2vs4LIa/3PDCS5fzDo/TzFSoBecO8C8PH7m7
	brF7iMHr1p27LxgzkyQMEzQjOBdM54yCqxx5x80vykHUhQdOCAQMb/miPRrIM+4qok1zqxkvTZc
	HCBnFGjcW7+6ynyFH7IjeKjA1YPmFL7QzgFtIBfrhu2jNpkmDHYNGt/N04wVe40/wTWLJp9PeVE
	QtmliNVA+fKibFm6ZrRE4yizS/lLwTh6/DXWlP80HeT3549NQoqcxToffN88IipL+Iu5xdSKu+M
	GmRpUSru4dI/zCWVnK6Nvey0jvFiaMTMDaojf4nF3O0Pd39sTYF0NHOqz5w3IdCXgZ8ndgd609I
	EWmtjEfADMbFlV2eKsYrgJdAGXK+zsMo4PiMU1iJjREjX1A33TmiMzcmImQtSL5DAmrlW7r/DzH
	RP/c6oh1udV89MJ+31WNmDQH0/VsXpgRJV43kEYyJShiGUUfLMaqycNdlQPN6Jr1PpwqTo6mP86
	/TCKKRX4FpLxwQzrSAz4
X-Received: by 2002:a05:600c:3b12:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-48715fc3286mr51267335e9.1.1774439733479;
        Wed, 25 Mar 2026 04:55:33 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c44bfsm147878035e9.9.2026.03.25.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:55:32 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
Date: Wed, 25 Mar 2026 12:55:11 +0100
Message-ID: <20260325115513.707914-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
JTAG. The WIFI_UART_EN signal is used to select between these
two functions.

Configure the signal as gpio-hog and drive it high to select the UART
function by default. Add a label to override the hog in derived
device trees.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a90edefc5197..29e3f5bf867b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -451,6 +451,13 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"SMARC_SDIO_WP";
+
+		wifi_uart_en: wifi-uart-en-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			line-name = "WIFI_UART_EN";
+			output-high;
+		};
 	};
 
 	embedded-controller@28 {
-- 
2.43.0

