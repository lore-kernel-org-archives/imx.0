Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABFB1A0BD6
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766147; cv=none; b=bDc9eYxQaXYxeQ9Ow+SoSTe4vKrC93mI3z1Qd0zWxLkXACVc07jEjZlXiTO/wSRr0PUVIcNTCakL1/um9Q1graGeza0uUboXKDTZvXUClBRN0Bjz7efkKrdxBIjMgtWn0I/toKUgdgeb6xK1rumd8n3cD0D6zz9doWObMh5Ue9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766147; c=relaxed/simple;
	bh=XkI+Pc7w60k8OQH0O7omuaUb38zv0zNaiQvi7wOn+CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcViZAimQI2yM9WGaymjPUm7Sl0f5paCngeZrvc+6JZPDxTdyRPjLJDNmMGFbHYUBrDnXtcYYJG7QXlanw5DXPjjVNTD44uO6PTyZg2ybnmHehh6qA+EP6ZAWzIOpDlU72fEI9kK+bb7+gXoMsGmJ1RzBJCY3YY0n852FO94zyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bo2p/V/k; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bo2p/V/k"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99eb8b607aso76453566b.2
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729766143; x=1730370943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9pUdYv82xqt7Xgtl7+4X7WHgZzcjvtNIADtHzAjrXQ=;
        b=bo2p/V/klpODczpZhIZuFiNci+ZY1V71HoQwJrA4PMv8MZqhJLfnIfSs1E7LLRl/s3
         J9IJB1gt0zTcTPxmPv/D3AIMJXslScHknVB7iHGRFonbHorpt/SwZWN74mhmZQmtPC8m
         iDCRh5uReP8ugd7fKmvKx86HJib1IQI5GOE7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766143; x=1730370943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9pUdYv82xqt7Xgtl7+4X7WHgZzcjvtNIADtHzAjrXQ=;
        b=jjnLEQWBRlOTnuQfxlN5hpkdYtggUelzjsnDS5Hms5nBQ6aqoS9NyIm5nWO3d4tadV
         WtF7AgFz69vraUC06m7lAz/kqABAVhYdc8ujnzSRkPNzZ0c0ff62Fg5OvOvEOSjJAdua
         sNg56u0xGR63loH3Q8WQhslsfJ4dKfDOlyNa0Rv9eBxPnRWa1hc0JBDPHIHmmoQ3tsIU
         2OKidH/YCffAThtGpDu7Bcht1IJYOwHxgzwVVZUplszGOH+uZYsfIXAUbQAq0ZOFNivX
         nXyq3FRMEgSxzgyTEF9mYNkQzTZkNIRnFoXYrP61diOmj3EZ7Lq/9cVVUOp5ZnN1VRLt
         VGvA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Pd8D8DeUH52yko5vgxFQID3hVq+H1Zw6rJ+jYXETORi1fvpKnJRU1cUAvjulOXZj3Dw=@lists.linux.dev
X-Gm-Message-State: AOJu0YytW5GUl4T6DSnpu0cvhwAxHXsm6tzLhmQ/Kb47bpn0n5Dq370g
	Ca/TnZ7k5vTo1wc2lmnfluKdBRSibBR2q6y5rKKkPB6C1mTPX/HPxJP4wmNzvda3cLgcXUoa0IF
	BNYU=
X-Google-Smtp-Source: AGHT+IHfb3oc/tXlxpxsflSckSQeMBrns/+C2m2gpMY+5B92QOH21Ab4FKnncfZAer2tZKtes4/KtA==
X-Received: by 2002:a17:907:3e1c:b0:a9a:835b:fc8e with SMTP id a640c23a62f3a-a9ad286b976mr132409566b.54.1729766143356;
        Thu, 24 Oct 2024 03:35:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559f15sm598592866b.133.2024.10.24.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:35:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with dev_err_probe()
Date: Thu, 24 Oct 2024 12:35:36 +0200
Message-ID: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch standardizes the probe() code by replacing the two occurrences
of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in all
other error paths of the probe() function.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/pmdomain/imx/gpcv2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 963d61c5af6d..6e6ecbf2e152 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1356,7 +1356,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 
 	ret = pm_genpd_init(&domain->genpd, NULL, true);
 	if (ret) {
-		dev_err(domain->dev, "Failed to init power domain\n");
+		dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
 		goto out_domain_unmap;
 	}
 
@@ -1367,7 +1367,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 	ret = of_genpd_add_provider_simple(domain->dev->of_node,
 					   &domain->genpd);
 	if (ret) {
-		dev_err(domain->dev, "Failed to add genpd provider\n");
+		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
 		goto out_genpd_remove;
 	}
 
-- 
2.43.0

