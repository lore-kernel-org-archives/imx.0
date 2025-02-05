Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5CA1DD873
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771248; cv=none; b=I7hRzS65jo691XfdVcxwmupHxAgTUEQ/v4BUoYpWiiFk3j+x8Pl71bxfV1bsESyBM3ZcqKi6892yBC4PqXQy0mnpHIhwNiMop53E8T7JrJ1wXe3WYqESQSYiImlzE4bVA8rZ45UGpRH2jpAdAFTVp2TzBN7pMk8LKeggZgGg0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771248; c=relaxed/simple;
	bh=n4slH+wgDA6MSJsnkDzYIOL0zzUU8vlxw6wGI5nPdQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reAAAUvvm73czwS9qRavv7LU0cVAuw9XlHTgvd6WPmPZoIEOT/wYRZkuyoC7FH0jXAY5eg+wyx4Ef3SEv6we86ysknb0qCL5L9qnhLjjnTFP07UneVLv8XelV2u4MtxNUZFmcxoREliAAduedMso/G1mMwEDM4sn/naSjaO/CW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QDQB1VbB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QDQB1VbB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f1d4111d4so10179725ad.0
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771246; x=1739376046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=QDQB1VbB31+pZISbSFpmXdOdtCRgqAOlJHVPC6W4WnLEH3r9IFjlKntWv+el/fav2G
         /plSgGS3ZLzT45cynfTcv7omwAkeezmQfN/zecup2ca93WjZPXQkCq/dO19s/jPWolJ9
         J5OkLKplo4KnMhRwaI39xznFPHdLEDwA20x7ZxreV1rNC22KHI0ff9+wO8pXSZkP6y/D
         H4A5hyNFrRdGZsEoZp/uvILY8kevgLeNtBzzCD2Ee8vzjZBhzEeLlbEU6BR6yLvWaeHU
         ylMHbbkabKG5KdWe5IQPLR495JaM7xVZiZ7xvWdODYHfT0fQGNk24rFHac4oQ9E07eYm
         HhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771246; x=1739376046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=tP2zu30vDo1VNHb2/A6teaO6V1LItJXPzMN/Cyjn6Fm08ON9oLuQN+jcBJrPNXU5DW
         hNoF58EyXD205POlYWJYiZfqkt/AQSq4AQc++4Wk823FC9DmaaZTOFcZWyRB5bUS5wWO
         et7gcPQrqf3ph/xsvOuFQ7p18u4JpMZAVQifAK8dxHv9Q08jCzTGSa7evYh+r8Rnx5w3
         EpBN4QKSJkBqRqFKkmtQumIun3OOUbpa7OdIRxKHnDKq6ViMlZdjQbILbd2ONxP2TgT3
         4piu4IYS8xqx1JcgeIPoB97rRVsgpg6bghM7Rl0xqcVTTFoFb5wp5RSRY0WN5N/Hpg7m
         ESlA==
X-Forwarded-Encrypted: i=1; AJvYcCWw9aDq5aWtd3dkE0XwFHNglAxETkQCpOZ6Gdm9bnSZThXhHmGINMlIhgfCSBOaBPOu8pQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0DIxFSbq4riDqlSybm98hBlvcSNgfdL4gFTdJY+LZivW7tYKi
	emzuA8Q/eaKuVrcgK9r4nb96pXI1NBq7bHTavmDfcwnKilZpOvUcR9Lo1ixkhfw=
X-Gm-Gg: ASbGncsTnQ33tvHWEcqPgoCxFk+bnhxGPPUpxh3ILQTm8UXlAtiOk+029ef+HlGCrVV
	kvJol1c91lOEkodKI9js1KGwLTz9Bb+d4Iw9xARhEVAL1P6024UZrqviQ83Uj8nkJ4/o9LYbjSr
	LglhSYUhY3t7jXULeTLyhwbXQ134+j312qOl+DYC0L0ZwFid7UCTti0vD9IfBQ/I90XjfY+ejVe
	VwpI7Ea9jvRmE3wXtp4nfE2oWma2FpK1FG1RhyFyNapLnXFFAKdzeW8ZQH+jQs/B+WiYgDpz8q2
	FoZki3OIs2xXKo8Yx9482IeUpA0Ge8kjB4Q1FR0o8R3/KQIGHSRaD+U=
X-Google-Smtp-Source: AGHT+IG20/n0MlzHXXlDX+eid7Zzs/iscNjRXbzQaZokFNcd/sGA49bK8WlZsq67OCE4wBBbq10xxQ==
X-Received: by 2002:a17:902:d2d1:b0:21d:3bd7:afe8 with SMTP id d9443c01a7336-21f17ed0ee5mr59541815ad.49.1738771245657;
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
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
Subject: [PATCH v4 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Wed,  5 Feb 2025 21:29:43 +0530
Message-ID: <20250205155948.81385-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0

