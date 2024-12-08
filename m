Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EC1E515
	for <imx@lists.linux.dev>; Sun,  8 Dec 2024 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733670445; cv=none; b=icwefB/Ud/e0Uf2OEVNHrQ0GUWgLAiU9Ayy6QtFuj+h2aLoiH9OVGDXg6y/JQAhOAv7EDcZGGbqww1HGZAfp6jwSC3rE7t3SR1u99M0r40CzL4D5mafyONdl6Pn7mDQYBdAPbFHh2B7EQ9oYWoL8obw9tV7myozTCyTC2h11eO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733670445; c=relaxed/simple;
	bh=4kGHNi5zhuCfHWfD6ETa3uawIdxtgj743lywS4/nwEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLIRgDL0upQfBYckdNXZv7rWPJjYOaLhO1MaZgLbUN6noB16G6IsZguhNCQ8VcceYYv93A6CP3/8SapkCuAAsXlDmCgfdi962qvGNE4Kp/14nsexH/yeYAwlBhDaR8Fq7HF+BQ+qv28OyfUFQRIO1myFBzOeeCAzftaB6rUyI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=J/lAVzAG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="J/lAVzAG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21649a7bcdcso1710025ad.1
        for <imx@lists.linux.dev>; Sun, 08 Dec 2024 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670443; x=1734275243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1Ymbf7OkgbozNLV0biXsSYspAvpz9yJ0j5pghYtlNA=;
        b=J/lAVzAGT5wlN0CKlsIQUbJeBoyWyc5bjVmgJ0WuwdCl3SlNb2lJUCOHeHxDd6XERa
         firD78bQJ1HjX1oguv5XH6xxEU0wworO8258s3rMCnuoJxy8/YUFcfhndjkRgf3Y5q4g
         iBDwZz16/yttEF5HG7eer49qsTIcYBL870IThAnlKEbp24dYKpm4+3cZ+qeefZP8429Q
         Lub5ftlcQZs0iKbdX6dFl/n8E3osRMp4d2ftnMtJeueq2YnDIUljHPhCOUu5cIG816rS
         nDk8GeTBs7TsQIN5Y2TJgxtT6J0/gcDbNKMDswqp1ea39GJG2+85HBM3ZVDBLOY5rkyV
         1k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670443; x=1734275243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1Ymbf7OkgbozNLV0biXsSYspAvpz9yJ0j5pghYtlNA=;
        b=ET6e2jozc+GOdgGsWUBLR3zqTq2Ab7enm8tHmaDEsQZgcVWyUe8XXoe0iCkOtpRqkS
         AhdKZjuEsR5HEOGnIkUhziB7UhRhPQAtgyTmlyDh5h4kDb6k1CFqYF/O/mdP0E7+PW3n
         /62bM6yYbtvTEkg0eCSLWASWEtobW8bXY+HOuT4CNW20H4jKPLDRVVWpm//7pOXFthz6
         u6PR4YKrdO9wgCrVz4BwtzTTOeaWimjqrmaPRTHQhl+KC/Bu3jsDTqRGoZEvFDDtroTN
         0WYO5VftAxX/iofUsl40jsv+ICFej/F5eNaBhB+eWciFqAVI/ukjQVywZceJRYKMWNwg
         jbOw==
X-Forwarded-Encrypted: i=1; AJvYcCX+cOVjU7H0Vk3ikhkRRCb2gShE4bX+SSDUrI64hO2TNL0SnPU+1myvjIaRwpV0lz9AwNQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDeVEYyIX1oqa1A6wSi8qdMIj+2UjHTpgkKEDZzuGK2ICBXz3s
	CN/bYY2AeTxcFy0R0RXSkkTq3fep+JSK1YuGsHnz5n4/uC2JtR5FmSJbLruLvq4=
X-Gm-Gg: ASbGncsM6YA1Oxvq39IJLEQWylFIWx4EA9Gd76weedmWJ5hf0TuOaXZ0+lx+ZbbpBTM
	2piR6DlbbchoHFrwFOn43vdgkZedsK3RSH2hvCd2+8W01F7eeQvOgtf5ZscSdCYAW2ThGCc4SEb
	07k7+AOZzJrMG7JfaHAV0DgctuGIthRxzvKWE0AQrh58Jykdzkgcn7vnaMzygmW1r/NqJyCJOQt
	YNJMVUz22s0vFoHUdOJguicc2oj26jIzEmzHNZgoH5nUkc4WcKp7Chh9rJQgDvkF+G2R/gn/6ax
	RaBs6TXg8pUPKPM=
X-Google-Smtp-Source: AGHT+IHVg6kIJU/hjxCaltB8c3VofoPFS72J5bvbHqE3/3XeAkWqN7rWQDnyGstJdvLaD8pQZcM2/w==
X-Received: by 2002:a17:903:24e:b0:215:9d29:9724 with SMTP id d9443c01a7336-21614dc51d0mr152817175ad.38.1733670442680;
        Sun, 08 Dec 2024 07:07:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:22 -0800 (PST)
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
Subject: [PATCH 0/4] Move RISC-V IMSIC driver to the common MSI lib
Date: Sun,  8 Dec 2024 20:37:07 +0530
Message-ID: <20241208150711.297624-1-apatel@ventanamicro.com>
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

It primarily focuses on moving RISC-V IMSIC driver to the common MSI lib.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib

These patches can also be found in the riscv_imsic_imp_v1 branch at:
https://github.com/avpatel/linux.git

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (1):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 155 ++++++---------------
 drivers/irqchip/irq-riscv-imsic-state.c    |  27 +++-
 include/linux/msi.h                        |  11 ++
 10 files changed, 87 insertions(+), 130 deletions(-)

-- 
2.43.0

