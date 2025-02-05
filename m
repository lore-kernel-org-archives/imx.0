Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076E61DA61D
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771241; cv=none; b=ejWFRA0F4dWSTgKGKcqi2745ebi/9UC/EITOUqA2nGG3cQF2L1eb2DsBSOwgEpGfLsHDvpqy1dxw7jhBFFWsIcIANHii/zUifw5R2tRSPELSEa7o+/FG98dBLxJilP7AAt7uiOi5M3eOA2uFjdDr/eqpamPotYhnmud2Ol7xUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771241; c=relaxed/simple;
	bh=rPuSUodznHcDcnkXovmaVlnFXIC34eH0em4djJco3jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKuepm/+MEq2C9KBUL1hVCYzJs86XeZsYm+Zsr1N5kkWFnnlfHw87M7VZ2L/uaQU/UsJwX1WaR0SO6y6gNrXcA/rcKkDY1lWHHOEjDYtz9RbVzwj+OmhQ3N1ztFtrwWIFp6mX1i9iPjWk2LSb7Xu45nerNwxtiPUW29aHCdwFzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TmVVHogU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TmVVHogU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2164b662090so135461385ad.1
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771239; x=1739376039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=TmVVHogUkEAW4Fwm6sPu2y9kt7mV8DCuovQatRBF+PFCf6spjzxRwYoq+93XCqmQEu
         2xW8H+GPQ4H3Vi+0UDpCTWQHBJwZsWC2RAhpHEoO6as3/3KhU0AtdLiv7OiuVCRmGyRN
         xTxdTe15l3c4imHXsIHyp7EW2spxD+KTMn6/vkk+Uj4/NQiL6GaxLORDtkegxDasJMVT
         wr7asDnayv8UcuPBqu+BC4wES54faiZC90lAEu1JceAQcrEIMtkdEwraDYC2CuCItO2h
         0ophr5topk0nPKJ4dAqn2S5yQJduOnEyXtuFJKMh716Jud7O8iKwY+MRGVsjdvn4M8xY
         M8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771239; x=1739376039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=T/cNpnzWtgA0+q/aEBeAb9qY/bWnQmN/Qc61sgQzb5O+X8DTgyiN/Zn/MCvbwmaYyR
         DIQeGSpHIVqRoezyXVYtihLlFDbSZQcquu5LSFtVUml+kX4Q2LG6RGo7qAZFPh8aH2qg
         mwEzcZ03z+08DC1Qg4jD153bx7Qr/AhcdqgzX7KRhx4l0oKqdRxJS8diLRv0wa9fpDl+
         hDva6z2qBnFAd/QV0zhl24dPLFcWjnSLb4BOYHxzKEsE9+TZA6YVtDUvReiMyVIM51U3
         HCHx0jhaCcxZqTJohOEITlp+mF2lLJ/S7f9H105J9bnxgTfm3F0zKiaanN+HZohoSIz8
         08fg==
X-Forwarded-Encrypted: i=1; AJvYcCWbXmgyo9wD6LcWrJjqupRtXO6Npa2vCav8kRB0IZff7KcXics7HE3RlIk1nIHxE6+LfhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFnoYXSJwA3aK3mx75YhIwzd3oBKZUH78R7vTzXQtAAzJtdI9B
	aANvvfJNF0tGMcX6UNwRuqfevEGC2PQ97szmK0jbXYeHYphvo0UjQTD2pU82mSk=
X-Gm-Gg: ASbGncs7R/zrNbIeo4TONSzBdvthM9v7ji7Cu8ulfRnWj3WZ0vRonBeeVRLkendnVTQ
	dmxQqRfSMICSD285MCB3BbKq5ypkCS+nD/3sBIOTM/KVoh2WpbjNFiPi2CRI2LMWAmBoelqcO5T
	K+UMM4ufw3uQwYuopRrXYTcMQekqHyN6nQ2hiuhrC7oHJHNJobY8aQDAu+z1pLk/HvwRCxOzGzL
	4DrAaVhFcCoXZDKgclQVplOR/BNeLN8l9Fu8j4JGZqRvgd6U9E7ASARHgXFUTxohMIgOvdwn73a
	EJeZ7vBJduGpD1MV5JOaYGYyq8s1MmZMTy5dsp7IIbfyhanzEXmNJeQ=
X-Google-Smtp-Source: AGHT+IEJIosY/OKbXQSnforNF3833piSl8A3TJUvYoiwSYBBjf98+ctLM/SnWJ1Zo9+v0gmQgw/WRw==
X-Received: by 2002:a17:902:cf12:b0:215:8847:435c with SMTP id d9443c01a7336-21f17df09demr64343705ad.12.1738771239274;
        Wed, 05 Feb 2025 08:00:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:38 -0800 (PST)
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
Subject: [PATCH v4 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Wed,  5 Feb 2025 21:29:42 +0530
Message-ID: <20250205155948.81385-7-apatel@ventanamicro.com>
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

The GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option is no used anywhere
hence remove it.

Fixes: f94a18249b7f ("genirq: Remove IRQ_MOVE_PCNTXT and related code")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 5432418c0fea..875f25ed6f71 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,10 +31,6 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
-# Deduce delayed migration from top-level interrupt chip flags
-config GENERIC_PENDING_IRQ_CHIPFLAGS
-	bool
-
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
-- 
2.43.0

