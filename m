Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E910441600
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113699; cv=none; b=Vgg7qRjV6kFY/xYRQVbhRkSPBHLyJazfWhq//uKtDZx5WFK2bdURd7KwtY92JWbdYE7ZV3lu7yWfefMVCZzhNHxT/ECFpYezjPzVikHCQJkc3tEiG11YSPX4etYKs9v65IY5rv4+p4fLmZnqzT8rZ5Ugtv09OsvjcA4o25TtkUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113699; c=relaxed/simple;
	bh=mIRxksyS93er8MS1YlMb9+It8o4xTAy8Dz/Y5i+XNBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jVSEnT8AQORUarcRajpuGG/NZiOkHYJ+XcTTkO+1t2Z8cGf+EYNaRUAZ6qjYlVu2Gm2/xOlC58uB/DpBZxJT9Eme/71bJRadEbSEBjoTAtUJHMGwYUimgcfL6iIg1ZsM1TPfavfJMi/jsdJ8b6x/LUZVR3JoJyG5wlq72AyZz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glP4Uzm0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glP4Uzm0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1139407f8f.1
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113696; x=1784718496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6Z8UNdPRwdYEDpBm/8Wj8CPVrJHM5gjfHQvZCFzLD8=;
        b=glP4Uzm040Owf+KuAPr+Zv/Y0BT+pvL97dsuyd5BqRJClIdQyG0T8cwRU61HJUIyFO
         qDkb2dmyPgxak6uGkiET507Tbxo34Jt69Gx9FZs9GA2taGUa6ePGLJEHMnUuPC4kTFSm
         /jDXJ7tgKqIVp6DsOlWQUi3VlR0pWNkzP8LNAdvwKKTYSsqnCoQOzxzt3JtT+UZIgIpi
         5C7KA/8soBbGATvkFLIyvpfmm6jZQ6AbBcfPWZ9lwFKo3A4MAI+DB5mrhPIy8dtHQrKk
         o+GoaMz4oJeFXynGqw3yMwW3i7c+uL5qNsnPjjVRE6SXY8BM10bO57bnQ+VgByqAh/NY
         Sqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113696; x=1784718496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6Z8UNdPRwdYEDpBm/8Wj8CPVrJHM5gjfHQvZCFzLD8=;
        b=h1wIIAGuv++SdH7f4PvSnW9IaWGihiXBkmu09JdRaUzadtdCmoQU8BDIzC5dnzmefz
         3Hw4kwQAbFJGKpAvMUv+RgSAeB20wPIV9idQvpAamF38tjL6MD7geRP9zow8Q4xoeDIp
         7WQkpXXuXNbhHRp7dFihAdxTxN9v5hTCCON4h8ZbwXtMnlcVm/lm9BkSXPCZ0rpdIuqT
         3pvJOeWW7oY9VQTcS53B2qFMCHHVaTABFgDHi4LOXAalzRY7aAEIxXTe6Xv7u1zg4roP
         YJXmYcRJt/JjES14z8G24y9Uu5ghXy/sU3Zfw/G2/XQ6yX/i6+IMKmapL9chqsYA/9KU
         iFRg==
X-Forwarded-Encrypted: i=1; AHgh+RqlJfCfQhfq51AbgeXL27Gzu7aZlE6a41rpMgCI7oZbmt8erWzCdofirrHM5XfJ+z/diN0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz+gUSmoXwaKFNbLwLHTimMZLgiVTdUwKU7CVeg54waX3loiVZ
	yiaqjDr8Kfvt8mnbQa990fERJLiETcVS8SEF95UOPvOHBxGvJwnTc2D2
X-Gm-Gg: AfdE7clwzyDYR+I1WwyYhVKSFi8mM9er6FUoIb1CvoTNA/rgAWkXte+/QuUyAOwMoim
	T3/pSLlk7AZkD29o3rgNg7JLwWva4A9VNcKsaf3K15EW6GdXepg+8sBPQZR8E5aw0neJCC2lnAn
	PptTBKOgzC5qsaO2NLdUj7wjshiyfIHOxIrBayZuz9AcADlg+0EC1ejr0r9U/gceoP6vWam720L
	+20zBZkVbPRv+UGxOx8Qy1h84setd0/PLdoTcD4+UuJvTLl7yuZGERKexg4xsACJCJAwKEFVxXT
	PXaIrdQaQ3BOScxLyuasSkmgTgrjfhyjjeUsJTlCHzf0Sni5UW4dlo3RLzZOcDa/5DR3K+GECa3
	B5ZNloHuE4j5ioLu3rFPtVzyqXnGhrKEl8u/0F8nSEQXiFR31NPh3el9Yl9cBK3DKtlP0HuDWmK
	aaGvfgCpAY69xygsny/OhvZ4T8js7og/GpHhr3K8tske+ED/KWkTxyhWxP6w==
X-Received: by 2002:a05:600c:6989:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493f881de65mr167311485e9.22.1784113696023;
        Wed, 15 Jul 2026 04:08:16 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm151389875e9.14.2026.07.15.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:08:15 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 13:08:09 +0200
Message-ID: <cover.1784113547.git.stefano.r@variscite.com>
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
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 530 ++++++++++++++++++
 4 files changed, 1027 insertions(+)
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

