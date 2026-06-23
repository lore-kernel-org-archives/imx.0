Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61764370AF3
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211576; cv=none; b=KfUPyZrEpVPh36TehwOEcduNpt9MNus1K913gJ5DakC9hrY7wndw25YzEE9mHgNATB1JnfOMjeJr3mOKwiOExgu7yCqoae3VNhbi9nstaYncWwk928SnF9M8gyMxeVCzFVBmWjSFeT6Ep6WcCGW2ajIiQyma3MbniYOZ6cG9KUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211576; c=relaxed/simple;
	bh=wjMPVOYlQDUbbr5l/O1Z3Izp55XAJ8pUek6vzl+NKM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s5joHXHb6PLo+g40S02b92dpMhOlcaXpIDi0PsARLI9jTzAU7OYiyF5hPNuN064xwadOjoSyKq7Bg2G/rX3Kfgdf2tZmTFWVnpTQ0KahnfXkfmZiEtmvr+zsb9rM+dzT5WnCga2Em2AJZDfpSwiiIyKLz4IIarV4uHqmX16LeCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Rr0g0kv8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Rr0g0kv8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4924593f45dso37929115e9.1
        for <imx@lists.linux.dev>; Tue, 23 Jun 2026 03:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782211572; x=1782816372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeXrq3s7XQQ03NTVUcOFA9RC9zObh9CMfGYLv0lwNEI=;
        b=Rr0g0kv8nqhMJmJTFnduEc4d6nhZDiED6vFcceWM/T/LgnLzg0/fo1ZcjbadZZcuYS
         bp4VSEaloLp19/nXN7QYAuoNKvOQpnSSjaNdelxPeR/Wrjznik6L0TzGHssiZDHav/nS
         PZ5jfaGQuL2XTstWVeIBJFv15jyQvziD9oX71Uh1ejzmmkLZyojJaIhA7bMKJBJFD76f
         j6EHM3oxVZrULp6xDKsyOJiVTzEarr9qRbiFiRLsN5Vo/x/nR68ZsusBrM/h5EOrlYRO
         LI+qpyQM+HBSBdnmGkvxOItF9zMf387j1R0KIdr1JpG9iMZIclBfYCeUfNifX6U+dDMf
         c3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782211572; x=1782816372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeXrq3s7XQQ03NTVUcOFA9RC9zObh9CMfGYLv0lwNEI=;
        b=hvpBAIO5xi25/zUNYiRj71gAtBgWCHUmQkWu7IvVZSHAHqe86YkOsFGAg+WFlTxRWI
         7XQ3sY9JAoNY2stAOj3/+TgeMvVEKrmWROyLlYOQ/N+ktnuRODOrivsOGn0++4wurm3w
         BYPYmw12sKqAiegjgfUfFm6sXvZFted0dAUaOncwUsyMLhXFBTYyilQxKSewKArRvSnt
         aj9W3EbnuJL+NJMiXKGpjmMimArBBTBcceezQ6emjEgwa2t8z/jpLeU83+QuS3uYOkX/
         XkbzrxXjNtKnr6xLEzlLaLX4UUAH4IQ1M/Hn70FQIBGonYVhr3lv50wAgvSybeS8MKKe
         KtZg==
X-Forwarded-Encrypted: i=1; AFNElJ+IV0agvfaKzg4lyFflI014LmsKrX+PaalCPBxVwNoARHW8pwqx2hO8jRLGvUSOVskuhX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrZEbUUvYTJyXLzYQINbGs0BR8ExeXifDHWukGWCJdo/bLBudF
	B7G5weOY1iQd0Nx1cTfuQuaThBA25ZE6JWYsvcbHR/XpNiLI1T4F64toSrxNl61mrDU=
X-Gm-Gg: AfdE7cnwgnvr2Nq8UoGJ0b3Y4WVZh5UpV84Vvnitfw4LOSKr+q7gFbbQ+icNJLqywKt
	Cd2mToDplIGEl3ltEwGx7fmfIb6jerH95HkfA1bIazgpoZGQoexaZnjgZ+sOLATNZEMIPEmRlxA
	+FOf8tT1Zpaz5mCXnrq09X/mzu4p/g9xKZ6nWkCVyrYGKpbLF2JxeAUjuT8AvwO2ab8K88cb2D/
	yKZF0zuHsQ9UXm0+LDpCbTB6eQ6dmaSmquZBltzX/XWSgEPyQy12q6oFZsGX51u+/d/aGxCJudx
	5at8jUzhzVjBw1GHEPJh8xDusp0v6YbTDDvvtdEKNffgKR1WCgtcmxDl9wt6A6E1XdWrWAS3pj1
	AAHF5Tmdz/j9rHD8Fqtk8YpLWSCpML7TX9SJgCmcAMjQNM5wqhor77f2XACiWRhpJbBp9gWNLH3
	+2Xc+xhPrVO+1NiwdaVFArcK8SKaXgyTBc+oyz30lgJakZ2T5cWZgI4bxXEQvyCkZHc5/aw7Fu4
	r4nYSYCG63uYKk=
