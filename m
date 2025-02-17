Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACD51A2630
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782672; cv=none; b=FmizhNZltXB0CxMe74oxF+FlgbpurSnTqpi/azaEBmrsS0M2gIcLnvkAI+l7bCkpSkVYO6fR/A3hBU/qEk3+kvH+BY3dQYOj97i1JtlG2K2crm9CPQHzk9WbRrIOU/Rh/g/Ri6a7Fl9oDLZeYkFiOV+c6wjJ6YDLrcFGMGAgKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782672; c=relaxed/simple;
	bh=TOkbHcros14ROwgOg6vnJZdWVFcQKalF8GD+k0BJQN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=edmmrNkqPMGIo5qOKuJZnQ9wEs/j5xIc6chOtTcF4k3DurfBAe/TTUqMQE5J8N+EMwo+0vMyPLVLZRxYVAyV/X7xI2OQnW5RRo5BG8hF5uWRFKLMnqdEL9iM02Ogvfjmw7AdSH7wXclQaJF1LM7RIha6Pc2JJxghGs7v6eUZlVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=U70wYnaC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="U70wYnaC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220ca204d04so53746235ad.0
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782669; x=1740387469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=;
        b=U70wYnaCmizz7GUNJpocJEBf9yDlXKJwdvLvJkFA0mwRvlRIUBSMoagdwliO8aQUJG
         63T2ZI3RWhs5Z4j1vlFn3euxpxY2+vGWG5uU1Vg8lH/ihl+lO/fUWeYm5jq5jk2vEcIQ
         Lv+vttQCCLqPg85COSc+TWP78QLKOoF4dGNrOXl1qITYlOfyJJyqRj2QLasQnv7Y3UFq
         O5niY0NMjleTHn2vFu26MNb//C9FQOivBc2/l3gbK2A8pJYInBeFFOc+koUaKP3nZ3Pm
         Jd2Ia5jynRzk3RoYj+6sdL5QQPh35L7YgpV8XHcEXKeFc6PgG4n9YwtNSih5haWF33K8
         GoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782669; x=1740387469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=;
        b=h5JEWtxs6o4JyIOIU1ppS8E8L/voxszox35SjgzBcSs6STRzy3/66vbqf7ukshTHXg
         G0iN+hoT6A6X+tsPCLrKxqLPvoP19IBI11wk8pTeZXlfdEleJ25zx7yPiBgL6OYloE3q
         SpD3RyqrO1sbkY0zy4AVJMZTfc/CxVY+3zWvF+cY0J2//Tt0PFJ6ESc6pepbQx80ftPK
         zcCEb/cWi4Yh/+MTO8py6ljHABvU6cjx+HiSJkBCrMfK8Q6xqNic011NiZojV4qLiAGl
         BGDP4pl+KAk2m+1GkN31bInZ6HXIWFUjA5StikiWKzWLqxrG8N5XbKfaxRuaTPxa7+rB
         Sicg==
X-Forwarded-Encrypted: i=1; AJvYcCWtxzQTK+ZXutsxgFGUpPgZ5vrr7XgrV6/Up/Wr4I7gKVbEEuMiVkORsWucv7b0ZCJoIuE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm5z1gvmkV4u8qTKgpU9GMYZJUjRNOVJ1mtCbFTwYilQKQNIt4
	38GM9twVQqCqzM3rRv9BZ8UxEhxzHoiHO9cL5W4cGLfQlWk7eOsDNShBVZT/h1c=
X-Gm-Gg: ASbGncts2rkqOy60qO3O6cVa8HAXNykLH8iy88aUcqvqt68B4jVBEp9QMA4lbFUaWO+
	yZuB335ZKTMjaWTlVCdvIl9VHDvzG8CCXV2rrOS47hGI66zvav4UA9OfiLhEke1gBygZ13vJaKH
	vRXTv/b3RNAA/3s/FyhDkt8Ce2guvktPgPWORD4M8olFQRiAl6d5T5iBBhpPwN/QL8R+jUi1tbW
	5nAN5Jjz3a6FpjreXtqqmycHsv5U5HGDk15KQCMkClmbK5XrJ6iKU08o1EpSkMidNUoXQChVQW1
	x1xnWpUwhPtHM/YhgYz94Ik95gPtRgtQ4Fka5tgvAv/oLPkM6y020Ek=
X-Google-Smtp-Source: AGHT+IF82L3fcPzRQrN7o7ULHVaO9xfwesocSc13p9Vkcov8kHTq/Q8PStQAxAacABCzFd34cRy1kw==
X-Received: by 2002:a05:6a21:e8d:b0:1ee:7ddf:f40c with SMTP id adf61e73a8af0-1ee8cb499ccmr13555954637.11.1739782669344;
        Mon, 17 Feb 2025 00:57:49 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:57:48 -0800 (PST)
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
Subject: [PATCH v6 00/10] RISC-V IMSIC driver improvements
Date: Mon, 17 Feb 2025 14:26:46 +0530
Message-ID: <20250217085657.789309-1-apatel@ventanamicro.com>
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
PATCH3: Updates IMSIC driver to use MSI lib
PATCH4 to PATCH5: Preparatory patches for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches to use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased upon Linux-6.14-rc1
 - Drop PATCH6 since it is already merged
 - Update commit description of PATCH1

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

Anup Patel (6):
  genirq: Introduce irq_can_move_in_process_context()
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
 kernel/irq/internals.h                     |   2 +
 kernel/irq/migration.c                     |  21 ++
 17 files changed, 389 insertions(+), 283 deletions(-)

-- 
2.43.0

