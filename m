Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FA519ABD8
	for <imx@lists.linux.dev>; Sat, 31 Jan 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847108; cv=none; b=ruCxILTtnvMWiYAmXvOdSPDz0itMPFDqAHEDYKZaXUx2SLZAN4C1Xi2WkMQp4ZlhZN0ZBvebmpGD8k2HVbd9V7QOgJsEH7ZDuKkb8Z+b6f6ZAY0NR6NJ6hP+sEbsiSVMorV1V+OSGDImszGWmezyAouHT7ue1h7mOtl8Hv2B7fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847108; c=relaxed/simple;
	bh=9OAQjhZI4G9NDVTt9f0prwiTo7Qoj04+zj9JpK/zoHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxjUprMWamdPUolljaBvQgpm0tcNAlNk+LzHl07dYcKTLUUCMppOgkOuHWnCqHIEpPa+YSB51JcmZtZ4UglMIKu79M6B1BYBJL4DyVo8xPAGWJPuXyRf9grxswkuQauPos0QSQAHB6+SEklH2B5Hd63T4PnC+pYsV2oZM2SvV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lkbpsrlf; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lkbpsrlf"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a09757004cso23094605ad.3
        for <imx@lists.linux.dev>; Sat, 31 Jan 2026 00:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847106; x=1770451906; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E79QyFHl6v9hrcpW7a0gJg/ST+Ia1jTsFgjOY9hJneE=;
        b=Lkbpsrlf7Q52dZV+L5NzPUbPPL1aTroldQoiNSmS3p47KbtTAwOZ0DcuTAovIKCuC2
         qqAKiptKl4ffzpdbn8rbPzmkIFRDWcgfOn2kfqSn2h0vBOCIKAyxC3firdTyFJzuSBg+
         sa1kFLv4o9V6ubLipKeQTI3hViZ2sI5eSbpRbjiNCYTookie0lhoYVzb3uQBNGoT6veA
         FHuF+OZFiy3uWQdpDXZkgVcVtQ0wdlOc1/aFy1hVGegjvQ1XPEjeznh/4HeHaaXYPane
         GOGAnp6oLa8SBcVrIeLY7QKIZ6RCSxW+mZ+ndKswsoK3iAdDjBiXy+bJfZb2jS7ykA7S
         HJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847106; x=1770451906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E79QyFHl6v9hrcpW7a0gJg/ST+Ia1jTsFgjOY9hJneE=;
        b=fmpb5apjwyoezwKR1RZmmuqLUye+pgCoNysKzFiOOuRPmfomoPgXY3RPCF/B+vMPH6
         VjwDBDQmj87/nfvaGT1iYbHQHQniEip77tIVUywcHCbDxcVAE6EQ1aNajSz1S1JOjm96
         L3X3dnqgAQezwpIJ1FUCKxSaDTBKxH4ckNC9uZSouGpNQBgYht6jxy+EBvasW+kKTpb3
         x1hTDh2y3dtiGN5LdoQaJl+EQL3ZPxDZ/x4eQsCfCnVkGkPRQswkgVX6SPqFM2n4yQOl
         /sXKXCQu4TvIarw7LAhOVU+CjSlKDRwt1fgw3ot/LQq9P9MSmCxs4AbGhtofh8Cf7Vgo
         5tCw==
X-Forwarded-Encrypted: i=1; AJvYcCVvBh34p4BV7gKG+fl95t7gCG347sfriM2kHSQq4xstPTf3Y9tjpCdt++nDoMqoleXw8Bo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrpc/gVsTcr0QzIv1DjJqXaF5FQYhZS3yK+KWgBQE4/9rp4RGg
	6NCqbR/29hgXf7xYuAIz3SElMslnmO16tIXo7KoZsdIeykXnIQV/a6SP
X-Gm-Gg: AZuq6aJFvIu1xYDEmVA6onC30ihJgHWxrC+kHlG20xuv36c49DpoiSAlNwSjTQIim+3
	Ne0lGHaHFVs282A3qV8FGjFYcHIj6mVliG3jpnVjjdEeS4WY9BpS0lUUKKyXwRoW749QxhoLSMh
	UWRh1YPrM0k2AA3gP7gIu6LHO9EKgyTR2CCe5rx4orWOVXm3CtOdvdewIFqgBz+W+0LuKzpR+6t
	KnQmxzr+IAgq/uxr0cah0AjGNn75InI1bwvYRLym14jIgWX4FSf++O1Gq89HG5sW2QabbBGSinD
	b4q5htedxwhcjv9WKfGpCgLjMpLmraLI+0x2QwSETx+hgUQATbEW5BWIKq5ESR1rHzfFogBtZgn
	llWvm+5f7yR+j76mOwWuzd202atdnbma1DhLYPMiymLuTZVnQG9zPr/ws0x7SLadRCokSnEebhU
	6vTCCGZvk=
X-Received: by 2002:a17:902:8218:b0:2a7:7c72:42b6 with SMTP id d9443c01a7336-2a8d96a221fmr44250135ad.18.1769847105996;
        Sat, 31 Jan 2026 00:11:45 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:45 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 16:11:34 +0800
Subject: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com>
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
In-Reply-To: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=1258;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=9OAQjhZI4G9NDVTt9f0prwiTo7Qoj04+zj9JpK/zoHA=;
 b=Amf+HD1p3lcCeTT2eWu8v7JUo6k/cHzSXe1AmMAfSN8hyokQgHe/dh6dj/P7sHbmDWKqueAlg
 HSqNr6tFh10C/GLl9mZ/HUETAF9ASs8izJZ1BX+ZQlQJkLbXzj1mf8y
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function pll6_bypassed() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing
a memory leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..1d8e8f0891a3 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
 			return false;
 
 		if (clkspec.np == node &&
-		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
+		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
+			of_node_put(clkspec.np);
 			break;
+		}
+		of_node_put(clkspec.np);
 	}
 
 	/* PLL6 bypass is not part of the assigned clock list */
@@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
 	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
 					 "#clock-cells", index, &clkspec);
 
+	of_node_put(clkspec.np);
 	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
 		return true;
 

-- 
2.43.0

