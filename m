Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4618F2F3
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126289; cv=none; b=RpnGER8wzOmUSXqAbcWceUFQJNSp7Hge/jc5bv4NcfI8J2QZ6H2MTyd5jRjroakro+uRuXBtx/HNLzI7OUjyhyL0uWA421YBc9PDTxvo3JMVFmIULThZNT61OBxpdg5AN8DZa950hAKaif/8BXToPQyrMzofRK/MtgXpzGNwOg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126289; c=relaxed/simple;
	bh=1ir13MZl0az/9cRAPNM2xtHw/7Fiznd6AQuTHA91Vq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiOtvh4IdZXYPLn/CmVvbOAKlol8kPiTdOk3UVby8tuzsEx4xjT7yrHodzalOb3CGkJYf63qjxN7zAR1aUx+jYruTSPHEwEHYl9nNv7/5m+UuDT3VBJEN3ALFws2vnOvIvhkxnJpbe9xHxKkRP2UMAUxxVNyy+Q4/veyJHp56v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TNuZR4P4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TNuZR4P4"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso10505621fa.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126283; x=1723731083; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=TNuZR4P4ptoHqPLtIR7+Ye/TP2UBU+dFaqLIrcx286db0TglabHj/T+pnY3SBLuHes
         qqIFtVoZPD1chbK277EExuC2tN8lx9FkzhW7WpqmJihuo+4kFQldUJQlXCKEZJWkwWci
         F6A3sbLXqjepBwaaFPfBPAjbYEUpQdQfH9cKwErYoIh2MXQrYGYmiOpOUP0Z+KtkfCEv
         zXenVTMivdKbvjsjGBm83C26cYHcmLbxAKqlCnk4Yok4s0pcbDdDWcsoYQMhQSfz9yma
         1TQokLaRQLqvLLLoJ7Jils01Tajko2Jsyjfmc4/tP29sXob4EiGDEpf/vMt5NOwTZTqd
         4n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126283; x=1723731083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=malJjDLW+VEQWaCvv3IJspZkp0cM/Tx4p7LsqHw/SARJBai+C+2CiwfzO7aIcPFmir
         4oh7Yca9mndHh7BnHzBpabzorcFNupuwZeyswWfovej5pS6cSAKJUo3he38ek0KNhUwn
         CtfYLWCPHKtxwwuG8bB+rGRxKUiFsu9Zb/88Zl/4K+xiWw+ZMo2xR1yJNTC+i5puD1Rl
         PrcSBNs1TxqNx5SR0QMJ/gWtMWJDGMqsKdNfaiQO4ptJ7+XzVWnhUKSoTqeLO/pSyhTf
         9tHKj7Wz5PNF6kI6xZMihV6XlszxfcZ5Hrf+4hBAnO02we4lip9oAmdd4zrEwWCUSF35
         5Yjw==
X-Forwarded-Encrypted: i=1; AJvYcCVcE1xtOWnF2v2C6UdBHaNXleMSmxOyYwNY9KL+oPp7dPSGtDW8RHTjvfxcj8c5u0HnE91dP3HbC/QjhBlVmIk2n0nJ
X-Gm-Message-State: AOJu0YxT7Go8g77MgJBaKz0OyFmhtll7FC0RAvuD5ci+neqsJNVs4DL0
	6AfwnzlZ/dbaHNnhiyvGGk2fdLn90uJVzx6kEa0eXRyFgL1MzB0bpFZpfTs6LTM=
X-Google-Smtp-Source: AGHT+IGDyMQHKv0RwbvPX/6d6Xk0Zr0aJrMD0f2Ipsmoyq60Ge259oDU095mhvj+uwb4LCGW4iMZ3g==
X-Received: by 2002:a2e:9cc7:0:b0:2ef:2638:48cd with SMTP id 38308e7fff4ca-2f19de73ee0mr14044491fa.30.1723126283448;
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:28 +0100
Subject: [PATCH v5 14/20] clk: imx: imx8mm: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-14-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx8mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..3f649da0230d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -609,8 +609,6 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

