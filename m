Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985521C9E8
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588399; cv=none; b=bYqLwVHFdzSTz0od4eBw/JM3yKRx2LiYgim0LKrpGgGd1Hl+5+kbJ7I0GB4EHuZsb8gYbkxsgWoo6Mb0xT1zYPQAMbqI/EM8cPUmmdO2wWEXHS7wh5XciY/2/kbamyh0WT0yyZlRPJyI+hLc5IMOShibHOJGGcdSX34oBO1zCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588399; c=relaxed/simple;
	bh=PI9gat1Shjx3Rwg9Z+QfkzAqopCGWVbuaV2ByMujHLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NKUpjlj4pQRrAPv9stqOCY7O7UPxHRJKe2oWxMZU4GPtrAYlLyg+kUsOxYPtpp4VR+WYlxBUpYjPGzRx8rRdeTcjcSBk2Rw0UvAK6TAYfLi9AGFFVHJRqxbdfo1rxEG+hW/N0tcCsDdRGshTVPpkNVaBoQ/3bgSJ4Ym/pKjh1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEh+V5ew; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEh+V5ew"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so327795e9.0
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588396; x=1741193196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gn1jVpYNtqABB36v1CD74BC8OtMIG7ZKsW6uUkVb878=;
        b=BEh+V5ewpXpwz4S24C8GckTQEbmSq89CDfxWaz5rQBGJQ4Z0aNAG5PXFugPo5z8S1K
         tmqmKi7l4ObKR5Bx99wgZlfhhH7yD8RkZruGL8r1KkJp4dCuP6k9K3iTB8Fntvk3N3Cw
         BDiIbSgGXDudZZG7HXTvReYPymrV5zykwM39pKLQQJe/w5DQ79wCAJDZEqds4LkPOVq5
         xRJUi5tYmG9aBlQtqyec4pvCv5qDu6nllF8fu3zCRcGtcyMM8Jcp/vSUm3h8aJryvZfG
         kWGJc6YkCe/ee/53PKKEgVaLlMQ8JHZPnCqaKzmtXPLNCOpBU3mkoWnCtmjYsp7Vo/Mj
         +6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588396; x=1741193196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gn1jVpYNtqABB36v1CD74BC8OtMIG7ZKsW6uUkVb878=;
        b=VaXvD/thMP8DcMk0jlDSpW8idFQHhvemz7PdsW08dy/hY9EsywUFgCPP24ApgfEh0x
         jCLMWGHMWun3ltSZnx5ASgV3ogZKaK8OERGwY2fCtXhMNRpv9y/1f870ZgKw+ZjvgceJ
         9bi5kPC7JEZKO1nnBxY37+i66ZAUcqSKLUV7SgGGIUrxXhJFjfHchs2G0l94cPbzqqiY
         ervPXr/0pygDb3YQQkqqEvd3Ia5Qv/qiLYTg9bkmDQ2z6spK6dgVYd93XE/Mkag5LzP9
         3sEdHC1gFSC/WILognK3+SvffFoJcEa8mESJpeNjXjyat/YQkOqr75sGPi3H6bQKsIlS
         wlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW06lOMU7zfmPO1Yl7hH73oQKDt3nzFzI5t5aXmOoz10wHyPqQ4fG9kwY3ZxTDM6sUBPjg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTbcMOqXd9lk9/2Ww1cRAWm1Fb8P4joVoNoLGtD2IvIPiea1BX
	uKlKUa1lYCuV9edmVcPTzapDr2wbrJRH9ODOrPRdqe91BluSVuwU
X-Gm-Gg: ASbGncudScCkmWx/p3+e38PjQ4Dcz8MjQrWWYFNq59Kra+i4hYXiKgjVqjxvtICvgR/
	esSm3rIDbOICQAvzSY6+dyh5E6CQWG0mwhl3LBV3kTtAvBF0bU2BaXll0YrzxexwOQ1Oj4r8F1c
	LwmrYdwMLHaQnr03ibXcykaX1EfQzNgGfbUNxhTihsvBOwD6RaVVeLi8KWUQ6T82pZg4XdslWyI
	oQO0HRF62ln68U8z1pFKN/eST4OasuLRl8qW92VSnCimZE6cvAAnaMfmB/Gb33GUmGGY7cicb3G
	U6yYBV2eXMNEOMCx93oT9FTqUW84gMPocNaMMGH7hMENG6mjMmREZcvrAp0v2yRg
X-Google-Smtp-Source: AGHT+IHASu5EZyCMob3n+ZWyMrlOQTMJxxFYG7U17xiFzsRsj31Q08c/ZUItm4yM1mcyej2N52nKxg==
X-Received: by 2002:a05:600c:4689:b0:439:9f97:7d67 with SMTP id 5b1f17b1804b1-439aeb2c755mr223185145e9.16.1740588395267;
        Wed, 26 Feb 2025 08:46:35 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:34 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Date: Wed, 26 Feb 2025 11:45:09 -0500
Message-Id: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
400MHz.

---
Changes in v3:
* add missing Fixes tag for binding patch
* improve the commit message of the binding patch
* link to v2: https://lore.kernel.org/imx/20250221190929.31469-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* add Fixes tags
* add Iulia's R-b
* link to v1: https://lore.kernel.org/imx/20250217165718.74619-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (4):
  dt-bindings: clock: imx8mp: add axi clock
  clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
  arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
  arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz

 .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi              |  7 ++++---
 drivers/clk/imx/clk-imx8mp-audiomix.c                  |  6 +++---
 3 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.34.1

