Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857C222593
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719310; cv=none; b=JARl567dM5pARgdPnwj8FQ4GiECI2lz1GkHpGH/4LQ4Zd2TFHlvVae3ZR9DHvbsTBlukrrDk6dBz/JfSmzMUBMpLmCngngHf2I3sVJ4WPvaDa04ldLzjBrAojWGq7mAeDQhSM/lEp7zmZRmWnfonjLAJQFbL3/SqUU63YG2m3pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719310; c=relaxed/simple;
	bh=6KfPFbuiFd+XjZqq79kzPL/jMNedVQKHcM7hei2cEc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mcnrUzIcoCwzMdw6uZuwFYQzIThw8nPx63hjZ20y8fiFN+S+wnnZaLFQPWqj25EoFTKMcUPpu5Pzlf2bUPwIkiHuLl8dIivW0FpTDGSYIN40l8GGOI9UXh57hgNCsjQzx/lK3/kGeyq/iXFjdHCz2bwvNPbFOQ044KYqRL3VLyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=c5fSeSod; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="c5fSeSod"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso1314439a12.3
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719307; x=1750324107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NxJW8a0rDs+8sBFsEtXBrcHDs56LoiAx3JrdQr1I1I=;
        b=c5fSeSodmfU0G3iCr5ZMQxjJHSKcvyxTOOGiJzJl+w10HI1wbUpb+5eiDjE/6Iuc6x
         YEyLv2e3MgTgEqTrYLjddn+t/Gt5bk9dTscMyY8meE8b6mo1Tuv0doi8Q/CoUrfAkLNn
         fIRRnDT5QPcJ2QnoIeYtMEiYq8U0Tkq0UUE8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719307; x=1750324107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NxJW8a0rDs+8sBFsEtXBrcHDs56LoiAx3JrdQr1I1I=;
        b=JtpY2P0zOPdAgFNiedc17hdcbG8M31hLDz73/jt9dTX2wvC3bgg9swH3uFOo7f9l/x
         8NKhGJBqCNKdGW+HIbTx7UgahiEPXChADVLPc4IssC8JFpl65QiEH3uwgiklLCul8e5G
         PgTjS4eIvxSHceUtXhSZ5+Wr5Zlqfx0ETquttUjroXfgDYGs0hlf2OxTc0IIjXd0PdEO
         wqmW4KGORp2jbcvDpeiMExZ9XRI6yZt1rtNzjXaM0v5/mFh+uOTq1PigZcMnc0m7hri9
         cXCNiUWSaHuPmCbmUHv99R6XcYNfR8nVJNysbRvRjzN40EyTNQb/3ZBl0f9q0BV9GYkz
         hZRw==
X-Forwarded-Encrypted: i=1; AJvYcCVSgsAIdeekwwjA5dVpxZWi1nZ2vyA//slIbTqwIkNiNpYQmU0trSP4yQWTwPOFamHHRlY=@lists.linux.dev
X-Gm-Message-State: AOJu0YySM6DWp66Imuhvg4jA6gStU6bh+otvGFkPGRe3iT66eOAzzIVz
	aj7lcOGdZY0S69vat3+un6+YggKhPqADKRSlmb5EqwQRe9vjSoiG15CbAxpBvo37PxU=
X-Gm-Gg: ASbGncunYny95IK8gk27z7JwybLzLT7IQR8BWIjvTJaCbuHBwK+ZVkP+9Q8xCfGTHe/
	l1iuU0xRiKIsSSwzQf7aGFyFY8IpcvTTPCkzRmT5me2ze38+MTBa62qlA70sctGe37IqvaQsTd5
	g/7EtJc72SJ7tphMe3OLFt3o4bEuxLSP3LXS3ArQKnqC8Ucxx4stkmsBOTxuF22Z+QqN+0xthBS
	Yd/qhxlMbuphrGWCzrFP3sNUIaGViiTd9YaTM3/Yog8vd8t/LUARVUd1gyEyT8ib9xemT5Wu+az
	x2vwS3KZPH453BjTnl+xa8IC4yrUdLnAobr7Ia8+ntbGvkFCOJQcWkIgPYbNFOE1reFYDaYXhAz
	8xKIHMjVNiv0BizhZtYFeg3J7n8LIlJPteNV6
X-Google-Smtp-Source: AGHT+IHXDyupYzZCXJi0eiJsh48G5Ym1bzk1PJGvBlaIo3IRc/SJXPwW1VjHYYpk3eeIYvpgukMg0A==
X-Received: by 2002:a17:907:c807:b0:ad5:e18:2141 with SMTP id a640c23a62f3a-adea273e373mr294920066b.53.1749719306831;
        Thu, 12 Jun 2025 02:08:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 00/10] Support Engicam MicroGEA boards
Date: Thu, 12 Jun 2025 11:07:45 +0200
Message-ID: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for Engicam MicroGEA boards:

- BMM
- RMM
- GTW

based on MicroGEA-MX6UL SoM.

Changes in v4:
- Fix commit title. It was referring to a wrong configuration

Changes in v3:
- Drop an extra blank line from the iomuxc node.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.
- Drop an extra blank line from iomuxc and iomuxc_snvs nodes.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.
- Drop an extra blank line from iomuxc and iomuxc_snvs nodes.
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Drop an extra blank line
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.

Dario Binacchi (10):
  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
  ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 303 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 162 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 360 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  95 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 938 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 2c4a1f3fe03edab80db66688360685031802160a
branch: imx6ull-engicam-microgea
