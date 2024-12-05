Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08BA1E0E16
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397586; cv=none; b=d1HlMnlHJOa4/dYU3GB/PKsW0KhYQD4aYGPynGq92minurhv8GqRNex4OIyM5JCRKHNpqLomx5/K78bjf0D01lxTUre3bEyZf6ibqJw45IsIpHpXgGML/0dGsvTom47LfwQ+nuTBwwFDL4QpDDWrpRtnBB9gyKcW09MKImX2ZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397586; c=relaxed/simple;
	bh=2BtyLulbVctROgY17Vj7ec+/Kfil/FkZFvqDIpetgzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B89/T56ZN6pq5bqRoD1Vh6Bw1fC0Wd2wMJcE7/t0tp8GVXk5KfkPRrbyt8NvfSMX8sCvAQLCdYjd3wzNjUSvuHGhezYDnUYAczxOe7+4kXJYJ9oJQCLH6aMSg9zApJmz52Gp2H2dDrVWRU/FAUUtuM9LO/3yROYIijauvP9F1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kW8FXj3M; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kW8FXj3M"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so144951366b.3
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397582; x=1734002382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gam048ootOPzo1BYL348MdN7mDqE4kD/okgjHVqyGrc=;
        b=kW8FXj3MOeGWMBv718txM0KzDJahQJEuDE7hZjDTyYYHD33veg5d5Bf5Id0NFPnMJv
         JUS0jb0BzAbuLTbW0RedpUGEl80NTyQ/ADMJjFTYZc7hSAoUccystw+MJypBt6Z7P20h
         Nfgd32YIKkyRHgXnspFdmJtqU5OrE0sRx1lbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397582; x=1734002382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gam048ootOPzo1BYL348MdN7mDqE4kD/okgjHVqyGrc=;
        b=Sh0aDHK5S4wr2ANJnxMWuLNE/dMQmmdV9ujAjRxeH63FtKdraFjZ3V3RNKNW0xd+g2
         MiwQPr4N0UtXOKpVoPxS8Zg7lQorxmUqsN44qVPFtafkU12NTcIqCwZHYA+Q3e7vaJyE
         Ewu06agMH3TbY8RffpN1mloONr72WfMFczbwv4yIyFyeA9e4OTHiAJKnw4XmJNwFZvK9
         noOxAa3VgV1xIXtmoB0QgHX8NLaHg+YgXWiVPzSGFuDOO8MRVktXNNZd0QvOUPjwVbCW
         ZrMSzFHuOtkmcChkRVwyevqeEt+wFWVAHc5W/Cw08fRTyjvT25n7HdAKK6ZSRUUI9cLP
         wcDw==
X-Forwarded-Encrypted: i=1; AJvYcCUjJEdVmygfGxt0gWWXXMxWEDBJH23H0bAw72T8W4fLYNZKpi9Rca/7100urJdr0RofNh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxR6BAFJHV7GB9BONQYFIqwE8LqgkcuIdpUjE2e+9jkq5vlJpbu
	0ftmZtgjg3Ik3bwRmveJPJ20+1q6tbZNbfLUocZ0LYzQGT9dy+NQ5XL/lkYuQmE=
X-Gm-Gg: ASbGncv4QvdJkV8D/jtcPZjbCfdAClqgIdvWQGPfkLuVWulTKWz1zVjBRJ4VIkLNZTd
	RlStlbsDj8pokoFYF+/CxR77bQEGuEVRpMFVIGxltVfjA4G4E4WZ0ts+UYvTUUGZ6wnPF8FZCqV
	Zk78QKgrKcXLedxSQExq+AiejGgEDFHSRPtfPraBgSV97AfAmCtV0D5s9VnraN53NODJZ3R3OYj
	1ar6yNBG0niKyUBn8ngdl1Hpp3w7dUuiFDrAHFW2PGb/nFrf8nIEqY2jkZdVUl3GBBY8Jwha0j4
	YAif/puvZpK2U8Z2nrm1tE1EjiQii3WdG1STtg1F74TFVA==
X-Google-Smtp-Source: AGHT+IF2SWjIDsKvaimdsUq5AY8I6ysaFyU1+v+YH4Hs4Tgz8lhC8r7Xmrl2RfHy+psFeGdbn3X1oA==
X-Received: by 2002:a17:907:948b:b0:aa5:427d:b101 with SMTP id a640c23a62f3a-aa601824277mr1086282766b.36.1733397582274;
        Thu, 05 Dec 2024 03:19:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:41 -0800 (PST)
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
Subject: [PATCH v5 00/20] Support spread spectrum clocking for i.MX8N PLLs
Date: Thu,  5 Dec 2024 12:17:35 +0100
Message-ID: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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

Version 5 adds only a few fixes to some patches, merely addressing
compilation errors and warnings raised by checkpatch, but otherwise
does not alter the structure of version 4.

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

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

Dario Binacchi (20):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
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
 drivers/clk/imx/clk-pll14xx.c                 | 126 ++++++++
 drivers/clk/imx/clk.c                         |  28 ++
 drivers/clk/imx/clk.h                         |  23 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  78 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  67 +++++
 include/dt-bindings/clock/imx8mp-clock.h      |  82 ++++-
 17 files changed, 1026 insertions(+), 234 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0

