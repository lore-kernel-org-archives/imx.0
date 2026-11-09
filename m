Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227011;
	b=vj1qeJ8ltHizY2HVcexTCQzWKs5KpqGSiu+l1wkZqmLv5wFCwcurxCBIIDFB5zcudg87
	 mmRf1Wn64LWdUtFvI4/eU6a0br4+vgTcdJVSLn0CRrCepbqWDq+XKi+es9y2t4pzEB96G
	 GxsLyv2JybG5cFFi6A8r3KMGpoxfZbIgkG0UQLoHdotx+OSmMcU5qskU138T4sYt7yQA5
	 l/RGGru/LaWbEbTwBVeHStmXx+YLEfhJvWc24jxBSVXiJxXeRdczLRvRKQQ1FUiDTsjGU
	 9h1Lld62xYrpO6N4kHj95sGL3mQf0HubF2nyz7xFYY4JteicjBYWj5NXPcAbb5G5kyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
	b=r8AxS/aFTj/P+g9jycIsIBBlYVwbp9WPs4G5MT0dCBOX4JUp4FEZ54Y+fLtRHKRCaijV
	 +cYx9+OGABOf08ic4IG9xtvF5pEQgcgoGoUfjjCaEo8VaXyD5sBCeXIrHfmR9Cr2Mo+S3
	 aWyk5ahL2iM5LBPJ4lWuumGcJPfB7CJwxEdpuz9/vH7HcAYbYeYF+magHNz6OiJA0MVLk
	 h/91sfj+tFltbXC/Rp8kIWd6pzUTxzw/iHkTBxeZM+W/o2VjK67IMehNCmBh1zyZ4yOKM
	 +FNtNrovxz5b5gZqm9nvB7ghqk5hUvQcX+L25H82KrxvwR4UOVB9B5fwofupW5D127Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tRioQZRP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95E606A33A
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 12:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE95E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tRioQZRP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5789335e9.0
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 04:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227007; x=1794831807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=tRioQZRPM7mboOSkoxLv9sTTWn/3mdIGJK35g2KTwWPzAXIlcYj4CPj6yhfZ3UuTJP
         6A9fRbJ5iXTmYQo3KErffmVZqLHok+gIPXOYyd9QyNilzQQAJqtmatktxyV+5BD02jB3
         LRI8i9v+TnCaPMlNfhn5zzNpw1xzUf44vFd6fTz1UpD6xSaN8+8G3nDvYLBebuvZd5RM
         IErBDBLwFT+eyv7+YoMDSIAAQyEhnxOW3RITWtbxJzmKgOrnuiKPBAu23pHAF+Tj3Wdl
         1RKXyvoUb6LTFlLko3YmfM9+10VGrrO1tmU7+nT2L7Al2ILmfTxCYhGps78XR/DqBnVM
         QRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227007; x=1794831807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=bh5Js3yyLEvX6M/dW90QVxHjFepcTWbUs3lTcmeKVXLVPOOq2XSm7N3sYOxTjH2sbU
         mmDuXq9mBfeQr5F8ijYvcdi5yDskjHEhhuNgT2mSB05n9DE0Sc0f8llh672B9a3h06F7
         gybN2EqPV/VMhPjo9S2zC09UcMgv7WAvcDFfApC/1Jva9yUBIjhwRZ1v4zVeGGbP4DF1
         84FvFLDUcFFtUGpyGQtwu6O92Y0t+3t5/s5MCWNqeJyAExw5IuZi4LimDbZkGOgBvDxJ
         0pU1BvSutJOvHq4u46jMZttOw3pVZhrz8WxtOAQYIa43W6vJztLL78lL0EE/z8YfxfwQ
         7isw==
X-Forwarded-Encrypted: i=1; AL+hErFC4p6uTAj2xXBI0t5xb6ZT9JGS4rQuhsM3SdrSWUIoWpzJo5bTYqCJ8p6nvfAJCHulWHM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+PrD2hQnD0eopV7ymBwroGbXh/f0zc6fGWGpZTCEEX28SjRLom
	zTsSSV2JQFIWwkMUNd6dujGcZziSZu5ZTqW0EjL7NSbJFHDxAiG95nj0sBfMk7Kvhls=
