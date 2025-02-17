Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5141A3BD8
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782720; cv=none; b=luNo1e3Gr0ScljcKxcOXYq+2EEpm6aNDg99qkRYJooGbvnHKcoPYGk9L4n6igr0Hz9zl/JkINkukgl7HJfA1ZjTC74PIlHFJFykibYRk+NQyxaco0o4EjGDiWABBGkp3B214ph26eH3ETc76TChtzfbRUKzAvKKnP18W9Nupt9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782720; c=relaxed/simple;
	bh=n4slH+wgDA6MSJsnkDzYIOL0zzUU8vlxw6wGI5nPdQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UU+RZA54FM8uh27PNBSUa1GPsSMA/aILxRecI+cdOWCNIQI50zz5TJNAjuQ3WbF0mQFDeXwaoLoYfwvqz3Zu0fPk62k4yDfYmUqiE6NrLxWbSLprBVnHKhMjyQ2NGEe8E8lqXfVhS7Nw93rYIk+nsHrk3SeoQssRpK1hq+ysehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=WnNm6wWK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="WnNm6wWK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-221206dbd7eso15647315ad.2
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782718; x=1740387518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=WnNm6wWK2qi5L4uMMN6Qn7O3YjIgMd4fBP+AM7+8u2g5y1Ji9tPWCNYvfvJ5iPYIrw
         T8GDor6Ucm6kVHPfcaWNPHuSnigUgiNaOl1zb1gkYkkML39QszLTpsc8HN8rmUiq1GMs
         4txQzh70Xfc5EL5qTHR6dmRlDsCZzr4j7nF0t6kHkXhOfoY8dStB1YwpYKA6lACD+9XS
         bfM5lFFL92ViBfhmlPDrYDRrKLEatd+VmXOVpqAzy+hsQ/HM4Wwl03YxoAuWXIkpiGRb
         hZN/JVayAra4FK91zMS6lPSFkVorsWVWQjPp1f+Z2FYKgH15bXSjxNrakxQaaTtxvzQi
         5wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782718; x=1740387518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=CDxG9SBnKC6gNaEEs98uZ2F7D2YZbC/ZBUw0opmDRKu1XmbqNNdThO8pCUH3LEpkNg
         GmpPw3OqOPWg2AgOJUCFSSANgwm5BkoPCFMRCzthq8QKXmJt/5QkIHieS7SjKtOAU9bd
         bZ/9fn2cqXQbECB6ukIKD5Yhr5kDxZ12Nn9R8OxOxsiaCXqq8xjo+K6kLRY4sdG58w3e
         mA6hR3hFe1Wo3Y4/6Rv4SSswqawP4EiiCstHPskxU2jUVaCNUa3AIotdOCKAi+CeK2PF
         QKalS0twAxEp/e4cLoBSBDuz3AHbEs3GR805gIOGjTdXGbVU44SREkZ1pa2/f2KfZOSq
         P+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXhnOAAfKTuQd0/B7joIpwvFZGB6kdQCBXfLkQWw3F4uPuYQZY7uDHidYyO6ObAENDiA3g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXA9MsYXRyTknmIjc8LIic3/lCR/ZgP72vvotY1GLDDiAYLbki
	1YAXSZ/1M3ZjrjFeETqQNtsc7ZliEMvhWOvgfEgmsYjRaUFcZhW9rQDNskdyIAo=
X-Gm-Gg: ASbGncu1CuZnUxcPxTDv53BnLBj0Lw0KH+p3i5tEObQrJlng8CrhWutl9EDiD0P+cRP
	xqB35gSCQcwiuSiM2ui9Ep5zlHvRdcLduh8gqm0c6xQ2BCpdeIC8Pqsab9X/Mp5LU9+VDwZPIQt
	+UTTieY31ERLoBGdhnAAdNUKC/RI06+djvm4L1zsINSLdUGF3lp9M60oTwSfCRVhsojmX/wecYv
	3/CGoDO14g/Ix16aitTl5dB4kUEH9OO5YkdbeoJKatC3cC/PLyms4h63riqbT6uw1G/wZBqsd6j
	1XU3hcQHVQdhLk5ho+88o/XiMtzME73lw36vgxvFOqYKIObxvPdXVeM=
X-Google-Smtp-Source: AGHT+IF5wHBOeSXkGQAxYL6n4RikPXg1rsQVBSgGjP3SNk1+gp0GdS9NH13FpIk5wtFAo3PxZIMq+w==
X-Received: by 2002:a05:6a00:3d0f:b0:732:4c47:f807 with SMTP id d2e1a72fcca58-732618fa196mr12143576b3a.21.1739782717876;
        Mon, 17 Feb 2025 00:58:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:37 -0800 (PST)
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
Subject: [PATCH v6 06/10] RISC-V: Select GENERIC_PENDING_IRQ
Date: Mon, 17 Feb 2025 14:26:52 +0530
Message-ID: <20250217085657.789309-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
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

