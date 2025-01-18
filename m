Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE707CF16
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204057; cv=none; b=k0v/g3EUpM6p9DyfWO9/Xz885aSX0Ij8hGfrTewKLpiuEJLk76WPz+4WDlENVJpzvmCVzXdt/9TaT6dtAqcLY3agLdnk5pfGOn+RC6cWyz6BpIf2pkm+QiRZfILjZXnQ+15P8VhaTdMQn/P6ZBcepqgdigJq/FCdXmp4wwUyqFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204057; c=relaxed/simple;
	bh=kQs6p/sguiTt33aX9Ord2e8m/sWMlm4NTrB0su2Kzpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3l2td4IVwHgM2nYJKvzZfhlhtmBAMufDv8TPMYy5He6nNGyXNh7+yuP37ji+rTpSkZdmTfy4tMkq4aytBKGJ+Ty9qHtsshU+YGzdAkIdlkZ1MTnPzlZoCs/wf8sWkTol29tts50xztS3BJ7Fip7O5SNzdueZ8wNvZ1ddCSso4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=j5AQljrG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="j5AQljrG"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaecf50578eso605460666b.2
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204054; x=1737808854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5onGhGKKEfsf2k5TF9MlXDxHozXopiDzBdinAngTivM=;
        b=j5AQljrGa4Q+3spPx7uK9Hhx79PC+GaR4n56TLsaeQA4HC/2oJLb8O6Up5r8PRxdMe
         XW0QPb7K0nBVhyEdzLwZ6yvkRuHIEsgvvpgRupGzxJiXB9715Xyf5MOtk11EbfeJX6z0
         SFftMADAZWysIgDerJi0nWYtCjK+OJ2NwMm0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204054; x=1737808854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5onGhGKKEfsf2k5TF9MlXDxHozXopiDzBdinAngTivM=;
        b=oXYQG5jTqx/rxaM4tyRKIvhQKtaT1YdGFf66VbGBdMmtYV0lh8ZQnSkFy6nLELc6mt
         rNLxbbw6z8L8YxMkY+cgHoGsNzF4Cbe/aWVsiMrqMsnMLSPOrvNaZFq6Wu+uGjiHSJ5/
         eq29V3YYMQXx6Hm7pfL1h4azxzI0eREgpNvhoToaVNxGhav8sYdTC2vfxj+pCi3Z0+H6
         +p8CYmyIw6Qx2R8fAGF1IRCw91dfGimti7qOBWLz5rgqZOPzl/yLjBCcSTAojol9/1PK
         T6SaohPNmtftMRClGUnjhow3FVNRIfQJVTJKtn6VJ78HghSjBHGipMicOxRTGjqH0MPN
         S+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVlw3G3f7KxkiBNMjHF33dEbtzrYkb/HX4mYF//W3JUtDsCBBExo2qgALUZ6uwecO4b7Vs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgeVJC/VsOEpVYR3ydgWpCYdPkzgxxUKotLASgbyQcZ12m1BaZ
	bNt1LIGbnopdhmweLGqTYwdQVAvfzjuRrzt/Sq4UwLgwK+ecoRqdsh32Q13c9bQ=
X-Gm-Gg: ASbGncsb3fEdnQszdq85KDbhuORQeOqTKAdy24gY+9ou1PJ3hEdyP7C9csNqgLsibpf
	TpOsNrkHjAV4+mNgZOhtEPWDb1VfBUdbV5mQZ0QWEOPqZWz6hX53iLeQMXdwew03+deD46otnc4
	4IwN0QxenytqBayLnC/OlQqx7YVByH39s8UO7md1RMujQ/9tuCdzZetBZhliXguCIw5SIF55g/x
	Hfbnkc30ReAJAGLEGjzNgiMa5rDH3sB85dpq6lttOTbyccx/MBi7w2bBPW8VVsKIH9WGaIRLdPT
	oMXD8FNTj2IdhaDu+ANoeyNzWvkvwXYyADuzbjYcX3pvJh/rLrmBe+8jnbm1/x62Py4Iw6x9U9x
	bFkAPiyu6uUoq7hfbaPJONx4U9+JlFgmy8A0G
X-Google-Smtp-Source: AGHT+IEjybvZ0WW6CYRPWu4SGI7kaRbjpSjgRz2MqsdM529mQnQ12ESTPBLo6wSjpHehJu8b/HKv+A==
X-Received: by 2002:a17:907:3f97:b0:aa6:82e8:e89b with SMTP id a640c23a62f3a-ab38b166589mr512324966b.28.1737204054044;
        Sat, 18 Jan 2025 04:40:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:40:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
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
Subject: [PATCH v9 00/23] Support spread spectrum clocking for i.MX8M PLLs
Date: Sat, 18 Jan 2025 13:39:43 +0100
Message-ID: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (23):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  clk: imx: add hw API imx_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation
  clk: imx: add support for i.MX8MP anatop clock driver
  clk: imx8mp: rename ccm_base to base
  clk: imx8mp: support spread spectrum clock generation
  clk: imx: add support for i.MX8MM anatop clock driver
  clk: imx8mm: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +-
 .../bindings/clock/imx8m-clock.yaml           |  74 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   6 +-
 drivers/clk/imx/clk-imx8mm-anatop.c           | 287 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  | 275 ++++---
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 196 +++--
 drivers/clk/imx/clk-imx8mp-anatop.c           | 305 ++++++++
 drivers/clk/imx/clk-imx8mp.c                  | 684 +++++++++---------
 drivers/clk/imx/clk-pll14xx.c                 | 134 ++++
 drivers/clk/imx/clk.c                         |  15 +
 drivers/clk/imx/clk.h                         |  18 +
 include/dt-bindings/clock/imx8mm-clock.h      |  76 +-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 +-
 19 files changed, 1975 insertions(+), 610 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c

-- 
2.43.0

