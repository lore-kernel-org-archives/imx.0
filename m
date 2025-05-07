Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8605525F7B4
	for <imx@lists.linux.dev>; Wed,  7 May 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621342; cv=none; b=KSKi18l1PNjaCxmFPhMiFj9KGd6IUdNgVGyzugwK1KBUJ5XsykTU/mpO/cVGOo1TjzYwkEmqmcAwmvZ+4fg2afrMusC5uHqyjyvpIqZUaUnmOuyLza3TZFT3Ji0UksxSfn9xSf4ftfmbKll8DTXqYRyfNfGNyhRMvG70ljHbQDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621342; c=relaxed/simple;
	bh=W/jXllp7QKxqo10uYHex1yrZDnuxG/dHXbYSQf58jCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UfHi+FxDJnWmB9/obnRq+Gy0swCGt4h5oyY6Lf/PBEev/ioXQhsj0FWgNeySb9j6BS2FpTdJz+CORJUvE+RYL0490LAgSdBXq3RTRIawEk3h8PLf7olYnXvg1XDxOHZs5D2vwXIpOU2cTPvA1QkQ6SVT4ymYTRV07GvseDnX9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xb4Unu2Q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xb4Unu2Q"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so52086466b.0
        for <imx@lists.linux.dev>; Wed, 07 May 2025 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746621338; x=1747226138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWON9I4ameGxWiEKwkDziYc8iN3l6k5w6SWR59IgmyI=;
        b=xb4Unu2QVmn/WQDApSYcSA60gdQPOkT9hyC+rxQDPtDDcSMOF2VqvdM9tFjzkwkBz8
         8SDhNGvge9YY7325cKjQy8991OZfXHpvbjUsE9PfQ9ueNu671Ba+rGqLOUCSx8YLIkKG
         Kzw3jS/Gw4ZoeRjIcapu1TM5zDDvAzoqCTQ/6Ci7w+0BVSNPFO/4QHPZ86AAM8vtdLy7
         DArII8ytCMZ23BL/3s9IAKRN28QTVzPpfd3MpnnY2vjgMUJQIUj6c8lHtXa3SlTJhHCX
         C5J2vnCOctNWbN3y3QyzBFteSztJd6DUJJWg0JBIHMM2tdFEOwW3QRdH0nxj13ly1nZG
         AgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746621338; x=1747226138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWON9I4ameGxWiEKwkDziYc8iN3l6k5w6SWR59IgmyI=;
        b=jKvE4irVZ9Ws/4C4qdFgScKxALYm7GiTDh7G90bSD7dB63+Z8EfzLqx9maFesqLbco
         Z2x3IanpLqw2Z/jwDnco6Otj3Ar4udexez7OOkVH6GZSfLNk5jRF5JT8XA1Y6obvU19g
         L9rQDr/qJASpl+YR/eavNxtTG7UyeOLQFkE9zFnrJ2NQae4ncmPMUIvVlY52mFp/8vWV
         nqedL+J3PmocjXTDZF1aAjKazFzxpYdkO+noTxpT7cXkLzEF+5wa56LkiMdpRbWdEgUz
         Y1YBO0twuiGzVaI2TxBNYF+Qg9k21c7TV9nCoGP671VJubFiZknC+gSJng0a/hPHTGUf
         GQ6g==
X-Gm-Message-State: AOJu0YwzNI6XiT6Cu4o+dT/Sy/3H3R676p/yf/4sWdBBKz8fFllwHdfK
	RkM2nhxvCaeJfOvU0l3d6NKupsHSOzEO6rJ0DbK0stbkfedhRE8vYZIMwlydpVM=
X-Gm-Gg: ASbGncv+OPhAN/2EeW0Ss3hAJ2OQIGNnIvasrEzEuTAAtRqN+MXitr5dYBaNw/YfAeG
	mdWXl5GSzAiZxTWbJCIqWD4YYf1Zx/ELyQfZAhGDZZIjehtOmvmFaH3kCMHyGdIMAxGiF743wpI
	z7makk8TzFTuxoPFN5zgrybzZmARmqHPLQ1WVgKPpXbMpsmnornsLKqfrnPi9+9kDQOG/TcuQ8Z
	ldM8FHxAVBgD+xdStrDtfHNLQZvC9vieSKS9AWJvDuKDIrZn2Wl/0liReLQd50c0z0HBVrKekLK
	G6xDtzfDxepXK6Nt/ztvqnBvB+De8V86oi9OfSU=
X-Google-Smtp-Source: AGHT+IEMmTi4bmJFoUPDT0YBq0AgR9RZuiis3rxqwa+boAiz7GJ/sZbLrp/zC5X9/7Njxkr4VGX0Ww==
X-Received: by 2002:a17:907:6eaa:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-ad1e7830348mr370649066b.17.1746621337789;
        Wed, 07 May 2025 05:35:37 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f04absm897883966b.78.2025.05.07.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:35:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.16
Date: Wed,  7 May 2025 15:35:28 +0300
Message-Id: <20250507123528.585447-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.16

for you to fetch changes up to 6a55647af3334f1d935ece67de4a838a864b53fc:

  dt-bindings: clock: imx8m-clock: add PLLs (2025-05-05 10:48:56 +0300)

----------------------------------------------------------------
i.MX clock changes for 6.16

- Add video PLL clocks to both i.MX8MM and i.MX8MP
  while dropping the numeral suffix.
- Add imx_anatop_get_clk_hw helper
- Add anatop clock providers for i.MX8M[MNP]
- Drop ccm_ prefix from base in i.MX8MP clock provider
- Document bindings for PLLs in imx8m-clock schema

----------------------------------------------------------------
Dario Binacchi (11):
      dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
      clk: imx8mm: rename video_pll1 to video_pll
      dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
      clk: imx8mp: rename video_pll1 to video_pll
      dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
      clk: imx: add hw API imx_anatop_get_clk_hw
      clk: imx: add support for i.MX8MM anatop clock driver
      clk: imx: add support for i.MX8MN anatop clock driver
      clk: imx: add support for i.MX8MP anatop clock driver
      clk: imx8mp: rename ccm_base to base
      dt-bindings: clock: imx8m-clock: add PLLs

 .../bindings/clock/fsl,imx8m-anatop.yaml           |  53 +-
 .../devicetree/bindings/clock/imx8m-clock.yaml     |  27 +-
 drivers/clk/imx/Makefile                           |   6 +-
 drivers/clk/imx/clk-imx8mm-anatop.c                | 287 +++++++++
 drivers/clk/imx/clk-imx8mm.c                       | 262 ++++----
 drivers/clk/imx/clk-imx8mn-anatop.c                | 283 +++++++++
 drivers/clk/imx/clk-imx8mn.c                       | 183 +++---
 drivers/clk/imx/clk-imx8mp-anatop.c                | 306 ++++++++++
 drivers/clk/imx/clk-imx8mp.c                       | 672 ++++++++++-----------
 drivers/clk/imx/clk.c                              |  15 +
 drivers/clk/imx/clk.h                              |   2 +
 include/dt-bindings/clock/imx8mm-clock.h           |  76 ++-
 include/dt-bindings/clock/imx8mn-clock.h           |  64 ++
 include/dt-bindings/clock/imx8mp-clock.h           |  80 ++-
 14 files changed, 1711 insertions(+), 605 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c
