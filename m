Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220281E835B
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464206; cv=none; b=IH3cbVuXGH0xSQhDWMPB/iTdK4O4meyS+HkxYt8YvpjcWD7n4SZu7yXPiUkh3onZr7nN1BmBhyLYqsk1CM8kq5P3XP6InoMMpJd0Vrp+XJVreyQ3PEt2y4VOs1+QGnxYOvyxIHibmFiridEQaGDQ9a4oV2gc5c4VH+4n0NPJneA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464206; c=relaxed/simple;
	bh=M98Y1kBczwFCvKhTPGpt7ZrMVlfH8rYymkcXq0nIq6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZwMaT3rX9IYM3zbfv9InzXg6Dht6DMh3woI5IshBPgVxLFy8yXmW/3ycz+suAJx6MfYXhKRqcEn0NVdjbtnku6Zf0LnF5lbyWiQYT0Euw4x0wylzvYLfkH/oTe0jbbCdZ4bSYOFVbcE3mTUgIWbeAl5z8SB3xNBgd2L0Un3/kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ev0DoA9j; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ev0DoA9j"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad891bb0957so659555566b.3
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 03:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464203; x=1750069003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TbJ1tbrVzaq9Eu0evFfvKDOWxuNNrI779QMTpMN0PYI=;
        b=Ev0DoA9jZLLVjygGuq4kWgSUs7839ZXltMIWypZLK9WsdbzM/NccJyHJnKk/3v9HaD
         /BWzhltAlO3gHckvvPWwjkUyPQz+6m9TBdmcvtsjfqEKmyEVMzQEBYbqbrWvL74wJwkZ
         hi+M0ew6T/C1dCtMAFpBfctk5jFx2EQAFZpZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464203; x=1750069003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbJ1tbrVzaq9Eu0evFfvKDOWxuNNrI779QMTpMN0PYI=;
        b=eAeUJuvfxsQGl8RMNLJme+P/1n1gDi0ihXlyVdsn2BkOCrzwIxGawTEEEJVry7sy7y
         +Workir4+rR+9ruZdAbwSturi+jmKWgpsOQC80Hn8bMUXzJO5dicrKLLd9hmIwZ2amZO
         1Vo3IapJ04YmMP7j2KvaO6Vk4y/wJetfm0mjWvUxsOBmNDfl/lUcN1Q2vWnwU/qagTun
         INbCCbRtV3DAQkKb0PWB2fa4SpSamLtW0wyGJbqAIWfdDaw/3jsG72MBPBp/W7Q7DdAc
         alxRa1p8e7qKDDQ3CBkrpzO90lpYI3TZ0DbiFS2kvKC0L/pL5Zw4D+sNjZrIlcunrFK6
         0O0w==
X-Forwarded-Encrypted: i=1; AJvYcCWkZxwrBgvCQ7+i8zvTPJTWrG/J2Paf7R0caNwDjxIvIcWEB3WH8LqVy7y9zunzaW9zTcQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvWMPJctkC9HoT6Nwbq/rKGt/wk8IM+Twst4oTSIKm5boGsIcG
	Ez2NxJ37xUstv2ApBkRsreVCKsPB7Z4L+h4gGsM3VGF/iKeK2mKjrNcxicNVZ5fK6bU=
X-Gm-Gg: ASbGncuGQDB1GtyASduLSc8GbWa45jeXg8dMNd1OVzIsB6PRbC9yr1Zj1lyIDjvdtin
	IsAZCH9ush4qYu+7lumP3x8EcDyqs2EeWyNUzED8//5/Bz2/mXVDt6i5EHOUt7mgMFipbVze21B
	vbK/xTzsRj0FqkJshP9wHOp1WjvoRcbufgFEeKY3CRdmrjZD8z1znK+RghY3+crDvAVvPTqMnqe
	5toHcQgYBdUsJWlT6ifIb/CLJ9ZFHBPIlwdKMu40jiW13X9HZ4Tz0Z9PvnzYipPxJPQnN6MMV9q
	9Z4dcoi7l0YxnHiC7dGzoH1iXGUkw6LGGxwiYjpOSnTm09/nAXgrJHuA4HzcUizL6VIJPOpJTpb
	k2A6FetBr/OQtNoFgNWx1GA5npWqHUSiY3dUKwvOW
X-Google-Smtp-Source: AGHT+IENu+cN1K/Tck/lkp6DHf9W71FZqSXJAShei9q/DyrSApC2JOSHLAClYdMgr/5JU1IPWNRyUg==
X-Received: by 2002:a17:907:940a:b0:ad1:81c5:5ec9 with SMTP id a640c23a62f3a-ade1a9c9e50mr1280776066b.4.1749464203323;
        Mon, 09 Jun 2025 03:16:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:42 -0700 (PDT)
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
Subject: [PATCH v2 00/10] Support Engicam MicroGEA boards
Date: Mon,  9 Jun 2025 12:15:33 +0200
Message-ID: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
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

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS files.
- Drop an extra blank line from the DTS file.

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
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 163 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 944 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
branch: imx6ull-engicam-microgea
