Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EAD1C687
	for <imx@lists.linux.dev>; Sun,  9 Feb 2025 04:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074696; cv=none; b=rg+z44aBmdvB5WkRqk2gsDLPfc+NJ11Mg+XksYqhq9dfqQcgMmU/RPNLdb+Vqtxlhc34Qpj8kncfvtEobllIOzDh0PSRqhTnuxWNm+brMuAr+X6j62mWpKx1Ic+ON6+E0Arl5H/UhQJZFX9jsNPv8+34jLJTKx8OQDQdkDXlA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074696; c=relaxed/simple;
	bh=n4slH+wgDA6MSJsnkDzYIOL0zzUU8vlxw6wGI5nPdQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7aqAk87qVAl0QWTDqC6MvFyYveHcIk9Pz2vPLDSFBrKJLr+uKeZZ9vaZjflZXlihRV/vhgOWSlc4fTiV6QzPv5q7JEg2DzmBTNxElnfoQqaDfgJoyopKUBuA6q8XIyRAgLMzdjmM5jpJ5vbbYuBy5H9twe6Kw3hOggd1Tv2NKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=o+/dqbOQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="o+/dqbOQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f42992f608so5041940a91.0
        for <imx@lists.linux.dev>; Sat, 08 Feb 2025 20:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074695; x=1739679495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=o+/dqbOQNKliIMkbvKUXJ3pk7O90Sb8Rw8qFg+ZSUn2v2AP+9ONAcY8QhNx5TzkziQ
         arN0d7zk/N4viVdo5XynM0QpRLgyz0QjTzq7oegwBdoUB0SeyZcUXLvbisfuC2XvutK5
         oq29b35hr1olWE869tXfnU5PSUWFaIikpvOLvCAvHeLh2e72iXm+DecViZkverD8UW4I
         QL1/ijXVGVdyshHZQi3+GRLqu2ymG3htpM8LM/wAh5fhYa84XzYBjbsnUk262y5byjcp
         2J9skr6GfqGo8wARtRSKWnnO7T7lX/HADKtrYIQKkXRj8mh/4QCg9NbOrLtKyfyS299m
         QOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074695; x=1739679495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=rExYCx78RSlLfEC9g/Mo3pMgU/g6hSY6tBNc9QDbbgaonAra6Q0ksncXE0yGg2taGS
         2tMn0T8xeebMZ/K4bniGrKxM9F7KI8/FvRqgG3esvJFcVmcYct77Mx3dq3gBeQ0oS/IG
         2uT7HR8gxrM1xOSgf+gfzya25mHNjyiAgrk12RnUrAY+cfO3eYeRgTlOIS2sIzexY01Y
         MsY2uPIz4RYeq9//mR7cZjFY/3hHBFpfjaOw9olFofcR5sz41ro3T2IqtK8dYHlDhSJM
         G1K8EJlo1KNZN8QIYmnumoToqRSVGQB5NmOyncZfzxh7JrdCRP5KF6eGgP41c9v5Is/k
         geQw==
X-Forwarded-Encrypted: i=1; AJvYcCWK6HKXUyvIoI+OHOyVPyID8fcIoSfUVznYjDpkHfEGcnCra3CEqyXEoUKIB2sRK4A6IqE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMOMVVL2dorcjD+dGDw+KIm9uWv0/+SUImAyKe7//bhSFHCltz
	uQxwsUxeZqRLbzK4YuF1veVU+UDeV66bYsQDaM2LYAmaBVXpOQuyC4kRUA9bXbI=
X-Gm-Gg: ASbGncuI16tS4Ck55Qtp61E41QVomLR9xePRzO3cgRhUr0YXYTLdVDjEGSDb8C6IChX
	EZ7fPEtf/72/tXCuVjxOR39h9sGpKO7IQc3tzpb7p59KGU/Eh0NXtJg6IPt1Mn2uvWOguyJDmpY
	vQuTzHlDC1Zuzu0TzcCMkhLX19J81pevW2Fv5tzOnPoaef1R830jxQ7/Qz3XOc96reImSjpP3TA
	xPQXQlh/NJesEoU5iW4YJf1Ox6fZW6VAbHdf6xYmfiIAcUEHz60k0FGMrQqz1Tbbj80iy+uHStq
	Z79XAHCR0xE8wIGVMlS01/cQHa9ahkkHWxcbaYLQz4IU2R0FH77k6Uk=
X-Google-Smtp-Source: AGHT+IHL0ZAy+b2/HWpMWPKyLFtjwNwqGOrHhxJ1k6glfU7lfaN1/yKHZr4v/qmnwtb+wj+/nQhb2w==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr15896176b3a.0.1739074694598;
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
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
Subject: [PATCH v5 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Sun,  9 Feb 2025 09:46:51 +0530
Message-ID: <20250209041655.331470-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
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

