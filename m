Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B91F8AE3
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339827; cv=none; b=UZz/DLlvKZ9dVajD2uGAICeUHB6snwJdDHgcuk0m0IBSLCEURIrQconfVCOUbqUjYxpc4iQ3diVqpkjSNqUwpQEAyTB4fdib4dEfbMWmkM0W7auYUI0KphebQLu+MVtZo77f5AAz45gqrbCo2vVLt6zDyNTnkfOzdEM654iyzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339827; c=relaxed/simple;
	bh=CDf9a2m0imE6fmCPPuDkE3P+yBsJZwYlK7mp2qPDVJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bn0CjJJ4hZ2aoxmtJJR4pwmaxxxpDCWpQz76Jjsqm7njAv82i5lQdjPs/HEPkvjEORUiIYo0T8vCGem1ztAtRHtE8EBQuaWhFqwhFXFFDIyNYxT3pVgFWUw57jOCiLfS1WFub0VeDSPUJR8pwLbadZJInfj4JaKEBhZuhdwAFUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CEoCebKW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEoCebKW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso5130075e9.1
        for <imx@lists.linux.dev>; Wed, 08 Jan 2025 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736339823; x=1736944623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0I9+VC2uPEBNPBTJjj9DiA9XkKjLM+nkrhkEM/H4bW8=;
        b=CEoCebKWLTa7XMibfESellOJ9MPksuNdxC4nOW0acDDZJVp/H0bwXk9oKT2D2mNeV9
         X7+SO1bUBLfZLBFiDS6IAcfMC0YIEEIV2iPKJPiUA1PHQpH/+jzDntTtzOE9egwJefEQ
         XizqjjXuxvPGsMpHVnnO4LJzPfOZ7X+9+BXHaNAT+CM4mqS3U1wG2haaguIp1qssgrET
         HL247rLsFN1Mg5NPWyiL4hRq/EF+QdS9MwfYfoE3CrIns1XYHQoiE57AWwsCH3sORdht
         yPRTGb6KlGsdsiyNxNZEP80kWS6zFNp7ALO1puAjllp3c4SUX/4MMGUbqJLhD4zwMOi5
         Q9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339823; x=1736944623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I9+VC2uPEBNPBTJjj9DiA9XkKjLM+nkrhkEM/H4bW8=;
        b=nZgpC7Xcmiplmz5qUUGhWL+eOiArM39fePUW2bNrWukqPYHiCO+znUcX4o40lwIg0Q
         KIY2uLRTQq6gO5Tu828Y63NR52b2cYEYuOu/NVb7A71/xjz8CVOHZwJVmLGAFwdQBPTk
         RlCIxvuV50X9a2HX601mBSQqCN/C5c/ToIyuTWj6mAhCUqkPBzvK7iy3/cc+ELybI5au
         qdfdPT7p08hUF87PAJubt+Qb8mw7WI5x0kefPs/axf9/rNPN3M8raM/ASi35bLgPrVsU
         ivE9QwM0L0lU2NuB7N3US2jWTSgytwh1aC0RQzQqqJhqdiVE0jQsgRKlzAvg9v7VeSOb
         Bx3Q==
X-Gm-Message-State: AOJu0YwVDsnQ4GIt/3STFwIEaGkT8vJIo7t/KI2qCWevIdYrsFyLba9g
	ENz2zrs/9PFZ1rD2VnMPQb06KyDmKD0RszmBPO13DZcJnoZn42x2LyNX1N5DOzQ=
X-Gm-Gg: ASbGncurYjKHSaZcTYcfNdwxaZUAU70eMyiyXPtgPw391VvLOLC9atk872woIQ105ZP
	0smIVdHT+zRK4Oxas+GP3aiECnJ6wnGykIsvRpaw+WuxIp98IdO/54M5FXv9Oaz77pTIw2h1ry+
	n0b/p7QGKQ9I5s7cZCxWM9iL4YpWWbZ3cl0GSlLqh9qyErQl1fFhbsgJWw9/R4fM4KV2F0vnw8s
	wjdPG1FgPCG/CxY55DUTVDUR9cv2g+JjxmzwoqdhjcYwrtgt7ZLyYR1
X-Google-Smtp-Source: AGHT+IG7/5cPf2PXps78wifVaZOeskzey0wLtVNJQ9pTQA6HY4831o/cwKfWew1xSu4tBYNeqfjruw==
X-Received: by 2002:a05:600c:a03:b0:434:f3d8:62db with SMTP id 5b1f17b1804b1-436e1dcad1amr22413055e9.2.1736339823091;
        Wed, 08 Jan 2025 04:37:03 -0800 (PST)
Received: from hackbox.lan ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e96365sm19377775e9.43.2025.01.08.04.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:37:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.14
Date: Wed,  8 Jan 2025 14:24:31 +0200
Message-Id: <20250108122431.3063396-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.14

for you to fetch changes up to 48806be086360846bb308c5ee21fcab8405a3da7:

  clk: imx: Apply some clks only for i.MX93 (2024-12-26 16:46:03 +0200)

----------------------------------------------------------------
i.MX clock changes for 6.14

- Fix the i.MX8MP clkout1/2 support by using sys_plln_out instead of
  sys_plln as parents
- Add 208 MHz and 416 MHz entries to the PLL1416x
- Fix the i.MX93 provider by adding the SPDIF IPG clock
- Fix the i.MX93 xcvr DT node clocks by using SPDIF IRP clock instead of
  BUS_WAKEUP
- Filter out LVDS, MIPI DSI, PXP, FLEXIO and MU clocks to i.MX93 only

----------------------------------------------------------------
Marek Vasut (2):
      clk: imx8mp: Fix clkout1/2 support
      clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x

Peng Fan (1):
      clk: imx: Apply some clks only for i.MX93

Shengjiu Wang (3):
      dt-bindings: clock: imx93: Add SPDIF IPG clk
      clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
      arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock

 arch/arm64/boot/dts/freescale/imx93.dtsi |  2 +-
 drivers/clk/imx/clk-imx8mp.c             |  5 +++--
 drivers/clk/imx/clk-imx93.c              | 32 +++++++++++++++++---------------
 drivers/clk/imx/clk-pll14xx.c            |  2 ++
 include/dt-bindings/clock/imx93-clock.h  |  1 +
 5 files changed, 24 insertions(+), 18 deletions(-)
