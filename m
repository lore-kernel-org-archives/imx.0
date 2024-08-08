Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED72218E756
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128175; cv=none; b=SVsnZ4bgXSEY2XuCyY8GCfJSWHKpu5joel36M9VBp9LGBVb+Xj35kMvGkc0UJfhFGWR/xa5FycljoP5mv8qVOQthqTfxFBFGnnZkm0Kg9IwQzpJ1XUJwlJ+Fr10C7WTRQQh9CV2PUwa2baPt9mA/FjqPAtJRvkvihlk5l7yzbIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128175; c=relaxed/simple;
	bh=SiZ3szIGvyuxD1G7YmXCV9iLcepTAaj5c+gARHQ/bJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TS62+mydb+/IwkeQNPRZsa6FwFnbjxHv3fB0FhYxacE907GG/wx9AtpecfBPz6lV7RRYfTnjmqMeZ3SqO6hd6NmrV9teyt6nbpf0NqbTR4QC+JoZADtz4KrYNcLkOhJMzwWFZ21JdtrzaT6E4uxxBL3hsQfKhevFMG/VnwkkGQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kA+/A9Jf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kA+/A9Jf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7aa086b077so106611166b.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128171; x=1723732971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5MWL3cjgLEXuvIZC5lLXbB33GYudCtwZlnHK0GLdqg=;
        b=kA+/A9Jf91uYSy33I5G2iEyIjtgHtoPsrosySSQCgJbN81KUOdfH7r3y3GhaTs/Oxv
         ZsvjGfnR5iZABd1uys10Ts97IH1vwcmBogI4TZgh8AQ7+/KBUTLeDqxn296h7A1tL9Of
         7uILXAoPQk/kB/EilWjrUt/25wtBdQsFTYGHh6hKaiOW5zO54bInrhXIg5QwE2DV4aKF
         Omq+xBJHPFA7GPXlB9f1QhW/0OzuwQT2Sd+SUJyPRnnKmHey8wznpOZ41Wy5Mkl1fIwz
         JALteFZ1NfQgpDKznlvykiE4HwnqCdOvt06q9G6sR0S2WaHq9fxLZ9eHlNRTQh5GjjZ7
         fh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128171; x=1723732971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5MWL3cjgLEXuvIZC5lLXbB33GYudCtwZlnHK0GLdqg=;
        b=pW44wy+ZI1Qn33p1ZC/hPlCDgBbEZModoDG+bscBb8zCTwsPRIh6L4lp9VH1Vone+u
         I4IzH1U49C8DgVIfmfpui5nAMRuDnvtbfyYoDq3eHgfoUgzeBFJSbvJYSYsXqj1oEdyT
         EWEarPGo54MGT1xR51sP6x5gGKMoZbl+4kGd86lZtgH+2tNLwfYEsBYzDkvv+kceYKJT
         6tYo+NIV0o2twZxdZWyYnabg47o7FBonQ1aKMSQHsqzUVV1fJ5/mnOPOS8z12C2ehzzO
         1C8EcatSdRo+iEAXmB0YheP0jvy3Pr60f+Sg+GTWPWWN4EiSSJbV5/CDiFgv/fIe+JZC
         QRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/9TYjlLmsG3eZm7InzAjMQN+zjj0Gqj0mJzyLmt1imRIiRF7fqTHRinr/mIjnncHkDviKVi1AjDEkAT/kvwRhArd5
X-Gm-Message-State: AOJu0Yx/TeqiikjbojunMhlqbQSCX10Hkk69494JA2E5kKTBaQQ+8jk0
	fJFQ0m8ypZP4JQ4dN3gULmgzaE4kIRaqev2TLWkze5QUJFkXayx43nmpEL9nZfo=
X-Google-Smtp-Source: AGHT+IHSewliej7ECiKs8Pj4pcmuOAg1jmAB9ryEfKa8DiqRd8T5n1QapjnGAgj9RIhKle0pBOsBOA==
X-Received: by 2002:a17:907:2d0c:b0:a6f:4f2c:1936 with SMTP id a640c23a62f3a-a8090e4057emr169860666b.44.1723128171105;
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:48 +0100
Subject: [PATCH v6 07/20] clk: imx: imx6q: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-7-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6q.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..b436463e06d4 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -986,7 +986,5 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	}
 
 	clk_set_parent(hws[IMX6QDL_CLK_ENET_REF_SEL]->clk, hws[IMX6QDL_CLK_ENET_REF]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6q, "fsl,imx6q-ccm", imx6q_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

