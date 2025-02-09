Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F7310F4
	for <imx@lists.linux.dev>; Sun,  9 Feb 2025 04:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074636; cv=none; b=P0OfFQS/FmYUIL8PSsPPwyk7eCppQxq4WFLoBe8ubU+oXXVeGYG+DIhk/e3lonPvRwLdMi4HJrwq5AFolcFdpwO8iAkanKG7cs/ki4u3FexCpL8hnxim1BRSUJjcWI2OPmD1OCiidjgXQYp+XL4BG2F8TimpG0uKuOjexM7Y2Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074636; c=relaxed/simple;
	bh=Xr4B6bIxHxwEzNHMZ1RA4gxJ39rt8BYamWe+C5twFvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4PYg1ojf3nvUTurV6pEhAzR8wxmcqtrT9jO3ZMT8ekQaMSvn6GCqXl+RWMGRbVlDD5iGnw5NKJ2f85QuJ0h2D6M6LGk7nje/fif92qEoN+bIICVEo8XI1Qg9Dah8fPrPVMvjGtF3ai9mtq+aoX7h0G0y/NDNJOw2+n+C13ZW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YHdO5x5G; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YHdO5x5G"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa286ea7e8so2780105a91.2
        for <imx@lists.linux.dev>; Sat, 08 Feb 2025 20:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074634; x=1739679434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffChoDiFR+PyqcOvwXXG+VNE/Bmtc2ogucfc93fQxUk=;
        b=YHdO5x5G1BdUU1sAslW2shHkepcbi4VdyHP0XYKU2tRCt+jwRxaIN9yKNHWQZNQY9s
         8KbnzaO9dp10cEroV7fCqkzS2y7VGjkOvik7ngvy6AoFL9awRM0W1MT3PuqAoofKGTIn
         Orb8AIEfqP0jCyB+gBpQlfpue90LRJmPQKElUEn0xFRImbBTy9CkZor8pAlnNeh8Z5RK
         dtd4oA5KBBEp4IzbbFccerJW472uJpzwOnymCSE+ERRBWwVcG/Aep/Q5T4a6l555pRd6
         Z8BDQvcbysyoUTg1jh/5wnLBWQFw0BLTF4P46GXhsuML99liDq8t6y/d9fV1wyylQ1Xw
         BnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074634; x=1739679434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffChoDiFR+PyqcOvwXXG+VNE/Bmtc2ogucfc93fQxUk=;
        b=moJ+JGR5My41VP39mhNoC2GQZ03F5xYrUIKXvwd8XTVD1qBv+B7gPzS4HjMPywcot/
         nsDfAgoh2a9l52wcUcyhVlIyoM4WEPyRBn0J7B0W1R3jeKWt1w4amQ6Shc6PnFN3doG/
         /TjyyF+kwEkq1ZT1VL9cJeWcs7N6FHABX/5tfcV3cjMeDwuBqFsX2gPtNLnwCpWkOVyx
         oyAMgFN/3Ha5X/BiRQ7TGWG/RIeUd2eyFbJve0hR2ZMUOvMj/JUG5Ut0iRKjFe2dLMQ0
         4cN0ur2Zt/jCvJcoVIgY3JeD29+K4OyWO0mEnm5oCLgNNToQSHvOdheMfCfObKJFf2TE
         eOOA==
X-Forwarded-Encrypted: i=1; AJvYcCXPvjxu3IVczzJm3sqnpTUDaFZEk3L2KJ04DMNkAg9a8F/9WfyTyRIQGbGGasHzW6kyMTw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9IGYIU4rZYdM9n0fgNZDko9Pb94R7EqL6PDoAHtQUlOrsXth8
	BFHdOToyYfYCiQ3UK5IWnzp7fpxor3ir3LHPhnD5u7JB+MhB95m44nhXA959BGc=
X-Gm-Gg: ASbGncuGFkHDEgoCJujYceG9NgoXVCPK9NLgzpUtViVRVR/9Oy0Ngi1xvRW3Cwi68SL
	c5JIKDaIaKsMiewSr3ipaW9VVXBiD9LF6S5HvecOgAh67hlN4SPWdhxw4EKvfwM10JVKAQ+NIgC
	ODd+6iydr13Vt3D9AGp4MAYvoBlyPRHg0Kty7/kGKcvXTl9sT5aOAPS6B7YWJw5shxbC1629EmZ
	sosmSeZfVzHIHtQmYU09HcM97AcmIyyXJrJ26IxE6PViIWCCkhosHRGYGrT6hQezZE9bM6WIVu/
	BZp6DEjpf9jDHKf33QSmwbGm2dJ7P15IzHuTAEK2mrO/HvT73hsfoGw=
X-Google-Smtp-Source: AGHT+IHWyivxqea4vrX5Vzo7+S2VcgVE1uEfRrP93aVaeTeSGQZ/oELVi9DGSUIrYGP8OYhXJU+GpQ==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr15893367b3a.0.1739074633666;
        Sat, 08 Feb 2025 20:17:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:13 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v5 00/11] RISC-V IMSIC driver improvements
Date: Sun,  9 Feb 2025 09:46:44 +0530
Message-ID: <20250209041655.331470-1-apatel@ventanamicro.com>
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

PATCH1 & PATCH2: Preparatory patches
PATCH3: Main patch which updates IMSIC driver to use MSI lib
PATCH4 to PATCH6: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH7 to PATCH11: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v5 branch at:
https://github.com/avpatel/linux.git

Changes since v4:
 - Updated PATCH4 with better irq_force_complete_move() implementation
   provided by Thomas.

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

Anup Patel (7):
  genirq: Introduce irq_can_move_in_process_context()
  genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
  RISC-V: Select GENERIC_PENDING_IRQ
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Special handling for non-atomic device MSI update

Thomas Gleixner (3):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib
  genirq: Introduce common irq_force_complete_move() implementation

 arch/riscv/Kconfig                         |   1 +
 arch/x86/kernel/apic/vector.c              | 231 ++++++++++-----------
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 197 +++++++++---------
 drivers/irqchip/irq-riscv-imsic-state.c    | 152 ++++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   7 +-
 include/linux/msi.h                        |  11 +
 kernel/irq/Kconfig                         |   4 -
 kernel/irq/internals.h                     |   2 +
 kernel/irq/migration.c                     |  21 ++
 18 files changed, 389 insertions(+), 287 deletions(-)

-- 
2.43.0

