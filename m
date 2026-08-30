Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE513939A4
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105757; cv=none; b=tHKRGJxE4j8/VRMzyRz4PIljdCM6mmCBvYByn/41PnxmidpFc/q94g3+MBJRWb/fFlzMKhZY1mm75OLVfUaH3tbNEQEOlqFPJ8sGa1ylxW1NKqWZDq0KC4fDm8iPpDJHN9RoooWy2R8ZFCi8nb7U708HH8vwbPF3RANIVOWrr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105757; c=relaxed/simple;
	bh=5I7WZk9Likezcszkxm2f5VMiSja2ZVMFwssHq+M2D28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sc1koMyGNb0aM40sEI+B6LtA0j4WdiZG4gVfNoIXXltO8K4LB920MTEo9knrOZDP6eFpeL0rveIVCFVYcVgxCrhkWgc0139I3dOaLXUYraaLmZUfzP0cEae5vFNF+dt5IAaSiHhR8ZK05eR5xrLA0svbFUomivqkkN3anrAOBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUzOwAiS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUzOwAiS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8557c3f270eso1823941b3a.3
        for <imx@lists.linux.dev>; Sun, 30 Aug 2026 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105754; x=1788710554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=fUzOwAiS5+n4+J34uHefTQGPlzDgXeAdCaCS64enmhBTWZqxWzQfvM1WnDFfUg7yIN
         x931wU7z7C5PkPZsE5aT0K7EC1BNY4duDcDa1yJHeNSm1eceOlN6/FLGMctODrTI0DTS
         hkEJ2eR9o0AiTT0IpQRNOzdj1B7HOjlYuGHPTq8dof+RTtTVD8Xa4JvqAsZisO7ysxwP
         YTnxzwyPaq1ixpEuWICyH8C2M8migjS/Nv4u3+Q9S8DahcxPdNZzkWBd6nZDjtfTO9UA
         2cgb/L8PLM+Xq7maJ3agT/WdQ+LupIPIFUQMX0BX0ivHP0T3dh44pMEupNmNykGhk+L8
         kxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105754; x=1788710554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=gGN43U3FlGkUwYaOfr++V8SCBMJSXEhSaW8YLkDHaWq2jrYOcAA0gSfkonGa5/gjgH
         ShB+aiNxOjuOaxap8zZrQ4QKTcYAYCYQWxIVNGzFLkhoUpTAaf3vbPbhI4cKzf7vVutW
         twUV4NM6luKHwkYKALaq8iBj8vhbm92hrNFBOLnYh59Y7FtaA/Z8VZgwsyyjYdreZivY
         b3Wzyks6J/tFmeeadzOdDPOu3TLbTFq46gOspgt4XsU4lCI7PtejqUnkJpVwzpMrFaUg
         zOr8P5gm7U4ZI+2FZFsuuvqA/E6DLJV/eN5WnNrVsu7qlF9QFYGKhyxDfVl+/MnHcTem
         s5NQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzTWkPBu2yIhtFiLkEK3GgXJJpjmRiLR76+asp2H7+XaAPLJ+mhsxdilANvFrD94P/Kew=@lists.linux.dev
X-Gm-Message-State: AFuF++k9A3N6LqDBQzE1N403Sp6zEPRY9c90GH7dkaSUWIJqFXJQ8a+T
	LDiIzfKYtKaDkcdCHwIc5HTztVfC9C/0sv4ChEqJXzgbhXK9NTOK/on4
X-Gm-Gg: AR+sD13gg9OjJt4WSQJV7+7g/SfFrOw9Xe6YQA2Gx4Yk2JNSNE6SIDhsNFAZyEGfz3m
	tVTLhzd54WIGAtcXG7o/YSJPZ54OPWDBrk12WcNKdg9VZ6hXe3mF+FZzRHRyLr7BjgnHpJkOol0
	tl3clesro9eTQz2mnOY/5xeoxkxNNHm4sZFlUxMMrfhcgoCEGbEap/OqYRtexfKx/XBhdUpjPwr
	gS5OMWT7Q+tcC5DpACCic1Ngbv9g4MjwkeNpJfPZ53uziNmAuGyQclovNftGLo2g4DRkSdTBpgi
	bLRJeytvSfagwfv1V2HEknG/ghL165/e7p6eE+eXTCJuPVC02NhGJu0sLYmP/Fbb3eJ89AP6sg1
	HdlsffTS9E96dwHaSTstNAdcEH27fAsSQWFAMXYWy0u9ymkZ7OL39MuyWctUARggVzCMCZu7pQL
	mbcbvi9cWtYev4QAf3cvOSTCbmklTDEV2WXia0i3nAyWORgO+lGJYxzO/ooEU/OJcPdMLT0xZo8
	UfXGPaEt9kK5K9yll9Ftur0IuMmocNmaE38uEo4f+CGUq3lysu6DQ==
X-Received: by 2002:a05:6a20:729b:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3d26615ece4mr29016741637.8.1788105754380;
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 0/5] fix and improve for Hi846
Date: Mon, 31 Aug 2026 00:00:20 +0800
Message-ID: <20260830160025.211384-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v6:
- Add link freq ctrl back (Sakari)
- Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
- Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
- Add link freq check in filter for v4l2_find_nearest_size_conditional().
- Link to v5: https://lore.kernel.org/linux-media/20260712115012.91600-1-mitltlatltl@gmail.com

Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: Fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: Fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 370 ++++++++++++++----
 2 files changed, 289 insertions(+), 83 deletions(-)

-- 
2.55.0

