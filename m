Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F83563D6
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285714; cv=none; b=QMcnXQpJAGnONW2fCtQyxPFI1Va8LCgcSxVrjPjavBtMz2qRXWcCHyNHnF/FbF71ZuQ40q7Ag0se5AddHRTKm8HwVx/yrjv6ZTlY66PhFxiarmZc1SON7Ys1RtCucy0iFJvHK7QmnlU2+V0XcqWGF85ADUc9bksQoFZ3b8M1lBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285714; c=relaxed/simple;
	bh=lleOIIrkEM6FB+pXJ1Razl4FkfUSxwLS7fdsMrD/1L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e057SzPjgqDr9W7C8JFKLTHpXhk04SEz7tceFgJHxBJbjNQX0d7h1aBQoMbC23arhy61MrOtCT8oaYGjSUzGwamw8kp92k2QQYU26nSxf03hsnkK2/piPm3OqT5C6E6EAdvLBt1VfvFk9dJvSRuAiUhN4m+XKhoN/1jci70tgaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtrUsmgo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtrUsmgo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so519124f8f.0
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 02:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770285713; x=1770890513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=VtrUsmgov9guXXvkbGBX61Y6afJjH7s3uIWOrisgMGEWjD+aopVJgD0Txng4tUqCnu
         O+6ygfAgUa7l6aBPMMwYDS0ytx/3QYF1r8rVe9kVqD/TvG61blWob5nkxtnGj5wkG5sC
         BoOI8CuFxzzrRo4xRqQ7w4uZls3t1d+QJk7Sc9DzMZ2ZWM41e+wGkCqL96Khb3zjRBPK
         lN6zPXjol5lv2EID3VnODoiK7vc5t9yp1COnPiwA2g6PiLMPZrKRGq4yM7OjogWcC98D
         tjQnRO3tfush8tts0BlA3VbBIqFTWWv1tzZo6mQ+yEemfFz3kfBLWW9j5ikBUOj9Wm6u
         pBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285713; x=1770890513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=vmhU+6F7JRe5L3Djk7R9z15lLFgveH1ZCdJP+IizbkNidzH8tqdOkJST3cgJLDvD86
         +wlteyhcTSZEER5xSw7RfELgRRXFH7tUx8PLBRqcZ+9Uyk8GxnSZe3Rs7GVPESR6zIWy
         dT8xlLCTm6luCHrwcP5RtJ25b2YKm5BsXbaBTLk7oho3+WNcUjqHxClR4JFLX6T2OfF/
         vV0NKkYg6LDwpxNlmojwDXVcO43B4iUNo78k2jWel1YNRWF+g+X4qdLOsH3WqNcNGlty
         /kQlJWnUFtGnDZl+a0Uxf7AmPnYk52Hd3Ip4kDuEtC4Q8rHJBobMJNTLx+Zc4XMARu6S
         BW8g==
X-Forwarded-Encrypted: i=1; AJvYcCV0aLoeKeTtvw0U4qz3Phk9VHni2CjXEYdQ2ZgcFq5Bp//Jao09v3KBnrrMWwqpO9LXdxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz46+sb9yRmlNb02hhQ2CjP1UIp3ADJId11WKpxmfOUc9AV7KNG
	w9ER93k1tY8t2+Q48i+7OMA1vPOao67Ey0dNzYFcpPL95AqjqM93neu2
X-Gm-Gg: AZuq6aL80YsYjaI8+/XKC6WYIsXVc1FotLN2rhTThdGv9fG0buv9oJNKnX6DmfvkWfj
	ok2zeg+fF6rrlMCh7pqIWkjoOOTK+kCJ9cZosDJa1XoTYN5koMUqkWAPzgFX/1R9TMmWen6eku8
	h6pbGeZCfRqjThxd9xwt+Qs3TTLwbOlFMfCmi6UNxUfGJxq39y3K61yQvBN8INBdhSF3QHupZQS
	N1FkMxUrgBpTGZWV8vFKLdcJu8KHWAN9FOSwZLj6kQCpwU688uHW5VYV89M2Y0cQGFF5SFUxLSi
	hz0gXzU0syI4u+WKB2Uboi4dwSaPptNJMLiODBnEBtiuXdbdlvxMhQJ7TcCTtUBEYTU+ZjNHXCj
	wm1MdP2ZADewKVrltwdouPJIhcBZ5bKYRScEcXbzCaHyx5eK7ttMFloRZS4v/tgWJhgMCGhXnbX
	iXakv/eZwJ4lexTVVlDsCjS9dDi9Xd3jDEcaab71LOQwihNCmz4eF+R1G14+P5NQwMLNMne3N1W
	QWtPkmPqi7XHSrSFcxMCmUE+07/
X-Received: by 2002:a05:6000:2384:b0:435:a258:769 with SMTP id ffacd0b85a97d-436180627b8mr8506438f8f.59.1770285712565;
        Thu, 05 Feb 2026 02:01:52 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805fbc5sm12025466f8f.34.2026.02.05.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:01:52 -0800 (PST)
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
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Thu,  5 Feb 2026 11:01:22 +0100
Message-ID: <20260205100125.9095-1-stefano.r@variscite.com>
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

