Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BAD1DF26D
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883981; cv=none; b=KmHWbqx4FI370ypOjxfeg/SwayP0dLalPjF6vqcFFoIJmPba6h7oQt3+Cw+fBM7fSxrJ8a9Q4C74whNBTmf2AeMHn3VU8E5ZPCDhBfiL8HwNn0NmloGz97IW7Dh7F7ZMFtyR6oZb+zzWT4KRnKkYbHonti82iEhjKHfqGVblIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883981; c=relaxed/simple;
	bh=KmBueEVKme5DtcuzYm7hl+dZKGVzspxJFWdpCrLNZgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEbXiaee2QfmY1vVIVfetRJfihLdpCLPW/FWdEml6pxNlMyL9iCb1YL0fcdLVBTAvCjcyZ8pRWjUKoXaN6tiZZZ0Cz9goTEyIu+eqq4g0u9l+bZ+1rOzaYA46cIze+K7PIRB0O4jQJ35g17H/Igo7fxWKh7f9i+BO4/kR7+E6sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JWg0tbxN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JWg0tbxN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso854695166b.3
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 01:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883978; x=1731488778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=JWg0tbxN03A2WrSKVxdBi1PuCYOoamWHS1WZ6nx4GXssB13bhgJ5uT/4xVzAlsjSA6
         82pt/alFn46a1b5q2l9TpI7cfXAYhc8j/6WyMTdUvBFRMwQajg6Ex+r8yv+zsuBKsQma
         3u2HqqiY8mRUtg/SCg8xePylh+arSc8UrlsaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883978; x=1731488778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=SkFwfDsHyGTpGahVYqT3DtK9tma8i1AuiGPhkRFmwfIpD2HDYzW3Bl3vyDoKf2knuU
         iBV6EVnZiaECuFJTkpRkOT302EDz+CISm3o3l64WP0E3seU9gHXamserCHNwn7f/6nmJ
         47D8x5ZF3Z1BfTA3EWrTwYSyEC5UfaWl5drlqGiNQenKZnj91NOFpjv64d+Zw8lXdmQp
         +5Zlo8DGZ+nmmtkYHtGp7tAaqyXw1ed41qUBiUAyMTie0lVoHhwE+dwr/p/BhEtkv1h/
         EM0TajQg6M7bQ1E8Je8e8W9uQdJboyE/6bM4qg/HcxZcZL5CODiVaUOB3omHAMBFLc95
         tEmw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Jc1bMXl1HvRH4HNkh0rSR6FcOHTCR2anAtqrwCOdbXEYKQy+t5MBnkFCytW7fh1TYhk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPs5IKVpVV69qhQwGtwqvFx5rmXntSf4MwxOcAR1a7ttL/aycm
	RhQet/RCtgz/IKXqoCp2F/1ZMMemeFKq2hZps/kYm97Uvg1iyDwMZTLG9grz3xs=
X-Google-Smtp-Source: AGHT+IGhUhFhDLrkRIYlsMo40Cw3IMcOnJmroZfmc07tt3QFWoaWVS9zSxCeYKz7sxTPazJhdIC8uA==
X-Received: by 2002:a17:907:9724:b0:a99:ec3c:15cd with SMTP id a640c23a62f3a-a9de632bf49mr3313553366b.54.1730883978186;
        Wed, 06 Nov 2024 01:06:18 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:17 -0800 (PST)
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
Subject: [PATCH v3 7/8] clk: imx8mp: don't lose the anatop device node
Date: Wed,  6 Nov 2024 09:58:03 +0100
Message-ID: <20241106090549.3684963-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
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

