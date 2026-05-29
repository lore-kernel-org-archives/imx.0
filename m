Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25F3314B7
	for <imx@lists.linux.dev>; Fri, 29 May 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062539; cv=none; b=naOEY0h+llHalTNbT8P3Qkp1hfQXiPJ2T1byZrARsD7Kn7yNuUeDhw/T37Pm3mpxenqvoNsEVEF88Dt/xhALRDx+A8JBlfftoXziKYJhMXJ/iuHGttmVcaGntoW4sA1AsWa5zyNbZczMfTlhcqJ0/5r4qHwzmZs43gpNLDP8h94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062539; c=relaxed/simple;
	bh=/lPWWE9B0ZByTLrH/vobSrqzpYZiQP1AwrRHGr/QMHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPwo1cF5eESayzXkg2KeWKcPcme0b+JKCuopi7pSGL13X+pKWWLiSeal/6mESinWdE6+iLIninGnZjOwFkm4Kj8Y5d8mQWEJ/TlCzUJzs5rIV9wa8JY/xChE5BM4D2ldULU7YeUSwgSdt5QNNs9S6PkV2mUIpPnqyQo7ueuRenM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZlsAJ89; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZlsAJ89"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49068493267so39903575e9.1
        for <imx@lists.linux.dev>; Fri, 29 May 2026 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062536; x=1780667336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMxhIukJleY41vOIZ+SD59yfY87aAB1ancR/PBsfkqk=;
        b=SZlsAJ89SffIh72qXyBIrJvqH+KHl1QvaOPCvyPa0oFv71sHizyP0n3XRro1gosd6Y
         X2WC913U9wpwxewxOhMiCvKiZ72R4vn7HHAHnCuc9liHQ9jPffEZjiGHB7q//lTajuHY
         TfXv0lKCYyLnAAezX0ZTXX+sMGs32hrEfiEheygxWzHKkzCsLpkUpiv1g3/b8Qdw9SMo
         6SeZWUuMLNJdBL5T4ANKTIXOnMcyfRfxu4kCbuIQntrl/7ZIDFAxafYJenrDzUF/6jHh
         vZripjSQ/Ve1tPQ00eR7F6jE9JBnbvGCDqf5CxxQLJfGvGzpEuJ0RJRP1XhnIwnuD7HT
         +aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062536; x=1780667336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMxhIukJleY41vOIZ+SD59yfY87aAB1ancR/PBsfkqk=;
        b=DebakvHlf3NrFsxKDN/ic49IUT+gigznkzfdahzrr0cVVGgy07zxsUDEtlk5wTaQAq
         weBAtl1QhIxuNFuEe8uP3XkG7xUEK0cxQ0MpAi2dnTy4MuXeLt+KEDuPfO5aiTSxnTPB
         Br/kN6pmeQogIjNFWIfTfAyEsYLsiAtwXpQwHuVBZFYqLwldVfVQw7bqX0V+vU10oR7d
         9EroYetkBwSz+vna1UlnRwtoPP2Ep41oKWHEdUcTPdLuMHWFsxLIr1G/RSTNlVMOYGEJ
         maskAO3Sw2DlS3DGEAzwgfRN1KO+YX9QspbgssRWLoAAPiWF8UvIRiJTw+tQmUmq7URG
         CF6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UJYgV4Ip5/cYQaahCg8R75LPrspKTSVFR+S3+33ET6V33ZAkiy7rLgHwBgopNuvaMq/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0WoLXrSgNF1T1O198OSuPHaq/dSTqwejMq2n2pkcYElUHvlWg
	0pRM8dTfBShj3wCdp9xE7JrgeXXrBW4nQhYac9SqBZhf04akj2gyxmpJ
X-Gm-Gg: Acq92OGvFC36bPVXgl5XLHmofpxIHChA6VPrS8abC7CzUW+VUdYFsQ6cF+ZTpxx5Cwh
	hIqGqQepaoBjcIOHA86zmjEcgf9OSuz53XF/iPWbetYfzq9gPkPgIIxMwCBfV/0obS+j2iQ1TY7
	79jYSzuS3MXbhKyJiRWxsYnMWwKMMrotrgc953+R4CSGpffEHLx3A0q/hwWl54IaKU2B3BJ+uvi
	5wsWI9DwznTz2299pRdNj50bTliJzqrOghz4YFSgv+vONptJhRSZGnoBWTayz9Ubc02RXgUlfHK
	sFvsA4CFGhp/IXKkG7bI7xUs1Eph249kMGNpWfHzyu6cFqBFeIRL2jVLw7fsgo8Bsan0aiVGNS/
	EM296pNsWssV/PD+HuBYDpKy/I8OWwyK4L5EVPXFrgQac+M2eJ1YFLjdeY4TQOWZEoOVtZc+NXi
	FO/3qNXwRfZjeSXqsykPX8loGMHFsIKp+JwIEnYMiDiqGy72zM/U3ylXOqXY7to1FScCB/RKSRo
	T0ysGZi4n3wmzwhu5/PV/ghaz0shxMOuW7qPY+kWg==
X-Received: by 2002:a05:600c:a012:b0:490:9d5b:d721 with SMTP id 5b1f17b1804b1-4909d5bd98emr48239965e9.16.1780062535369;
        Fri, 29 May 2026 06:48:55 -0700 (PDT)
Received: from GLaDOS.lan (93-55-225-230.ip265.fastwebnet.it. [93.55.225.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm20777125e9.9.2026.05.29.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:48:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL handling
Date: Fri, 29 May 2026 15:48:50 +0200
Message-ID: <20260529134850.22196-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
the Symphony carrier board.

The signal needs to be driven high on the i.MX91 variant to keep the
board in the expected display configuration. Move the handling of this
line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
the correct GPIO expander.

Fixes: b3292129dcef ("arm64: dts: imx91-var-som: Add support for Variscite Symphony board")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx91-var-som-symphony.dts     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
index ac9fed58357e..c1e6c9978275 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -97,13 +97,6 @@ reg_fec_phy: regulator-fec-phy {
 		regulator-always-on;
 	};
 
-	reg_rgb_sel: regulator-rgb-enable {
-		compatible = "regulator-fixed";
-		regulator-name = "RGBSEL";
-		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -258,7 +251,6 @@ pca6408: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
-		vcc-supply = <&reg_rgb_sel>;
 		wakeup-source;
 
 		tpm-enable-hog {
@@ -267,6 +259,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	/* USB Type-C Controller */
-- 
2.47.3

