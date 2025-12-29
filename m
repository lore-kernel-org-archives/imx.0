Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865526F29F
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020695; cv=none; b=tTp8AtmH0ze24bZ+bbCa99ujVX5unGeYwOxuNtNy9HusA9iNRSe78Ueu4kw7Bmd3zqEDwFg0G+XtY3Q5fhlOjEW21IJCoKyEhxEbL07sbp8qRx+heXS6BsN2LoKyC4eWcMp+76fl+qilmixyTQQmxDQ8YYyhZMWhJ9Wzzv5riYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020695; c=relaxed/simple;
	bh=rUsF8k3Hffx7f9L8YJrFlHMprC15qfDI5GkdFPK2rMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnB8D8nEYw0p//r58rnnYzqkkrpr2XzeHSkyQIfds+CnvK34DtSN6G17trX5pNtIy9zHPgeQqXHf4+yLO4Vi5r0y0cTjWdxhYkTVLhcJLBoWOZlJgXBlqtfMxLKORHFhzFi9bUbz6msuMOpc+RwK04wDjoeY14BaEjBtHfKbXWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL19AbkN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL19AbkN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1132329f8f.3
        for <imx@lists.linux.dev>; Mon, 29 Dec 2025 07:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020692; x=1767625492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHEN0giZ9ctJ3eXe7pXHVE7NUCY/SFiNC6nnXZg3quQ=;
        b=fL19AbkNZMuoAeZcaagkiYEYT7uDcOjCJh/ffWhXwNR7qNQsNdj/zkRGAego/gQpt7
         qzzddgKaB355yvP5o8rRvHuIxR7LsoAMNmhumjuvd4CwJnp/Rk5zA7Uysc2y6yYYpoR8
         rslqC3EmYzS3qK/AidgZnqB/x/xF/8DCpsEcDf9j7FW6shLLrxHUj0UNAscIBenPDRnt
         LWvor97wUtc75Ge0nTMbpr8ci0H+Nq4o4jBPmeTnpkXybnD2cSWW6wTLOF68y580rLTk
         skUEhd9uHrKIsZkzQQYN6o/2HcNcQgk9Ujb7wWbXXaTdWztKJBEiOa3g+4DWNiMv4wl0
         5/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020692; x=1767625492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHEN0giZ9ctJ3eXe7pXHVE7NUCY/SFiNC6nnXZg3quQ=;
        b=CMlc/I/AquzFBvNQdvMozVPqc1oCV1gKPyz+Z8JlQi2SWB3ICMjq/PIjFwskOoPWav
         vsNMg3jRJlLV6n37F476hBVEnHjIC3YATgqLRNrjmo6PRPWxtOb7EfM7RaIX8V4/WC4P
         +I/8RcQtMB0JzRu/CBR6lSQi4hapQZt8o8ikYWzKpm2JkeLUFt3KTYNV3Ktc5RzDioSf
         yJHJ6SVQaMXMLZJIOPhsal62UmQ8CqTVMu42Gy/jTkLq2QjHst7ixVMeygD3JRVAdaZw
         gZWdkm2Vd1euaGQIl4+3h0L9plROqFjhBKV0rUKKfRuzPEsCmSuxwwOm3nVBvsOLmVVu
         K38A==
X-Forwarded-Encrypted: i=1; AJvYcCWoY46viF7aCTCkoRdC1Oswuq1Qp660mFgE312v+IhDIlIkrS1r06t0ZUltz02/5qEqi6g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4sw0FH/K4ORgZ9s6hh26MXy3BSmNBZmOmBrocyNJHasWZSOJp
	vgn7fNI+SoilDOhPiuW2K758oAsAyQUkeQfnwr/pXfvGbB3PvlL27c5S
X-Gm-Gg: AY/fxX5jxzTvlqHa1a3oKrdTwgEpipLAU6XfwUwS3OK0uVq9td8z2frTM1iQqtuMsU9
	ZYq+ud4lv6/Fm1aWBmTe0sY+uUfhy7cv2PRg3ocxPicmK1szPdjtFCOJFT+MT0m1G5+RW71aRf4
	5J/aaLbOwneEL2m5quPVhPF+4cbCuZfDwY9gdzD5wmwSnH9mtFhGt1zOeWPA5ZbJXey/vxdKlex
	gI0H+u4ZR5dITUOjDosMPUztJgPYJNRyw+UiFiY3W+x74296v+3DruWs2V10hx4kLHFpmveV1TN
	eTRaqJas7qylPUzGanKaXIU3qR4iDHWJfCgMlDsRhmRKG11yq1mS28/9L/JPMTpuo6CxWVPOPQS
	BKux6wQ8LmMPgNw0YC+Xc1c18NC1M2UsWfB5Vb3Sizu3eLMZPk6pdp1oCLRkGWB1tOGiePZA20D
	5PmyM8JqEAcY0Sjf+MMIcgqZUwSgJTelqomQmcse/LMu/CrQvxi2rmS3YYVTvWHDKPWJEWrntvA
	Nq7Q/cM5m/iVCevDdjJ
X-Google-Smtp-Source: AGHT+IFYl+a9l1HFC9fZU6kSuVFpDYvy7t7ogNUxGwrhMkfCrZCdqiRvwnzBMD8/3Q77QJVIhjX1uw==
X-Received: by 2002:a05:6000:26cf:b0:431:a33:d87c with SMTP id ffacd0b85a97d-4324e4bf65fmr42256380f8f.11.1767020691618;
        Mon, 29 Dec 2025 07:04:51 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm52899902f8f.16.2025.12.29.07.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:04:51 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon, 29 Dec 2025 16:04:08 +0100
Message-ID: <20251229150421.57616-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 588 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 462 ++++++++++++++
 4 files changed, 1057 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3

