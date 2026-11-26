Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700044;
	b=nfSBzihr/AcskVnIx9ZSqDlpJxjWXj1guaWrgBKHEBQ0PUNXSI08RowPBeS/iHIbTAq9
	 3c7sh0nCdoVUKMXZDkCvicXZj79kfD/LsjbX7JPshC4htdN1kyknvu6+oeNR6wp26B0iv
	 P0cLCZJrEJk5Z15JZtv2Gq9Y4PvNTla2tmIeKITjwxhDpZGvAeYNX4TxEe4HiEomnu/Gh
	 F39QCB7a6kLJtNxwNVcXjfe2RNK27Lx3X+lvtqXnK+8c7y9V5Hdy9rRgI/VhHeHW2vIqv
	 tmIzTPc8msgGcJKVgVwXTy+CkxY00J2z8IqjzcmUyIvPnVJN5JFRgZnK51WZwJ+K4bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
	b=04TDnrIapYifpkT6likQdam/IvvJutw5JdM7a1TkWJHBLqUCyFlVzUurmB6T5AGzxvSb
	 YWMhq/EkdArHjGxQw3dPRS12a8UgAUSY/kCV11/MQeYzOHddxNgM/OLFMaAqJDYXREqsw
	 +dDfhPDJ3jlN2B/ngmiDlCDp2ZFwagos+0BcEKT+f0ce9Ie5u4EGvMGLBu4WdBf7kgHVW
	 /gJ55cBu0aSLEX5c+QqVDOeOuZ0jXykwVedzrEwPIwr2BkQPT4x9J+G14mkcEN20t+GeM
	 CE1dAbSbyQ3RR9Mu/QyrIJVWw7JZkvQ/TgSIhmViy9VGZqOJCLwgk7Jqccrv66dUgtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TavJrGI1;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A05606A327
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A05606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TavJrGI1
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so9094207eec.1
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700043; x=1796304843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
        b=TavJrGI1dA5ha5kPl/49LY3wKz4J0uYb5fu34xgDg98r2RZo8LJH6R8qyzO5XbiC3J
         HsvZU5504mh7mFjhWZSC/RY8Pohv2uNyUObYzXo2AABQVBstqxbfYo8jf4xhlP5nU2Am
         XzKXIQkKTXYV2a/IeqjM+YyYhjEtcU6qsauyN8jrxMUkb4V3g1EoSLb3r0TUcuKsyIMu
         kxYlw+fJxvi9FcHeeXlGXXW/YTed3suH/vr6gWf3451jJmx19mbBOyaU1KpjIf5No95p
         XNndt4UNK5SPj07AHFX9r2uKZZ/OUUJx0uHw9GleQEGdd8TueAFvc48DZEvLSd/KdDSy
         mT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700043; x=1796304843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
        b=a0i3D2r2/zfqhaoGA+zoQPk/kBjY3URD4lHyvk/u/t/19fLQC6QlGEqz2x53QxIVHb
         +le9w93JiAoVLM4VsiPICnH5JIjQVUgJDiq19nv2Lm5i3sT2luBAOfq4tig1QUKW5reU
         gmeu3v5dP+OPYAK78POJXc4UyxxxZEOz7n8vsQwAmvVoONs90lqK97aCPc3LtNdimB8y
         Qw1xxh1Ge91PpNFt+Jz8/bqOj0ZhF0pA0NZc8vt5eVw9UddhluHk4zxepqYQZPpQOhB8
         jh9dHXMKlfQzFDsncBsNkuc0jt/faKlBpdlxBUeipqHLbMgrOouRH3XMPlvnvsbpCwfO
         Vdqw==
X-Forwarded-Encrypted: i=1; AL+hErElmCnQhlk0WMPlLJAvN+8m+LxdJumJ/3/9ayy/Al1lBV8B61zSazvjviiFa3OM+MnssSA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/OlFxDd/2LcNKcgT7VQaTgatMvw8lq+ZwmUQoX5ZFnykLSPcnT
	w+DufMfIvtbbHLLYoAhuz/QYFCSpG5cfHDXtl+qOp3Ys11RspLkvwmzpD5kcbDxMCQ==
