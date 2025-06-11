Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D72836B5
	for <imx@lists.linux.dev>; Wed, 11 Jun 2025 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646461; cv=none; b=tEYIOFSPFLZgqokW5dTAYbnOif/ivLOKxFDw14BmgDeTooqPWBm30Osg2d7YkSemhvAvi7MPPsE1tDaiZlAboVOoxCYJxqPs6mZW/Di0MLh2tx8BSXu5zmGAkRo6mL/jOb6xmXpU7Jd2hHl8Sjvba4al/2rmM2Qgd39tIfFVNdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646461; c=relaxed/simple;
	bh=0jgUbMrrrNY3QwhLNEA7O8KCiSx/gIOyEaCeWfqpB5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4cZCL3AP3XPf8leXpPzvZqZ29IfxSDDzYKi6QC2rljak+8rsOg4/FOmUjF6aCNLc+Zr5rugtpa0LnezW0/bsh+WC4omJUR+FDhXMcHSPzKTtRDVSY8BQ7F0WvQ1qyP0wv5LoCAM+Rx/K7UwtO4KJSAm3nxPTByOX/Czfn5I17I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hOS443y5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hOS443y5"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so3836242f8f.1
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646457; x=1750251257; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=hOS443y5/3U2adc6EHNwsTswTEp5mL2D/G1HUFKfplYHrLDBxBdPbpsRs1arbjPIM6
         S8nHJ5G6IV4HCN+7Q9FzKwpAAcS/N6kd2DJbNPzSDMCRgsqnaOqCR1COGnvVPvXAAk09
         76BT6KYGSprwWXeJ90fbKVKvKomtDC2UDAOhxkpNWA0fa38VfeCa06h83YhHWlK2gRaH
         JX2EXYqEMti+t1le/FugN8QVR46B/dQ+lw3gMraT+s4WAIln3J7mlKtLOJYMLWYZrhnq
         o/XlsN+BuuH5yBW6nABCDgcSMI1+43HM0ctKYn5p/mjlGzabCc8rjZW5srB+CeZ0O+hX
         WwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646457; x=1750251257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=uiXE/qowP6cZBM7wI7DqipFGUwg/cgJb81uPCM5Rin4ld7j99UATYQ7PRP4u4wwaUs
         G5OJEoEqGHiOzHU7iURNtcs9ZFnFf+pFXN1V26DyAO1/rrJ9bC8/3Lnjfa5/l87/5Chn
         WPx1mTzbKEie80rnV1A11ewsH7TLCoQdWWBsK/s3useA8OcA2NAQf5pGohuNk/1WvJHA
         DNZdqRzGvCaegEMbE7V61hpquoTrVSzXmBQMhNfkYsFpmvCegyeU/ubpuqxyPK3K1zXc
         R25Uyt/znJFhPw0V076E2Xf9iktJyZnsOIpKZA2LLK2srx1Taz886TP4qUIHdxueYkxN
         /DDw==
X-Forwarded-Encrypted: i=1; AJvYcCVWBwp+qjxw2KhUEZ0Lba1Q/QTkMNv10jfIsAffzkGH/2tBarbFPQ8CYe2v2K2xQOAeDvc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMYqQUvaBDKm+LNX98EM6HmuNcJf/mcDeWp5RsHhH/xQfM+fjY
	aR8jR2/SS+IFRxrXLmBc1duz9bitRP2NRNoVozkAw6y/gQuVMpG84OfJmvTSMxYWt1U=
X-Gm-Gg: ASbGnctfq7kK8Iv4zXxBXtsoRwdd9vUvg4xI7YIgKFiaRVuqzfFKYdSwHTnwTa/u1/c
	0FXNIhhEikJX+glmCBkEJ6Erz2Ej8eajcYZVmQ2rK1vJv7ttTFSx7XE0jsRHm/df9HY7ESWR6us
	y06CGhJCRCBKOjZxLjPkOXtXsapqhlrpUeRYkyh1W1opGCtSh5FzkkPyYYwE70dUxTtBitHgX+N
	XycMDJP925yOpmVE91N3JXMj/0J7CBMWdTzwiM97GSsndtifVadqTxnFwvHRN1LP7ebM/m7SOLN
	6z3FoXuMRoe7B+7Dn4KDr65XLBM7TswkvnPpNi7Vhm3mu+kH/6WF1rgxYRaqYyxd3JC5D98GZTy
	ZbR1lk8+UYGE=
X-Google-Smtp-Source: AGHT+IGSKQ+I1VSBXzjz0e0/4PIaSTIl1mLDIRYQG2dUdUWN1ZjW/HP6izLGdBlHKJXUN9U97V2Bhg==
X-Received: by 2002:a05:6000:4203:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a5586dcff7mr2566047f8f.38.1749646456700;
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:57 +0200
Subject: [PATCH 2/4] reset: eyeq: drop device_set_of_node_from_dev() done
 by parent
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-clk-aux-v1-2-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RwzYmOF728hq2o8OgF4Q9VGpNb0lf0jDIwME53KEgHc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxzT4vvsOSw1zz5K9DH+lG0L5oWKmI61cqwC
 Uao7DX7/vqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cwAKCRDm/A8cN/La
 hW4nD/wNd9PvOlo3p4RnDdZJ6qBC2p1a28mPHDfq6qSu/abBcGDIzBdcMUxT62vTPUu8vpWiUGQ
 pFFM9Ak0KjaeQXESXgfXTKh7Dal6utZtLY/jDkAbZPH1CwNYWpz499j+w4KpDXlZ70DGV9b4Wur
 nAc3LYPsix9HrCyBHL4J+bUdWbiZEJN65Ry0GGjj/77420eK2cPTNB0lcn0a/8Nspxs6a5eeb4x
 GxgMKDRbx5Gtc7q31GWbg4XsRhNczNAxGHol6J4U52E4/tdeyB0nWgnqg957uLKyzKff5npQ/3x
 VOpdHG074k8RLQ9kAbwpTGETzaVqm1Us6dEbwLkFAs6zy9EFjLCs0rNcy7xp9Vi04Za0zfGtX7Q
 Qv+i05679yJBJ3hUZJ7gmRPiPftx1Zig+ZdMH1rqLCKlxNbijywLN9bwy0nK+yxAxxKiq9KaZ6X
 G8UF309wZ65EgA57LA60CIS3n3dKEUMwNGPD+Hn0Ya/ZC9Jatg3rF9B6oQP1yDI3V9bMIpDksX5
 yFuQh8/1B89E/ZITsAi7jg6/KC3DsmCjIKGrovtwIdtyC61OzP6De4p6qQcK8KSUhcwFNB31vkO
 mITE+N4jmeeCX2ghVtBZIpexDdcjqcCN0r/MEOfdFdMYz77VtMrWDSAyYmnoEIXZv0b5OosDfZc
 pXrQkrGtqAn1Ltw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Théo Lebrun <theo.lebrun@bootlin.com>

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b42921e3e511148cd29f215b5fc5e..8018fa895427bb1e51ea23b99803dc7fe6108421 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)

-- 
2.47.2

