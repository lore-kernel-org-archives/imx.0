Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384790;
	b=dNTWWAzO0q0ZF4RJFb57FJjQoOTn0kjBmTbMmy8g4ToaISelFcrvhnpXnEuMlu3xqLRJ
	 TQzm3g7QVKxH1kWIl5KZrmizZpggZfWTNC1qOUyUsb8/Fljn5gRdw9yI7w4RjF2uvm/EQ
	 dpDJgAnI/ORR6Eyx2ZDgOKmid246Ryexm3EtrB++5q2YRM3F8NE1mdKZ/9k+cCC8LIfGb
	 ibfA0hSYY6itHCVOsOwEcN+XqMIgcNRb31kwFRoFg9CTIuwATTqTxyV602pCXfId/P03T
	 M8Zdi/odweWvQ/634FsXSfzFhiNewQe0LJ7b1LWCzZl53CmVKL4Raz4f1hmph53HkkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
	b=APOSPUxynQTZC9hxQQLvg3w52vzQmPko1FFBmXHBDXwMM7rfLxawHOpAlzLVL2j0hVZa
	 pRN6ZvEAIUlOuDDMXQWz+WPN/+WacRrtTZ/MNPqR0i3QMBvDXxQg4M8UAjFn7DPuw+m1l
	 59fNmd2Y9sKQJiiE+orxT02HXDly10gLX7myh+GpKpoJlnERzAA2v2+vl3Z4KoAd5fFWo
	 tbClNR7ANTmcdZJJenHN8xyIZ4xCDup4gWIhAVetE2RlqBYvsVQJqs1Z1yX5IP0LP06v5
	 FXsZFJ9aFSN/yiLdPRV6pqQSWQesoCmAYvrHHJ3z+ugSi7+m1BQFsMz/v/Pn84aMJQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q9V+X8Uw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64637606A324
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 08:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64637606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q9V+X8Uw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so32690745e9.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384786; x=1794989586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=Q9V+X8Uwdr5aoTiAzP99fpIwwHWHIxbC0JMefbV4BPCYhddZ7jZy+fPRfJ6MREXzs7
         Utb7BgZZ5cb5YyozZ8IrZ1kT9GNlH5ZECFc/DoWbnHmV0Nk4l7nGIvloSYiPK/xdeWjb
         biU3/yM53ACAuOluwZeGA2ErhSpoIGDKVcHGtnIA7dhpPJEv1/Jfh2i9FePwWiFZRjmb
         Ng5L4jOF+xbeWFG1t9Mhc1yi3aaLM4Fkg6nxndVnB0+V7WCOs8IscxoO7NwzpDFMfFDp
         4HsU+HmpTMF34FI9wkNEkxiNy27eAyNm98b3zgkJEzmVWKGmlIUIYnyIp2i1gzn7f1fF
         TJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384786; x=1794989586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=tpM7bEBMXh+e4eNRc76qY2cUh/b8Jnp+WTD14JDxzW8JxV6GZKL3OlstMYYDvluiY+
         X9gaaL4GyuaJ+JQpGULT3A3vudKvykdkvYVM/EnwbiZ/tFxCopfy9mULU5C9m1OdpdkM
         OuuqmrhV55FKKMCYAsimZrGuA3zyADYgHxYldxSFrWTcVtvREV409YkcH1Kpqzat87U3
         4KvZdXFs0PMNWSueo4CJ11WRGz30xtQQRY45nNuUPcD3bkrA5BkTGTZ/DfTlJU/Jsqa2
         Yd0oePab8radzm7aEkYWQu7vNn3nDbIO+1OQUAoQ0LICXttwOEVOy/TLTDgLshZ/YO6J
         /h8g==