X-Gm-Gg: AZFdTZemAIOelIMLazqk8Juz5VveHTonJR+FyVK6s6v7RUeAevtgbTVN5BJwE7d9u8d
	gLSRGCpFMfJs4gULwQSGYRwodMgJaipHbxsQf4SbGW9ZdlJCX1Ce9nUpsWqFPVHa0X3ipEQl7H7
	MCp1rSnzi+KdtO4YMznfwK4djdYXnev9vWmYu4d3emZMji2JIieYba3Lex83vI+j7YuoKmh2iH6
	xGJtmnPBw4FpSRJgsGcmqXslKdOyioZ7IpcbTGaY8m4zyrQcimXQScB/JDLu4gOEDiU+zZJLlVV
	SNCgfljtNSaapU3a7CIzbtNKi9WSNVg1EwwBGgfvgzNjflwGv2MeO0CgBrpOWZDLybY2ivA5zbn
	84R0RdWeVmXTMVXvsazu/w7d6+6/GwneUKaXS03C/kWr3QuJkGDSjBPIcHAPrKN72v7qMC1/CrG
	rrjhf1RHn8+at/aOQUEBFuzAb7tmh4bFDLR1MVFeRk+ON2ArHH5vLZ0BOHV5TDqcS6tTcSKd/nJ
	6TIrCXgXAE1iMDLycNxk0IXNghMjVHwUGRY51PyPF6Xxi/395c6ZEDSHlIaAI1nYvQpPhSnk+9C
	CJ6m1ubeeKLBrQJccJKmzypbN6zCQZZOfUJu0lUB2U8Jx1J88Q9UXnvm18LRrBPr74Q=
X-Received: by 2002:a05:693c:6010:b0:382:105f:e7e with SMTP id 5a478bee46e88-3857170e441mr26340102eec.36.1795700043018;
        Thu, 26 Nov 2026 05:34:03 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm70967222eec.21.2026.11.26.05.34.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:34:02 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Maarten Zanders <maarten@zanders.be>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: gpmi: fix probe error path when CONFIG_PM=N
Date: Thu, 26 Nov 2026 21:32:39 +0800
Message-ID: <rc-b1-20261110-vc-170-6561daaaf6bd@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_PM disabled, gpmi_nand_probe() enables the clocks by hand
and gpmi_nand_remove() disables them again, but the probe error path
was not updated to match:

- if gpmi_init() or gpmi_nand_init() fails, exit_nfc_init releases the
  DMA channel but leaves the clocks prepared and enabled, so every
  failed probe attempt adds another enable count;
- if gpmi_enable_clk() fails, the jump to exit_acquire_resources skips
  release_resources(), so the DMA channel taken by acquire_resources()
  is never released.

Disable the clocks in the error path when CONFIG_PM is disabled, and
let a clock enable failure fall through to the runtime PM and DMA
cleanup. Builds with CONFIG_PM=y are unchanged.

Fixes: 1001cc117124 ("mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_MTD_NAND_GPMI_NAND with CONFIG_PM=y (defconfig, =m) and CONFIG_PM=n (allnoconfig, =y), CONFIG_COMPILE_TEST=y (object only; no new warnings in either).
No hardware or runtime test was performed.
Needs a CONFIG_PM=n kernel on i.MX and a gpmi_init()/gpmi_nand_init() failure (e.g. no NAND chip found) or a clk_prepare_enable() failure in probe.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 019df54c4bb0..fdfe11439a6c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2806,7 +2806,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	ret = gpmi_enable_clk(this);
 	if (ret)
-		goto exit_acquire_resources;
+		goto exit_disable_pm;
 #endif
 
 	ret = gpmi_init(this);
@@ -2822,6 +2822,10 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	return 0;
 
 exit_nfc_init:
+#ifndef CONFIG_PM
+	gpmi_disable_clk(this);
+exit_disable_pm:
+#endif
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	release_resources(this);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
