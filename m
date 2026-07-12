Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC49B3A4267
	for <imx@lists.linux.dev>; Sun, 12 Jul 2026 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857117; cv=none; b=LL844/giJz97DHRqw3Yb16GQ2etiVLAM/LxVZqJig1pP18yG7yoy4TwjSQ77AYBePBr7JGUWEbruoQtn3fNvE0jUQpA38/2cBfk9Dqs+TBzJ3CuioYlQNThy4njCj/0aNdStyWNh8zICUuugGL3UFqltIqRwFhrxfduZ3ImdSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857117; c=relaxed/simple;
	bh=6+TZszz08ANN8+9ofoYjUJ5lkEzumu4XH0cVK7Cerfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXRRpHVOQxHw30zvHjsmf5Pyc/sk2d+mIa7jcgNXnvadr/L7NY+m4Jzl2t+ukRmy5OEjMRUA2lC1u05nosOqm/h84kT9dU1OSixTX58lzvGuEKsnFzVcIaEHW1jdgMeAXojU7ZO4940mqgqlVNCNzqNQNSGA7EcFnN3kDY3+Gbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AegjtIRw; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AegjtIRw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caf228a910so16598205ad.2
        for <imx@lists.linux.dev>; Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857115; x=1784461915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=AegjtIRwyOv/jkR66FeFhMMVCNzKYDeUjxS6OI3+RSul6JVSloNW/6i6uq3qp/y8g3
         Bsl9gZvv/coo/GALjEO8llZHQhYeVt+ed9/f3Z/Q1f9jPcMcgq5sDDieLpq4VBWESCRU
         Se9MNd8CvwWAQnzkRvcLdHbA9wkAyOHF64ug3fk1qY0nMi5H1FIS59eDGd9ZGbDS9pS+
         zDtv23bsbm4W6YdMuccJjLwqtlqDDDcrvyrkqioa5sD79XdFrJl4rcVkkB+969pFfl9J
         2dpfQLABgAd1TZNZnRYVnv/D88EA7h3SR+TZzqav4in3DiQ0KCDZDDbjP1+E4aZPVOBm
         01nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857115; x=1784461915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=M8QusArQHwDXHWngc78KMSIKLR8YLeFUDO+M2+oEW6Nnyp5KKaY9ps3H2xTXhQj99j
         1uTgz+HusMDexLlMTAkVww4MQm+QFeg3RYMP5N6TiCdZVzoQ9quV7oN2wmXWT2JWabTx
         52kgfA4EeAhO+HfOmc2qvntalSTu30moTdWN5lIpaE71fO0T4YijDKKdcQqLaWjOx/+4
         EX3i0BHQqUTSY56z+iNWp8rnmLJOvnNnaRkvx4SYxDRh+hpQkUqF6ZBhO8Tl+5QQZfaR
         u0Y82zQfDW0h3hnktZ92+jUSYR529sez++cOsxGzLSICmLP0Cdrdl/1O7g4B3aAQWSzK
         ndHA==
X-Forwarded-Encrypted: i=1; AHgh+RrUXpep9AZwqGheudwp4lt3yaGSlpltH11brvW5EZG9CPxrjE+nbuDNpWVmJxTa+kbSzQI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrorNsyQhama7FkukOGdXp30j3s5wVyQqocjZEUMSeey+f4x6y
	u15Wkv6mWEOjG4JzStPWX8kc9wV3BZqCNMWcQI0nxkOQMmoPPDfOEicD
X-Gm-Gg: AfdE7cnJgZutFllquVDdM6UYKJyj8NX/BvYB+wfeon5mZmsLugEe4Q97MEr8XRseXW5
	N/dv//L0oHnGoof1/iPrqa1CT+GAllIF9lzluagiQ0qauEEH5ExOJ/A1u3et90y/dbIkqGJY/Wu
	I8QeLeM3OMoEuC5VxhNmLQCJcG5xvC5sCytaYUZa8VDUpgLC8hciajFGeuHCtyMB8jjajKdTX1x
	1Co2Y0/6mImTghF2NUglfnWitDRDHiQEAlCgHLk1xyIwyNyPJT/laSM57Orgp75VKV6Z5Vd1ZR4
	1vUEeSpEQBJyHNCFS+WxJLulNqFLmi6n07/WiH8IMoJFnfM93QD68SyJMyqQ57ZxrCcDlLz19h2
	gS8HWPUTkkom+Xffr0Ffe6yuwtgcW/Xjm2aSgHajhUjLyGs0RBxbz0bAG3jrvQPI9oxCrB1CsRx
	SXHsHNSxZq45JdIXAkiS/gbnucF+oIAW5Ewx1SgQHcb6aTsij54A==
X-Received: by 2002:a17:903:4b47:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2ce9ee1890amr53777765ad.24.1783857115288;
        Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:51:54 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 0/5] fix and improve for Hi846
Date: Sun, 12 Jul 2026 19:50:07 +0800
Message-ID: <20260712115012.91600-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
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
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 296 +++++++++++++-----
 2 files changed, 227 insertions(+), 71 deletions(-)

-- 
2.54.0

