Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75096443AA3
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059541; cv=none; b=JWYXD/teHGd/p7tQj7xoiUZ2eYDeYQMJ2515bOPd6jgbbVepVjkEMVbhk6NF+mXRG94yL8FP5SSROpfebs43/tgg37ZpY/iDeZ75aVgZDGXv8yy7mggf7rwRMeVwf7ICmfg10HWDA975km/W1uZdlXMrnCt0ecxMK7R+orcnL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059541; c=relaxed/simple;
	bh=nJP75in4P3lswa4oWsjjX2TeYlHn/IYg0sncecBQJ3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMaEUDTTfglky51QsQ81A3N0s93c3cvj2oC0UK0rEwvNtHjgQ5NWP23p1Fbaaed00Fch653Zhm98SL8fglP6gwD7UwTuZ9/NtOLfllooaszYrSVh0vqJeibuzdo20c6Fk0tt5fl5AJPpKDPM4au2skwIoZiL7DtpN0Hm9673o2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYkmWMCX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYkmWMCX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso2803764f8f.3
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059535; x=1784664335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoWubUhSydBTzOYHJhhAjBoFYVBqYbpc3fDg9gsugJU=;
        b=RYkmWMCXA6LsSpFNfsMLCu3prEL9rteB/qrNXwDF+jzN4shIramqTUNiR5FzRYcwaV
         enayMPUr7ofcP/yHVD25uQyZjAhVCcEbTjA2FGgS9AE5PhlIo1iHoXV9BA8vg7u9xbZk
         +9PuATHgmhxIDCRmfECNv+mx/6mjY0PjwFy5E5HIEDoIkVifRAYAoadbeLRnLu4PC74b
         lVQsYYzc7nrywRCgX+exYZ3ta7TVFb6elzP0vlkJMIXCGSACrUV5s3nhFl16KAAcTTTg
         E1Ht9KSG1H+tBdmYbuoMyVLNXDKHgMwEerVIlFM7gGW8CnEWdSRwpbnhOSeXyc9v/fGJ
         cKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059535; x=1784664335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoWubUhSydBTzOYHJhhAjBoFYVBqYbpc3fDg9gsugJU=;
        b=C9wEfzB/VvR5ru+dFTZGbXffzd9Zi/FX4Ds1DS08MYwFHXsjDcv/WAG4osty5xCEOp
         I65Q5bTGmcYdqd+ywHeSg7MY56Uk4tQct7Z6bavbtAAit4Ui00Kx+CHZ9e2iDVzT2v47
         965+simJ6ZDcr8u7PujKV4hfUGCpvgYU0QdxlBklWTM2/0/P6eCbQ2xau+rJJhbinddf
         88cTOpifW3MMrJ8/34pQYZPKCVRXyQGd9TJPY5/8M50XMk1JbdEccoiKZew1FLTMAJ0F
         Qnu+Q/CShhnMo5zfqMEB814bQcafIG6hdcjaC/UJZWEh3m6y0Lbvt59XHSjC7PD0OP2r
         wGjw==
X-Forwarded-Encrypted: i=1; AHgh+RoMl72T8zW9fifrI/IVoi+fvIurP+dpN9xg1jbU0W2c2Tm2GYJbeBqtmlIehdiDeLQYH9c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2WaupJtEpySct6ct189yibEVYTKskiK04aFGAHXj7euZCGj9M
	yBIP9cDd8zzc82SBYzGwXl8yE79pOlaYGt6ReXjUszO0U9EqPbnh/CJg
X-Gm-Gg: AfdE7cmHIOtFmMWPfEV8nhRBXwuZuJK43WeVvuej4YLAoAbXd1/gwtliqCO8753b6Y4
	36whZnsEVfMU2S82aPV4GJcvWs4eSu5pDl5u6F14xG913eVufIaoj3PrrT10lcoBXN3Z+Iis3r7
	GgWHq2t8R+OFbDrvX5fgix1cAvI7fBc7GvqIE7rhwmL6cnseKv7XPhC+mSVL+DXiNdtOpivgiB6
	DjVJyImWAk5Hhuvl5MN8DzJCBaYx0X/D/xnmKbr64VKKms+qU+WMHx0WttxTjg4EaTNbn2cFNS1
	L0pFbg1HehHdP9DsPmnQB7QX0x4wESZQUdOMUm88BSqssVjvEcytxDCrfUCNLUiGhFk4WF5bqSt
	M1ElUSCBPVnetUYgUHQiQRtTXsN6IFTP4amNvVfQFH3JMbDfyA5/nTX6jhQhFqupGpd1ux7IZFJ
	bBJGuGIhRjj1Wnm6Zx7ldUk6smrlQo3V2zTp2k3NTVqAv5szFM3Jch9TvK
X-Received: by 2002:a05:6000:2008:b0:478:9d9a:d515 with SMTP id ffacd0b85a97d-47f2dcf7f47mr15914629f8f.44.1784059534751;
        Tue, 14 Jul 2026 13:05:34 -0700 (PDT)
Received: from GLaDOS.station ([93.66.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm11669797f8f.22.2026.07.14.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:30 -0700 (PDT)
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Tue, 14 Jul 2026 22:05:18 +0200
Message-ID: <cover.1784059139.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 488 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 529 ++++++++++++++++++
 4 files changed, 1024 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3

