Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A632D18EFE9
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128174; cv=none; b=Ky8xI2toRkc/8sKyFdU+7KVEXrQ9+V6exnpFRNG60eo5sC+rrHJOuabo825Azj6jPucwLE1oMQs4Xi0CmPEp8q4T36prW0z/Y2H5tz8bQYF5EslJ9LrxezA9OTvgluMhGp3MMLEtAPxZn4TulvFdx3ivUJQ2z39TqZg0Trj85v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128174; c=relaxed/simple;
	bh=F85JnWhsga2fKjX8ofqy8VS4HE5CVI70avGh7w8r0jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XcqTYEg7bvtCA2/rx47V3+QbOfI0RRQi/vx3vd+x2KlC7xQPCxz8b3jJ3tly4v9RhJsOBGA0MPkTHC4TnlidFjIpa9A3vHSPiR7lQp4M678EUROVY0fQJawipvwWqDPMOroXQzXbdKJsAKyTAOaLbfDcwlfK7nPSNjrsMsfuhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=enEf/27z; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="enEf/27z"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso15063211fa.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128170; x=1723732970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=enEf/27zVUZY0DJL1cin74pDobkOlf6C7TUQ7zQ3kL+eVNejKj3v9nEaDlf+ABdagE
         FUlTBGw9eyGb+/H+D5+6SRbUcD+oBaTpoAk6/43ZEGZpLHDPYTPdA0TUAryNQkeRW+FY
         uiqolQfooLtJks9EpwYYFgChVJ4ajgJ3NdZG72E9yRa8ej8pMfV+nwbD9qpaR11wmRdm
         3Walhaf7efyst9YzO700hd7Af2midXr7ejQ3YmIEFhKvs64rK4ke0abB+mcEE+QQ/mPO
         3gu70/VwG5NAb4ZZlcwuPSuyURWlxzvLoLyGlox7MdrGdiYxIqIyPq3cd21QSdmo/s2M
         crqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128170; x=1723732970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=D6Bj/g+CneoZyG5O/MXAS1RKW5qouDQDZnd4fKG0MWI0e0MFRUHunz3wBRdp5msF+Z
         olZRa9bRP18OuMSa+Mh/Dhvje7Ye93qUPebHgompWUCLrMDorq38BP4XXx7sShbDwNLZ
         qliAMD/AY3GXNa4EF0dpewWD7cXrAEUuY5ImJP4Iqc+WVVa1uJSi0tPORyTeltlLX5n7
         O/y3yIifdxiPfo8+Ddj0gBGVIOmnEIzVDeUtIMPvd74nO2UlzNIWLj1hCafh1bgkCSEc
         4TY5WYmhd1xJ7L/nBDqE3oQIMYNAC0lMqMFNRL7Y+jSs9PWYYumLmKcSoamBIu9KybRK
         OCjw==
X-Forwarded-Encrypted: i=1; AJvYcCXszx/yRNTzzFyibotSd9SHZQt8+bIoVmOaA4Z/RxlePV/L4LA7L6VeZehiyaQX1vQoyZE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/rzTs//ojqmpEu9iAbcVI8uzYYAdkgCE9qD//0DjZiNE8dABe
	UByGvZSI0fTTl6RHpdprTizT3pQ6ldpCyOEJsEhW8VZ3vXN2q4CGTghYYi7VuKU=
X-Google-Smtp-Source: AGHT+IEa8lUG5PUwt8CAXfqOk3wGRaLOx10UCEmHtPBg+F4Hg/YBNadhRZneaPV+k6P/U8cOdJlD3A==
X-Received: by 2002:a2e:4602:0:b0:2ef:2905:f36d with SMTP id 38308e7fff4ca-2f19de2c724mr15068821fa.16.1723128169710;
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:45 +0100
Subject: [PATCH v6 04/20] clk: imx: imx27: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-4-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx27.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..53018e80ca51 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -164,8 +164,6 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 	clk_prepare_enable(clk[IMX27_CLK_EMI_AHB_GATE]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX27", mx27_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