X-Received: by 2002:a05:600c:4e86:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-4925b3b6a6dmr32351285e9.30.1782211571510;
        Tue, 23 Jun 2026 03:46:11 -0700 (PDT)
Received: from localhost (p200300f65f47db04fc6db6816c271cd4.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fc6d:b681:6c27:1cd4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-492494497ffsm295458225e9.11.2026.06.23.03.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:46:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Date: Tue, 23 Jun 2026 12:45:57 +0200
Message-ID: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=wjMPVOYlQDUbbr5l/O1Z3Izp55XAJ8pUek6vzl+NKM4=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiyr5KeZ1bxvclSYN0ryzWjd4DVvquCtxSt7lodOrRP6X hEy0Sirk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJVIaw/xXf8WnFlD3W+lJ5 T/lFGpdftL3ntyQ4yLp1b/2krSWLe5l9hfqiZhxbpK0tWRNle+P2aSOhcre5c7Z2GExI/B7aVMc e1rC182PkjJh9NsqqJ1MF9i+1SbW/vS7Qrywlw3wN+1yjrMmF60t6PKely7cyK3+8ymW6+nMlR4 yi743T0cam9rsbu1339sxLjiq99+EB6+VS5m5Ww005QvZTXjxd6Vr6//G0l0k6+7zWF82/Fndcy v3RBvPlpdMUzqhkWz3Y2FPQXGj6+caE/uwDmS5KCReDloWcmNjZGN2/Ka6FY1+0wof14etk2XM1 1m1Z57Ch9H2E3LYFJpP1rzy3VlO0cvO8em5dsP+HFOXrAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
4b563a066611 ("ARM: imx: Remove imx21 support")).

The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).

And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
("ARM: imx: Remove imx device directory")).

The last user of imx1_reset_init() is gone since v4.9-rc1 (commit
e1291cffcc50 ("ARM: i.MX: Remove i.MX1 non-DT support")).

Drop declaration of enum mxc_cpu_pwr_mode, the actual definition follows
later in common.h without a usage in-between.

All users of of_device_id also include <linux/of.h>,
<linux/of_address.h> or <linux/of_platform.h> which is enough to not
need the forward declaration.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

found while working on *_device_id.

Best regards
Uwe

 arch/arm/mach-imx/common.h | 7 -------
 arch/arm/mach-imx/system.c | 8 --------
 2 files changed, 15 deletions(-)

diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index 45c1a2a7b35f..d7ecaa822adb 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -14,23 +14,16 @@ struct platform_device;
 struct pt_regs;
 struct clk;
 struct device_node;
-enum mxc_cpu_pwr_mode;
-struct of_device_id;
 
 void mx31_map_io(void);
 void mx35_map_io(void);
-void imx21_init_early(void);
 void imx31_init_early(void);
 void imx35_init_early(void);
-void mx31_init_irq(void);
-void mx35_init_irq(void);
 void mxc_set_cpu_type(unsigned int type);
 void mxc_restart(enum reboot_mode, const char *);
 void mxc_arch_reset_init(void __iomem *);
-void imx1_reset_init(void __iomem *);
 void imx_set_aips(void __iomem *);
 void imx_aips_allow_unprivileged_access(const char *compat);
-int mxc_device_init(void);
 void imx_set_soc_revision(unsigned int rev);
 void imx_init_revision_from_anatop(void);
 void imx6_enable_rbc(bool enable);
diff --git a/arch/arm/mach-imx/system.c b/arch/arm/mach-imx/system.c
index e88ca027129d..1afae485f203 100644
--- a/arch/arm/mach-imx/system.c
+++ b/arch/arm/mach-imx/system.c
@@ -74,14 +74,6 @@ void __init mxc_arch_reset_init(void __iomem *base)
 		clk_prepare(wdog_clk);
 }
 
-#ifdef CONFIG_SOC_IMX1
-void __init imx1_reset_init(void __iomem *base)
-{
-	wcr_enable = (1 << 0);
-	mxc_arch_reset_init(base);
-}
-#endif
-
 #ifdef CONFIG_CACHE_L2X0
 void __init imx_init_l2cache(void)
 {

base-commit: ef0c9f75a19532d7675384708fc8621e10850104
-- 
2.47.3

