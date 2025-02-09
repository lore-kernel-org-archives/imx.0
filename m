Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51B2EAE6
	for <imx@lists.linux.dev>; Sun,  9 Feb 2025 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074687; cv=none; b=OsnbRkCFWWKGPxdVKaMLcukL3rLWVAenznvAr0sDM8O6gfQ+H5+6H76KxBPtXUQEEYa6hKdC8+oWJ77oN1fPBq//Z9OkTRNUgo2CMaAeKvmkmOGDEvH4pld3UlvQ+wFyqRtH0yHAZYrqd5a5NgSR8IW3KvdqEWZEUmzOgS95dZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074687; c=relaxed/simple;
	bh=rPuSUodznHcDcnkXovmaVlnFXIC34eH0em4djJco3jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OG5wD8CrAs/Xh874cYByIFumjywX5dmHuVPKOo67Vpt6ih0EP1LWiuBFeWahr8uO7emry2uPk+G//8eblUB63aJXQ81p29cXCAfmcSvKF0cdSpqQMDKZHbj1HNXaUUVP/c3cAEKMxV0IJcZ75RFyoSmQvhIT01grQ8YBmFo2C34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=GJSzJhbV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="GJSzJhbV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa40c0bab2so2049282a91.0
        for <imx@lists.linux.dev>; Sat, 08 Feb 2025 20:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074685; x=1739679485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=GJSzJhbV2fg1aALcMiRHJvPYI4tDnGxblL1SAbSy1W0yEjH57LiW+3f9UP/i3N6M5w
         iN7zwl0q4TvYbykXVRLXU89hWDo85kvUwlG6hrzAP8IoASNOsolDW6Rm5o/BGDOG0uEn
         OtYJrS72622GHx55tRo1y5kMwYjbNcZpUcKnkcwursvmo5c1hzUvGOYOqVmqG2GpopU7
         r35vi61GyVWSA00+c6rrvzx14EIWB2oMCALZMp0PY1raE3E/iSujkuV6CvS4tbUH6w51
         nfKnRUhpgn9O9l0kfp4vlPqZo4l8JXXU5svwnHn36dv4HTkkHwDgQeT2xTuILTpiz+CT
         YW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074685; x=1739679485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=pfxHRIXuYrX+PA9ueaPyg98TV0hNlOnGc/baoW6/KGmqXhD0AlxUKVRmlf9vPp0JCQ
         ci4dDiEWbw+SO+jBH74Ng6HgiaBCfFRA2KDDLlM9s9psosD9Kt4wMGXLyT8jhwW0aMDn
         x4zsO8qRZf7mbX3CallG7wIYhKL9uHyJfwWCCUIG19rORqqswIlAmpIkzh3S6IUz8cLS
         m83l6jWRAL4MpNJeJP5wZ9lTGRqavKzdYyqiJNpGWfvldw81ZKpzFDGkYImU66eRiGkW
         ZfPzJRRlugWuoEQQtyjpmD2Prkn55JyLqn3ls3yHWyeisT0FP2KrFgxLMmXXVTiFnS6c
         XG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2D/p2nRedbSiDntlIcM/lS9uxzCE7D/C5hgsKyAPzs3zN731PGU/YAspjZ8ve5IgRpko=@lists.linux.dev
X-Gm-Message-State: AOJu0YyD/73A86wzkgQ997WuTwXOroxdUEFyGnmdktlv/u2FJ7U8xP5/
	wjsyXBcVSd8+NxszOPLULNctfBtwMuYHjGgMWWceuEDLEgN2KYt+OfNTQd8CZ+A=
X-Gm-Gg: ASbGncsujZ1vSrDHij9K0+Fag1NPPKKmU0I96WRdZxXXV9/sdX9ybnIFul2DlebWrzy
	apizzc8QksWlriLILDdErRW6cOqyy3WgM7h367jgd1meJJKud55ttRUBzIkD9/ec5P/SeELgP35
	4qumsnufCYH+Pz1HX/8Hg7T4vcEQ/ZCd21g7dh/Z5AqVDS1+sDw6QukleC3Vshq7/jXck/FuIbk
	UgAXcjku0DX9K0O80RuV5wWmvz5HNIizRlkTrEJwNiG23emIU38yBqZLHucJmtVbFfOQXnq63Oa
	Ela1tKfEGnvQsw8SoQ/TVMWX2FIPlTpZ3X76yjNy9P4E3/IyAWVjE5M=
X-Google-Smtp-Source: AGHT+IHplK1Odn1krUBJui9aJ3bXui5w4fG7ychKlkG3JoJ8qZ1jCX3WfSDt+grELpA1vaZRwG2+1g==
X-Received: by 2002:a05:6a00:178c:b0:730:8a5b:6e61 with SMTP id d2e1a72fcca58-7308a5b7c17mr217952b3a.2.1739074684846;
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
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
Subject: [PATCH v5 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Sun,  9 Feb 2025 09:46:50 +0530
Message-ID: <20250209041655.331470-7-apatel@ventanamicro.com>
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

