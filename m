Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10A1FBCB9
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165010; cv=none; b=ppIA+QDFSFnLV2Mm6jZUp01U5/3pcKB6oVxM8y0kWk5UqF2wTkyvgyTwR1+/cIsqTNcLNJST/NGbyv0E/2OM1t5bYvgabvnbnJn9qACJEznoupjzIDtc/ffJfbqlEG5xK5VtOHislmGeh1tN9C66ujecxaxnRAcIc3YXity5pnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165010; c=relaxed/simple;
	bh=cSTaSEFNxDxO766u+g2scX6EoRBsJTeVLMz/j7PoO1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IrteGUkb6M+h45/F08TPMnKnyVyP4obuQF/zbrtP+DElyYM/XgOvUZbWmAyvBlnlgMrTdz2LvFxoXtj4J+Ew5yRMnFhL9+p7mYEwCgZl6/oHWxWUlfJbzLlDGOsjCEZQ32Omq5IIGQ1OQXG5zFJ5F4HT24YXuqucFY0/FZeHojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnkJKx2e; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnkJKx2e"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbc38adeb1so429561466b.1
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165007; x=1740769807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RCLtFgB40kh5NGeWf7eTgIwKvvdlHuGYWJTu9Fn9iQ=;
        b=ZnkJKx2eBdgqQWtaL8noEGqZgkf1y3QZjY2lRiJD2yVWBn6o0numRq9k7IKO37KkIs
         +fXjN8r5wcRK/wpG3s1egD06vUO1Jvkd1T7Yc/YxoGCqFLSCdWHd+dvd1mrCl1OeWluz
         USPWjQx49IYEJWShYu45ps7o7W4DCWhNVT74hAmyOcbY9FviQMJrnkjHTGYitIdB+t35
         q7FldsZ8v3/aaI3jtyJZZKzsW2mWe/PwSUXet//4gYVz8h8qhgP29bzzYFv7PfWPxHei
         XCfjuy41pgmaxRYCcaDzIBAbF9dr3D+NZjmeV6R4ucN9DWrbcwTJ2/DrQVlg0JxchVg9
         1NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165007; x=1740769807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RCLtFgB40kh5NGeWf7eTgIwKvvdlHuGYWJTu9Fn9iQ=;
        b=bDED9U/VY60GEQYIJ9BfJNrJrFVEc8gfpaxJ9JXY+mdOisaTojawQkFEyNPDAY10A5
         AfBDLW4BEgcouYM2xEcJAUtUUuU45yHmJL2usTi8q6oKmfA2BgJbnpB9Dr0G4LKV/Dvl
         Hm9J2kdPF6UYWws+Pqr5RNNNCddkCyhHdnmXkRkcXr/x5BRvNtDuSrmI6KhyFBYHd10N
         a1XB5UND4oOztRIl4RnLCzk/xZMy37tNQ9BOEdR9tnHyynZyt6WoUYBC5XIKB5r9zoDC
         00CGY2QBJi4pYPxENpo5dZ7+N4ZzYAa946onvBqLEeRY2cOeBoH7UXyqBUs10cnxC3Wh
         PL2A==
X-Forwarded-Encrypted: i=1; AJvYcCVHlPO4Tu2ISTJR8vXTFRHJBnZwkHMmDJYzSE4xw6gGzlHHe8X2G3B5Z5ArDoUKDxGvodU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5V7JNiw6SL9Yo2AQSdOjnbfIaV7dzsBfySZRxQDrxm9fqQSoG
	FIs117zFpE1YQ3DkpXlRnQp3jxUQh8FxxHufiI8pWeVeyosbHb55
X-Gm-Gg: ASbGncv73Tm8b7im0WEyO96eZW4s6XbokKoh/ymwvh0YZtN+hxNa2e0MIyNj1U5jfgo
	OJtylIHETX2E2tVwWFI9Q8K+qvxgcm5hGJnAw4EJSTP+xuZqpuf5WPQS2rAKbNAeRI9yWNXN/cE
	fo25SBZi63l1Y623T2WknAzEBUHBAWy3UQbHovk/qMBb8glDB6Ne+YPZYj3p/mwCMQsd1hsUmUr
	CUOozW8/MHcIDsUQpQj3tX6avFrI+PN/P8QADxyN7D/B/yZn+9E8/5oyOzbnIPOhLAd83vxM39B
	v7+nFRsgoLlNvGOu0DopfxCQrM54h70bX0XCNJQCqf0qAjCbbrjwJTXLJO4=
X-Google-Smtp-Source: AGHT+IFpUclfl3GP+JTSRxwBFyvgILom2sf5gyrQlkLG8A1WEQOIo0TKJpX4cHGGPDFAFepHADJp5w==
X-Received: by 2002:a17:907:d9f:b0:ab7:66d3:bc88 with SMTP id a640c23a62f3a-abc09e459famr488105666b.52.1740165006472;
        Fri, 21 Feb 2025 11:10:06 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:06 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Date: Fri, 21 Feb 2025 14:09:25 -0500
Message-Id: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
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

