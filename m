Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C412367A8
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408064; cv=none; b=uIY5w4B8AELFhfSGatKEUd2adVpg2uL57i550pCcz2nJ4pTyoJQpYIDMPJd+qclczcmNyJmhqqqjC4xh3mbf+0QgOQ6ISKXfUoeL07z8i4fuYYvodmb9Mj8tfzNcoXhko1NTbVGxZwru58hNe7Jlx0hwqdpujvHFoF5Re3WGXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408064; c=relaxed/simple;
	bh=7+iFhP/KPJUOuOXLm7a+O04Wu6GwPCVk074jNvsJ9ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4Y4SwUxFYvLCbN1o2En7dcmAdbATHwLUnawdkNQqDsc6Qs+jGYxUwKAiRzBOuosRc1x8NzY2UZehd9jbdk5PHhMcX5m0J8MWxNn/x/y3y/gE8fZ7qTWODYexIX0VRUoxvyMh+NMUMFeRISD4yIZ5Mvb06Eog9wKnLYTOVydFa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aLKkwwwk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aLKkwwwk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cf214200so14825575e9.1
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408060; x=1751012860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OL5RYRK2xW8zpfGNlxCIqPA3FpSRk6s+VzdpwCEyABE=;
        b=aLKkwwwk35ME4N8q06JYRAzvymyqtHOy5cfjlM4WezF3tvy41gbTb0GLGXxjQ6LcK+
         3iQngmNXAuuPeapvlOV+ZipAFT0IEcvVgaCWlNcxAaenR0CJO7wQX2Q8JhRCTOd89Zp9
         3gX2v7z9eUQSb1gMDc/1bu5NQ9fAvWzsboGQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408060; x=1751012860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OL5RYRK2xW8zpfGNlxCIqPA3FpSRk6s+VzdpwCEyABE=;
        b=FVzvzRNPTRbOJ4zZz+b3ygaeepCGkMB8Jx3TPqTOSGzKTSlhCA1rA+nic6gbAmuaK0
         /U9HZs48UaVNifAajZwzZPpdwcLXR5fWTT0tNZlJ5CqFQ4Sr4leXC4Ob8AwPOwJTXPPc
         FWp4o9QUh4p0KMv+tRqvaa4p4LastJQejfiIEvB/A5qj6WLo5Yu4wZplhBEjFvVTvUwI
         L0CN1HFMi9pYTO9YSNcFnp8YXtA6fvubYBQBOIO2lgwN6OeR8f7zEZ5W8dlgr8I2pfNE
         eackJelA2w+/6cPjHJnAn8AwjMzVKnIn2PZYN3cW5UaVWHR7+ljsFeW4PUrHy4qsec+i
         bXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWutpUbjz5lc+83d6/cULmmIMXo1DfmWvmAyWuhJxuxvhvGNjIJBpOyvZwo5wZO3iH+MZM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyya0NqW7ooPV/B4inFEtmR/raJ1PVxxHAgJqgrRkGp/GWOGkQS
	ugx8HRXiHVsf9y6nsLzjbAllIWw2fwEZKeVCVrdiO2dMiYovQh3lV66eQz2QHp2oSz8=
X-Gm-Gg: ASbGncvxq6bB3NCTVdFTUnGwj4F7QlHtGjovzuBFk7zHXsQkmnMoutJEXiV7LZym7nY
	FC218zWGdEEx7v0usx/7/6Bo+p7vENPPNaL4/FS8C4kUCa8SxHRDReqZM1WUm/dS+mxu5KSmIkf
	u101zzl0J+5DmNCgfIzL38wmZcLF/XUEFIVRTIKI0kK38Bm/TuTCEl8ZfPsyGtPSPI5qvG9R+i3
	bNDylmiaK7UoW98RVIpXWMuXaZerUwU0P/6v4t/TXvOKzs+bP1wsOUGZ50txOhOn8MItnQ9i+hp
	cwwZWIn6DjO73kVrLFvLSUY4fi2v1BrN3lOEEkLa1J9jbSoHkrVZsG4GZeC2VIhl8gZ+La1ie3x
	YAiLINwr8GhuuB1v9uW5dzUDCICx+S9V8/DvLdFVrg6//YHIzfeNJ
X-Google-Smtp-Source: AGHT+IGsnvq3aPtcZJNsLrMJuMg3R1s04T36bsYu97E9L1l5W6bV0L0RgKZbLxc2RjE75y0x1FOIIg==
X-Received: by 2002:a05:600c:4e8a:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-453659ca684mr17891535e9.9.1750408060027;
        Fri, 20 Jun 2025 01:27:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
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
Subject: [RESEND PATCH v4 00/10] Support Engicam MicroGEA boards
Date: Fri, 20 Jun 2025 10:27:04 +0200
Message-ID: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
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

base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
branch: imx6ull-engicam-microgea
