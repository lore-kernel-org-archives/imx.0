Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA59460
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549707; cv=none; b=a44yh6+iZxbDIsa/CEEmQPYbG7yrCRXfVSq61isr3CESwOSsSB6oOt9SO5s6WqSdWjUCBFuM1IoIX9XmGinaMz24+Vd6ZdrumIYRRI2wivRFfUHiKEDyM5scWb7ykM0fbFLQaRD3Y/D5Q0ndk5dO3Et598CkO6Vm7ed5SwGLnOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549707; c=relaxed/simple;
	bh=BBsO/QzFamCFKBviOR6aJuGOuWb7j+QU2IdRMrxiOmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ht/xXJ7jB/t2/4RiUxi5RUakyyGiziMasnsbvTQcLy+8FS0R7z87L2PJh2tDydAUtZywZUmHxsW3DgFxgxvA0l2lTDe2Q8CNAezvAN4fvNp9p5On907eUd0Eaw2LvcbfxmHp6S5MPY7bJYkM9Gp4ROakxucPW/wyr3vZdO7gds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dc3srmLv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dc3srmLv"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso5065813a12.2
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549704; x=1750154504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNFLgO9kfRuOPSKdW9yn0XSFMUHevRdsYw2FI16nNfU=;
        b=dc3srmLv+tLXp9qEZyH1QLjPJq/ExeMr899j7rWPJyD5wmYzXDiN2qzns7DXa1t8Fr
         a/6CvV075+WoIKarPdl0WD9AH7fx1WpI1AIDY6ZLRRUApGVL+6A8O7ZEbbH6fgtmFbRc
         k4ZhUkfZddYmKsYFUnJkgXAJvw+Qyu5E6xMbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549704; x=1750154504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNFLgO9kfRuOPSKdW9yn0XSFMUHevRdsYw2FI16nNfU=;
        b=eKH+AqBc4WXPgrL1OPG7g1bKXtOD1kS+cBcy13vCRvO4zOhmojeHW3t8TottaSL9cE
         E0OZZXCQ+tnvS2pk3sy+kHufUiUvmMfrYtqUcgRnIOZJ3970/+9tNouCZ9OXPfRE6s8P
         rPmeaoA84T2iZ72c9REEtiePUIZQoTT5pgDEh6fbZbRavRXjKqNpb6KR3wYliV9nFC+u
         CaNHbJmOAQWO3HoyXX5pqVuEMO1UMJpG8i68HyTM2HN/F9eWOnIn3EUnzhj/qvk4mfqQ
         XVEagaAISM2bDiHuKRVhIbu3UjZesklPbXXT5vF0UBcfwtOFnUe8/RaeiQ+vNHDJQ3l9
         BE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs57xO8LkTeOVNZde9rPy0tU3OkPFGIgqyya0Fi1m+P7+uRxhmP5I4qpbmIa7Uu9S2VK8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpqew9xAtJLfbqIzysYahIt829JsZs3KZKO2rCL3aCFXBTPAN2
	Oes5FV6YPcSp2x24I2iTGWN9k8C142cMQ+Z+tv6YFzbAsgkXCfkd/QMVC0Usw29267Y=
X-Gm-Gg: ASbGncuGljPQ1+JyFSx6uQBgisJbTHrwHUN+iybMsmODKjKLxaYIFDOqQpncus95SI2
	P37P0c+uFrvM4Md1FBU2I0PB6v2bA0f804piPvKo5a409YyxayteLDoSVy0MscjcIeMzOZ0mTSG
	sWaq4dyho0Z2EJ5TM8ScTSSLKIHZWJheMuYz/cl8uqlcIXKysFKm58gOgXiu7yrgnbBgqeCK7r+
	chx7AEwOrlF+1oDaBebxMGwKTCRajEdVRP+o/IKg2P+sIQmeDoeikCwUEuqbgxocUjTQT7f/0Kj
	vlN9NoOiPilnl5a9rb9pPxDPATjWAf862FdkTi4Kq74fSq6J1ah8tGIsThYwDOw74b4AZVLlJGQ
	gA9lDROV4Ep64j1KGIvdWkham8UM=
X-Google-Smtp-Source: AGHT+IG57PZ6Xm8M/Dqr4czCnzfYZyTYEAAg9doQ7EidKIaUDhSXFwVRX2wpqWFLIhoaLQHBuY9O5Q==
X-Received: by 2002:a05:6402:26c6:b0:607:5987:5ba1 with SMTP id 4fb4d7f45d1cf-6082d9b3428mr1770004a12.20.1749549704176;
        Tue, 10 Jun 2025 03:01:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
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
	"Martin K. Petersen" <martin.petersen@oracle.com>,
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
Subject: [PATCH v3 00/10] Support Engicam MicroGEA boards
Date: Tue, 10 Jun 2025 12:00:13 +0200
Message-ID: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Drop extra blank lines from iomuxc and iomuxc_snvs nodes.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.

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
  ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
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

base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
branch: imx6ull-engicam-microgea
