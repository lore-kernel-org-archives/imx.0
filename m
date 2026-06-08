Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A13BBFBF
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929687; cv=none; b=NMbkCpSAOgr20y4Nny63dV7w1ngC5LRbzWDqiUVWm3J8qCn8UJHh79QCZebgI5ql4aADm8iOwWTqVVtt/6DKd1q0qxolDkbh9je26Vl/Cerk0aALjjzVp4dyuM3VK8WPpbR18+5SUnVgqj7LHmIJQsFSQ7K9jjQLj0NmqkBlDFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929687; c=relaxed/simple;
	bh=+wicVs5ToWL4a54zQqI268Tg5wVEbVHmDLNWn0zdgz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tNQMZni9416+CkKbUuKXfUFBKE0DLHMw9A5oSnV/pyBpQgTkkUgX5xSmntxsa2jvTvR+zCXcBRmqZWWnwza3Fne1TXhkdFFIHbBA1IFfM48IPR1afE69/N8ZmGltWAJVJu9pr7XbISisl5EYx3edJMONQLIgH6EirMk78SCemTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyNLvGj4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyNLvGj4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2074112f8f.2
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929684; x=1781534484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9bZC8rw7YmoIyog8z2SdVy+ERoBgDn2wG881TA87OA=;
        b=YyNLvGj4MCBFxU13i6iNacP0goNzjnrU3izzEaXpkkmEdh7UjX6N4wUbM4YP/sJ26u
         sqv3V3r+1gk08WMCgCpi6pWQ+6uoIcZymI63fsFR2jNuAjeSpFRVvHHl0oN2tBnNBnI+
         65VOpXKemggBa/V4cC0eXt5bMrq4sa5UjKRj+vPGkZGLW3LlxmzBJiEWDZOuvVsHfnae
         7W34LzCkfCsNSXzuA8RLOEh90/HV7V2CrleIvj7Gkxta5cSB9bGOacvdu37svzJBofZf
         8s14i0UoTz4x7wZ3XewKDQgaMKt5FErkidDNp+XSe0qtrYjz8qbVVADaa49P/T4xfrI+
         KzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929684; x=1781534484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9bZC8rw7YmoIyog8z2SdVy+ERoBgDn2wG881TA87OA=;
        b=bg40f54WyYIY1N7FZ96kbIpYUAgVzqlLpdtLWrUxCyNyOaFOJOgbAJal88AL58GcvU
         2H73761V18PPDp3WVhsoSnu5YJ53qbqqHovhSL7d9iqeA+CZXZgAqsDB5mW/9uAI9BMy
         H/k04rKJwwdZ9zm2WMti4j/CDUZtS4pytr9lLlNwqHqJB8SVjk3LN5aLp8JT6wQo9Wp/
         jFnBcE3zc+n96pRhmuqVY/ISDx7vl3LtPous8FSFcBqTAVP2qHxILgEms8reUl2YbnpJ
         sZ4F49TfFYUcjxRc0CS8bFQjdZFQeRRs7xWEAP10DOr5FZk6MkNHHNOW1ahS+J+8JENE
         wwjg==
X-Forwarded-Encrypted: i=1; AFNElJ8/a1yzPDB1KihX5L8RlfEQvOtBa3wHb1lsIj2M6RauQFHRr7/F5dMDpanUJ41nWWU/hXA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxTC6Ji8sQ86wsokIAbaUAOaqzrvD9J6NWKLFKbdy8knPLu0Yw
	BynVnr2yVxEokUit/Dwgm5OAq4rRKvoq1svjA1GUQ4QDtmlBb7LAoyRg
X-Gm-Gg: Acq92OHc6GkaN+5QWs9S8rl2cnGZ/6408l9ulRuxuwgse2BCe9ou0r/MIBs2Drb58ym
	0AqTg3u30+ALF3NMoUFYOWcX+tMKMCCyndw/GLpuZms5Xb7nX3+1VDrzWMW2M9eCH1iUfNkbPxO
	1wM3oS7QP1v5FvxVbsQCClRSLqMctmyl8TnhlBGsbtHZXf/M3ALVsrOgoR5htFJWh3+BoUQDMn7
	aIe3y3l7emLJ/VjXhtnwEl8d7PuVvyZOtQwp4lwCDsWs7U9Pb7svDPkQcC5NCKBmmXBrjxNDfNw
	FBgy0PZqs7eegK+rPMtIKT57hCaGLXjjMbX94FCAc3Ik+uxjgssy6lcp3sr9WYRavxObM6qOfq/
	C6iO4M/7qfTmn8z1d5O5CMMAFM8QtqwUTcMoJloBhs33/yEJ2gaXNbk9yLbj5NVNHHQ+ds3NoD6
	jOUfrKdTmisjXCNKWmv52XB+4iNInmSGUHreGt2CewVur70coHYl66YB6FFXHjEmWKJtMRLzASI
	D9s4LOPBkh4kPCr+nkdaihVE9rI0jvLedI8c3+GHgLjk6u/ZoXfC9v7CI4=
X-Received: by 2002:a5d:480a:0:b0:45e:f5b6:7bf9 with SMTP id ffacd0b85a97d-46030627a04mr16756707f8f.31.1780929683675;
        Mon, 08 Jun 2026 07:41:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:23 -0700 (PDT)
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
Subject: [PATCH v5 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon,  8 Jun 2026 16:41:01 +0200
Message-ID: <cover.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins
 - Remove regulator-always-on and duplicated vddio node

v3->v4:
 - Fixed USB irq edge type
 - Add HDMI HPD support
 - Add pcie reset-gpios instead of deprecated one
 - Fixed eth regulator

v2->v3:
 - Add FlexCAN2 controller support
 - Add FEC controller and MaxLinear MXL86110 PHY support
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (14):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: imx8mp-var-som-symphony: enable CAN
  arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 389 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 399 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

