Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AD2289E13
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979120; cv=none; b=JTI7JJpgSuQrQ3tczt8+69AZXuU4Zeu7D3DVncfkASkm3LTj5QAPmZXz0zcqLqKXl45L04ElgIysF+NQF88PEL68oe9Rep7Ak+bG4BLL77LFV0xAyKbyOPQ6+4Cwn/+dkdgxIA/+aKlg9TCv3Isa0EkUvz8jjqJPbRnqFLefqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979120; c=relaxed/simple;
	bh=3G7mlblq1IkMV+TQeAC9F7TUri+6TwMa0SOSWvsCMmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aWohUgwrRjlfXRqMG8mj9nSUaXVHQqhpfIckjNVdGVNrrru3dD3ToQic38g3W+f575n7i9Ux3n5vO77aOKq2PQMjOicZG+xSpvC+r4wzee1kWklb49gX4qMavbeyj0Jq2g7EPg5Ne+ycFM197RlleLw7G9Y1iGMjVFzFywXk2ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bjcNKT7i; arc=none smtp.client-ip=209.85.166.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bjcNKT7i"
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-940d25b807bso84861739f.1
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979117; x=1761583917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1AvuDUU8XTDFjTkk8uCzrLoeu+wpmzYKrOcfQ084FIs=;
        b=bjcNKT7irPjWvlm/SvkLDnwIO+PY6YbERY5uIIrhig9pY+UAPKdGVB++H6ObZ9etMw
         Hf7h8bEwDv/QhjqjJxTa+ClF5V5bwCIxSFViLOs3W2UOC/B/lQf0wbqnitWjBAijCzS6
         GcFOGzOZ3XeDL/jRflgNbJG3ic0nrq4Oy2fppDVmfRcGWOmoCKD/3SbvghMyWivQZuqB
         KQSuIro5tdx/2OlA4gi08anXkC+2GOFuTlS3eTbeeM/DPIANHW4vQj8gMh3gZBIK9pnL
         khtdBsv7pecKKs7H5PxAtpWgmbXTJ+v1R0TlY7Xkob7ZQobU2vlkCJygE+SI0OlNjvql
         jesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979117; x=1761583917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AvuDUU8XTDFjTkk8uCzrLoeu+wpmzYKrOcfQ084FIs=;
        b=H5FDlY+VnRzloCSiQP+3zqzjmWw0ky9WPHH8K8v88aXqYlKrMnqNjenD+0ZAFcVYmg
         eq9eMKMMpGdE86STNg1LtYflLTq9xT3QV6gsz3a9dS/o9kTPOilRRbWPHq9lJMtus3Pg
         8iO8a4LhWOAPw1Askf4p6fNLNaOzRxy4i8e0Kc4W54D+6km+KdwnFL6wbQsoMhpIln7p
         4+t+lFSD4sr26eUyv+RdxOfUCp2P1BeNaxaMnQd4LMMoCzTv67s/WSHvx41NhxMp8kIT
         8s5zllscU1IeLS77jlC8S8JNFEGhvgJ79bpAf1C4RpX2k5RZMnJzabbNpJNdTTvtrIuM
         2jfA==
X-Forwarded-Encrypted: i=1; AJvYcCW1ekRnvHBKmdqXQ+hc+M/tznUDgfcGerxrNteK4P5KXG+q5PSPT9MyxjaX4iaNZLsyEyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYwmF2AWppfCFHoKfzKJ94cB81Pb66tOV1muLF2yyxDjjWDG0E
	qxC4FU/C3prrVxwvhCWMox1L74TOiKmfYzfLOVI45tAkHBGV/AHz8S9PB502VGlkoFA=
X-Gm-Gg: ASbGncuVErz9IMOrIm3qdSm5KfkbvIFbcoQqleMcDmTDMqyByxmS+ECIpULXJRlpGTu
	WoHh1fq53j11XZYA7qo7EKP12PAZs6v7FVHQP4Aof7aNpW85hv5SvxHT2cHm28RjvhJMrGqMxR2
	CPIM9tey5zPqyW9vAV1RjnuzGzUm+BdDtx5ee0wNNtYpFYnpoyBK5LzIDojvm1vdzQlSEpXgQOS
	apao3oSBltT36bT/QnP1yf0k3kSWJnq8I/hoj1Vfm2o2GrCYHtF+zl+Od0s7HY+huMg2zxrjIkO
	A1Iy8CtjRKXDmRfEGl9iELFK44t3Hf3zD6Cb3n/zoAwIZqv5+O0ncKrUpoTSxyTvMczfdT5yRZG
	9/GJehWOyQKIhDDpV64xLTSRyQ2NZF+t430NbNInF2rIsMZFR1FUceqPwlPt5qHTjpztV2Ct3f1
	uCrHS9I8v89Lbnz2SZM+C4kFffVF8J1nJFLTAd1H743m0=
X-Google-Smtp-Source: AGHT+IHkIIUwLfapdvbPcRnsD5CACrEJj9nwaBI41U0v+K+kXPy5pHBwBsF94Q6SPwfqvwS+pU3GAQ==
X-Received: by 2002:a05:6602:13c6:b0:940:d808:8a09 with SMTP id ca18e2360f4ac-940d8088d03mr748582839f.11.1760979117170;
        Mon, 20 Oct 2025 09:51:57 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:51:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	p.zabel@pengutronix.de,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	fustini@kernel.org,
	ben717@andestech.com,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] spi: enable the SpacemiT K1 SoC QSPI
Date: Mon, 20 Oct 2025 11:51:43 -0500
Message-ID: <20251020165152.666221-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the SpacemiT K1 SoC QSPI.  This IP
is generally compatible with the Freescale QSPI driver, requiring
three minor changes to enable it to be supported.  The changes
are:
  - Adding support for optional resets
  - Having the clock *not* be disabled when changing its rate
  - Using a fixed 1K size for flash chips rather than having it
    be related to the AHB buffer size.

					-Alex
This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v1

Alex Elder (8):
  dt-bindings: spi: fsl-qspi: add optional resets
  dt-bindings: spi: fsl-qspi: support SpacemiT K1
  spi: fsl-qspi: add optional reset support
  spi: fsl-qspi: add a clock disable quirk
  spi: fsl-qspi: allot 1KB per chip
  spi: fsl-qspi: support the SpacemiT K1 SoC
  riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
  riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        |  6 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 60 ++++++++++++++-----
 7 files changed, 98 insertions(+), 15 deletions(-)


base-commit: 606da5bb165594c052ee11de79bf05bc38bc1aa6
-- 
2.48.1

