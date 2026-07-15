Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7BB443E30
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142566; cv=none; b=RItlrGWUgDBx0Gee1rKPqajI2OByo5uZl7Zukc+Q1IunHFk7sSXKfMpjfshYKA8W4phkh6a3cUj47Rz/Op0I0meu5rvJWdThXs5cW6tG8UII8IYLBu+tgKznOmmdXnk15hxRH0J3Vz5/f5KBNkWlsYFmidBn562S9+cVJEXF0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142566; c=relaxed/simple;
	bh=AKvUmloDNtBO9wH3Im5q723OgIiJ5619HSc1Z9IPeAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNsBiLJWsMZMWIIKF9OeWxhdgz+C4Ho5FKRAsvf37r4CKYgNOqidSzRfBQKJ6b1KOAORuwHcVglm69tsX+lg9uK/Ds/caBHlokONXh9U8MGjv3NcEvN/2vsbjgXWAtOpcu7mJX0BEE5adBbFkAHYgmoY8vXHCSfxqV5EOjB2xLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5fltOPm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5fltOPm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so23499385e9.3
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142553; x=1784747353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVte+qBFAiblhyzUMBEEPT044OiLyJRnPNqnE57mdqs=;
        b=H5fltOPmVM5tjhTOHjs0y6rxEZWW3rawYNSw9XAIcQ3yBHR+NBhWbFMQE3BYKsfLGs
         NjI9uGPXlIIJGQr6CxOFXY5ihTTr/VzV2F6OAERKYyv/FU6UCfIW92/LZonQ80D7zh1X
         pPB3oGAwnOpgXkc+40lXieJwo1dbf486lI/AR9lWa2ixmMSs3H8fr1kpCSw5w+Bs7O4w
         o8vA0IevuAFaUDErp0WAuid05iMMNWFGs8c/MM3itOKnqH+ATGBo7tro6eJKD6NkCTu5
         xZ7SNCXvUBoFUKit7W05LmUcN6wIBMqLVO5lI7CDDWbw8QGunOi7z8fR64cos0ZX2CCU
         SLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142553; x=1784747353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVte+qBFAiblhyzUMBEEPT044OiLyJRnPNqnE57mdqs=;
        b=llxJHmcMPHzM/x+2UgxzWdmkTQ3bG9iU4w3h9KjHN+Y3K+05iQrOz3VEgS1x6FUXtW
         gU5jaMuUltqNjpePiNHLmZcAhmIoffLVNKbpNEmOTTSdz3oZa4i0z43S+bee+8nwYHqJ
         tkp77YlHwcpRNVBmCMzjtZ7jl5Axs9OovFypFCeczy+4su7vWaMxpxSkBtnkIQ7xavv9
         FdhT+iuaYkaDVL1TsF8AMwydV8Y3XNeDOi29AHmacWhdZ/ktO4I1jSS79UKkk2JiRj61
         jCsOMqXHkXdO4fKTF3K/kHShCOfGeXloS4D6bI8H2mr3z1nwfUpvbEtbI1lH+ibp8BKt
         FdTw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9u/84DJEEVxeVBswB80ERNFqqxwp0/evvb5zyGWuUFJrSrTXlKKxyAgAii/CbYH3uawc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0lVe6PYULMNyj07rBPqJkHR8A81GhJzarpnESbHc0uXsjNaJE
	+q5VyGUOfM+3z80+RwNU91quAfKK7Osm/j4QarxXHynN87OMx8okkJWQ
X-Gm-Gg: AfdE7cm4dzEpDKwKAEwYcJYGTQfEEs+q2Na7YLjoqn7k35YcfxCyDnkAuG5HyGczLaK
	YJTlmDGEyhd5IRL7fua7KPfyYHyqIaCilIJUWp88HTf2CezRvyULG0t8ml0dyOyf8fmprfKDeN6
	CAO6BEfwdT6MlrU9kbdEMMn0F/jFyV+yVU9c4kLIFrtRYQJDWAZkIZyEYEQZ6kNI8WrF0K0AWhi
	rsovs7ZXszVMtn8birPQZcYJX6WNKpy1l5jVh9OmNLMR8GP7XBfRU4gAL50KoRIorIgl+j08cMk
	vvbQ07JgJ3PaEe81sPJhH3cCDMs8oOYEmObmUuacl00P7fuvbu1WbQf02U+APFTHV7sK3/RGcb2
	ppqqhOLZYLtHkinlFIjte0vI477o04rGSjBjRvR4+jOzBrn22LWoyXUkiSRw3rK0stxLGpcKU+0
	2oX7PcCvLiw69/BB3T/FmetPxFkLGPDGxOyG2bhp5MyrxrCoC0JcF1vi1nFUo/dBu6bpbVvSnQf
	WB0Q9mc4UmRIX6I0RbB4PjLSolt4BqShbXV
X-Received: by 2002:a05:600c:19cb:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-4953c15d121mr46243825e9.11.1784142553147;
        Wed, 15 Jul 2026 12:09:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 21:09:06 +0200
Message-ID: <cover.1784142385.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 4 files changed, 1028 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3

