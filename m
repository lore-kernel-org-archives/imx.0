Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4F47A5C
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630877; cv=none; b=q5kF8+k27buE5zi7NR+I6ELVHdtSLpqa69cEizZuzJ0oi2hebosoFqG/GuId42wS+NzruCXdA1cHzzfYfiJwPUDw4g2A/93apyH/xwjJAJCMpTj0/ID102r//sxYgxB8x8u3nkTWSkXkhPkerjME9l867m4jIlgVa8gV3iq9t/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630877; c=relaxed/simple;
	bh=KmBueEVKme5DtcuzYm7hl+dZKGVzspxJFWdpCrLNZgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGcA52qfpxfEl4E+oRa+aoBh1Wx1lPsoXfdALukCND/c16DNbgP8tmBd0D4fApyDdS3RxEd6u1ym0X+NiS7MwmtWdz5+79AuKw3UdGd+8PLFMt59X/1Y524A1T1+vQk0bNSREYN/+Jtv82UkOwXwKxhJcttdSpn+fpyHsX8PAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ecupnQ9L; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ecupnQ9L"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42f56ad2afaso37360195e9.1
        for <imx@lists.linux.dev>; Sun, 29 Sep 2024 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727630874; x=1728235674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=ecupnQ9LUcEyDdkF4B99vVcsK9brwl50CkGF8q4yT1tlPHhNQvqjJDfDEEpK0vGXxm
         7dkbkkAAVMaGd+xhU8ecYNKUfVLs3aMT1DGbi5zSAt5csaPngNH7+ASbu57h/grVJcvl
         RaVPyMHvz8iwuYy4Rhv8sEri3oQnljxlUPOJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727630874; x=1728235674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=NoCwDqS+EG7Vf8xPrEjCvgMy64sG6qOfLkh0rtsBpC6brmmhYhzAy+ozl8BTo9BISz
         LMZp6DVST9ekk1yvJxBWf+wo5oR2vnHd9Cy7L0oxjzMjoN2mO6sjqk5Oq/Z6OT+z6YIS
         IdHYDybagfvOzFHsyrl41NoM4sAuykg2tN6P+1jUExwNsK4YDxRJhAyfnKli7483D37x
         ZACw2Ir8KCymq/E8PF17th4d0SfwUFrMHMIXg+l8vRb1HmmH3NyZoOWE0DJ4MFbRV8M1
         nrNhkwHrqypSVQJG5DrpOFi+5niwYSFBqEQpTFBgKUteVIRPNjeIfSf6Tb5xt0aSAbQK
         3Iww==
X-Forwarded-Encrypted: i=1; AJvYcCXPUdUFHHIVYjrM6dWsCjMJg7TEov2ZH7Rowif6TbuV7wdStLC30HjGcW1H6zig0g0Z7vA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4dKfkEhCvCWUPPmki9SqjFylah8FaGZeEFtoMn2xwhQNDHND7
	En3HCjJ21bNSe+/BXvKKlwBELPHKDLEw9PT5fxMcYdjPoRe2/tRGIf1tCHFH0jA=
X-Google-Smtp-Source: AGHT+IGmvVmD7fNsIntJU4qP6HHyGpU2QLRfhh5X/ydqxCTIJfv/+WNCG9XNyNBpNOJz5bNihD8xgQ==
X-Received: by 2002:a5d:6886:0:b0:37c:cfa4:d998 with SMTP id ffacd0b85a97d-37cd5b1515amr8217224f8f.49.1727630874386;
        Sun, 29 Sep 2024 10:27:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm403176866b.8.2024.09.29.10.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:27:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 5/6] clk: imx8mp: don't lose the anatop device node
Date: Sun, 29 Sep 2024 19:27:15 +0200
Message-ID: <20240929172743.1758292-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
References: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the "clk" (clock-controller@30380000) device node caused the
reference to the "anatop" (clock-controller@30360000) device node to be
lost. This patch, similar to what was already done for the base address,
now distinguishes between the "anatop" device node and the "clk" device
node. This change is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..b2778958a572 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -408,13 +408,13 @@ static struct clk_hw_onecell_data *clk_hw_data;
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
+	struct device_node *np, *anatop_np;
 	void __iomem *anatop_base, *ccm_base;
 	int err;
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
-	anatop_base = devm_of_iomap(dev, np, 0, NULL);
-	of_node_put(np);
+	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
+	anatop_base = devm_of_iomap(dev, anatop_np, 0, NULL);
+	of_node_put(anatop_np);
 	if (WARN_ON(IS_ERR(anatop_base)))
 		return PTR_ERR(anatop_base);
 
-- 
2.43.0

