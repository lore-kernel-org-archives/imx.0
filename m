Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81003228C99
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406794; cv=none; b=TaFLDaJ9S15mUHz+G53c2mT+GvzfsZkjszY/v1YvQ7t2SNTrud74+df6n0z5RRX/uTR1etcoZRKrijLWBb1R6QuzaCwdeZvL2OIDuJl/gz8dh8rkTsDVwHnkRwV0TSQp8NCGnf096HSi5PwwKjEGeLWyzLVEMPWNh6NoiRGP0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406794; c=relaxed/simple;
	bh=KnTtT7H0BDAXwRML/nK7OxrH7+Yn6paLBhETbSoOyfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZSeNdnLFRHJvf9LwZVgnCzZ8jDzBWLzca32LAGLq2jh20eF3y1QfCjCYzbsJgwNw6TixJn1H9szccNoAWHE2pqx6XWZLkOBZ6EhnYUefXAcn2SBxnq8qHTaURxXMl4UdXorvOf+UeZJgqNM7yWTMd77g+xxOyRezsMqBVRjcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CKsAZoS6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CKsAZoS6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cf214200so14654155e9.1
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406791; x=1751011591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2eNUIeZ5UwiRp6oWlkiO1U+c9h/DGgR+XfrLwmwISU=;
        b=CKsAZoS6B/iC6gQEEKL3UNAykHPcUjDznQLKaYLMi8cJ58i17GkU0hYvavgSgGUdOc
         BC1+7NE3xyxCeON/WVu2p9FtDpaAabWz40D/nN7QZo6jaP2+nalFKzi7UeKL76hf1YwG
         gfRjlvos3LuJlLl9+R3EmWYQgNFc3mJ2i+5Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406791; x=1751011591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2eNUIeZ5UwiRp6oWlkiO1U+c9h/DGgR+XfrLwmwISU=;
        b=RoQvD2ypt1kgvu/QNh9Uzye6p9crQcfX/xH1Za0L+nMqdlTdhAYG+y6LscE1gzTkvk
         SLtGYHdRUuT3w7kUhlvDbatmJVRrtpiGlsw5Xl7j8d0CyDvEHcPcEemE8Ho813F4PTxs
         RjJl32XGCAWu6OD5cGkjjRwjuX0cUu9xk+wltRBYRrrlFdF3IZ3KPZLlOxKCD51VYfr4
         j8jMQUMfrkfWSqt9IphQM+UyjMhHkbmuM519kB6xQZaT7BNDMyMCnIvW6ml0QmaCx0Jo
         NGgNuL1b5btpWD3s8BbjhCd7ROG1hIFqTjALRxB1FptetzMDH0hKm++GhHDnx9Vr008K
         v8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXIk67mbz69lGxrMVIVBGrqCc9qiS5onsv8aJpHAbe6fQ6BZC25vR9SgImWqY3VJ5LoHA=@lists.linux.dev
X-Gm-Message-State: AOJu0YysJP6WbLWWlC3rL6mcMG5GFe2zbCyJG1W1uqx2Gzy6zu8Dvs4N
	jbqnHzEJXF07l9se4iqMVl96e8qKNIvNeqZ1+IWdTNF7F41jX8E2bOUeDoDHNhohP+8=
X-Gm-Gg: ASbGncsOUHNlK6OTd/cN1z/ScGccG1rjgsoE/G71BrWarr1VTnsq99ioH5x4aac0ePo
	ILNd+rraoe174Lt5RIS7Vntq9Up5+PEA6xv41eicUNO6/fqLCkfm1ZiAdquUKgr+c4MjTyvnr7w
	ewdP0vMA/W6ALKnB5yhsKfpsa2aEIYYae7WK0AdW5EadC54P/rPy/SHeBKmc4NheOVcd7LINw2/
	ljIUzi8L7EexzW42/neq3LDASStC+2tqUxUPiVqsWOLD8HVu3UcIGs3eGd9Ebn7l00JWsOxFbHK
	o7NAV/NCu+purmjRQEKzdfMkmLFPJ+FR17VEbAVA1XgDzzUrfEu7RCmmghC6wrPqShyFb7MxjoE
	OrlN1S3+AU5RfRxNKbDvw/FkiU6OuxLiABYzymojSSmeSZ1JI+x2E
X-Google-Smtp-Source: AGHT+IGex2m7oBS93TBsbAaINT6CSOEuBu1mC17t+mWbAEvl99cHeitnaXtcBxitr8TCel6t0Kgqvw==
X-Received: by 2002:a05:600c:4fc1:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-453659c4832mr14575205e9.6.1750406790643;
        Fri, 20 Jun 2025 01:06:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
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
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/5] Support i.MX28 Amarula rmm board
Date: Fri, 20 Jun 2025 10:06:16 +0200
Message-ID: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
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

Changes in v6:
- Drop [PATCH v5 1/6] "dt-bindings: mfd: convert mxs-lradc bindings
  to json-schema" because applied by Lee Jones.

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

Dario Binacchi (5):
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 5 files changed, 315 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: fb5103df1b24f6cf8bdb333b24bbdf45d4186b0e
branch: imx28-amarula-rmm
