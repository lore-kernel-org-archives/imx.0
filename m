Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ECC34321E
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700106; cv=none; b=EhoKhHM/8MCdD6qwQC9J4iyNxNsPfbUUef4HELkUzpMq6dEt2BNbtFOgIpnZgY+DliI2f4bQYcfBMQueqZIlhmjL7HG0MMjmGlvEQCpEut8T8AYbn37+ANts5FdSXIdUMC8QSOcSrqU30Cwq+TKNj63NrO61H4dHEu9O+l1FDBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700106; c=relaxed/simple;
	bh=DzYhdD6dLeuq6gx9bQoxTIgwouCWI7ls/2GGuSYzyK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXQlRCtSc21LVYJ/mU3bFz/LOe91GUIMJHZXCR/cOlVMNil5wCVH6F6r/IaZmDmg3DcmYxFrTh9ZUlx6oOin7eSK6DLSpgSWPqOfzZ0+icE6OB5pp23dEqtN4S96dmM/VXDadilGSshaBwI78fWkU8rZ6zhhLDLpRRcKIJOTcZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBopUuMq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBopUuMq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b456d2dc440so276763366b.0
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700103; x=1761304903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uoOJKVjcja+pZfFrIKEYfKv+zueerFYrO1gT2duocao=;
        b=nBopUuMqDv7wRPaRrXxtQZCEkPRn1Cn6gemL8KcriaoRT0nRy8e4kdh6rvoIj4rh6T
         jJFtvOUeYYrmU+uzHwWlcUky7kup+ATkZ1vVSpGCkDYV3TQZT6zOFagcRjrJkDrFzgTQ
         SUJ+LA6fVlIJfKgFItaM4YpVuy6YLjYTyLJimnWJpxD42mFKlnwWcvBLAGxzjC40A6zO
         n+/EvGCpOrXQelkpankX5PVTyK8tXAwjqNXWG/OLsj2hWF6sSpJVv+1Hm0kUvorpx5eT
         bkju2/BSkcccPl7/KH73tMRsxxsdgs2Fl+3fHMglk/amtgeuLH+nNWz67hWOkqbmbRml
         72CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700103; x=1761304903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoOJKVjcja+pZfFrIKEYfKv+zueerFYrO1gT2duocao=;
        b=lD9Wi67ZUnCDZ9Cn5MwncPdMCVOTdeDYs2DTK/vR/jPErsisEst/GZCXjex5rJTkd6
         ObSRYxR5nMuCGlP7fy1JV7lKfxpTh80x5gUSiNcCOKpsgr4ZuwJQWzctMKyhmbxc5uwj
         W5qRS5zWunKVs4WFIWZ8TuSgO/LsmH7S5IefxfC3FEi9+k8SMhHSgiDKxGpbjsQIXMMP
         6899ExnV65t6vGBsVyv9/XZfkl59tCbZ1QceiaXkVmy18gWr7LBkawBcUVZnb+5AtaOr
         eoOMwXd7WUJAuUc0XtT/qlPpSGrpvKEcCei6qy+OL9OPhyqB98bOi9RFbduY8WNrg/wI
         Dzcg==
X-Forwarded-Encrypted: i=1; AJvYcCUjbSHjxxzuHTjj6MB11mLVnBq5WOYPQzRckvxSotXXymAEzfHgIp5yKcYM/B95VIErr5U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+WBnDt6dzZsdqgE3A6jb6Lqf/iy70oY4nQ2CYUVj+qNhJHqLA
	lOLHbJnYlyjM3eJfg5qnHAyOV2tOz+pd5Btd2vvXoGL9SJEnj4ChRaha
X-Gm-Gg: ASbGncuC3a21TTiIMaz7pe/emvKjs/mZ46S/pVZ/SckO7el/Ha0dmcHH1kev9kf1yqO
	J8AOz0pqbV0SoxfUVHASRl3E5O0V3Z8UJo2xDKHJpb3cs9jL0Droj1iA6zSSp0tVeFjbl6drLHc
	cPtou+d/mEIcnE5kcDwzICnG+WelXEEvfMNDaInhQQuF+nNokEeQ5kdZbaVjdmdPThsTtBqWMDY
	97w9ov9FtkHDKWfrt8+zBbuDCeA7ZK/KZXEU7FBp87KZGSxK6ctsJfbnjxFJ5jyQ70dlrH7hLBv
	FAnaN9fovKow9XtoV4tb+5QyhHlH6Plybq30mbBlRQnlU+6emVEs+tlo7lJZ4cOi6KB1K1OQMWU
	Z5AfJ8iiTmUj9ylK1NPucrxMusH4TrWB3sJ1hyeEkt5DIBUaE0akLje6Onw2jHbI8yimVcTNzla
	/6xuFRTl+9pQNf4dOumRQavWgqy16yVvkyIZMq0Ieg9ABEg7oe
X-Google-Smtp-Source: AGHT+IGFhQUxhV6SF10u6CZSFFpi31Ect63oJZfFFTLF//BzPbI6yY/eC/VY0xS8OHwPwrYiIx73tg==
X-Received: by 2002:a17:907:2d88:b0:b40:33ec:51de with SMTP id a640c23a62f3a-b6472b60651mr339169666b.8.1760700103306;
        Fri, 17 Oct 2025 04:21:43 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:42 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/8] Add support for i.MX8ULP's SIM LPAV
Date: Fri, 17 Oct 2025 04:20:17 -0700
Message-ID: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
LPAV subsystem, which offers clock gating, reset line
assertion/de-assertion, and various other misc. options.

This series adds support for the IP by introducing a new clock HW provider
driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
allow it to be used for i.MX8ULP's SIM LPAV as well.

This series is a spin-off from [1].

[1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/

---
Changes in v2:

* drop redundant description for "#clock-cells"/"#reset-cells" properties
  from binding
* make "mux-controller" and "#reset-cells" properties mandatory
* add "mux-controller" child to binding example node
* drop the compatiblity with syscon - this was never actually needed and
  it was done to allow using "mmio-mux", which requires a syscon parent
* modify the auxiliary reset driver to use regmap - this will allow the
  mux controller, clock control and reset control APIs to use the same
  spinlock
* rename "imx8ulp-reset-sim-lpav.h" to "fsl,imx8ulp-sim-lpav.h"
* drop the "IMX8ULP_CLK_SIM_LPAV_END" macro, which doesn't belong to the
  binding headers
* fix the values of "IMX8MP_AUDIOMIX_EARC_RESET_MASK" and
  "IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK", which were previously incorrect
* drop redundant macros from auxiliary reset driver - replace their
  occurrences with their values
* squash the binding-related macro additions into the binding patch
* add mux-controller child node to the sim_lpav node
* make the "gates" array static
* link to v1: https://lore.kernel.org/lkml/20250804155407.285353-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (8):
  reset: imx8mp-audiomix: Fix bad mask values
  dt-bindings: clock: document 8ULP's SIM LPAV
  clk: imx: add driver for imx8ulp's sim lpav
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  |  72 ++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  17 ++
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c        | 211 ++++++++++++++++++
 drivers/reset/reset-imx8mp-audiomix.c         | 174 +++++++++++----
 include/dt-bindings/clock/imx8ulp-clock.h     |   5 +
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  |  16 ++
 7 files changed, 453 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

-- 
2.43.0

