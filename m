Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384E43D4F6
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488004; cv=none; b=ahm3SEScjEz/At5g+mOV3/anFqwjlpf9roGlC/5zigc9S3wGTSvRQ8yYfGEYlL8O/lPw4k9PJCA1zw4LbJ6UTdkzs9R3sO8isUeM5PYxNnIkVuGfDQeHXVdHMivAoSZSTbzI5TyXMfeEMlYdjfkp4kR7MlQhjY3tJLnyMBwhy/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488004; c=relaxed/simple;
	bh=SKVKVQvWyYO2FnYxKoN1QjxhOZrsgJI0bms12zf8FmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6FC4hoKZKFhx8MAtY1dbD9hMWvcazp21AIi1gbW1wHemVRwVqwZjRVAGMIYNzQ9dk4BiEeAONPl5D0n2vl5SAzBpyqYBE7i1PC2Fp8GWxRiFpSZNzO1dtLRNFMBq9+pE/Zdp0l4AhTud1Oq/bjrFJe4+TNVcoJq7CtqJIA5PDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiU76aWC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiU76aWC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ee6d32402so3604049f8f.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488001; x=1781092801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tO3scwQLDILDFlQjuU89g4Kx7wsmtUF5t3cLtUVDts=;
        b=AiU76aWCHyBErf+Q/u7eQr9sIXBYvJ5xWGMblmxiB0X/KoH99qcxeXWGGTK3OjqPAL
         e9IdjToRhZzIS9ChOiEuG5jqHjztmkyekEUdkJ6Z/Ez4cI6lHih17LB1GliHWjPXKFse
         kFbLZmF2v1PMeEmibsxLkz5U8EXIXZGVl0/m06jy+vFqsJHuLoUWyso8D8g5gRQv7g2b
         TQtUiFI9uXh7CcNb6PF5SfKFSiJqXVfZzfxMrv0/BCcS3ThcIZ5IgUS2Lw5pj7+DuZ0B
         zLgKd1COienT4llw2ToQaVKgZasEfIACOJeKGMEctjqNcTMKsMfo5N2mJJiuLz4CejqO
         0aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488001; x=1781092801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tO3scwQLDILDFlQjuU89g4Kx7wsmtUF5t3cLtUVDts=;
        b=G+kIsdMj+MeWQ0qgVCyfmV7mysehnIsNaWhdBOXmkI0Tr0TBEJoxRZtktxcpV+Uo1I
         8S1FML/kPH6Re7UEcbFEdVis9NQUZLZ5F1S4EceZWGlbYNB6mShG67OXA58TUxXgtR8x
         zBUPR/lNug+ho2ufIQNVreAT2DJcwY04PcMfupYeUHKRubqjMfCcVUQ3KA2CVDIB2gF9
         k9tLIu4OVPT6XK+eKIEYDrIAnJ6mQ/NXCzB0VoUSM/8Vkb3ZyzXDPMW4dhOfSwBWDwnT
         ZQo3J2it7eQ5YhQE98cDoIfLDUfh6Ww3ZgeVFSv3rSBMQavCt/phiJdX8YPAto8c1UMJ
         UEJA==
X-Forwarded-Encrypted: i=1; AFNElJ/QTpc0WB96E6f1FHQVLHitl1KGVwjzbXf4x39ONstURiln678783MzWdJwBSMRzSoolKU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq/i7d44ys6bcr6KqTEpdmY4y/tdq75hoKj5LK8oiKCGGSWkL2
	vBadJAeSyHGt8+vWRkr1cQMWwvq1QTxrUOAvzGs7MrMSEbJzyod80yxD
X-Gm-Gg: Acq92OHda517uJ0mYGtgflqYKcdwuu+AEEY/Tp/vHWOzAT1Q3V7tLuzlfDEXBEfO6jI
	tP9EYD8/kkcZ5TfYSnEkoyOxweAVbqT/Esg15KVFcn7IIK/ZauL+D1CX31TFZscDvrHI8OSMlpc
	aWz3ZqYjv1Jy/X/MrgpVjr+vL/NHKHHqkNUvoLMK6wi23DpYoMoqPsaixZeE1Ic8w8kHlyCmoX2
	5E2/+0aVsEMwAYNnFYST5//uDKHoWmCFnasqPb3cRe2VgTHiPw7oX+fnhEU478X3Y9joRImDzsE
	U2AnRfZOBIYYQ0s7HdfAYPbxkbuc8VxV88Y8pthLT4OKWaCnupGlnPtwNGR6U1voMjQYB8NO2c3
	J9EHPq5eoi5mjpUZBKQLv3/Cn4HEuKN/RGs76skbx70V6zH3ZYxuoALfJZxmQFXrjBhzahWIAHv
	vrrZl0Atg+/OgOCXkXmAAkfiiqnwRRlYmO3yL7XvYLcKKlxRNrXxEjn+dVTqspV85PhT7gjjnzC
	UPtxpVxHSLZcoUEOI/8ZCdLYxA1WtexKYSZi7M+idfe4uiX
X-Received: by 2002:a5d:4e05:0:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-460217bbdbdmr3322115f8f.15.1780488001203;
        Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:00 -0700 (PDT)
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
Subject: [PATCH v1 01/12] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 13:55:39 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

