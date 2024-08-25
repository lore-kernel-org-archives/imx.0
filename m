Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3E320C
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724596474; cv=none; b=YKOuY9YY9/3LAtSYmIlfoKVZMAVe6t0y+VSM/6DHZRaHlj1GFYI+9aNqg3shAzoCqCpIUCH+Rm4nmfhO/gTiGLmtijOWleoCVY3satI6uyMu1j1aoGUezqK5jsIMp6K/WoD3aeG7WpjWbZcgw8sJJw90udw4sOTiv/W0tUfXSrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724596474; c=relaxed/simple;
	bh=Y4w5OHB5AAqQgw5YqBA+ey3TPocL/Uh/eEew5lcaGaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVOa5XKiTnm5AZiJqngnd9Nq7lCI2vIBn6WsD7ib1T8LXfx/46EXPgJgnrhSUnrjbuNtvQCUYYN8GD0L09y5o1fPj2YnwbjAaI6RdydFpqSBMkqnInMic5vB4B8K1Uq7UjFtb5Xj79px7Om+U6A1pyjYU76nkceIPaR1mbFSxys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OhfBkzFz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OhfBkzFz"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8695cc91c8so362554266b.3
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724596471; x=1725201271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJCtcmIB3UdIrkYLcVzOIpEPiO2wmd+dCBPvqHnV2K4=;
        b=OhfBkzFztOriGoxQX5oS4IPbDudjn70OfpbpWIgGCiFw5gEnjn8/l0u9PYLNg9wbPq
         NObonAVYfhoB3xWmLd8lKSaThAzA8vfSEUGOdsLdidzMbq4Vd2XWS6zeQOG9oI5TtxtT
         mr2gq5TgdMv3NLOX5Iw/Ijn3Ezh6P88GfmVK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724596471; x=1725201271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJCtcmIB3UdIrkYLcVzOIpEPiO2wmd+dCBPvqHnV2K4=;
        b=h5fVVNMrUZ0m0qWY6emAiK+5ungsA5O2hfq1hyZ75Ffqgtie+kgAqW1XsN6h6oM14e
         bRaQc+b/MsfLH12X5HByGHIatyxX1N6LeoPTvd6qnaiPIn5nXPQxD7keo9wVomgl6Iom
         e1U0UZEtXPu1pU7rXxpLTPPYDaCpYR+AYLazMrvTTu1BuaJbZj+rr40SMoXLpE4vP3Ic
         1Cg0aIqKG/p1EkbHorTphEn1oLckccsxvJ+EkN2V+7pJgh6JfZ3kpTZv5DvrfWVGOKI6
         QrKYgrnTJZoFAqDwD5940VGGgX9utG+w6BFnHidLwaJO+w+S7FeWqCtcMnN6Ud0tG1DQ
         WW4g==
X-Forwarded-Encrypted: i=1; AJvYcCVkRx40+PNqwGtFZWweTIIRiLqDsiPyJ9mebdIvRl+aKhGi0akKW7qbDMg/nHy+Jgm5AgQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0aALyCqUz1fm2522PHwwJwFY7DHU7mu2xnyGFeZMn1HlyQcXU
	9iCVkjDNE62jORhC1/ORRsJERadzb70F94z3G/wo9L087xZSJd0qqYbkvzP3wIY=
X-Google-Smtp-Source: AGHT+IFrPkCDWSQxHr3mcynt8lDSRSWlq9K1FdNFRP5DdDzP7xtG+zdnJc3gqlxqDwJcYjVr7uYgTg==
X-Received: by 2002:a17:907:7f12:b0:a86:8524:2558 with SMTP id a640c23a62f3a-a86a518a3a6mr468976166b.12.1724596471075;
        Sun, 25 Aug 2024 07:34:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4862b6sm550625566b.170.2024.08.25.07.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:34:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/3] pmdomain: imx93-pd: replace dev_err() with dev_err_probe()
Date: Sun, 25 Aug 2024 16:34:00 +0200
Message-ID: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com>
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

Changes in v2:
- Drop the extra { } to be even more compact.

 drivers/pmdomain/imx/imx93-pd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index d750a7dc58d2..44daecbe5cc3 100644
--- a/drivers/pmdomain/imx/imx93-pd.c
+++ b/drivers/pmdomain/imx/imx93-pd.c
@@ -125,11 +125,10 @@ static int imx93_pd_probe(struct platform_device *pdev)
 	/* Just to sync the status of hardware */
 	if (!domain->init_off) {
 		ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
-		if (ret) {
-			dev_err(domain->dev, "failed to enable clocks for domain: %s\n",
-				domain->genpd.name);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(domain->dev, ret,
+					     "failed to enable clocks for domain: %s\n",
+					     domain->genpd.name);
 	}
 
 	ret = pm_genpd_init(&domain->genpd, NULL, domain->init_off);
-- 
2.43.0

