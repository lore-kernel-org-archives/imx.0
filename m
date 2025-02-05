Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B985919049B
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771201; cv=none; b=NSGur5T0k+2pqHhFz8YJURBmkROHUlxShlnA8Aw2DBIxMSAygyNRDFQLFrraMUwaM0ctTPPhirxdd5N0ObVsQruzRQRfPFhGWzpiLlMop5uZSr4EIpDxf/olLWAyAHrBKqA8+juDDBYqMg1uJYU3S+bA+fVFnwnVPaL9SgZTMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771201; c=relaxed/simple;
	bh=ylxu88ulF1xhWdhoZrQAMflQHBVC3BfD0YqBlekA+jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M4vgnTB+M21lAAQQgxIISLugJ3nn4zskk5VGMrQKQpLRi4LVeWbejaWMJoWZbuveoLk+mQNUZPCsAtrP6hbFErNT/MbQ5KaLPZQ3WZo6wC6h7e73oymPnE1bCVu+z9TTHmnG6J+8fKgBXCLgXrsVDT3uxaJajvp0YMp2zc302kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nJUusKZ+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nJUusKZ+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f0444b478so29165085ad.0
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 07:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771199; x=1739375999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=;
        b=nJUusKZ+J34KPkhnJTo4Lb6DWp/JheVLlIvAo2k+qbnIivne3hrt061/iOdx5xg1kE
         hRqd61aKIhwrLMEvBN424HJ+TDiDOXJJdKH/0a7KBxHrI5uoLer9RbeiDIbF2v/X5TB7
         om0lpY9Ua+YoMCbJdJ5Kmte/uQqJE2rt0iroYiFvX6XI8rR+mJVlMM/lz6sCvh2fTCYM
         3zOGMvUVrDhbc4eA4jf3f3zMkylmBvUCtL3cdfQWbrtFtKFP01AcFaMU41WZf3jUkmYX
         AGmlbOU8WBaz60pVsTNebh8eGfi+ml5mKVfhThxBOBly3OcBEx22XJI05NI3UFRp5vDc
         U6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771199; x=1739375999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=;
        b=kGcvpysuCgu3EQPGx0B9NN/sXVPSlRL40MhD624YK7hRWvDC7kc/7NSqU+fEWVN4T0
         ctw6JmBxYxt7FlYisdeQk4+/0Sj6sVoA+axnZmP7dj5MqRGUPNFn3NI8nhkkGFPHIFy7
         4fz1cKLXjZaLEzgIQnwQjRaU2xD4Xo7c0G910VjmcittSx+RR1ZhPuKGIiv6bYz6O5Lu
         QCr6yjZhl9UyAbM7VVCMdExANRglxOVRFufKXg2o8OJ9xI/b91Q+IZxff9j1SRJd7isj
         TH9INGwdvOmKLqPqflr/h/5wUALDivtAf74fnXIYURFn2JN5RVHMWlsHGLYENbU6Ty5W
         fkbA==
X-Forwarded-Encrypted: i=1; AJvYcCXciSE/OePmUYWx4Tbm41HMxfj2/ST6JLONucgkSxgoGLUFmBVE4Po1xCafSD00L0qezww=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6ikD3v+p6/eeLMJlNW7Ap26oP6WXCt9lPV8kgDc61JyZhJZ9z
	u//GtRtEw5YaugnqpPmPCG4bSwa0qYpLbBN9hPriW+UL9MuntwttRghzma2RyGo=
X-Gm-Gg: ASbGncuXrF0cURPd0/vlyEojrwIrJFE+ZLr0W6RFkMonbE7wusVoK7UeBUyEablNY2C
	GaI/HdvTYBdPT7grY4Nz2urkfp9Ug3n4CHIo65+/uAppiXhQM2HB13nqOFh+mXM/VI/YqnqyRVK
	rH6yCAcHN0w4yjeSCGMEdKuiar3bSEISQisPUWxWc7mOUUh3wKZHA3HZLu5hRMyBMR2njFIwSWN
	MsUk3lINBqYne5eze6DnT4fg/CBx4VX0+3siAepWvk9OoEx2JOBRUcyQnritfg7rLK7YiMiWSmF
	t5j8ARQTF/bImzMJE6V9SHldWvdr0dNqlbufRmPTqvGMbzcYB9g6Myw=
X-Google-Smtp-Source: AGHT+IG/1yS9kPdzHzlz6pxYz4TJGEpsfp15GF1V712EzlJPFVPcBMbHsLPYkxwfxuOCVyO08gz4DA==
X-Received: by 2002:a17:903:41cf:b0:21f:dd1:8355 with SMTP id d9443c01a7336-21f17e4cabfmr58273655ad.15.1738771198793;
        Wed, 05 Feb 2025 07:59:58 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:59:58 -0800 (PST)
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
Subject: [PATCH v4 00/11] RISC-V IMSIC driver improvements
Date: Wed,  5 Feb 2025 21:29:36 +0530
Message-ID: <20250205155948.81385-1-apatel@ventanamicro.com>
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

These patches can also be found in the riscv_imsic_imp_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Dropped PATCH1 of v3 series and updated last patch of this series
   to handle the intermediate state for non-atomic MSI update.
 - Added new PATCH6 in this series to remove stale kconfig option
   GENERIC_PENDING_IRQ_CHIPFLAGS.

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (8):
  genirq: Introduce common irq_force_complete_move() implementation
  genirq: Introduce irq_can_move_in_process_context()
  genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
  RISC-V: Select GENERIC_PENDING_IRQ
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Special handling for non-atomic device MSI update

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 arch/riscv/Kconfig                         |   1 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 197 ++++++++++-----------
 drivers/irqchip/irq-riscv-imsic-state.c    | 152 ++++++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   7 +
 include/linux/msi.h                        |  11 ++
 kernel/irq/Kconfig                         |   4 -
 kernel/irq/migration.c                     |  20 +++
 16 files changed, 280 insertions(+), 162 deletions(-)

-- 
2.43.0

