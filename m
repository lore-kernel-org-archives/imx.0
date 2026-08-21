Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095C17A314
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315290; cv=none; b=uzF+JP4b3ykIBi0oJ+5KyMtMGMOoXexpyuhgoC3V0PLOoQjxeF+lLsey29Ioe9CXs0+3AkvSQ1UUtWydeOioUtInPu1eW40Kei2b1brRW+B/UMSiL8hkoyy9dwQvFj2amrCzm4uNZUs5SS7mwCWMIC5FkO+Zf97a2HJ4Yb2E43Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315290; c=relaxed/simple;
	bh=7HjWuNo7DNTNj7Ool2zN1yMEnn5DAV/xlNVqhA4KaBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knROf/6GyWMeM07vt0X4xpKIpmnz8J8jHsJ+0QI/CW3oFZTMlilmWziM0vB6r1WoTrQikzf/GCdSxaT/EIJ5Fycb3DQ2zqnk/YlQs9+zzxP9MKkNDJStHh3QpGz546zGK/k4Xv/RDOCKTFQC95vrMwOcZ+bLKABSIjIRwQnwhlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN+I0Uoj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN+I0Uoj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so1411536a12.1
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315285; x=1787920085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/h0XzmwWRXUqJNSMv5UtY0V0xlijWuRLVo42IsC8mD4=;
        b=WN+I0UojTeAmnUB/mcWDG0YfF1rlih6T5UBBSD3zrhpx5Gq+euZkQJD5K2Tg3gJcRC
         8u+eJn1BzD21KIIjT6U1x/bK+j1zf4pV2gVkWom1LZEB609PLtLs2AIMBiHBRRjE2HdP
         3o8oPePtAtVvTrZf9jK/IH+tmPbWZrvolgcMe69x1gWv/tlrrIsUEh9n4hKbvSB8GLdw
         e6Rx8ucFJ2KuFOpnKHAW+SptsXGmJAE+KH0Pe0L6hlLgADlb8rejekJk71VuMm76UCkh
         HhdImCLTSBW/sHJBVKSGhFN4azDA8iY8CHkpSfdbNcEuqhqdWC5aLfwRpyLkusVOd/Ly
         AIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315285; x=1787920085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/h0XzmwWRXUqJNSMv5UtY0V0xlijWuRLVo42IsC8mD4=;
        b=Gyl+r3Q+s52iH+w/d5ZlyPLoVBaDzNI7QcspA19vI5dgUnHMCgZCVO14tcgs+SsADq
         Et43xiYllPytrrgnsZuUdbzDLEK9C/Sk9ugvAe8rscH2inwyuRwLNAwvp2AyY5kObb+F
         K+uqcf1twdDREEoi25o44li/g/synnaF5KFe/272vn+Llia14X4sMaVeoVYrJBsB3egH
         3qnMUT3gCgNbt7w7I1k6ryj9DkO6CVILN8v1dksqrF+nmWSZbFeoEgzWf6T1mv04i76c
         3vpQAR+R+wg4iJCocHyZQaIvdcivb1NMXUfRGrWdVGnp8ffBZSxlCOwk6mArFDP+zC5y
         jHzA==
X-Forwarded-Encrypted: i=1; AHgh+Rrf7CkhOptu4pwwIDFPhJhO0O3etvUGMaXitBtXy14c+l+eg8gQ7j380covx0NaLAgaTYA=@lists.linux.dev
X-Gm-Message-State: AFuF++lfcVL2BA7X9cJ7Azu5BuQqj0bd2iERrBij/8uXCzscnHGvoBvD
	ngeAKBov1HnBAWRPtqCPqnbgkS6VfQkwiggfvTLGoXrYIe9Pz6oYi0ej
X-Gm-Gg: AR+sD112a/2liqNn77Afg2FCIJSNDImkbPC9C/nVpfEbCTs1zMD8mP+P672Uq9rvLhA
	BcZvz0QXRU6IKAJwiePNnSZliltQ55Gq/JQUq+2kv4ElQ1hIjbCpMj+ewonakxxtQHX4cAuKaeo
	h5GJ8H6RB0QQkH5Gnsz8gvfpqcpWtVV/nN3LHifaWHAVSwogPUtwK9Fibb8EQqTO5dmOuECFB7H
	Bvg9nj3U/BdUz/Ls/fIoYQOuG9xT08J3EeJOwxCRP/oi0AyxZBBoUUafwL0H1ZZmA1TbhNm1TlY
	jkT0e+LWx+1N3ZDGbFaqFkUWgS6kFjvjMnu1bgMoFjY32cws0maAS7kfoS5veLQBCtjhwo06rad
	D6fmPnF90Av80vfTkLl7V/MosjyrnnNvSFIJZxX0gwCKD/iohiMfgd5p4XIVB/LuIIX3eOJ5qzH
	hqll/Ymk1XrdNiu00stXUqdFVNLotUIgFuEtBMDMXkhgC8n5OtzqJhhrURLJRhV5FKxczjtFTqM
	C1pVzxnTgwHIS2DNClBiZIqmXt/Vo25Z+lrBT3RSKo6EpO/AyB5CW/vmg==
X-Received: by 2002:a05:6402:380f:b0:6a3:9e00:8ed2 with SMTP id 4fb4d7f45d1cf-6a42f27795amr6967378a12.16.1787315285116;
        Fri, 21 Aug 2026 05:28:05 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Fri, 21 Aug 2026 14:27:49 +0200
Message-ID: <cover.1787314780.git.stefano.r@variscite.com>
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

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 378 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  64 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 633 ++++++++++++++++++
 14 files changed, 1471 insertions(+)
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

