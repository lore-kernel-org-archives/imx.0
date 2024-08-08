Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EF18F2E5
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128176; cv=none; b=eJBz72OzO3j9FQ8SC8Nxc1oNK39Sqi4O1aIQmYcqlvfahlXH4sIhj53cSRcVwvBYnigeaptYNdT9KwlCIPbsqUKcFPy3cdCfMi3ShOnOuRBvxLbFtSEr+IMcKhYXyzyvyFHdexwUOmpa6+ninQdOL3tGJjzWNqFSawPr0vUELtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128176; c=relaxed/simple;
	bh=F8XBaUKciL76OFnGIv5KAgXWQ49BMItLdMHThv/YF90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNvagXPvKY7UPS46hrD04rOze6Zr5zBUFZat6Ku3eMlthv2bGf/4ZufoyF4Vk91jONN2tR5b+PF6IdXOevHActlS1A2HAlqNO6cwv0ZvrXMjOZLaOrUUAUMdwieIMJlMQQwx+9lDMzBPvRf0ndAdn7rG2Em5Hfj7faWSbgXuBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLmYboQ6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLmYboQ6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a79df5af51so3245000a12.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128172; x=1723732972; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=iLmYboQ6+fWECb9Ngg93LfcelMHub+pi3rY6YFlesVhdBoMERipClc2K0p2ZY7Scmj
         qcomhPrZ7lqdxMwKXEeDXZAsSyMcrDXcveJW03Xo5MAllTUX0zgTvapHr2BgroBSfigr
         xGd2Vt5QXRwPbCbv3Ryd+/8rV6tnaanDi/bXe5G3LCvQHlGgKSAEgzYrezTKNwAwh6lR
         YdG/Lig/x98ja5rm3aphiiiI9WtCrcQrCVOb0I+trMR5wMZ2Ri0exni3IPS9/WcfJCS/
         7T3JJlClWBfXMeJt8br4RErHhJbzO+7hQZEEos+MwlO7NZgnY+Vu4KDVT1rP2o8dcg6d
         bxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128172; x=1723732972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=AuZ5zTFLJBDPjw5vA5orBPw4OsibFH5Muf/W3z/M1GeUA3ZZPx0Yxz8tphabnYrNDL
         R5LM2LJWgfLg5tBXZ8f2O7E49gdjaxEs1shDzZNl6KXRkTj7ehjE74Yum90USnmCWnMK
         GqhU3LX5/zoHrsoh+qq25zi+pQFBddHw+DjrlG2ueMx5ueodkYq+VXz2S/YWKxrv0z8E
         fhLDcYlfBSDLM7Lm+4RQlmN77rApMP/UKKnwPfNVX/xyzSJbm2I4gsd4zUemv2aG3inm
         K+664KRz9Zc30f2MY+qSnmPhobHE7xSSXB/7QZq/5hrMt0xwNPsN/eOjNq+aC8IlxjZx
         cT2g==
X-Forwarded-Encrypted: i=1; AJvYcCUx4TmZb+pY+wDknSp54lX/gGXFl7QWQxVPwDpJbPxOOsO3DxsG+EwIw0swFTdttmQDbZxnzUzNcu/D1kFXnSbo+ycq
X-Gm-Message-State: AOJu0YxL/GnP2PUJJhoPudQ8qvXcQB345pA1EMzT/gvFpZ5MhwVHwApS
	3D1Yi+kTEsPo7mFxdjbCIs8qH+oUPvHy3ESyuahq5t9lRsvYmuK3T9FzHAcLjtk=
X-Google-Smtp-Source: AGHT+IGtJSveR8KZxSWZ0BBBvkzHjtJ1Agj61Z/XNfYmQr6Fm/KzaJ6kZoSkBXVQlwYGFGtVuoa17g==
X-Received: by 2002:a17:907:3da4:b0:a7a:81ba:8eb3 with SMTP id a640c23a62f3a-a809201715amr190601366b.27.1723128171973;
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:50 +0100
Subject: [PATCH v6 09/20] clk: imx: imx6sll: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-9-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6sll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
index 2fa70bf35e45..4310adc5d54f 100644
--- a/drivers/clk/imx/clk-imx6sll.c
+++ b/drivers/clk/imx/clk-imx6sll.c
@@ -340,8 +340,6 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 
-	imx_register_uart_clocks();
-
 	/* Lower the AHB clock rate before changing the clock source. */
 	clk_set_rate(hws[IMX6SLL_CLK_AHB]->clk, 99000000);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

