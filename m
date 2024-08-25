Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F241E520
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724589394; cv=none; b=lwQi4SVY8EHBsQYeImF5gu4RYV1yrP1sIGm1qs0+hg/7GaBMB2GUWou8vuaTcvA/v/VL29mbZB+349Yvmvs2zBtx++CqTTDPgxOGbT8meObBKfJPfUCh8O0hDXhwi7y9vWQdwkPBq9DPl2dZnaGJ0TZE7n1eLwLR61r8N00CjK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724589394; c=relaxed/simple;
	bh=6AXodfhsBb1FFNtIxaDf38XHEgg7CfFzYFaOmts+BKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FlL4C2xYiujMwXvrakdJvKGdSoi7D28EFFablK47z0nvKjsiRX2P4ffZlbbIZvgri9OOndvZgD3VGcuMzP5yIeZT2GLrlaowf+8RhMg+Z4l8cfoSpWvctKVSYcP24YJJ6tDX2Qscw2ji95CUQZro5l1bbN7HCgrnFS+iOYcagPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fAYH13yp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fAYH13yp"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b6so4026006a12.2
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724589391; x=1725194191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1CeKLJiREErcfFDmVmFht0rfeHvolojmCG1SEp0D9eA=;
        b=fAYH13ypgmXdT+UOJogsCkyqdHXnl1+RO4nErlrm2CJXLxZ4J4WIcu8T4wVdlGlJgr
         8yYz/QJC9HhBsbHJXhAGV40o2tvpy4yyxl3H8MEAGwWc5MKtapB66fmi0TELMVOtaVZR
         hrnmuEA2EByIDCz7RNwihgvuwGP1Z2bn3fVMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724589391; x=1725194191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CeKLJiREErcfFDmVmFht0rfeHvolojmCG1SEp0D9eA=;
        b=CMCMxTSpkLCF3++Pg3kH//UyBJrfoRhW7Znl3a6Cbz+t5L0W36/svgF3Yh5JgaoN22
         33Fw+B4+dJmlFLwkWp02SM+msdah1LZvhTaKPBfMO+dOVFM+g6dR3kGilNKFbc0QekfY
         Fgu1Z81tOtw8ofG+mlT6gz9pGPR/naGqXeTahpLyiAXunFS8h+60Nax3E05BY0t/IWlW
         5LnrU/mpDU9t0zG0uTR9TbNpKF68XEXP/5TK97xm5ugyQoMO9zFJy4NeleuUW3oWddPO
         D/NOmydvJFYToiqxVQSb0vwhmWmxYZg4cXae8ALMm0dGETugXVceTtqDaB0wsBa6IzOY
         uZpg==
X-Forwarded-Encrypted: i=1; AJvYcCWZZcFNqHKLZ6LbM/5qTpyMCKj3+cmiABeOkGSeHdwzzuJ2HFt3DKPwErZW/IdvXLFsNyI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhhA4NgQeNivzTdfZ2NCzWUiJzYz2NmDxAnzaOJnyKibZaMjFy
	GRmGCHFypDiB0gNCSauTCUYo6uc2nDG8j0MPVX2hzzYxGjk8SSS0uVOVHRmYhvA=
X-Google-Smtp-Source: AGHT+IFHSFH/DUCkWWR0GBh4a/QABa5dvYX0l+xr818EafuCdl7Z/HffbouhFE5+OopSoVp6HJHHKA==
X-Received: by 2002:a05:6402:d0a:b0:5a2:8bef:c370 with SMTP id 4fb4d7f45d1cf-5c08916403amr5020278a12.15.1724589390746;
        Sun, 25 Aug 2024 05:36:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3e89ebsm4350404a12.43.2024.08.25.05.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 05:36:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/3] pmdomain: imx93-pd: replace dev_err() with dev_err_probe()
Date: Sun, 25 Aug 2024 14:36:14 +0200
Message-ID: <20240825123626.3877812-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This way, the code becomes more compact, and dev_err_probe() is used in
every error path of the probe() function.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/pmdomain/imx/imx93-pd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index d750a7dc58d2..afc482ec563f 100644
--- a/drivers/pmdomain/imx/imx93-pd.c
+++ b/drivers/pmdomain/imx/imx93-pd.c
@@ -126,9 +126,9 @@ static int imx93_pd_probe(struct platform_device *pdev)
 	if (!domain->init_off) {
 		ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
 		if (ret) {
-			dev_err(domain->dev, "failed to enable clocks for domain: %s\n",
-				domain->genpd.name);
-			return ret;
+			return dev_err_probe(domain->dev, ret,
+					     "failed to enable clocks for domain: %s\n",
+					     domain->genpd.name);
 		}
 	}
 
-- 
2.43.0

