Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320E346776
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788597; cv=none; b=gM8LIosHW3ZukwvPmeySgt+MwJjnnMG1R4fh/WurN1W9fu2omzN2+IN/puq7ho5zTOi3f0u/VgZtnoJFb8zFKw8+s3yATxXwAnHFVgtNNMbeAts4qRn9/LwbHClpURun1hAxIxssEFp/Ux6p4QMv6AtdMmNpGb91G+xe2dqNT3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788597; c=relaxed/simple;
	bh=SpffUkjliwaKx4GCJ0zzoKE4MJf/13e/7G80/BLtTt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ex/ycIADb0/yP0MbiVysCU7NU4fui8GInB/LL55B3zivurPVSqDPMmCWkCqi5i4DjenFceuZoIyBltVbTmTIikK7t1vPRgzzKoLWaFRqoE6+8yfIqwJi6Tvtnl/tpzhrHPIPy3ug5O1Nfy/8kDMbWLXyVgIt9rVGQo5pJN4FSZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuAIxy1L; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuAIxy1L"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-823081bb15fso1267724b3a.3
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 07:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788594; x=1770393394; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBCSSoRoE8bVuHZUQ0AtCJQPfPq1ZSOXtwQ+4NnM5Ps=;
        b=kuAIxy1LblwAM+Uwh5hFSXl9IBOZHBjBrAd3aoSpG0pA2PSE3d5pA9l6oi+fS7vN+L
         K5jH9XtnNPsKo4dHciGmTlqoS6Q5e7SZqsQXE4mpp1aD58XlLrkr2EwHAiRhogh2Pbl5
         3wvMag5nZCTDS++0pDFSF2l6rFjfhJ/DUP48AgEQ2dnEJVWQhiHnSB8cVNyXmr2kxbgW
         EKUFvbuTIcj9F3FDyOtszy/OyyjQAqJqzu4kg2FcLhjxknszb2hbiS/dEJmcMVcv4aNT
         2nEl5QlZd+N8mJ/9kr5tEYD9wLckU2QIB1gizi2c+11c26QmqonpNTqT0XJ0bTbFeQm4
         GLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788594; x=1770393394;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBCSSoRoE8bVuHZUQ0AtCJQPfPq1ZSOXtwQ+4NnM5Ps=;
        b=frzXzRl1p4PiJ3DCmreqPWNexfSLAIN3oXPLo/rW0ZHDqhG9NSDvhATyQkavGCgoAk
         Yb+aJ0ieFcGNY4gFxO2CqpGp7Jhw7Wx7YwOyEbMdlWnJfu5KFYEMmzqCgmFLO/gvs2QC
         7wcelwGGLr27w1w4PJJelDORdiIBDNa8nJGQ3f349YBuHUifaU+hGYkgn70AC1vlP2WJ
         pbn0KgRxPleqBtu9OlM/RskvSxTghr7QoD/F3ppiv65QiR1h5g+RTrChPKijmAZVe9j7
         AtZQlORq+htDF9xclYhW63spDdGwXch1Iuo2/CXWnfXto3XI1bjNC9lbr4E5R0Xo0CdT
         IEpw==
X-Forwarded-Encrypted: i=1; AJvYcCVlP3nQSkO09ph+FJlz9RvSMRZbjn/XfmO5arz6FpphtKvek8gOJXooma0245jZpX5uzzM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzj7jo3k7ypaKTwx31KdaGkkI59okCZDgf1ExrEr371W0A7JL7
	kXB1qmHjoP4SOMKAfISThtXF0Y22hDMMVJkJoM7I3hVPde4RYi38etNe
X-Gm-Gg: AZuq6aKxq7GHA1FC7tc+bIfHijGWRZ2gTyLj1BK3cRUVIom9Br1oyyCSkgnmbpTnZmm
	97LVyhMFHhtdNeJWkwOuvfTNSJJm/U3kPBGH7XlZlUvRwr86GZhXllq9pMeHG6dfq/+XzFa2Krx
	MET86fSLQA7v3FSy/Jch9BOuc5fdu611+CZnUlZrk0ZO2aIZOfUC0c9hdRtbtUMQxhh9qpd7ZoF
	PsHYhginP424MJa+aZ/PQVwuyFVVWvetIM9UvUOUCacSCvRrh/GLKd8ACTq47u0tYVTbGrzLTw8
	ges/4Zrpz2wUraya1pI3IneMg/9CDUPsVDN7/vLvdbAX/J+xUIwD9nB9B0CYtcM64TFRIcB6Tve
	9lzMj7X/4rh1615NKYfbKNzpKv6wwurs/NIQM4LHxIAXUKEHm4d0VW1n0SOMM/xmPnWoPsq/NiB
	fUcw1CqnjGCXitoE48P4J/secY
X-Received: by 2002:a05:6a21:6490:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-392e0145956mr2877751637.54.1769788593981;
        Fri, 30 Jan 2026 07:56:33 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:53f:14bb:e0fe:f839])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d94c5sm80540015ad.71.2026.01.30.07.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:56:33 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 30 Jan 2026 23:56:28 +0800
Subject: [PATCH] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKvUfGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ2MD3eScbN3M3AqzQl3LZJMkCwtj07RkIzMloPqCotS0zAqwWdGxtbU
 ABfTUf1sAAAA=
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769788589; l=1401;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=SpffUkjliwaKx4GCJ0zzoKE4MJf/13e/7G80/BLtTt8=;
 b=RenJYBVdy/Ov1ruNAsJl/+5Atz9o7oZITqzqfuFckxK2XcbQReo5YwVM9xuKAyR0SSGv96MM3
 NctQ2VuE+pNCrMSbJ7AHd/nF0J8oRW4968bGtYuOEoGHg8D4lH7rp6s
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
 

---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

