Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1F43B71BA
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732153; cv=none; b=MXyyzqBfWkSPHC+9ocAH8tPde5X5oLgddccvoT6FGKDfGCtQti6K9d8OhdDWDsmABB7GyebPev26IdDLCOk5gK+8dgOzwh+TI7/5x+j8ml1cXgfpOaSunulyNKzjYPOljVB4TrWR/Yyii7sKuqSL4w3wqWgsxGVdisYy4MyoEK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732153; c=relaxed/simple;
	bh=cY24fbvs+FLjS6KFW3Jh0RFhLvNyLNIegA5+N1odQks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqIM4c2LymwZhvFG6rPHc+2VuFnwo8PhD4noNbew+sZduV6RcMaGnu/EESsiw3lSd2s8k8gauFc5WBvhSajqQioHTZDnfw4onMoqixC1GXH7UujhPH7IimMYr6NQH2lte2CoNuN+RdUAlk3A/yf8UQWgq65Eld28qc4Lqw1wjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HselKPyN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HselKPyN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1712a04ddaso90675966b.2
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732148; x=1788336948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k388DoNqDIgdld01dlsQvG3KwwDwUBDweu9hbM94/GM=;
        b=HselKPyNzsAwoQOTUcHHnnNNMDr54fYsXt4DNiB12q43ycfLcF6JH1oeYuaMhLkqmi
         dCWyCHuwfjAsBuI24VVA6qXaDV9nAD+SEt7Cx8dHSkA9wWH9A9boMnH/+b+tSvU7g7F0
         TD12iD6qORrR3qwxA4dxwXt8LqRzMjEnsHA69/3KiZp4jbZZqs4aS60/8L9/wxcWEtfY
         jW2iqLh8dsyDwkqHGV1OzsQs7XVLiHOu14oxXyV64kLxUlajESceFGJ3NM+/v8hLODvX
         jHB8G7+fLyIBioVNKSTq19Gu3R+z34cF0UlzU58/E9AzGT//q8pe+y0kh/chHiUQhYYo
         UaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732148; x=1788336948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k388DoNqDIgdld01dlsQvG3KwwDwUBDweu9hbM94/GM=;
        b=oq10do9Su4lPNMEoc7njCM0mNOrcbFbVBvdK06pqxPDK/kJUzlBkMq4/ksSga086/I
         2rgcVyUG+7JbXfEa1EO44JMK7DI27Mph+2TmzNde1DNxBjZSyXrlmxVCKZKP/AGpZs7z
         zc85s9Fj87wkksIcFZBXeNYMr3ktE/dnDoW9Y9tclBfHZyr4ybAbysvBfcBzGb4TjdH4
         4g5fC61dINg7SXllNmzblnbfb8r6icBGvl/I5mzJzbQ8k95p+nodtmXxs+72Ic96ulZF
         SQfhWLOuwr40XKCjGwfdoKVwusrJ2F81eFmQroKtnx6Wm4XRmesCPBW1uyaG2drcqKLH
         UluA==
X-Forwarded-Encrypted: i=1; AHgh+RoYwELNCSugvZH2gxgMuIhNP0C2Rn2+hJbela3faEf2trQuY76oKa165knTee1jvaSIKfQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kLxPO29lQkx5Os3L91zGBDGc0aZYQ+ImxQTB5IKD3a2J9LcqWx
	SPqtTJc4CM1BhwL16E9JbWjNQdBiJ1wpdgtuC2k3+SK0IXtvyTho1KgY
X-Gm-Gg: AR+sD10lfhrqiuF1ChZL8oyXrZSk/HUd8KZeGlQ26gGQxqjQr8NJtFIguBdkSs2UJmM
	Ni3pmMy8y6rNSbC/5dhO0P4CYLnFj8PyMYiNbIgGgjVMSCRS2LpEf+JK7g3mbv7dGmpeBiNuTpT
	Mo8XVjflmYX2DqxoenmQiAD3iVBM15XuwEhdwgAsRaZjmL1NNNgvP9/1ailB5Rz1FP6UJMd1BSz
	b1EDV/nbd8432jpuTWcLeYu4YRBXyaHTJgqPHDH63zLDBVydici96prHES/7Kv8AV9Lao0EGoO3
	pR0WrVqpUN9Yz4Z8jrVMxRuGgLphrRpGgk4yVo/uLHlaN9O2+hPTpsUmngaSViZIs9anRRclniV
	nNB2KHo/qgCNQAV52yqOqxDIStPxIzX8yR7cTmhWTgoi9MeGKFYnXo7+B6DfSqrcE0FHA6669O1
	PuI/ydvKyMCAnr5RYsxRP7IXz+N1t9Pxpqdwc5ri4JJiGERGNnbhKFm2AsvsvnzlR5uqT2wQ8C9
	2rDide0ZMlQXVDHgBPPo3Q=
X-Received: by 2002:a17:907:1b23:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c250c6751bamr485985966b.20.1787732147406;
        Wed, 26 Aug 2026 01:15:47 -0700 (PDT)
Received: from GLaDOS.station ([91.80.77.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab65sm360997566b.37.2026.08.26.01.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:15:46 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v5 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Wed, 26 Aug 2026 10:15:34 +0200
Message-ID: <cover.1787674237.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  90 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 14 files changed, 1470 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

