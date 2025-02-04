Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3BE2063DC
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655666; cv=none; b=lA8bkGtYFjU6ubV1Ac4W7F4ZeA4sz+7BJUAn46KxK2q4hxi7+/MIacJRbEdSHbXOhFVNz9oJYUMyHPmnvlCpQyRpcjwXlbn2ELsh7fhjOfEzQBcBCNVk0XQJSRWQV7gSpkQ80RwqXlx0BvfBffz0Vg1gxXG5MccV65NLPAV9s2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655666; c=relaxed/simple;
	bh=1xcyd4xbQQnsJ0VVxdhkgbe++71P2EFh7Yknlb+8V9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXafxKNP1A5LkixTWmJSUl6pcCuN2uPPu/WJaSOTiBJZOQXzmuAUJvnzrQDkStiuOXRugn/NID0OD5G5qYlw78eor9CGkCvXStgUe4/41LP2zWLE0F93rJ9yyUcmFgYmtGyOwdFV+kx2Pojz1XoR8LnjK826JidkDUc7gTme40g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=l19LlfDq; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="l19LlfDq"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6eeff1fdfso479464485a.2
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 23:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655664; x=1739260464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=l19LlfDq9yfWhj1b3yd9yiu0SBnFdxzvP4CM4Br4fgFC3VDxy7BAwrzOJD0m+0bAiG
         qdZRRJhr3USMllFQABdzjby3BmORotEx4Pq5H0qCw/mRYN3mvZPJTy0e5ikTKrO7iFhr
         mWIJc0GV8agNWZzvJFmAOeS/Zc52FcLaSkhN8Z5nyHOufOH0ZssPqOi1/FbFVchK37wV
         9th8AC+OIdM4MZsxQHBFFjI9aLVdV+1zWkdnIMAQMozjaB6NrVYY4zvP/G1v6i1XrMAt
         vBnTfILI5bEyA+koS/jWmuTYMbWzoL3fDaH5e0rvm6VvTO2pkS3kgsYcImGmnBk8zPM0
         3N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655664; x=1739260464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=VvUCcBKiHWQdyjuwLiwSf1icV8hmvpudYopuOFtwYMB8eT1I7eb4FrqhYB7XQE88pk
         KBRLdEW/MCEkBBaixrhEFDUR8pziyHG/otgu4+IwZxrbHNNSRNfD0mTdgg2C4grG9Dge
         2HYQiXX9U45I4t2HGUMPq94uJuhcwnS3myaw52xqUHIAJi3ArFFj4GRBpgdYdlCJU4wi
         l8YQ8I/rxg9D+rkGMabQkQjMuAOVyh5JVj4L57/jLIlP2MwMzlDgH6dxW+qIKzMKIIWH
         nQiwOIAkLG040j54h8hIn6L4+FVM3RNOvo488URsDOKev/zqqpSNvEq+9khqR4UCuXmP
         CItw==
X-Forwarded-Encrypted: i=1; AJvYcCXSbtJEQ4epuCV4i5/LWw93P6FIofhYD1J7k8piBNE5jj0GJtVSNBjL0LpbbpW8JrQGLyk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrb7WutbloUwgO7f7jXHZw5cSCuJ93xWWK4jGJCt2eOwMQpfqf
	mBPXWSyXPYoEAuonZx02U7EgkC0xVmFXDHeo9U+IDYU94gdpFRq7mEjSsRekkMg=
X-Gm-Gg: ASbGncutnt03EhEE6jAdv5dFihR+2uY5qxkbJxHVQogjgbKd4cvs0XT4b5mhW7drD64
	1ClefcMcZh9cEZE1NXNwDmM31zG4bcy92MIGK/emWeiELKVPcKruVuLs+v0N+mfIn4KZXbCnejX
	2hL3eozj6mIWVsggC4sUcE369KiStYcA9wL6HG2MFyuUc/YcK13qsn3oho03HQsyivcjIF2Kocc
	mgjkaCAcrjqLIbTTa9ORyeD5nS08oHn4RYwGke8DAFLeWoAkAJnDh3UapgeOEu8862wpnogs/4o
	yS/EK0NDq+bzgWjyX1pMliLF6tGQy844hD3ra6Ub96t+4/hEoDAzm6s=
X-Google-Smtp-Source: AGHT+IHnQYtrMWCiX8smMX+KNobk2NbP0fzLkqVqwBS3IWCPax1EIsVPqU/PPsh/vQevjqw+kgDNzg==
X-Received: by 2002:a05:620a:688d:b0:7b6:da92:fcdd with SMTP id af79cd13be357-7bffcce1d45mr3575797185a.15.1738655663645;
        Mon, 03 Feb 2025 23:54:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 00/10] RISC-V IMSIC driver improvements
Date: Tue,  4 Feb 2025 13:23:55 +0530
Message-ID: <20250204075405.824721-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib
PATCH5: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (7):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device
  genirq: Introduce common irq_force_complete_move() implementation
  RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 arch/riscv/Kconfig                         |   2 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 177 +++++++++------------
 drivers/irqchip/irq-riscv-imsic-state.c    | 127 ++++++++++-----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   5 +
 include/linux/msi.h                        |  11 ++
 kernel/irq/migration.c                     |   9 ++
 15 files changed, 224 insertions(+), 157 deletions(-)

-- 
2.43.0

