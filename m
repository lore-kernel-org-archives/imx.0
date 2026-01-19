Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38838A731
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768847777; cv=none; b=msthQamxaRp8RPkdNyKiY5XBJKiZHjjEIzaUWacX4GDJAZMk2BEfsjv5FFGA27txm9pShfx1Ks9H4H9dbEELWwDomWbDKBpUXlN1JajXHJbr5hsKOEdXEI9UYPm211fzFTLjOD46u21FZFDR99nEeTFC/FlvsHTYFMkI0JEEWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768847777; c=relaxed/simple;
	bh=BIRqmq2QxCTn8l7SXziTd6BUFkmIfu8BsaiokwOLfS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuG2frfgRmCzq+raDykvArGg3tVKLgj+Gz4oACS0unfM3mBV+TkOszBPABrx9gqGOma3rkPxhc6W+78whxFnEi/SnUD6OtFPMu/48Kez/u+V50aF8yNIk5tT1trwXgA+hmM2Y2e0c0Vkyv5NW6sn7UGRhB65oaRFj7+w9l2AFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJ2iuoV+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJ2iuoV+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so26220035e9.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847774; x=1769452574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=55lyyZqMdMa9O5mc9RnR0TLqDLX220EotOz5fNdnf3I=;
        b=AJ2iuoV+ozTy9NN/yney0jol3F4Pps1kJHkyEOrk1cFYI8yHT4Y6Bf6Nn3/8Oa2Pgk
         QjVltXd2MF2m4ZuN+wxoFJjlmvhGqJgAFwPP0BNh+NuEsESzcTzR2BJ0FyXVj6F5wZA5
         Qwhm+8/DAwFL0/QkxeMFt5Nh41XAnRBFDtHgYsxdpSZXK/mUqiRe1i2tOUyhQLjgdISj
         mL+ayoQF9yus+xPrkZ8sAQF5HdYpb40Kw1s5pFIkRM6yk6KjRFfCRHichAEz3oAN7Kl3
         5FjSr4yJL+evpXZt3UOYdfmaQMXt50D+sx81FF6Abps4AjG6rh2gP+m3uhftRwePv4PC
         ljLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847774; x=1769452574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55lyyZqMdMa9O5mc9RnR0TLqDLX220EotOz5fNdnf3I=;
        b=lgukutcz482jy+h/+BBqxYpUtwzj6Pj00Akv+3ZMPpQ6G8jNpCfaFFo8koVe1ovfYH
         8PsvheWV0GO7XKe2d2ZGkSCbe0n0znk5G3b0vsGavzAgipKRZvvKBgxZMVofKm6xULEa
         QhbeHZ5vuagK7nZlJFhnD599hKU26nVXNxFJymC3onpp/B/yv/q9+l8dq1XodXjnpAFH
         Xc6cLDlKe2nudRgjJLLQYotiRnI1VYCesvbUBR5P6A/1KFK3LYSP6/NqcCCnya1w/SwK
         jwCu7UCVqFSIrKIEV3e+sDgPKQh6SlRQ+VKQSr3xB3xMIeMiMQAOUv3Gh726KB6z3X6m
         ghyw==
X-Forwarded-Encrypted: i=1; AJvYcCUdSUKmLbLYtaIViWtkM6sfwMSZ4qYaj3nR65X4r7aCjMQkJjk7JET+LJyLhDUZHx8x1Ck=@lists.linux.dev
X-Gm-Message-State: AOJu0YydgcxR8G06/DVz8H5WN7rmk958HFc4ygixEU1bTvS2aMr2iQ9/
	gDURKBduTtngtDWvTF5/5ajm1lAwWuJ83cf58bgwCkmTzdjaLiBozXKa
X-Gm-Gg: AY/fxX5XPpoGMYgyrTiV7a7WxotdkTfDJ/12Qg05DMQ+JJVCrztqg9uESQmo7cNcOVQ
	abJmnhg/Ilizsyht0TgWqW1tCAaeSmuswXYp4Yf6aHUXaGEy88OB4dndE2NKQ62KSgZBfYpka9R
	0zU61zGBDWmiGQ+ofgLzvAzmTyMKNHfoJYTrMVWoNukxWctCvWooLDujA+m37iu6wEX0TU5DtDZ
	ORND8cHmGpVuKjVdQQlYs2KNDNooTfTqk7ELzR3JHs9AIOHEIf035Em6wZIDMqQuu7AAlMBm6kT
	t72nu+Iof9mTeaTLZrb/yhaTia4Gk+NJYBIHhb6Dzj3N5+MTqCtj2tSDc+bIhpxkCNPGAaxLxWF
	pWyD7zJTN50uewHSRZb4nGx7rcn9e4M9Ph++j9KkPy6C3JpTVghVRr8U6Z5tdN7tAKYNpe0TDaD
	+zLedy6WmUGPS5h23rVq+q/H/pmBtJ+N3eBgibcHVvNUgson/gMYikf9jojPEd9Qj0A3/qJMkes
	+BpAO3ByKzNKe/YvsigFYiZTA==
X-Received: by 2002:a05:600c:6812:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-4801e5301fcmr175456075e9.4.1768847773622;
        Mon, 19 Jan 2026 10:36:13 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm203965015e9.12.2026.01.19.10.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:36:13 -0800 (PST)
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
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon, 19 Jan 2026 19:35:52 +0100
Message-ID: <20260119183604.88192-1-stefano.r@variscite.com>
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

