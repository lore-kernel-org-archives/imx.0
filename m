Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309672882BF
	for <imx@lists.linux.dev>; Mon, 19 May 2025 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674983; cv=none; b=eM19VjdjHyuOtKBFKVn5EqiHhSjsuQFYHyXu4kVXpC9ZU8+8TzFjFVRwasPFClGjkOjJ9iXvcqNXtExWPALD5USiLourmNLFPOBl5ybk6XAjBc/AvuJbyJXwXCbunARTYLefAwajtZhgj5Ihmyc33j4YvmvOpO11HAY79ggSs/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674983; c=relaxed/simple;
	bh=rQAwwHGSkb+3HPYT26JL1d2p9vSi54lvUjzrl/7T5w8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nnE+8a0T9mSIOca1RFTUfSFQK7Oji3+9MFB5Qq3+uwCqEMA9XB0z3w3xqTY24eYmq9NAxigDp1EcrgK7xqn0rXLNmYWPYyWoRq3L7ktp1myCp6+18QC0Ptgj6S9n2Mp0Se6dAO1/iGSE/Lx9o0q4eGl/ubPgqFMkJ1JZgKJz+lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHw23Knf; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHw23Knf"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87bfe95866fso598893241.1
        for <imx@lists.linux.dev>; Mon, 19 May 2025 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674981; x=1748279781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGjXFGuWNPuMSkHVFxRqYuJrDQhGPryMypgumm+l/4k=;
        b=VHw23KnfKDAkRwgeE5vvmvCapzMaYyuXJ+G+MDfEISiZ8dqxN1F01w/c65wngQqpWt
         OIUG2ws8GyS1lS5AgLsUospA8dG+PIB7UtJLhIyMabOKH+9x8vAFhWndTx7XFu7RTInS
         BPyXLCpJkx1T6FYA/bTXzrnXLuPhwo1ReAN94SUAe92gRMDB18y+3zq0KllbWVyevlA4
         iAjRPwtK4OH+IFQBWiNMz00n9f3+yjCoslK8Ev1eJvzRSOUee642D/aBdiyU2S6N1sUH
         ncB+zH9m3Lf4JrONUBcF2oVFd2yealV1dp7TJD3wx//EvrSLMpaFULc6UgUS0en0ST3B
         gbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674981; x=1748279781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGjXFGuWNPuMSkHVFxRqYuJrDQhGPryMypgumm+l/4k=;
        b=BiFQuJEHcLJVW+KeuD2RvxwidcHIYROZAmiYXw7BAk+8WxVK58qOrMjD8isxGknFn5
         Cc+h3vqgNPnYdA080NbD+zpd/WDTsPJjMdc2/dXaECOxtrYgGgxH7Wql4TCyj3ZzKlOP
         AbwWeRkn97B47rtmfXcPl5oYV5EdczJI1yyOSaLHe+CngrLwuoZrmokaviVSLHH8zGBN
         /9M0mtzw/sgnb5XFTKCkT7iupGwOdH78edjy3uV+ZjwUUZGkEmtSGHEy0QwqZ0VcyGj/
         yyLjzsIdWu5Nq8panmw6D5nxxQgBV41cQ3/QIkU7ZpxBKdBmxeAAoyI3va2g5NgdAarF
         OnHg==
X-Forwarded-Encrypted: i=1; AJvYcCWWkQLoxiBLEOPe+WvMHA/TO280Mo0UVrs2soSujqfO8pS7a0Iq/tkBTAaBLs1EMTEvpyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSWH/9RnGe970SGnzrM17JNfjzXtkx1ENwIKsHQkvieZW6TdOc
	1ikcB9jEor8jk21K5fXR6vpuFxo5Lig2OJoMOABr0X4RmuVeQipBtL04
X-Gm-Gg: ASbGnct6gxB1H1qInMUePfZWR85uCrbntBywctaKWbHh4dd2vzOBWG3xi15O0Ng5UPK
	e8d3XBkG1PM7n0HLEE5X09lnOSM+6ZLx3lEg7+u/z5l73mCiMCNPpIwxKU4RjHrq1k+Fl8jj9GP
	Bwo2Dokym/fMxFFovlpuvDMIeMcFE+uvjOwdV3IhvJlf0UVBOr3/RM6UBYr/K4jXuI3Pq+LRgRj
	1WKL2J4WFP50jF1dJxXtfwCBh96YRMjuHsu2qqeNIRaK0EVU/0YwKeyIC+pORokn1AHK+1yQuyG
	8hDoU7TzeG/GzSPUH9Nz3wxXwahZlw3gM4/WagVwcmLsVpgNKp2gHFuoovafkew5M/SndTw2DA=
	=
X-Google-Smtp-Source: AGHT+IH9BchR+WY1xG/OkUX8wAcOrhxgnJTryDQb39oorpQKhqyzK9wy1AtcbLqbWwTQkOs8cLfUHg==
X-Received: by 2002:a05:6122:2049:b0:52d:bbab:2055 with SMTP id 71dfb90a1353d-52dbbab9460mr8433938e0c.10.1747674981032;
        Mon, 19 May 2025 10:16:21 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:20 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Mon, 19 May 2025 14:15:13 -0300
Message-Id: <20250519171514.61974-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519171514.61974-1-hiagofranco@gmail.com>
References: <20250519171514.61974-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
by the bootloader, M-core and Linux are in same SCFW (System Controller
Firmware) partition, so linux has permission to control M-core.

But when M-core is started, the SCFW will automatically enable the clock
and configure the rate, and any users that want to enable the clock will
get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
fails because clk_prepare_enable also fails. With that, the M-core power
domain is powered off when it is still running, causing a SCU (System
Controller Unit) fault reset, and the system restarts.

To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
because SCFW will automatically enable and configure the clock.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v3: Unchanged.
v2: Commit description updated, as suggested. Fixed Peng Fan email.
v1: https://lore.kernel.org/lkml/20250505154849.64889-2-hiagofranco@gmail.com/
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..627e57a88db2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/* Remote core is not under control of Linux or it is managed by SCU API */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
-- 
2.39.5

