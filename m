Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F534FF62
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468435; cv=none; b=Xv5ORqy/aN/00C3a6mPsrWHFeqNfxYSIx2uWaWeTAcyq0PvTBEdHxLctZ74R8F7OapUVieja80IMP0zcG1efjSToj5rR4X7QaqQI49SQxOtKpsltw8bmwjr658fGJM0pSHItYRyYctEXrVHiY/uuiDL7RSGyAdhh6+Ca3d+6638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468435; c=relaxed/simple;
	bh=Iot54+4YH8z9WLeHeMdtitMcMTgj08iIM+GUm+BjpzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sm11HOQ6J423t8ezSPMZzI/b8pYu8w7bP0U0+luk3gLn5lFVKoLXuoxvJIfn5WbszB13WmPjZjy8mSMbl64OVUX940ij4Pc4rE48xXoGvEK9gFdOop6beSuaUGkjxIEhDp6daSeHAJsq9gJSGakA2PPWhXyUz1zlnhH4o0CyOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BN5ylYVI; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BN5ylYVI"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so26062166b.2
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468431; x=1790073231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlZV+gDl5kHNbM3FapkIWa6VkdcZp6BNeCy2FJirDI8=;
        b=BN5ylYVIGlu3zrdtttC+JzLw/p0SM72VVhE7jeuO2aGlxAH3PL1qWGrSTMo9INkz1y
         xitQ9Tf+l8ZGFaBl/Ukze4xThRC/8tdtQHep6wa8oh86opdKCAcLOZbBWtXDEHZ/4jKP
         CkiE584Vu6eWGrwEC/SvJ5ud33kZCv4XBNavgg1DbUIU1oUzPOs5k0O07YVtdNq1yRYR
         1KcEKqV3qW/nv+G7as0fzZRC10IVr73wEAQxkvleE64GxlWN8Bu4uBt7kunI45OiInWb
         YO7Ent6pCgVjdUdKzMo4q5kQwxyVDzmmPwuY73J7KNCAyOG451gru+wU15T1umJ/Vhok
         GUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468431; x=1790073231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlZV+gDl5kHNbM3FapkIWa6VkdcZp6BNeCy2FJirDI8=;
        b=HpwhQ4Nltd8fd3MQicWYP4d3Rk/McW9rWwLE65T3+0vvyI2hpt9hcGqVWkiqogGoeg
         8l+rUE357cjjkdH0zTBE/aYOY0zdN8TC3hpBZ1C8AXGEJwzpYCm/Q6zWjyW6R4XaaqQ/
         39pCVwrj2arCqAI9ntoR0c7TalvcKwvOYWj9/SMmKdTDuec23XKwWGMqNw3l8PIUPli+
         HrALA02jua+cv9mFZ4snZZ8Bnrgg/1z5RPIuZV17zzRVoH4oeIaiSm0KMrSjdT49k2oU
         eIi1eGWwxGm/JhIqmA3+b8G2HLMsn/WJuW9KaR3l2fFptOEWApzXQntwCX/JqO/sO/6Z
         qG1A==
X-Forwarded-Encrypted: i=1; AKwUvByLbVdW9S23hR7lthDl5fhiMJkxIe2sW15ZWTwJkdyRrd1U3LeiPkow8xDrTCHjF1e5Rzo=@lists.linux.dev
X-Gm-Message-State: AFuF++m6s3z5ABh9Xl48pP4wqrrGueiuILazLKhRYHCGNuuyx2d5QMGb
	IhTGE8WlImQXpd0WqSah9juj4fGkAEkawC5qm1wiWuKv8AFO9rxB5LiA
X-Gm-Gg: AYBFou3BWBrmE/hcZpbe6n2KiuFKMXbhQapaiSR8sQNqrPW6Zq/3muYzK8xZBiNYxMJ
	ZaeossuJvJFnYEgmpTLjcfSw80LG+SW1C9sqH7KG6pyQ+4uZj62rZaDnNYcE8v5Fzh7r9TYfbn2
	OIJ3R6O0WNuDFx0SuF6XWcjwbRXbA33bYIpzHmHAZQc2HjuSvW4AjB5Mug7S4vz1cklNLxOsj7B
	REPH0MKrl6u7BkfEPoH9/+NLYT43dSSKSvCleB7KvBKvwgmeILY6rD/jo1IH4Y/GwWzfSi2CxEx
	89rP5LC57gobZZSv9uE+ol1JvqS2BovkfBqHg8FdTLlybXexY5Ki76CgJ+m2DNXZWPpapA6pTzN
	jSlwgXQqkM7vhVSv3iTR6qfrzNa7+MjenA6i6WMdNOzduh4vSdzlu+6ZKsGciiS1XZ+/s30TALd
	cWgr3fCZVqTMtT/rPmTdMRys0Y4U2zuuhNvAzXmj4zRGmXLwara7t9Wdk+A56MphAGF4vSg2Z0n
	+bQCpyMRPYBca/1Jz9xZcdgG56wTFBqmf5cZyKVeNUfubFUh8Dh5wgwjUWqA1A9mypjBs1UNzI0
	B0Gyw+nd/4AvdHCyS6olDw337pDlSASDmsWGOjUpx9fOAN4Er5V+OWoD4z91eNSXipRMBABkqWC
	QB9mI3ownnIxwp3g4bXpOv7zVStUaZsD8CT2TXIAk25fiELUON0BgFLOaqEZFrSPF0OjOdqMX0B
	QC3wLzWqQkdobFrc49Tb3neEp3xhy5NkaGuDSJvYHvEbNKLDBA+6Z362wWTU0hb4hE2dXX1R8+p
	ZV76W0ouKZ9HpETrYWzMx2uz4I=
X-Received: by 2002:a17:907:9610:b0:c26:2da7:347f with SMTP id a640c23a62f3a-c29d734648dmr49184166b.0.1789468431374;
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] clk: imx: clk-imx8qxp-lpcg: add missing pm_runtime_dont_use_autosuspend()
Date: Tue, 15 Sep 2026 10:33:44 +0000
Message-ID: <20260915103345.1334-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915103345.1334-1-joshua.crofts1@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_lpcg_parse_clks_from_dt() disables PM runtime but doesn't call the
pm_runtime_dont_use_autosuspend() function, causing potential resource
leaks.

Add the missing function call.

Found using Coccinelle.

Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index f0cf6cf91899..b31903060361 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -279,6 +279,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	}
 
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
-- 
2.47.3

