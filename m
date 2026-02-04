Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05127347FC3
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224732; cv=none; b=GfmBbs0uWYtj1mRWbvmUis4xsS2F3jOXfjfhxagD1zcNE/40eEpdp8hiG1vSWBbTla1kp+dlVg+Z/VlZBZKtX2e59QubCNUg2idlBN9yFe671OEKrJFuU+qcx224bF8XFVJ3ELhqTNcs/E7Ykvxr0jx2t9XVo6mLDk9U7nlW3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224732; c=relaxed/simple;
	bh=lleOIIrkEM6FB+pXJ1Razl4FkfUSxwLS7fdsMrD/1L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcBsvermvfYjmuJI7yRJV3JJwceK9dW6kS58ZHL2c95ARldKl+r7yPaDv5pq9juzMJ5zq4m3PriEVcX+0QuICJZwPCtJHcDu44sM+7CAl1zzIj+brMVo3X5NnIF0v3YipHZbUwhByB8m0on4JYlmTkPGCqXmKlWQmfdgLYWEAXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpwd7cof; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpwd7cof"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-482f2599980so379705e9.0
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 09:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770224730; x=1770829530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=kpwd7cofqXDjjQxUcdHqNTsMeg7qh4Pdo0N5aj462h6e6lDXm9HZLFWMmumIW6K2Ev
         D+yDpaiyAPpLLs5mh76W9bW5yQY3h0xIXhN2R8PKfgznHtbzCVSbx457RoSffQ80sFg8
         I2q4mVuxUVIFfawDs5AQF0WtYmqhuoX5YVvRLtLUU3pH3zaxQ3xK/wQ7ciTiTeu93/tI
         z0XS+DWIv9Qw4URArls/9dVXSmvkv+IK1gelLTtTaqcvQPzwYonIJAnVdZNtemHcv156
         T5zIBmaT2mZbiyYNe2ZpPvHX3GUACJyads/YdUVn/xSZmMCqRa3EKkIE01Y8aGs46Tit
         3LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224730; x=1770829530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=A0wX3B7842FLIAPMmzimK0okMmZRMRl1YUTf5NVwY89TTVu08nrVQo6jq2pq0uWpXP
         KLcYm9IANK2QTpjIkPAuK01jmD/xYb1xvoX4tcPw5iC9KSeQadFduSM6OlkK1qwLGsL9
         ED9yyOFxyFgZCNnY5VnPfQ252jkk7ANVhLQf3ySg9/OL6R02TqMtqhfLjwKesnY7uwI9
         UZDPJLTaV6gzFw0+LdbWC+Xa750OxoHWF5lPVeiC+GOBF05VnuRiD7C0ZmdmyhVuegS1
         fZ7UQA+chT+U2nFwZTgGNNSxw891kpdRkrrBhRyHRSgwpjHX9vNs1sulG8Schysw5xXE
         2Erw==
X-Forwarded-Encrypted: i=1; AJvYcCXiCGBYlKRXprA90xPWwmrJluoxAEcIXrbkF7m3dhhBy5OeWrjtJVfN+sFxXRVkI9KXG98=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdadYvOz+lvyeVao5wQ7Ic8XIgvvn7HxHHzZzSGc6gqBH2x/i0
	mabkdJlI2tgExjuc5/skIlz0LUwLZ+1XVoNVUToNCcLvC/OOWN39OuXw
X-Gm-Gg: AZuq6aKAd2/ql2YjyQ+HP9YXwC61HyJE4nNmdjdfvAu6h1ZxqKAIZxqonH8xrgjho4f
	WmEsVC6sBpIq6CsLPUGz4Cy4eWVk6hzTGpos3uQKk2BIfJjQouaNGgEzSLRRVMqASCzUJF0KD2c
	WS+w/P5Yu0aavA88gjo9VCB0bn+Dov/RZQjnRFrCTC+NgC64Gv/kJS7++JCYDHqnDrgVv6pwuvy
	sPGUAi6TfNOS0XhP5KF8Tnpq+BUXy+8S3iWJrLygxl+uTFQb5v2m2dcd9XkKnPTGE6FLRYpKRE/
	VqpJ6KdMyb64mMWWF7FGyTC67DRIXut+YHqPIGgo/hFxE0h1tMHZbGq+bbwJ4Gc26he592G1Gzo
	wCn8pRUMFzmXI6Q2IgbWn7ZK3a+w8qj2Gtc1Y1FPeLsymQ7o6UCVFyKcDe1IyboYyMLKscsx6n+
	Wq0Shjsi7HER4cf/zdyZeHaudPhz/+TuUMjg8xp42E90l/3Y19Ys1Fm6d6WnhE19fbx1cewr3v/
	vGfHjX1zDBTR29JO+iLyWjOxZYm
X-Received: by 2002:a05:600c:680a:b0:480:6c75:ddce with SMTP id 5b1f17b1804b1-4830e9a9b17mr51563435e9.33.1770224730178;
        Wed, 04 Feb 2026 09:05:30 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec10011sm38044465e9.0.2026.02.04.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:05:29 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Wed,  4 Feb 2026 18:03:53 +0100
Message-ID: <20260204170356.35169-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.47.3

