Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A05205E2F
	for <imx@lists.linux.dev>; Wed, 28 May 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434394; cv=none; b=qFiRfoepVfjIQKJDbbQopM7UM9Ef8O5koFlI8B1L3UgeQb5dr/3WeZkOt5HTPGw7qZpmuRzfnufZFvC5VZEFRuJJZRsqeqqEeggEGkU3saaZ/OQMxIjJ0M2edmJKKg/+Q//FQ9TFb/tFOQoM1EY9azmewcbJEemq5aVu7MsqDco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434394; c=relaxed/simple;
	bh=RMtFUse+IKv78RNPdpuh1ai7TKuWgiCBZr/6gVgYYoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=loacw/Fow0jb7IE3Dm1n9kD8oTQnnk1RcMT+bxiufm4NV1OhcuBLzGEa7ZotHXW1DJ+jMinas4LLdW8DFQ9CBlCvPAbjc6syfpbJZxOoCgN5wn4gdPEl6p/QA6ViJUOIDhMNbM54LV/X9KpUdLuf9DqWUq0Zx2zSTIqqsYGA/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cBTH8Gw4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cBTH8Gw4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60462000956so5470494a12.0
        for <imx@lists.linux.dev>; Wed, 28 May 2025 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434391; x=1749039191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIm5zjYKMN6OFYzQuz3a5OKGZSsL3cGIU0/LJYInxwI=;
        b=cBTH8Gw4VtvPhj66NeiB6qToCsUiEPAPPncDv91m/eelMHsBpsN8sasZVSlBQJsJwb
         3+WPlwzVDC92s+xt6zmKfSw8VcL4HGF/sOnIxCJ1Ly37TYpwLRRmHw5rRo6oNGq8t9Bf
         T6WsfgeBGjA4ZKhyGmDbYe0MFKjyse+/KCx4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434391; x=1749039191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIm5zjYKMN6OFYzQuz3a5OKGZSsL3cGIU0/LJYInxwI=;
        b=iwlFvTsdWNscBfbHZt+QrKbyVUancOAtepaMBamcj6JLPpQ2p+5xG85aTxWvgUcXKL
         jrHU9CB76aBF36unjuSbIDLgKXR9aH4sPKqRqEg/3/yul80C4ff0g22JU1+/wwm6n/m8
         /ooFQCqOtRrRrghRQHwRePUqDbKV1zve4Ye3isq/HEdR49nRwi8GbGytUdk2boOBjHBw
         ahmfQZKYbggP7KBEDtWVSkax+AeCTcOUMdwz3agR1fIuOZEqMM3jcaAfJdCkIZxFi63n
         VRyT3rAVNSJ4rN4EwFGEbLBAXsVD7pRhY1DmoWPd8DkOq8Ko/5gtF9mDWjQ/0lyT3tWM
         nr3g==
X-Forwarded-Encrypted: i=1; AJvYcCXwJxXsZyz5dPJhcM6w5kB9sX2r9MO9P8bAOKnMCkGWqUkkNlDsSauy4/6XlfrAIGu5rBw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi2vZNrDrCQwDH4lrfhCe3GSO9OuSrZ6zAsr9Jn7zf95qWfg6z
	H5nu5FuxL6sgVC8fmzEhfQ/xN/cEL+Ic2kUYinhlquEb9iNdGIsSiAEwfBfFedWy7RE=
X-Gm-Gg: ASbGncvTOzgo4aAqjENWLuGTzQMluxyqbRN5ZGnLp377VQF+dL2hmtAXOeaZzgQRDiB
	XNJKDW8Pmuwx/X4DNDIKAPP0uxzwtzTwfN8oQO0NI4LkyEcEFh7+pZDwOUtEW0YfD0W9degw1ZX
	edyM8z4xEACDxByMUsP7S3GUmtrkvUKarITkkd63M1tZbQAmDm1zGuMRQrTK+VYAZZwUNj3LoMs
	Vx+RzZRER52nGs8uzAznBTFoh/QaE4yBNcsCYNIflAN4g3sLlaf3rHz6X+GaqdwCH/ykc7aXpjb
	rGSMpl68/NMCQHf509R72Q08TbJyWy0uGxj1MgYi5I8QtwUS1fbcnyKVyY6sWq2GoRQI0cpBY6t
	moBrjct1G7N4k
X-Google-Smtp-Source: AGHT+IETyf2GSBL4as/yohckfyx/K6gSToAZaD2CCVz7+dNiszWCRp1kQVLr9GgDovIvyA8Dl2hlzQ==
X-Received: by 2002:a17:907:608b:b0:ad8:91e4:a91c with SMTP id a640c23a62f3a-ad891e4ab51mr577513966b.29.1748434390436;
        Wed, 28 May 2025 05:13:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Support i.MX28 Amarula rmm board
Date: Wed, 28 May 2025 14:11:37 +0200
Message-ID: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
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

Dario Binacchi (4):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 6 files changed, 421 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 33f410b0eaf4ebc3272720b4a68943a73a59cb05
branch: imx28-amarula-rmm
