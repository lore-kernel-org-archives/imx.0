Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F124E4C3
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746160; cv=none; b=l6Rdsha1t3+IJwRcJ4hNfw9/amUlF++0n9hyUlTkgJbgzldGa3mSWVYyKv/psSPR74mTBcO/Pi8PtQc9YZz0bCgTXdFD+qOW8wgMzighrK5m2vHa5uTUmP15D+3KiBfs3uuQCq+JBKe1xSP3OX9p5FRmjxKKUQljIUvqT3not2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746160; c=relaxed/simple;
	bh=sHPEcCDYogiAcXc5LYqps5Dm5uc9aiRfkvHMbT9kJm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTreKqkdM0H4PVP9NVLqiR0O8FR8zySlfLYC6BznB9IkfW+rdBkwHWNnW6WmQwhwfesFdxRLDrn2Gq/NQhscPX37GidR3nsEiLiXoCkZWYDGWXiTor+5g9dJB5bLPQE6ETwQYtHss6J9gqXAoOxDXq+Qjp6ZWkjWPRM4l4d+Zcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tf5ykY8S; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tf5ykY8S"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7042e50899so165018266b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746157; x=1762350957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3O1Iu/ksHRGyZsz6LMTY3M2UTA+pLqkjIUkkgFcc18=;
        b=Tf5ykY8Sf3SUzKg7Oswh8mNOjjUb09AMNkKErOB+MnQ3TEV1zyKWKIztMR6/BORu3d
         xrf4ekKtPC7b6O2eciBfhW9i4n3kzOUiV+8/Y6KXIiKUwwjxU5boLyTm6Rj5X9+5VNt1
         z5EzHj3fBnKvMI1aJgTX4L/1Qn162dg0EnhLzh5bX61+799HjdGN5bJSnCa7vsQCZYbl
         35S9jx1pAiCni/p2MCtnV9xiRUhbbf5XrD9OFyOlaMdgMZjNnJCBd+a8XlffMl9Ijs6O
         D0RjHNZBHUThBrsG8geoqQySftGtjF6TYEY/Eq0gVbhqEwYURaPGNANKR04yuiWhVGxK
         28kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746157; x=1762350957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3O1Iu/ksHRGyZsz6LMTY3M2UTA+pLqkjIUkkgFcc18=;
        b=EgyfcbsetBzrRvwS24DsM6aP5C8c7yO87IRFx6tG1bctxxtuSGR/bDU7CamAX9dHhk
         7nw1IGvmKGLEeeRP3C4CLDcE9RLugmZgRAGcd8d3L1l6YsSYILlIa1BlSAKPyM9cQA5t
         ZcnKDZvSWvv2RrJLpKPl2AVE/k0UY28jfnW6EVMPxr66LBe5IgnJp6QjJUCokkzVk3SN
         dwemk7BIl3+Y/ias6jDDkGS+Vw4zbctIcT/DVdlx7fvgDiZ7gUhTS6U1Dy799I/9uAQR
         4r/tBMG4+LZGZJZxYJwNd9n33YM3lTGPrGg37S/X7gQg4Hta2VqrsYyXtLIb38YSpS7X
         Isbw==
X-Forwarded-Encrypted: i=1; AJvYcCUVJ7mo61nZ+Q7pIuwzKHq7eJ34WPv1ellylKqpOq5tXu2+y+hOhfU2g+Qj5JSuVbVJUbs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywre5tT95B5i2MqBUnbkI3/Wp+VMFdqRA7L8uf03H4MnJ3zerEy
	ARbRxCxav89MtXPn3/U5LRvCaI4j7NGFkF7ney6KWORBPKNooo0oJ8j0
X-Gm-Gg: ASbGncu3D7SKPSJd69TgVUswG/FqUL/m6OE3N+woZLTNeMW0nX4M1T+KC5Ml12SFI8C
	OchpCeXt/ylNyUCE+QZ3xJEn+P7Sbv6boYOHj3vl/G++5V7vZkWJB71QAn8zBEyh6aj1MGlAFtZ
	g/UrRhIze5a8Zz27Wj1HdNml1oSQcLCkk9/pzgEUpxInoL8Wre1Ef2yvkerR1SWBQmZ+aMuMSyH
	GDl5vsByl/SDB9K3D8Hc1zxD2kfEL2FD4514sFHV9TP39kkXRcR1+xTjbpAwvpasSNcwgruJBLz
	zGoad8w7LNoZx6lsgzbIEOJ+WdvjxgCtPcElhXV+7Nvn302xqJpURdTksLx4f90J9t0oU80+5sp
	BPZw+73blvA/1HLKHqdirPVFnaTj7C092hw2HrUdeccIDNHg6KDElpmndGA/AlP+HPCqMoSrUId
	jI5CkStxvbaZthoenE38Zk3W6U1w==
X-Google-Smtp-Source: AGHT+IG3fjXdxPy5yprhsiCpSi+P154WFnEbny0GwxKhkE7eZydOCcZ5Zo9k8sLJC5ZAu8sCW+HiNg==
X-Received: by 2002:a17:906:ee8b:b0:b45:913d:f523 with SMTP id a640c23a62f3a-b703d2fe6ffmr341163266b.18.1761746157108;
        Wed, 29 Oct 2025 06:55:57 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:55:56 -0700 (PDT)
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
Subject: [PATCH v3 0/8] Add support for i.MX8ULP's SIM LPAV
Date: Wed, 29 Oct 2025 06:52:21 -0700
Message-ID: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
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
Changes in v3:

* rename "lpav_bus", "hifi_core", and "hifi_plat" to "bus", "core", "plat"
* don't assign the "name" field of "struct clk_parent_data". Previously, we
  were assigning the local parent name to this field, which wouldn't have
  worked anyways if, for whatever reason, the fallback mechanism would kick in.
* replace the whole auxiliary reset driver creation chunk by
  a single devm_auxiliary_device_create() call.
* replace the "shift" field from "struct imx8mp_reset_map" with the usage of
  ffs()
* shorten commit description for patch 6
* cast "id->driver_data" to "void *" instead of the previous
  "const struct imx8mp_reset_info *", which makes the line shorter.
* open question resulting from Peng Fan's comment on V2: how to access
  interconnect QoS registers? do we need to model the sim_lpav as an
  interconnect provider as well or is it fine to have another interconnect
  provider that references the sim_lpav node and accesses its registers
  via regmap (dev_get_regmap(), specifically, NOT syscon).
* link to v2: https://lore.kernel.org/lkml/20251017112025.11997-1-laurentiumihalcea111@gmail.com/

Changes in v2:

* drop redundant description for "#clock-cells"/"#reset-cells" properties
  from binding
* make "mux-controller" and "#reset-cells" properties mandatory
* add "mux-controller" child to binding example node
* drop the compatiblity with syscon - this was never actually needed and
  it was done to allow using "mmio-mux", which requires a syscon parent
* modify the auxiliary reset driver to use regmap - this will allow the
  mux controller, clock control and reset control APIs to use the same
  spinlock.
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

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  |  72 ++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  17 ++
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c        | 160 +++++++++++++++++
 drivers/reset/reset-imx8mp-audiomix.c         | 164 +++++++++++++-----
 include/dt-bindings/clock/imx8ulp-clock.h     |   5 +
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  |  16 ++
 7 files changed, 392 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

-- 
2.43.0

