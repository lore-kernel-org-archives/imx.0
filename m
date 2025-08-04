Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E80218AAF
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322908; cv=none; b=Nf0n0m7ztLhKHgZgGQaz3DPdJmAaW4NHHtjQYhEtTZOMPOn9ahUyjk6hgdWourj7FjOondaMdiVuiqiKQxMuwSZEi0FzYsHy5zhwR+aImYF0nwtgNAG5T82fpj/b136PIYdeN4/6pV3g1k1X9jqZoaqxqKAZ4znB7hkgFYCtX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322908; c=relaxed/simple;
	bh=0RInGftqr9XRMlJ/2LtTpF9XOnE5vTNAAeVp+UUujvo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PJJ2SQCSQjUKWjLeI31UqwUH+93l+M6SkiCIqbVYKOM8nG/y8LOEKfSu2dwatgBsXw22mFLc/U1AJCxmWWtiJkTAViUgtrefazZYEVI5LGFe77bN8UB8HQZcHJ1yuubJBg7yn8uBmep8ppG+OqbVSit8T/LH7xtH8mfIsh51t0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCBEht0d; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCBEht0d"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6152faff57eso8015373a12.1
        for <imx@lists.linux.dev>; Mon, 04 Aug 2025 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322905; x=1754927705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbOV3QZD0GW4oDlvtbd47RUfYokiKQ6TvK1Q7vUQ2Os=;
        b=PCBEht0dzlPEGbls0HvCK/z6XgzJki9cLUeFwP7QhT+SO55AmYf0PMYPsV3d47ZAtM
         yn9ouNepIz7vPlNjZZeGkXngDfFti6Uvb2g8srqx9dehDOGEx7Cdj1DPg4qb7zei/hZn
         qjJW+wMtArUrZNiJsJsq/6TmaJrXP4Lq3N9JyW4BBs+2sWnM1bLx9+rZDPhNcOPpLaRP
         n7fDTcFcK9tavYAVS339/CudANwU1pTgrepXZ53T2CHl6TImWzN282bGo7tBv9qnZiqR
         TA8FgBEQMJM/VFWO6HVPLS1zzgOfY/IOHAeSLu7wgA4GjR2LTxj+VEFNKSMysfBSs2aW
         cFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322905; x=1754927705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbOV3QZD0GW4oDlvtbd47RUfYokiKQ6TvK1Q7vUQ2Os=;
        b=cxP2pnRxOcP8Og2O5jAY8EPUuqjdL1NVUA7pOxTc714sHLxdiz7yJc82/joXtC5BX4
         /o4s9L4O6QaetK/pfx2T69pP+FVvIWOWDlw37xwj8yXx63dAtEpRKoXXd34Nd+3/rzxX
         DZI1l5oURFTU6ay6wHMIyOc2WU5AswiDU5NAiGrQBYzaPPL3SR0dbLFqzMAyNgaCK+RY
         Ibta2KlRrddNNgIOKQworXndVLxquvSI1bk+qAnGykTwH2Xps9tbnhWsGQ3NE4rTDIOO
         XsZrM812PWPE5b0ED6FbQ2TKBFeAVwzufgztUOjvco1EFUWS5ebLmJs/dXqCphYtSElh
         7pyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAKjMfBiraiHw5DhLS2vCoJkB65tvI0YKdOGFWGQeUd78ni4Bb9oW/G7abmsZYtBIT76U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy58nNd9dPnEV6FhIirCrem0oBrdt26MXrj9mP6FK3VvUVwt2Rb
	9MYVlgnt+r5liU8z8izH6+2hMfFg0wUvLcTT0+J3Er6ZMxBn9ec4U8N6
X-Gm-Gg: ASbGncukHTz4NVTbwBGUOnsFwIU8R++Pavux9NG4dBu2Aw/cOKczIRaLajVKPnksBqW
	DVpPmwfJfA8myLlSLvEFiLvLbUH/2waIwHfTu0wB6eXfsLXUpGOeL8tYo0aEm8ybHtf3kyImZRg
	cvX98OalJ60T6wR5MRfNSV9YwcsNA2rStxQr8HLhz6k4Ym6JvUn73wcQXmfJuKjm3f8rBYTjfah
	xAaclpSMizLCMgL2faZzWfbrdwTdkvNx6eR3BElGtAEFkNa/V+IUMlKPRtavdl44qV5dvEETDnE
	kivzTqSLf8Y3VxBKZ08Vhx6IkORqYhJW0OLFCtbsqIO0HOi3ODGNQYoaxNMtFIeTe9lA32i/mnD
	Ni3YYXvLw4keBpbd4+EisdmJu0zZKAQCGFbrAdZL7ng1yKSwbfW49kbPg6oI=
X-Google-Smtp-Source: AGHT+IHyIOC79MxZuaH2TPvpwT3MuiubkEYDKGpSHW/WfHAFoajW6vgxXCNDRLPV71q+6lpnE/9g4Q==
X-Received: by 2002:a17:906:c147:b0:ae3:caba:2c07 with SMTP id a640c23a62f3a-af9400220ccmr1004902066b.18.1754322905163;
        Mon, 04 Aug 2025 08:55:05 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:04 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/7] Add support for i.MX8ULP's SIM LPAV
Date: Mon,  4 Aug 2025 11:54:00 -0400
Message-Id: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
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
allow it to be used for i.MX8ULP's SIM LPAV as well. Since the IP also has
MUX-ing capabilities, the DT node is marked as a syscon, therefore
allowing the usage of the MMIO MUX driver.

This series is a spin-off from [1].

[1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/

Laurentiu Mihalcea (7):
  dt-bindings: reset: imx8ulp: add SIM LPAV reset ID definitions
  dt-bindings: clock: imx8ulp: add SIM LPAV clock gate ID definitions
  dt-bindings: clock: document 8ULP's SIM LPAV
  clk: imx: add driver for imx8ulp's sim lpav
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  |  69 ++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  11 ++
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c        | 162 ++++++++++++++++++
 drivers/reset/reset-imx8mp-audiomix.c         |  63 ++++++-
 include/dt-bindings/clock/imx8ulp-clock.h     |   7 +
 .../reset/imx8ulp-reset-sim-lpav.h            |  16 ++
 7 files changed, 327 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h

-- 
2.34.1