X-Forwarded-Encrypted: i=1; AL+hErFSJ6792iMvMr0mTID/k9YUasUIYy6b39F1i1SfyKpSx52NNFESi5S6ASaKu9cIjFlWbmA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/XWpWBktZ/hm9VgU2WcRHooKckp1ocAWvPS602CDMefQqXswa+
	9Jv/nJY9UjYcejp3PRXukiHngkI3UqlCu0zmvqOrpRybhbTFDFkFrMXMH2pSLrhSth4=
X-Gm-Gg: AYBFou12UUmqZ/orDpf7y/C9tqCUGxrl4rOMXDM80CWrhP6yC0dpbHLV0kMhxkiOWz4
	GeZVl5Eu+uVtB+7TPgB3K4YRC/6/q7mZ8KU5pWQ9cb6LF9GJ1fNxjmjuaqWSoQ3HkqCDSkk4CXo
	6q9o0iuYnU252xFCeQ3DTHgq7PGtK3+2tDkUKbsoDl1IPgBKq+6IwFZgFRLlygQuxPlV0fjrpEK
	Pd6iCagtvgCM0zitfpLoT8J62UYF0ao0Z8eN2F1xwtiXcH0FEs+4zVlipeH9jttTSlwO9+3gzVO
	cBCW97/XxqhfgSMHMQgyOvezS0YzPDih/80DDonf5PaNNIouax07nioQGPOP0EAXBhbX78AgRUz
	FVkZpriKPRDlQ80an+GFokAeFTODqpfcArJk3dHp36F5RlUIKCmKyVuQX/MAor5hZZ7S8zP2Uot
	9xJCKyGrKXAIkW0dy16LqskOB88gbHcJykp4iNycGxdmIEryeUWcfSZ5pWIidnUsovb9FsbxadS
	eQ9LJCmkciLPfuDK6LQ5igELSdueWTbkeXU+KQaqQODjT/wTzzBwBo1a59lW6gGPUgDEjabQ5pf
	4CfIjk53RzHBTCyUKrGwnu6HN1fpEgwNxoorzer2MnPqqKB6Sr9/bQrnrLIzmQEKCmn+LUGDivY
	ykra09NRSsw==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr24681275e9.34.1794384786446;
        Wed, 11 Nov 2026 00:13:06 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:05 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Wed, 11 Nov 2026 09:11:45 +0100
Message-ID: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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
System on Module (SoM) and the carrier board byteDEVKIT.
It also adds display support for the integrated Youritech et050fw01-kt
MIPI-DSI panel by extending the existing ILI9806E panel driver.

Changes in v2:
- Patch 1:
  - Use specific panel part number (youritech,et050fw01-kt) instead of generic controller name.
  - Elaborate commit message with vendor description, panel resolution and dimensions.
- Patch 2:
  - Update compatible string and function names to match youritech,et050fw01-kt.
  - Fix commit subject formatting and commit message.
- Patch 3:
  - No changes.
- Patch 4:
  - Drop standalone SoM compatible entry from fsl.yaml (only bootable board combinations allowed).
  - Fix typo in commit message ("byteDEVKIT carrier board").
- Patch 5:
  - Update panel compatible string to youritech,et050fw01-kt.
  - Invert GT911 GPIO polarity to GPIO_ACTIVE_HIGH to fix address strapping and reset.
  - Assign pinctrl_usb2 to reg_usb2_vbus and add vbus-supply to usbotg2.
  - Add disable-over-current to usbotg1 and usbotg2.
  - Move panel reset GPIO into dedicated pinctrl_panel_reset group on panel@0.
  - Standardize Ethernet PHY node names to ethernet-phy@... and use tx-fifo-depth.
  - Replace underscores in pinctrl node names with hyphens.
  - Rename tca6418e node to generic gpio@34.
  - Consolidate devkit devicetrees into single imx93-bytedevkit.dts.

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
  drm/panel: ilitek-ili9806e: Add support for Youritech et050fw01-kt panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |   7 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   7 +
 arch/arm64/boot/dts/freescale/Makefile                        |   1 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts            | 449 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 10 files changed, 863 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
