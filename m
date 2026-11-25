Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594988;
	b=5bd6gTMhHKjFYbLVIB3YQ1RegijHA6ASHrL5Wbps3b2zZ+8TCbSXOY6rCg5aIJuvm1Nr
	 iZ7JYzlvvVKVCRoaHhN00wteRwVOd1GttGBvitx5lhMowb6j+9mqb/y951oFx+fpQ8USx
	 0Uv8CynN3oQka00cl6lcIJ9PIGRqeIM2op9ZI0ml8dbkfdHtsnJx6W5Dmr1cYK1HUh56l
	 uD0CfG2w4RJpgVhah3w0NEQUFP5eOiXBBYvjGCP53j0HZEuJAVZI+vcRjIgYa3JHhDNcd
	 c9b6MhUEPQkyI7NtJJNUNiZMVyhdbu7IoQ6MF2SxXDMJqzjOQnvz9dX3cMtVZ8Efj6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
	b=yH3qSi93NKHR0orf86k8RzwzMjYm9mf79a/5Y3LGf9PTYh3CgRC8cTndMCybGpDdZUUo
	 dQOddodKZBsL7R4uDYj/0Z+Rhr9TE5KWM5WcDfGhfb/ejBh0bty2Ci+zwLHqIT8mjM2X0
	 6JV28QE43i8sZoh4SxgofEzW5q80AF+Zodpy/Ky25Zbh+EQnWRjpnEk2a9fBdvoCCgUcO
	 rZpLKuaXk5XlmVArQ6vLcEQgB7ZzZgDou5x83yiVt4g48tPcWbrTrLE84PsG3Q2Ts2b6/
	 +2fTQPDqfVBZxQOlkbeJ51zHzPKdBPow/8xUGgwVcy1MNFUJ3IQlCQ6UdgjWFacKl0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpDk8Djy;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812A3606A681
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812A3606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpDk8Djy
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so10946405eec.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 00:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594987; x=1796199787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
        b=BpDk8DjyVGShBOtAkae0boYEkndjMTjm2gGv2zfD3oZzuf2xWNn67VT+nw+dpu+3Jn
         Huyr0HDl2fNL61qOxIu4hG0OIqVuZ+0P+vuro/wdKmNoTHyiReJHa/NSXqhBUmylVx94
         nPMqNeMVAHwGXhsvvaYeCyFVhZLkDkX3C7C0s/jlMebuS49gFKvK/of9M9RqubEIWlAD
         GKK2qqLOn8gdMP3Xvb5PssMeRimXuAOUuorbXiFr28QVlNTgox8hipO/gbN+3ACKpcDW
         k4n6AAdUAliYEkYxBJoUYjB6kSVKlK3HQQKcT/LY84lUmaqfCi7uIpw5f9KR5j/yXTOR
         6Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594988; x=1796199788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
        b=k26DyfopRvV9ijZ6z/ctvmawnQKFMnJlJFhujChaFcdKHPEXF2wBUEkibyBqJM7RX2
         xWck4szTD7glr9tEN00ULhBeFDycl4zy3EZJ7mXkBLpJqKXrUULvHpNIFpRGrnrQC6N/
         4W1mzPCFoP0t+1ziavoaT7Ga6xKd5UpJbvmNF3m4ImTGEtYbXKp3n+9w19zotyvffQcN
         gT084mmgBVs4X8g4yQnf1ghpM4v9PGdNVJIxgXbv3uwIaYlz2p+9PJb+MvjRdWtXJsxK
         C8Q3/BUdKQlFgiBPUEQXxSVxhKEfjPIZiEehhLJlCG9/rZTjDCVJXWjTepJF3oZbqFYi
         DEAA==
X-Gm-Message-State: APuU4Z/aUTI0SaDn9p+2xUgi7clQd59CfQv7RPmmDDC4A/lKdxXxkyB8
	1pSOwHUbGvLz6INixRxzLOBA+D48z7P74ycXJ3fqNNzcyqfMJGG77Q36
X-Gm-Gg: AZFdTZfyh/DbfhEWutsvwEENQr1ethLPX63+hoJUncR66TBEEF604HDFpcYVPy9z/iH
	/JuO9fk/r73Nj7A+2JOUV4X5scT7o9FZaNWMltAT4NNQOy/Mdd15olBWGjGvV9Bw7TWjnqu1ls0
	38YOQcE3c8wenWRlIOH4hawjsIdXtPBcRBp/+8C6dL9VX0LD0VRQxufBiei74DED02sSAFU8GKY
	MnA7KGCyIdwVO17sQN6MSD++fq+3ivHMAnVRIr/ox/5FRMbyGx9jmPySxjd7x6Dqa1pitFMiJpR
	DBMmFNFKrTTQSnG9Q9m7+NkAO0fvGtfVzmiwxKsWf0P7fbIebtbD8ITwYgJUCQqra/4L8PfJbKm
	K/Gui3e4Mj2YUKgVmlzWz5KEHH5uThz6LAondxwnEWNMmPRUFPRlwor4gSufuEHyM0yOGBEktiv
	tCbUPyowBffeU6JZGYHoL1k9BLWOQZFHiMvFiezRU5Ia6T1iOaFxezIJx9Xa+z8RaPjekR0ak18
	ylO7Tliifwcw/563iiSGGN6CNsqBP5c3vCtILBx7dBpHnNKPZX/quydQZu9agKJMK7gysas8hK3
	B913DJgDkW/jdeVWDuT3gvKxGjCPfijSafeTWekgn5IbU9r0QQyGFoL0czEp5ZTr3cbXCRa1
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr16776266eec.11.1795594987278;
        Wed, 25 Nov 2026 00:23:07 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:06 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 support
Date: Wed, 25 Nov 2026 13:52:19 +0530
Message-Id: <20261125082222.136238-1-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Add device tree support for the ADLINK LEC-iMX95 SMARC module with the I-Pi SMARC Plus carrier board.

The series adds the ADLINK vendor prefix, introduces the LEC-iMX95 board compatible, and adds the module and carrier device trees.

The module-level components and pin configuration are described in a common module DTSI, while the carrier-specific interfaces are enabled in the carrier DTS.

PHY interrupt properties are not included in this revision. PHY interrupt operation currently depends on U-Boot initializing the NETC power domain and leaving the PHY interrupt GPIOs pulled high at handoff. Mainline U-Boot does not yet perform this initialization, so the PHYs remain in polling mode, matching the approach used by the upstream NXP i.MX95 EVK device tree.

Changes in v3:
 - Add the ADLINK vendor prefix and place the board compatible in the appropriate location.
 - Move module-level devices and pinctrl configuration into the common module DTSI.
 - Keep carrier-specific interface configuration in the carrier DTS.
 - Consolidate the USB3 DWC3 reference.
 - Correct USDHC pinctrl configurations and high-speed pad settings.
 - Add PHY reset GPIOs.
 - Add WDOG3 and RTC aliases.
 - Move carrier-specific chosen and USB configuration to the carrier DTS.
 - Correct the carrier GPIO expander interrupt configuration.
 - Retain PHY polling mode until the required NETC/PHY interrupt initialization is available in mainline U-Boot.

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 147 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 631 ++++++++++++++++++
 5 files changed, 787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi


base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
-- 
2.25.1

