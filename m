Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226434E75A
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497448; cv=none; b=syyB7iEYRh3jEnVTuMX9Gyf8Z3IAGXSNyqjcBDfHOsojznRLkYnJ1zo7lumaNA8pJGLOU2E8tYJsc2Eckc4rBbDnYpA8D+MQPATi6MEcoP+koyDO0oTy6553iKqAvgR3RsxDenJ6qQ75I5NoQb8cp5spcgjgdOe3hRgz/DeIdXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497448; c=relaxed/simple;
	bh=qfh3435JgKkQxsJ7o+S2GAaDXfNus9x1IXuHe/oW5HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeIl8pbpOkxkamVNo50y5/CaUdgA3ttEJ/maOSdb5/zPceF4nEQ127345D9NXOImjTtVN7ooX1RIoi6sA+aJ9EqbqTUnFUOyf+Q+ogAg8cUkYOvLKq+5/Tf4l9S+8REizixrFiYCAt58gAK2trk5UwMtgKdQPswHWwWdnE8tQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbCWlo65; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbCWlo65"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so117562145e9.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497445; x=1781102245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJAlGRz75xEq17uv2UlpRAl3s1Z0RM73GiaeFljbD9I=;
        b=qbCWlo65o7r9W6Y1kws3n90YXMXRuEyrJbU0/PNeMEHkeL8p2Lt37JS2JWFS9v+v82
         7NOR2R571Z0c3U0b6gRYikFBUJayqH22eqOZ3TqFUFCZO1eqSz7sJFhMqEoF8BkS4kFU
         9lv2Z5+tWqKgQ5nWa5MxMARiE8GRJUpnl4JHdCYjNmKVrH0Jn+h/UrmdrRdPnprkpY/t
         cSg3Dg4KYQWJMP8u6CMCFHYg/t46X1HCxoy/KCb7ZEG/XNoXHG8iT5ItnQeqy+b3oKo5
         Rd2yRtKmn66qe5czBimTayU7eqly/xAvQNOks8gjpOC+2crHocnqPHIXf9zMXoc3vxEW
         NRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497445; x=1781102245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJAlGRz75xEq17uv2UlpRAl3s1Z0RM73GiaeFljbD9I=;
        b=KLxJI4c/KNqhf6AQrRXcGh58afILomXGjnUKQvX9boFkFnpDjzHZ+DVJIGmfn12ZJy
         JzA6X0tEWgJamky/E6nFtps9yl9iVhLG8X5rM53csw6Frhc6j0GlXMnk3xVi5vSNghln
         mmZHjvu8EG58zkLKY0cuRQNFxPSfAMfEEKF0MO+58wAcIZfnZKT8uK4r9AItcjELM8Aw
         EN0HAJ4NIQTZXNf+LiLaLGTCqWc7Fsv8MFls/WliOg1vAg72fgdX2Ex01CDh9E2Xy/cm
         Bwy0OYh+mZeoVGS0rW7mMOoMNUQAxdlh5038Jpy1Ryqx9V1jiGrAEFUQBapeONP/kpXD
         20Og==
X-Forwarded-Encrypted: i=1; AFNElJ+dENbcoOxZkou89N1PDIjuZwh15NFd1KjVnYPKBoRF1bseWxAy2rYi2UFHWzdQR0rSrfw=@lists.linux.dev
X-Gm-Message-State: AOJu0YybW8UzTnyb989iU4Pe4KZJaNYSrVeBPeUa4ubQF8zdHIpHf5WI
	PsmGrBbZiXF4rFV6PCjmR+NC8nsuqssKOC39uHCmtUlvVJibSmLv9je9
X-Gm-Gg: Acq92OGcPho9SYopkvQziDi0JELpAh/hQ/Jqgib4oCjCx1BJ4zuvo87OxT7W+i9EoKm
	6XF6TiRb6jc/2+iFEdBihPuv3nmxKWNjZw7aYOIKgMl4ibZk31KE7UsebWA0zJen1JZ48piTkVB
	VRUWU8IBPcyY9jrVNkadVXnzNtfPoeYITEMqheI1YyjBZoOZPW4IIuzqr173KEg4W8m6HLs6Pr8
	NyCpCYww6/Nfx99ATibAF+Fd2cqpw9xBfYuUu776T3vq+ZgatSB8SshOyHs4lCFsmz3Hp/hC03T
	dlwfFUntQtQM0bektIKUDP2sR1IQHU5PZ0bA86jz/svTMsTd1q0+4caGfnV/qWZ5xZaAe52aEC9
	U1WHrdoD2+4X4vpAr4wcAy+GYBCDRLZ2/udPJ6CGKGDUfQvRmJm1suMixHuuKMys/vLJpLCvoa9
	7L4upNPHbkAbBwhqsvUNU1Fl64LMRl0ualz+zis7MOo9fcCpWfbQQLpVC4gye09DzZpYQzaxNkL
	pWTsa0Cr2syomjR4iJXY9HMOXOPJHxXttN9376nqJS/Oimd
X-Received: by 2002:a05:600c:3107:b0:490:bad8:329c with SMTP id 5b1f17b1804b1-490bad833b6mr28402275e9.12.1780497445402;
        Wed, 03 Jun 2026 07:37:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:25 -0700 (PDT)
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
Subject: [PATCH v3 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 16:37:07 +0200
Message-ID: <cover.1780497188.git.stefano.r@variscite.com>
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

 .../dts/freescale/imx8mp-var-som-symphony.dts | 394 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 404 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

