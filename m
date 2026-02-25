Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75E43D902B
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039040; cv=none; b=ZBfC0e3pd1cs/jnwMv8cj7mxtjFEQIMeokusB53N45P40gC1WNK6ehnYzDY90k/kWSPRrPXCYS+wGLvk6IFu3IFfI8tcAMVRGZxFNxQ6Ne0l/iPoarhKAKGmGXRKMty0qGq10IiALFhvSpV32BfCjQbnxGnVUHQf8m1KEYf+y5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039040; c=relaxed/simple;
	bh=/xBJjsSjTyjG/WPUzYI66QwIigLR/Nf80Oq0zm5NxBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tWKrecLheXylIk86vQd1bHyhHFQfvWTMMnMhIuEoQAROuRmGsRIv0BGvmorp+NV9AwHuxVg1NWlqGLdef1bc+JBNmoy+UOG7m3LczWb0pINWyj1ZuoqSdx2TSlX9CrZ45RRzpyPsPCGSaA3oMZyegOo27RGRvQx0RwBUeeE6rzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIzkf3qS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIzkf3qS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso57675e9.0
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039036; x=1772643836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/gKDfNO0yZEaX4mw+sj25TM6DxomC6HSWL+mXYtDWw=;
        b=KIzkf3qShNIc2m7CHDbEu546DBR9Jnj5JBf36oAf0WuDeIUHZuowypFYMOwniDWUPQ
         96ZO4fmkGX+aHi1FCi+kkFSBkmP/Iv9qJzaWwkgXiGVsTtNTn6U1UvWVUZxqVv5dHNNZ
         f0+jia5OsuqV9ktAloee/ECc6Yi9Q9OMf/Nz8DeItrC9SXt0QM0aUUAT4g+0LdhXhkwH
         YRlhnYnhEVjVzpUzkoF3VevTAbAOOQQLgYg7KX8dno895a4YXRaJ5wT+JR/RVBfMnR5V
         7ebAhBBfIPk5JsmUkbbMU6/JBZ6lQH2hcw7WSixdS116Dqv+5GPyIDpnyBNGAHd6wRvG
         12DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039036; x=1772643836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/gKDfNO0yZEaX4mw+sj25TM6DxomC6HSWL+mXYtDWw=;
        b=q5CvCNqmagqwLAmt9sPh2PPic+OTk2+9t5hWtDh2AJTRgdywlm0GVmUNCKdrqZHIYd
         1WFceS1eOWJiisC6kHF/2kYppQ3fRK/4DCc77ZVSbFp/AHe/pkkSA03UlmSM8EAgmh5z
         haRjOJh/T6+3yO4ff64nQu33wPgcdgrDPyklY2QZzLKFOY91FTZBllQTZihxhyk5kODb
         MrhEyIsVITmLjOUpzFfPVgzVKcI94StsxTkUbySwnK2a//EQ7w3o8JfCMy1QSVzIYLXe
         AiLvE/b4JVOoCFtRO9z6XJFJ4X9LwEJwFYllGRk8ljo/a3WeSSmUcI7yJ1X5p/6MjuW9
         b77g==
X-Forwarded-Encrypted: i=1; AJvYcCUdsWTfECn6x1gt2S8j96+uwLosmxiEdbnC181F6gl6VcJ+k0VUCyWrIKXeEGpkBR/IhGg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6ewiD6ZhxARaZPxZP5ORAUSsTF43vrd7vVj5iruuzBZM/qU7T
	ZWfVKXqyuWfpbGjZaThykffa8l11LIbUvvTf5zQegZmSpzTZHbFt2Bqg
X-Gm-Gg: ATEYQzygacp1AwFh06QrsARyf/ONx5zc2dyMoMdOZBm5y57yoiylZKDtu7c4DruEjMl
	r7/7a/JD4r1ZfXF1fJtT6UPAKtLBznupj++HHpz8daMQfa/BBlVo1TLyqd1PrPSB3YQRxGz1xKZ
	xMSldvQS/WjNnHxTxF5bsUy32UiFXj8k4upIXCo1lSjhwqbMn4skGgLQuPWqT01MQvnMUqkbgMi
	Kbj0KsZv5VTurhoynTrW39yPXbgDmzW0alH0kDeF/HkUypy1G1OpG1PEHcB+uPMT7npSEsnkvzx
	+baUNjmtNHtomRL/Iho3r6EimNgty9WaeGxOQDHC3te1Mu55I40sRtuzri88hhimqfUxsfRIa6L
	YNjdehpusvvn9eq+eCQpaF2N+NCK/KdO7esGGeYwgmacqt1rSTpjgqRKVQoVvBgya9JA7U/LRyW
	6aj1loy2DneCXvH+UmXtUJKdRb1SAk2+anqvqC0zA0KiBVn+eomcDj4OrIjVLxeLz1p1XRsggiw
	7pzI+crXFrxa51wKnsrJ6A1BWfNvRvNadq3bzZWTpe0BFc/Ew==
X-Received: by 2002:a05:600c:5486:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483a95dea69mr263172375e9.22.1772039035675;
        Wed, 25 Feb 2026 09:03:55 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70b3f3sm88276935e9.6.2026.02.25.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:03:54 -0800 (PST)
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
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Wed, 25 Feb 2026 18:03:35 +0100
Message-ID: <20260225170347.77841-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v6:
- Order by node name instead of by label
v5:
- Fix newlines and nodes order
v4:
- Fix typo in spacing
- Remove vpu and cm7 reserved memory
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node names with generic ones
- Remove fixed-link property for SFP
- Audio regulator cleanup
v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
 4 files changed, 1023 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3

