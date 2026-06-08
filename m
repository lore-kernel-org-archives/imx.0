Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FEF3BF678
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912645; cv=none; b=m0zRsFW+9GhSQEukdcvii08K1BOVVRRCbgHvxvkJ4nBtjfaWIY0gMMb4+pXj9gaKfCZ1Lfxl64Tb680s+coUhMZtUx5B2FKi6zn8TdDy/8ka0FaCVQ5e0WLeq/I2sXm//JbODYxdUzm+Q/LsglVs2DXYYujAa/HA4kOdyP165Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912645; c=relaxed/simple;
	bh=WBgC/I6XjiAI6oZ36An82ssyib58SxH2Q0FmTxSkU9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPptbaPpRBBzsklo82Jaek5ZrCYol4PDnUNwc8QJoncySm0kFEqDFkYwvxYRcut9GjNno6yoze3i/TmdIB3DC/BebMC9qrJTfJ6CvtbNMR5CXlvb/UoeglKv8S1+q5PaboKuSiM0SVRzz//Q8cNn3v1Be20j3VgT2p6ngHzS8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/7WRkIe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/7WRkIe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2171811f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912642; x=1781517442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpy6WCoUNG/EhEMu1+5xb7+kdwt7VzLT4ekirmQQcVQ=;
        b=N/7WRkIe4ZPgw648fd8xPYZ6s5nJO+JiMaCBoLItuKlNoJUmQS8WDpmd2VCmseQM54
         bVwlup1a6id3JxYUKGsIlVMZq/ITIm+p8ByPaiwVkFmjEHiGbd81jEWndPG54twrQWp+
         6Cp3+kta7KuHNODUQ+pBXfBWZCIoJ9rJJTNitS9CJzF/paC1zw0JkJ0IkWc12ugTNwf1
         9wN/4hYMPWjWs005VbFUt3tSPDHBmjpWWCOtAKqqFuQlCp1r7ygmcW34LUY+U6DVZKtH
         /fqkdfOsOY8YdT3qa031r3oqj+Cg164u8Ws8BbH2H2J2cUvBWd6k+1JtgYJOllcwtdIw
         Fszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912642; x=1781517442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpy6WCoUNG/EhEMu1+5xb7+kdwt7VzLT4ekirmQQcVQ=;
        b=m/Kp8zi0TJirrz8AE4DBacC6O/F/6tLVg+SICncCkJzPt9yjoFQMWqYmnTvGhQjL5J
         S36qAxCGu5AGNWerShdo4K0HdGfXP63uKoTaS1s54C6+LjPrIb6SfTa0bUcvbGJpz3Vf
         HCjuhWcdC0rKCxlFNP07miprYKjh15RjMFdS1qi6IZco9SaQiPldN/oQuGpJwh8jNZtR
         l0hPahlrl33PlJ9LEGHmIJ/X9+SfhdUWHGuh795PjKbN9G/hQr5HNDjwTGF47Fn4/u9l
         L3CVJY73/Aa1D3N0NrxYpfM/8yM6YmostUWPjFtkLD3u0d1uXe9dkIJKRNKN3dBwtrfJ
         xZvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zNcDoYzTawbg8yzi8Tu/a676UqiJZ1lnq1A4FInEk1DF4bhTSzqOYXyU3mlLuDsg26Tc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwokbirDfO1n+TBzJNVZY6FZHUoXcuC5XPJ5Stv9ErhAmEQx7qO
	tgHKH3mwkyqy5r4iufZiSYvnhFXV9lyVZIgSS/VFex/QZ1W0UJNNGcjE
X-Gm-Gg: Acq92OFYQcnnbwHOXyyRU/HNrq0nom7aSkrf2+qS+yF1UI4dYZSY2yaj3vJJQyM1Rp1
	UrWuF+T9fyqvUoDU7KliP+RDT1BEAwq30tpDNoPS5ZxFFjB3s5En2Qhy+CmCNDY3Aj4vgqoACkp
	lynXg2shWVb1vOnGEE5qfhsnsWBmb2xRm8bb/Hd+2auDiw1LRTdcgOD8KNe2VUq6m0VrlDBjoNl
	BTN/fZPZXA2YIN0BQsefYJJFulGd2UmHUs40w/fOn0bXAA0HlsVgJvQ24FlHFtOMLRikJ6XUxuH
	reWFCFzHfG/oZl1DRV09gROw7NGLvEUuIpK6G2HKT34Na3lwkSVRuphj2K0Yh92l+hC4rZ9IOfv
	G59f1fHpWmrv5TTcm5kgxMRwt4IfVINN5auxFEhDhEtu4VTFl6CgzGR3oYzxKajErm+ZSc9jX/w
	s+2RlCePguVPpiLQZMPWtFtpAfSQBbp2ByqO5RdAi/P/zmnU63vA1E5pw+NjAdOxhHHUkLdJRiK
	wo8mRll6C6bbT3fGBMAuIi9NQKf5kjE9Pb/8BmTbqZRznIW
X-Received: by 2002:a05:6000:2990:20b0:460:25f3:b25a with SMTP id ffacd0b85a97d-460306301bdmr15689749f8f.34.1780912641650;
        Mon, 08 Jun 2026 02:57:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm52385020f8f.11.2026.06.08.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:57:21 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  8 Jun 2026 11:57:10 +0200
Message-ID: <cover.1780912513.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 723 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

