Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006A28F1
	for <imx@lists.linux.dev>; Sat, 14 Dec 2024 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197171; cv=none; b=l6CT35GnFeWr+KGZBcdta7bCz9NLC6DYtzsMBLVG3LgjAzTouwW5x+hjCvBDs2n4jby4Wy+QS7ORWTMEf7QCRMJ6T/Pp9mtDLCZ83jR/5q0Wt0ZWHYsOrHqAa5ViU/MXoeGB53eU/zSpQilkg6qt4bzteGzbpXNMNGhE+wur24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197171; c=relaxed/simple;
	bh=SQ9uVWQAhuntKlTS20JZafFZ98N5NOWQNg/95pFKO4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNc5KT9SEuT3piuzxDES3EiEjz1uaOLGkPUigcUeHH5VKpHUXGX4ODDH5Kq27xlg5qYC1h5/H+L9V+7juI1O9Ixdsd0tT/d4xaurvtlXtzVnXK3oVOKnoheT3rP0OnoHk/RhAiZHj0vyG9Tqb+matjAJJc+9W63VRdvbP4a337c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=o82NlLDT; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="o82NlLDT"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fc88476a02so2169005a12.2
        for <imx@lists.linux.dev>; Sat, 14 Dec 2024 09:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197166; x=1734801966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv0bHKD8tx/knjsXKIIRgI9/G/KQE3L8kp8HO/illC0=;
        b=o82NlLDTdM/b3nYyWxBB9GE0EU3T5b/ZWqsyXDelIMs6x1vlobwfZ9755Z1SL8fyJ0
         6fVHum7w2ht2EiOMK1jMhxN6/LC0O12ETu/m9xCBVVk+RF2rxJjpL7Nyeu/wCqbMJ35I
         jpGksuJ3gkf4R0vjre//t04xNU7DEvnwBBxpgod3lFSaL/yqzy58FmklAynhBPPPn8KU
         BRkLh2cHKxTQVMvr1dKXLkjvYABuksCwnqozlTvP9hrqi9OmZMVtHK+YXfh/h/Yw0wJv
         flOeNrx9bPCa5azKG3ywFv3gA5B9+tN573nbKzjU7J+2Yj+SSVEvPUd+fvMmlL3UCpYj
         WEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197166; x=1734801966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv0bHKD8tx/knjsXKIIRgI9/G/KQE3L8kp8HO/illC0=;
        b=DRzR0BKzPTAr3aNH7DmRYQIQrDkXdZfnxj3yaEtvJYfEymsrTIwUzD3OcrvtI0DZIE
         o+GOHxcnYCYtLT82Tlo8yctJ6JHcYNQQY7SZCoXWJijJiXfaHQZHRfQ2gOidYLPi632Z
         RQ2KM6MRh7+vc0f2vw2x8LruP/rkYugPbrkLMOLUHzy7ofb8/zz+a+t1SW1ddfrSlerV
         mNfoZfOBL78GJmukFI9wzSw/Mn4F9/BOBUhZd69Rk35A1iAVFCqq1Z4xEtEWJqfUbFy7
         42Vel4PGVtz4bPRum/ME2JUEHh3XhUOa4x35MDFS9yLws5SV+AwIlJczARUMPHJ+IP7v
         pS3A==
X-Forwarded-Encrypted: i=1; AJvYcCVXR6LakMnV98rq+C+mslOTP0M7aZrIWcw3OFOhMKvCO4EZJ2pLV20oL88vqeEDyUOFDgw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5F7f5f7YR7py7oKXuKOveacbQebeOK25ls7fYMjw630PwF4tN
	oBPvp9+lFzWKQEgFfo0+BsV8D7MmOqnPnFxiPFdeg2RGeDYQ1YFujBpV72Q+nPw=
X-Gm-Gg: ASbGncsEN4ymRC80vxVEWkRqFsqyoIWN4iSMQNbE29fTS0tTbTxSvAiFB+DQCO6VRDc
	R+sYWF5xoZuCnlj1VX4mLthY6UVW9GbIqMBlMPocWLQucBhaONsNNlubO6ENaQScabdusskcr1s
	KatITXTrJFKb2uUYggE/ooUDg/CNM72XYM9mq5Mw/CwSE/gc8/StpAH70qJ9GvDc5tOwrFDySVS
	oUug5oM1JV9HzPz38zW6so7Kw2raCyCH5eCCT5dQ0PGo/M7B2VMqUf2Xj8ikO1L+tbnyu1jaotb
	ThpwQcz+wqRvfPM=
X-Google-Smtp-Source: AGHT+IHyKbANKEj4g4KxocXm4yHOhpiEBiGMph5JPaoKcbo6rZ1/8zvn09yNoAs/k0KDXpN10M7D5g==
X-Received: by 2002:a17:90b:4c43:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f28fa5beacmr9746521a91.4.1734197165633;
        Sat, 14 Dec 2024 09:26:05 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:05 -0800 (PST)
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
Subject: [PATCH v2 00/11] RISC-V IMSIC driver improvements
Date: Sat, 14 Dec 2024 22:55:38 +0530
Message-ID: <20241214172549.8842-1-apatel@ventanamicro.com>
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
PATCH5 & PATCH6: Preparatory patches for moving to GENERIC_PENDING_IRQ
PATCH7 to PATCH11: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v2 branch at:
https://github.com/avpatel/linux.git

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

Thomas Gleixner (3):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib
  genirq: Introduce kconfig option GENERIC_PENDING_IRQ_CHIPFLAGS

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
 drivers/irqchip/irq-riscv-imsic-state.c    | 110 +++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |  15 ++
 include/linux/msi.h                        |  11 ++
 kernel/irq/Kconfig                         |   4 +
 kernel/irq/chip.c                          |  39 ++++-
 kernel/irq/irqdomain.c                     |   1 +
 kernel/irq/migration.c                     |   9 ++
 18 files changed, 262 insertions(+), 156 deletions(-)

-- 
2.43.0