X-Gm-Gg: AYBFou2chL9Fhy8YY0xbLMLksywcWf0DB4iai1AxdjsTT+cDHyGr9DOUC6yd/IDBIZn
	MEBVyY2MJQFEz3RInCNy3n46zZaUFchin+Vkke505G8VJDhgIcoDnAIQDlKL9ahlgHqomBUGMTc
	+5YRenPzuMztxwQje+wUs3OcvJEhICGibq6Cis5d4p5UwqczybgFArvBzT4kxLu1/08VRh5cEeN
	yOFOK1ve8/J9vEjzkagnFFaav+Hyk6TRh+8Xyu7orFTHI/EM1rnzW1/sJQ0klOGE86beBAXlq5g
	a0NdBRBSAqpCJtSd+9MazIt1wtLTtbT+Un6zpHyWd1kfPNbAv/KIJBcv+aY734OCt0dbh/8Fgaq
	+mhFr0urwAy7IkaY5UMAbE1eHrNAqUC1Q/JA0vBN/EJO0HdZhOu934KtYgV/FVbX9FtSNq6ORpt
	XO9vJP4KtW6QZPrBlDGQjwciqCmbV4HmIwVQ7QS4UscNdjuC7McdD1piDk6q1lDj+jjpPWq7vuo
	5MKcc4aoPT+nxdMaS5cKbaD6x/2PeQq5o10RVlJQk0QnyHoUg1p2larR74VBk5nlM9TB38OzWnd
	gbuk1g6AIOH9iIU8j4+b/J0TI+P64e/TlL9DO6EH02ndAwBUUtJVrrN3PWjr6hmOu4Ry1uEJMG5
	cCCaRFzwTpA==
X-Received: by 2002:a05:600c:1d05:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4b963c7585cmr73754505e9.26.1794227006810;
        Mon, 09 Nov 2026 04:23:26 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:25 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Mon,  9 Nov 2026 13:22:45 +0100
Message-ID: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the carrier boards byteDEVKIT v1.0 and v2.0[cite: 59, 60].
It also adds display support for the integrated Youritech ILI9806E
MIPI-DSI panel by extending the existing ILI9806E panel driver[cite: 56, 57].

Overview of the series:
- Patch 1: Documents the vendor prefix for Youritech and adds the compatible
  string to the Ilitek ILI9806E panel binding[cite: 56].
- Patch 2: Extends the ILI9806E core and DSI driver with init sequence,
  display timings, burst mode, and supplies for the Youritech panel[cite: 57].
- Patch 3: Adds the MIPI-DSI controller node and the bidirectional OF-graph
  link to the LCDIF in imx93.dtsi[cite: 58].
- Patch 4: Documents the bytesatwork vendor prefix and DT bindings in fsl.yaml
  for the byteENGINE and byteDEVKIT platforms[cite: 59].
- Patch 5: Adds the Devicetrees for the byteENGINE SoM and byteDEVKIT v1.0/v2.0
  carrier boards[cite: 60].

Subsystem / Merging notes:
Patches 1 and 2 target the DRM subsystem (dri-devel / drm-misc)[cite: 56, 57].
Patches 3, 4, and 5 target the Freescale/ARM SoC tree (Shawn Guo)[cite: 58, 59, 60].
They are submitted together to provide full context for the hardware support.

Testing:
- Validated on physical hardware (bytesatwork byteDEVKIT v1.0 and v2.0).
- Passed `make dt_binding_check` without warnings[cite: 56, 59].
- Passed `make CHECK_DTBS=y` for both target DTBs[cite: 60].
- Passed `./scripts/checkpatch.pl` on all patches[cite: 56, 57, 58, 59, 60].

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
  drm/panel: ilitek-ili9806e: Add support for Youritech ILI9806E panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |  12 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile                        |   2 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts       | 459 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts       | 441 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 11 files changed, 1321 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
