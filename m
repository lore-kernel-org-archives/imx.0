Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53C1C2439
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075239; cv=none; b=LO0ogM7YMLvLZuFV5zkhlsMJIlIKYRYe+eaHhks7ScFBBmrsBtZG4/h+jtFL80E7n8s2ucuqbrwOeK69fOMQzJL8/WcS+9pPMkh2UKR9UllBG7XG7GTc/jx/x8auybwpRnxkw+ck1LXSdvERiD9V517SV88/1bvT3qJxf3EjErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075239; c=relaxed/simple;
	bh=qGyDbu8dbHa9uRw+TklcwCPRNvx4qe8HGiBX4mxWY1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rf8xQBbWxH3Wzy/55YRaoewRXg3RiXUCzlQ/vNYrXzsekDKWe0D+805BZhnRHhz0fC0gx1cMXRw7EjJOtp3nemGF+Gw9SsPBohdpl6zNY8QbfyRdKl1MjKnjAn8y2Oi0olYGiNEsg+aN44vuO5i/w6NSdcE9/styMujMa7ej8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=E2DF+ko7; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="E2DF+ko7"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d0ca0f67b6so2089182a12.3
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075236; x=1733680036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rchwEG8OXdVUFDvOBxqjyl0K00WGKeVLIMzEYmldbsw=;
        b=E2DF+ko7sjnDbERfvrnjwC3rxv4RCBU/0Wqnu3sHnhwnGlDB2252A3+/KPjwIV3s0P
         QOVDaCtXtJJVZHGZ/2P8HfczTLVljNywXAsmr/l74E1ipOKCGyNNW/EYiYqmayjYGd73
         76kLo5/Z2pzY8HKu5FyUgPo488W4ncfDot5YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075236; x=1733680036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rchwEG8OXdVUFDvOBxqjyl0K00WGKeVLIMzEYmldbsw=;
        b=XRpJ8gA70QhUVBjyzND8aE53kjs5A8wjA6jVaeRMNkEUgkw/67+CiQiMBuKbG+gChT
         M+8ZoGgFN84I4STHtPotsDc7/oODNqjYM7XtlcMORmOifKo/i49EPdGDiJOwPv4TyF1/
         cPsrxE2zl5y0yc6JXx+JyZdkplrnnTofSVgg6z0TBlsuqzl/c3n0qDaAxqVOCb8ODR/J
         LQWpDuVmW7jQkkjjaXdC4fYx6ni6c2yVGNFnftXDvGdpJniSXhb7v/Tnux2BPcgXp1mC
         +HU1P+DoOaUKa/dOpnPTdkUWtYKlwU2OsgEWKUsrnWCK/2qG/WZ/soKziJtMGYWuEC+U
         YuhA==
X-Forwarded-Encrypted: i=1; AJvYcCVOIlAmKTBxa5LFIJmsJX85pjCGp4yjq4Qfjvacx9oOZLHCxx6Z2hULgIPQ+lVpSGTdllg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnPVG6IZVX3wn57XOUegZrKlS4yyzGJJh9fMQ3t4bw24eH2pN8
	xOXwOCuhEhFedHgiC2a0P0K34JlEzcafIEwBlh7+jkyyX7ZTy1OjVIxkKZCBwTQ=
X-Gm-Gg: ASbGnctNj/8Gm2S+5CyvpDPGDIdx8Q4tkkHk5x4XyBZg7fHkMsL60C5lD+uIV5zGoHs
	ctnjh/Oi/DW8MPts8eX5lGgfgi0HlUxfWgXlSpKbRsu+WTJdG2Juf8hvqlPtSvYgwI1xlyLNG+T
	0MFWDnIdQTKrdsk0x+TKP0GajMg/G5DPSCC07uORZobED6mgfNP7suDW76cku+pYDH0gazy4cd4
	9KWT4brmCfjLnDxjM4YzNftXqEQIx68el0/os73wfjv7seGslAifdIqdwbNUurpRf/+nvm8r1sm
	dUMajnEpZ1UWRtKwUycOmDR5jt+BeevI86WHXA9SHHxm+uIxkH8SiLGdjiowauZUsG4dhwQZPKp
	3RI+9GCooBZAlVbx8
X-Google-Smtp-Source: AGHT+IHOVUCcxf0ALDonprqfVqUEbAzV53v0SZ4mU7f60wTN66QJ2QUiGKJxXNAkQ6tdMuSLScJWrA==
X-Received: by 2002:a17:907:7742:b0:aa5:152a:d0a5 with SMTP id a640c23a62f3a-aa580f2c2ecmr1673821766b.18.1733075236544;
        Sun, 01 Dec 2024 09:47:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 00/18] Support spread spectrum clocking for i.MX8N PLLs
Date: Sun,  1 Dec 2024 18:46:00 +0100
Message-ID: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8MN
PLLs (audio, video and DRAM). It has been tested for the video PLL on
a board using i.MX8MN.
The patches added in version 4, such as the dt-bindings and the driver
for anatop, were inspired by the extensive email exchange from version 3:
https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

(no changes since v1)

Dario Binacchi (18):
  clk: imx8mm: rename video_pll1 to video_pll
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  dt-bindings: clock: imx8mm: add binding definitions for anatop
  dt-bindings: clock: imx8mn: add binding definitions for anatop
  dt-bindings: clock: imx8mp: add binding definitions for anatop
  clk: imx: add hw API imx8m_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +++-
 .../bindings/clock/imx8m-clock.yaml           |  77 ++++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   2 +-
 drivers/clk/imx/clk-imx8mm.c                  | 102 +++----
 drivers/clk/imx/clk-imx8mn-anatop.c           | 281 ++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 188 ++++++------
 drivers/clk/imx/clk-imx8mp.c                  | 118 ++++----
 drivers/clk/imx/clk-pll14xx.c                 | 127 ++++++++
 drivers/clk/imx/clk.c                         |  26 ++
 drivers/clk/imx/clk.h                         |  22 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  78 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  67 +++++
 include/dt-bindings/clock/imx8mp-clock.h      |  79 ++++-
 17 files changed, 1022 insertions(+), 233 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0

