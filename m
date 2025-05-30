Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7690258A
	for <imx@lists.linux.dev>; Fri, 30 May 2025 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621276; cv=none; b=LxUErkQwbrFMHCGGgpuoGVNEBF2uYiEk91sjcNNOrUkccY3+mIv1H9CJf5casFIxtmAD7d17A2FvO0LOwYcCV+tIBtCy0UOJ7lZNklDQKPVl4Xo8eHuDTt1tL8GWZ2HOfR8Cs5EQznuGPtHznp4djTauEYslwzfp1DxFtoVdu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621276; c=relaxed/simple;
	bh=KmLizsZC/EHsG+B3pqWO/Yxj0X1XdikxJ6WfhvkFKkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tiDNm+13gVNY/bp2ifd7UNmS9Cr6YsPmJistALdRqzrf6zJ7+Hsvhg7QzWubxp1fxbPp+GMpLz+7o2GmsXRdiHJtatuffT9eFy0thtMFREV0H+h2c1aBeVwoz8Cr7gXZ+4XlpbhC36YO72epAKKzyhBc2kBTAUw/6rZ2RwKwhYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fO5GqcGy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fO5GqcGy"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a35c894313so1939057f8f.2
        for <imx@lists.linux.dev>; Fri, 30 May 2025 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621273; x=1749226073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=koRnW66k+022ggfFoSoQrqqTLl823zuv/376lcTR9I8=;
        b=fO5GqcGykAq99wSBe1bhkXWRLdG759Y80qrLUtrX+N6X7ljVOhTjaoIFgRm9Yo+kaD
         rZWCffm3rhr4JD9CE89S3vPtl7x62gYanqPeATvDxIdKv0da6qxlXxAadCefo0W0+BDF
         TNegJyaR9m4US1oRpX4ZQMCl+MVf0Y76BSqk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621273; x=1749226073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koRnW66k+022ggfFoSoQrqqTLl823zuv/376lcTR9I8=;
        b=vH+ERLVH6w47ykKNzs5HZiQekp6VU5SsV19+gINPDJLTOn+zQF4EP4CKudtVmh934M
         rDHfq3JhhBMgOMyCzgdT1E6gSNBz2JVyA4nEVaIRshUrmYDaztaTpqZ/UqfpXul3WMBe
         K+tBKbiHvCTuJxQayIBiey8j652BG38llIhnU/Cn6YYD4viLJVPEmRGdHtW3tWR+JF9X
         JcuDy8+Vux/BaKQGlBxGK2DWLcPOMg5Dt0uMIV5Iywjtj7S4Md5r2s73AYdEMsFvaY2/
         3kIdHumK20YUy+6y+dtBiLjSYNfm/d4JxDnG5SgQAIQDsivLFpO+u72MQ6B5PnQw9zkb
         SSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtzsHk6CGol5+3HOnGN0SCUIpYnarHnS4qooGPBUXuTxJtLXKAfo4Nbq/dkg5qsWC11+U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZamHReqhA6WIZD8GMcjo727MNA+wpTeEX+C9z9kzt2Da3HwmS
	qzqN9WXkYrSyAEU1QiqPcnHMLol1Sa8lK83YKN8gGAYQFlpZGYcPt+Ve9+9hTe9a9ik=
X-Gm-Gg: ASbGnctqDqgNRuO3vDf65jIP/NkJ83XjA7BPI+BKI5bhBENtq+9kvhKl1pIlpB1ba3P
	GW8pDDMwXXKrcRSphj86ot1xUkwyCP5FUB7DfDqyjQrpdUNoUPrVGL8PK2sWdSMXdvZJ2yYzhw+
	4zldG+GNtTg7ENXhPOdIUWgQMelP3GWXtOeZUeHuk0n77WEqHFMZY1JJrn2c9i/u8Kke0GP08oT
	Sv5rwdSJV/l0J9aodoUK36safPf50kUcFSbStKwU+Li9OIaTnTCumV2dXbYN5vRAfjBhJ+2JUBW
	S22iaoSSGvZyVFvMIzHl5aipuPWaoNTeGwjxagqGLMzNBWs0wx/u2vzboyiyGsoi4ghTZbEfqwo
	ziNwoIGDqLfOWZBWIGO82BUEo1oTNR+AvA7sq3NHs
X-Google-Smtp-Source: AGHT+IEgCfDLZvTgBMKT8zzGqvGoHF8+fTV9cPyrjWspDgJx5+AgYctVuJO1cy1dC+MaM92LcBU+ZQ==
X-Received: by 2002:a05:6000:25c2:b0:3a4:f038:af87 with SMTP id ffacd0b85a97d-3a4f7a9d575mr3347648f8f.47.1748621272729;
        Fri, 30 May 2025 09:07:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/6] Support i.MX28 Amarula rmm board
Date: Fri, 30 May 2025 18:07:31 +0200
Message-ID: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for i.MX28 Amarula rmm board.

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Changes in v5:
- In mxs-lradc.txt:
  - Fix deacription formating
- In imx28-amarula-rmm.dts:
  - Drop #address-cells from gpmi node

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

Dario Binacchi (6):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 134 ++++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 7 files changed, 449 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 6100186e509525510e2b38d790338fae3fa463f3
branch: imx28-amarula-rmm
