Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FED2E719B
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557548; cv=none; b=qzeFsCmaRI7gRybV6v18mDcUD3ztiuzGPYwTK1xfO8Nz6x+nFCihue0xaWCKlr+04R/hE5nSqCon9F9VxPV1wIl4yjVbjs/atXboUPTtk/l30/cERq3QF/t/mvcNe6s9JiDNx9eefqpiczuTNAUkQ6hzdYsuwd59DkjcsIdiI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557548; c=relaxed/simple;
	bh=ytEuxidEeyGVWdHcSV0Cu7NXfhvzR67Ajz+zEcL/AU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVONVgKU9ewiKUSOBUWlcqxEsL3ztB4wvRZo2z/zY5n2TeLoKmPzD7bysG37LaoOZUzDghOOA1N/ArtYZIC3bUeoF6CfB7Gw93z63uGPSYXEkHGLpyl2wyqNMARlc8itKjl+I9QiWHdglGR7AIf3KKOniwxoU/w9lDBhmRf28Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI4LKlyo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI4LKlyo"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so308466a12.3
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557545; x=1762162345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23eUEQXgE/OVJfCXbnrki5PnT5McCVtuG+I3zbarJTQ=;
        b=eI4LKlyoConNyQvFzSYzCKPMSXahayi0EHkOSOVqKQGgc79MZ/BPmfhwhF0ykoeuge
         dpclkE9RuaglHIavbTeikV39jRwLr93iV3ggPIjH1l9Bow466IboqF9t3Q91oV3YxGIC
         /giTorMsK0Q6t5neBoB1vk5sdgi5SgIOU6I/3qOlsatT9OE9JEYOT91G0Xk9lSU6YfYJ
         BXw7ixcjqS0YcJtMhGOPQcv8GlsxxH315oSIT/82YJj97U/gGiDiW41vR4vvIbByepod
         x71j65Cdi5Ok9wQe7euc/Hams609OvTrjfgnrXYlf3rlezT3LJhRRgEpz4lpCIuU6nsy
         ou/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557545; x=1762162345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23eUEQXgE/OVJfCXbnrki5PnT5McCVtuG+I3zbarJTQ=;
        b=IhppmP8iCmfjLxts/G37hEj1RoH73qzh1WV+hMLf+gbGpA6OFzHQtTBBNw67A0DLQk
         5YKnRnKTLS3HRovMRHCIbR9JnJy75epUPOC8UhG0Grmcw6ZbwWoYJVeZViA6Uq10GtFH
         Gpzzy3j35CupwXJsBdRT7ds1V4feT7p+hqTwMc8jKbzrA0lUYY5Ll84czZ2rihDhi9Ue
         Gki9cX5IK3CN4bwz0c5H3yn7bcp03tBtUsncoeeKdA1Adiz8/ZRKeBYYcXJTsOnQqQk3
         Fs3ehje4hHn2X5Qq6DmtHoNy8oA1ZQO16d/n3DjIscJtKQyR3pRleUDOyuRi/J3tSj3a
         6OjA==
X-Forwarded-Encrypted: i=1; AJvYcCVxfFaAR3KFftsTyjoHZk93jZHnpbeixyHnVziOR/14NjChZJZ+jp6GHNIie5Txk2KPLqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzL2W0QpWiMbPThtMHT0OuDCLIW521yj8oV4Yo1kpWDIX/LCFwG
	APbZZOFZHS/bJC8SWpbrNh9Js7kjeMY6+F7BVsWuldqHNvQK2x9x0tZE
X-Gm-Gg: ASbGnctzE9EAv5l7bl3jtmKwjaVNkoyIDt69Ep4cQuAYPBu8gWrWtZOcGR8zYXjIa5x
	CX0yJIHgJ/K0K5T0Xfx9atBPBnCX1RUZfLFdYw0zUNTHgmq24zrNV6sQv5ON9ju1dE/7vyVGTfG
	2OxrfaJ4++/nLq6kUynqbLwpexhsfSYW1f255rTqb5KLZxTKlUWdJaQ/1ZncrMoRKpumIDvwvOM
	t1mP5lb0rXB4BegpvPMXqY3Zj1BRtSAicih2aK8fvv1oS/wO/jsvUY808lhrH74L1eqQKCxC/Zp
	nqt4X/gVwrTnmHAQwAW10MI4MHs8adko6egx9MHf31yCmLpi8sKjeXDGQo4n5a5i220i1c0irKF
	QeraxzX8YvW3UzU1r2d+whtHJO0ChwvR9S//V+sqQnRe4I61U9iurVRky3YmGhPGtWkzns1MUBY
	FV9bo1sJX5WcTulGBRKliM2/dn/WA3EZI76AC1E1HGx+FxM6arURsiBN1PwSq8ea6tQ7JW05Fhw
	lSLXiyWWQZSTWFu
X-Google-Smtp-Source: AGHT+IGTNqBigSY+yLBm+K5D+Qhni0CTXFG23WNwy2NenphYWj6Fl0c8XhhQtLNokHDZRXhqxEvdhA==
X-Received: by 2002:a05:6402:2282:b0:63c:2e3:6cb with SMTP id 4fb4d7f45d1cf-63c1f6cea3fmr28237052a12.26.1761557544632;
        Mon, 27 Oct 2025 02:32:24 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:24 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
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
Subject: [PATCH v1 1/5] arm64: dts: imx8-apalis: cleanup todo
Date: Mon, 27 Oct 2025 10:30:07 +0100
Message-ID: <20251027093133.2344267-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Functionality has been added without removing the associated TODO
comments.
Clean that up by removing TODOs no longer applicable.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 8 --------
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi    | 2 --
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 86d018f470c1..6ebeade2ce72 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -31,12 +31,6 @@ gpio_fan: gpio-fan {
 				      3000 1>;
 	};
 
-	/* TODO: LVDS Panel */
-
-	/* TODO: Shared PCIe/SATA Reference Clock */
-
-	/* TODO: PCIe Wi-Fi Reference Clock */
-
 	/*
 	 * Power management bus used to control LDO1OUT of the
 	 * second PMIC PF8100. This is used for controlling voltage levels of
@@ -269,8 +263,6 @@ &adc1 {
 	pinctrl-0 = <&pinctrl_adc1>;
 };
 
-/* TODO: Asynchronous Sample Rate Converter (ASRC) */
-
 &cpu_alert0 {
 	temperature = <95000>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
index f97feee52c81..7594ac61fe56 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
@@ -314,8 +314,6 @@ &pinctrl_pcie_sata_refclk {
 		<IMX8QM_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO27			0x00000021>;
 };
 
-/* TODO: On-module Wi-Fi */
-
 /* Apalis MMC1 */
 &usdhc2 {
 	/*
-- 
2.42.0

