Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104069;
	b=qDd1WazaWvb68CWYhhuFF1GxMbWzOFx6QpqgOirOyuMjuoBENJZ74K9MilibqOR9S0hq
	 gvK4RjHfcaw8MBhGSB6QctfLGfcwI4j90YuPlYqihyGYsWnsCTtGz0aGwcrCe9eUFB59h
	 +muxJvua9GUTGeRs6edqlFjt8Ng5U2ABRVCb5FJsl9ifVl4XLZnmr6ger6Y0p9rpUBo4K
	 slGFqBNA8qqd3puSSYfs/frZqw22UL0eeNgaM3x2EwiUA7/eoeBrv9onlF0eZXj6eB17g
	 PwuONJv1T3MDAb6iU8MCkdQJAESH0Es+welhq/rJ2nUjTspg421llQzDUyE8BfFAk9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
	b=JgHKO3Zcse8T6aE7YY3nR/Au8H5oDG20Y84V/tCdPVtKcdywi7eydjgOGcWB57c8oDMn
	 T5rOuiqKCXxkPYpgOFGPrdUHrYPey3ZR2zrDUNZTTUippwfhTMvmfZrxlARs1NJYnFJZG
	 Qh9E4HMwp4LD/0brCVmkuWMmvjvnh5UxrKFcaRFV4BGKAV/qEpkYv014pQv5u9G0qlApC
	 5rwHZhlP1xDhYWzEYcvXefJjtrT1pbO8AP5cGI862NUFXe+2y4Pkv4tPVIJhdmlTvM62U
	 kXLH0FcUDvdDVerxdT+f1kH0M/IfEoG6ZUooB7mld9LPwHzp7+ASTXwAbLGlSOQCVaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1PYyHSF;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE7960A2602
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 16:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE7960A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1PYyHSF
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so25924705e9.0
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104067; x=1795708867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=h1PYyHSF4D29MtpfrybtBr5nB4FIUG399yN3THRyxkgwUe8dEe1ExvYUcBR9WDL9Nv
         UrlUhCQRACIrJr7EA64xrkaSKaPlNS6HKdUaGxjL3aY55z1OcfJfC9CdpghJAVx3VMbp
         ahcxaxA3KEuyM1lT4+zLzKjPKZXP/hUihzvmD2vbF19G/3Xiwp7OtXeYy7KBTh3vYnmL
         3k77SJ/HKTU06cS+n0zT5cyIvLHUbzQWCoJXF+W2ny0f125YmD/Jq4RalPSgkeuKcM/U
         ieZWt/pH3CQFYAdEkgboudLufrc22uXFiOSfSVfib4giQY+5BvE2btWaMO8NnpDIA91z
         lKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104067; x=1795708867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=c2aDYg24Re90Z3lPHqTGrQtpjr74gGWZckQ1s7YyA+hVvwfpxmCYdFu0rW63XSNKT/
         VuDxIGc17kMD5hp20J9KK4AE+Xi/KAf6EPltX2KwjHF8d9LhbADjUUBfUHdgXPxQfjBq
         SEuvFZwV2UkANihdahuw8aKnTiinXEP70LtE4ckJJXKKqNPcch5ov5/Gs6poavw1J5qF
         WBVPimRktbWC7ek+nTZcCurq7jhz1J7e/s52qaP98n1t6lelndqIivSB9fpx4S/SIus6
         NZmXAKXl227lv0IUKL7iKzAsRD/YT0+FWdSWcZ/3/85xg+BpU9mjzClIq1Ffv+uT2ufK
         VS4Q==
X-Forwarded-Encrypted: i=1; AL+hErETcNCcQ9zdj0E5phMKQJK24CnmRE2hy4sfDkXxaxRT5UwwdkSR3r2/M7QC3apaQ7nVH8o=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Uh1f+tZtNPhEhqvZB5VjDwdL11F5PpRSD8IRSQWJvo7UxyQLe
	ouT1qeES4MI0VAbXjO2bPKklCDBeyF07utzZ9+VetBm07iT3nelfrTd3
X-Gm-Gg: AYBFou2Z0npNvvdCq2rJeQJrG1t6uEiIqnewdtuHLhC75Orb+aE8P5LyBLRAzGO+oMM
	9A6S4NlYvdfEmm/RI03ejdctdeFYSKzlQMOknjMePamRE5SJGf8R37si0sSNLAqlIG8Tic60p9P
	mMOjozWAOsF1ZlpJDxwS1iWprkkPGZRpsZRtiqs+ncJeIwtAiy8ksFzAlx7hVDBhf8pu4cb1KK1
	zlqIeJGM8p5fwWAkE8iPFV1Y3OAdCQpWJ9rGXes72y/iwTk8qeMjS7rMt2u0kQFP8ycFdGuX7p6
	Nw0a02N9Xm5cMTnHiHQ3MbWw17QinjAiMF/0MJTFgiyZNsXlKjmFNTn4VolfX8ahPkcI4AgBa/f
	CTqtVxASFE46rkkN/6ZkniD3Rpm13O60OQ5O0uvoRnccYAQliLWTW0VGWogWQaXPqKaoJ026jeq
	FmwCNuSSkl2dyOnfoiFvpyyohfBsSf+gDBWdOqxltGwwlZdySa64UX+ofuFYaIDzrkyAKX2e38+
	f1C7ToI/dN3e0s67Y3oeDNslwg0BGD9Q87u95gOH/if9snD+L19f5Hsc2hiQh7zWc0rNB2TwZdt
	+VpSFPrYXY03nx3K86dyTaEm1fNlC0+jf99fI7A4F7bC5bPe13OnYEYpXqgUcL1ySeNKgmoLbED
	9cQgso7sSkfc12KChwBccT3rLAUhgzLhRuIIulAl1m3Xie5aEi7qE/KI=
X-Received: by 2002:a05:600c:4f0d:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb7da2ba1bmr145169935e9.24.1795104066898;
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:52 +0100
Message-ID: <cover.1795103362.git.stefano.r@variscite.com>
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

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch extracts the existing DART-MX93 remoteproc configuration
into a common include without changing the resulting DTB. The second adds
the M33 variants, reserving the peripherals used by the firmware and
keeping dependent devices disabled. Remoteproc and MU1 are then enabled
only through the M33 overlays.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Validation used the remoteproc binding update and cebd1c0961d8
("dt-bindings: gpio: vf610: fix clock requirements per SoC"), which fixes
pre-existing GPIO schema errors. The base and M33 DTBs build and pass
schema validation.
No hardware testing was performed.

Stefano Radaelli (2):
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3

