Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC10022AE48
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 05:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069486; cv=none; b=KZiVMER8/+K/4sNVhRqA1U5V4uwhAkW+l37auh81K6QxRkW2+Vv/BRs6sPxx74ONdQMbaNKGO3fkoRtBs6ZAKwTseqgYW6M04qyGXD8TiIP5pJQmxytANX0GhOIEUSC6SW//CrN8XpntZODH4fwf2w83q1VHXCiAUS38txxI6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069486; c=relaxed/simple;
	bh=xncJOWmuYUFhSJpC2ndwx4Ilw8Yx+jekAMRqVnwcHuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KuEhiloaQ9w1wcem/P18JGRjzU3RrxHinelwRf6fcWCEp0Ei79rgvUK89DddBG2c3v4azvwZ5HnwHUqwmatP4ROKQspBgZObiNekOfA+Dk9du20Mdpnf5VWIWphMp/RyQ+tRK7rDuhMd3GbO3OhltPxS69RoO8oZ8BVsJqNpQ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Assiw3hb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Assiw3hb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2d792c8so42512085ad.1
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 22:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069485; x=1781674285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQdOheEUqRpM4ZgP7ld+n/Ny0a30r9dAAihdKcjT1Qk=;
        b=Assiw3hbZFM4M7Recz3iFBkK4t5E2rUsIsET9gytEsPoOxy5WfnPwjBkJkw1tHFG/c
         5STGWL4AjLEC3L/gvJVEn5X0irqwlrcqbbp0trs+VMyeJ4UdBzPiOc4exZzob99l9ZjS
         +XqqXjtmlRAv6fOC0cYZBMkj5gAPOMfA4pnnMJyBNRZpA0UEF99Z5b17DHXDQ2pfpi8r
         sL3quoWbumzt5JwEGmh3XQbcVSr1lWy1QuJSbCPB8Y11V9JB4V27VC++U91Z3LAWZxUh
         YveRFDhjyXHfuzzW4pvGt1fiWgfRLczzDGsauJ9QbjIr9AZl5E3ukMmkAVlI/cgJk2R4
         5bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069485; x=1781674285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQdOheEUqRpM4ZgP7ld+n/Ny0a30r9dAAihdKcjT1Qk=;
        b=kWoYYccPGTm3KZl0yzBhHq4U7N91YcY/a2Wwssnz3sqBAsy/k+F3aBZXkKgYP5NG1p
         Dh0acbmCNgWAldMSug+yAMcpJh8s7Ihaf+iCenG6ti7gulOjMPfNV9wy6hMn15DuKR9l
         mzF+2gkzsGxR8jejzXKzOuRi7AnbSBdAPGZylsi3WdpzzxhW/Ic4Rpr0i1rGa+xq/wVc
         nBT1kCXfCAC4afAnC7s67nv4SAA2TWD4Fc+M0d807fEQihW7Cpu9wUOM45beoavza2bm
         QQ678wbM8Wr1ZvNC6S2ywSe0ris+tZprB5pMM3aNbUzUZGevDNiqyvNmwvGyDvP5RZTq
         rMsg==
X-Forwarded-Encrypted: i=1; AFNElJ/cXDNNpAnIAA9Lb9ys5KrtjiVjLQ4UAJP5hlmV6NLZIjK75VMdsIjjE7jqEQwYppHNvp8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSUUwEJgUtzXZymi5VZf7HvrKM/HrwqjVBe1gUfwvDKwgzuZWH
	dPvGy3ePlgqEPqtt3vjRnP+3w0JLtn2Fj4i60PIM5pyO5qCjHDlesqnu
X-Gm-Gg: Acq92OFEO5Ut0cE4BkaCM80cPvIp8tcbm0YnWwiIAuK5hVGbYI+ZWhjUUwYBoZ2PHty
	TN/8G440fGkZP0zLGVcPOhvDaN49+9a8p14wtYYP16rY0creezjOfXWjXpnaXbWW8S6zTiw8Bzb
	ldAXWotlvrnoXYevI26S8hbe93MzK48ubG58UdAXLslU74vt2n5S49T5MnrYF1PLb60kWeNYjGs
	bMIRz40iD4mOwRa84WgAsEJblzeq9FvDt1Vvhvfcn9TU39WmtawFigISJqqX4ZpulfM6TD1aAiu
	0NElsYEfAhPZcBHsHLmBaOunS1bcR0W0ZoiEwYPDW74X+tsSjGTHmGelGZ+TYOZEmc0rKHFuClk
	Ox2jPo4vHMkz4fzLSi/9zsU1riRyOwjlJvaYbUaXvaWMyosicDL3Sr45F1lBB83mX+I+ZgHT1Ep
	YpXMt6pgxEprB8rX4zANMa7mRa09go04MG7gMHk9bB2X31n87GjDuqtWCmzshFtrr4iaP3jmbcX
	/e7nfJEc4kIMuKyQX/2TgesluIx7fwrAh9Cw7H93wyvqLcY4yIxRw==
X-Received: by 2002:a17:903:13ce:b0:2c0:c0fa:1659 with SMTP id d9443c01a7336-2c1e8207360mr303183845ad.33.1781069484906;
        Tue, 09 Jun 2026 22:31:24 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm107916975ad.45.2026.06.09.22.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:31:24 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] ARM: imx: avic: fix device_node refcount leaks in mxc_init_irq()
Date: Wed, 10 Jun 2026 15:31:15 +1000
Message-ID: <20260610053115.2263570-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxc_init_irq() obtains two device_node references via
of_find_compatible_node() and never releases either one:

  - The "fsl,imx25-ccm" node (looked up to map the CCM low-power
    interrupt mask registers on i.MX25) is stored in np, used by
    of_iomap(), and then the same np variable is overwritten by the
    second of_find_compatible_node() call without an of_node_put().
    On i.MX25 this leaks the node reference on every boot.

  - The "fsl,avic" node is passed via of_fwnode_handle(np) to
    irq_domain_create_legacy(), which takes its own reference on the
    fwnode through fwnode_handle_get(), so the caller's reference is
    not transferred. np is then leaked at function return.

Both lookups predate the switch to irq_domain_create_*(); the missing
puts have been there since the code was introduced.

Drop each reference once the value derived from it is no longer needed:
after of_iomap() has mapped the CCM registers, and after
irq_domain_create_legacy() has taken its own fwnode reference.
of_node_put() is NULL-safe, so platforms without these nodes are
unaffected.

Found by static analysis tool CodeQL.

Fixes: 544496ab5cbd ("ARM: imx: move irq_domain_add_legacy call into avic driver")
Fixes: 9b454d16e57d ("ARM: imx: avic: set low-power interrupt mask for imx25")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-imx/avic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/avic.c b/arch/arm/mach-imx/avic.c
index 3067c06b4b8eb..6873a50bbe2c0 100644
--- a/arch/arm/mach-imx/avic.c
+++ b/arch/arm/mach-imx/avic.c
@@ -173,6 +173,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx25-ccm");
 	mx25_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 
 	if (mx25_ccm_base) {
 		/*
@@ -203,6 +204,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 	np = of_find_compatible_node(NULL, NULL, "fsl,avic");
 	domain = irq_domain_create_legacy(of_fwnode_handle(np), AVIC_NUM_IRQS, irq_base, 0,
 					  &irq_domain_simple_ops, NULL);
+	of_node_put(np);
 	WARN_ON(!domain);
 
 	for (i = 0; i < AVIC_NUM_IRQS / 32; i++, irq_base += 32)

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0

