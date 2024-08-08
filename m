Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3B190071
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128181; cv=none; b=jkM5yHX7ryvTKXN+OJI0AWXJyKmgzjkp0Udh5J3d3Qi/MVvGAaZ+3JP/IVU99nP6Hbnrm7VE693ZYRPCVK4HcaPZkfwRkyruRwFdsfyiOqxIEZ0zWaPhLCN+HKl365W3IkiQB5/twNP040DCBvqPoZE/ZMLNYUx6yY5dCrmvkSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128181; c=relaxed/simple;
	bh=3MuovDtIRZorURIU9tYKQJVq47VGHfGnfR9ISQ9xJW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KP7isyhEAd+IT7i1ND4SdLtpkxpPKeQeL6R4BD4hK4Gte5ScBGF50vmL+KZegc2KrGpWXh4/ZFEhToUQaHYEZhaA3wrDadG2lDAMVqDYWxKM3RNGxS51zscCo6A48loAGUyzSAKfLuc+4Sagamei3bcuebn8ZGZyYDVqbSG0dPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwIypyNG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwIypyNG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so168209366b.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128177; x=1723732977; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=IwIypyNG6YVWh3DyKP9Lqwp39791fbt0MLU7ICyxvx7OYOuLMNb+oQaLWEg8ad0UyI
         h9iPdWsp+BNWL1H5IxevULv97HcgGNgLBmbKdPExY693Tx9YzlSAF7RxDMXCbrvu8gwr
         T8l2yt5EskyMYTLAaW7fbmVPFzrowe8jD/h39eYOMOfhNoBk88fpKYY244qmlymsChqj
         kqQyLpU4p7ovLEYmSJ1vQ//c/Fi2rmIeZauffVUzlzKGmgPYgvWSt2LaBTYMoQpvLQHk
         GFdXGD2NJCMNtIQDFX5tBbCJrz5wovTIXgXCQGSPqUlfsTLnGYem/CR5+QOQwfPushK0
         uh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128177; x=1723732977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=I7n5aCdOhCG7c/wYZqASR7RnGRGFuMgqBJXyYp7EY4ztxw3Qv8YbeEYhBk9xNjHt4y
         sMYoAPjkaMETMXEdr14/msnJXqPjeWWratky6hjHV9HV2vhfXzP9PsuUOnES9BndmwAW
         bTsJEw3iSFRwAvTbSIRX+PFtCoE1gltU9M6dvmPC0iCc2W5h4vAplmXyLdx3VgjSil9e
         Ry3mlZUQyv4t5Uo2mIEUns7AL5q1ptPB+2LzzAZ3N/fWss7WzEt4qoG8wuxKT3f47pK2
         kfzkBpyqAQMugWfgCqes8189iA9kuvTcv9E4W+2TIfMZyhDqRVO5oLQgOV0zoTHyvRNI
         6O5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVqUmPcPrSRDHp0RLRi7yWF/mQNzUVRDla6qpJIiETqCoMm3Q776w/59Xo2W68KK3hB7VCbdQawcu2kAm07opgYwFW
X-Gm-Message-State: AOJu0YxXlfxE7ySutZs8haG62E/oG0Sgp89Xww4b59kNfDZR7hbDx251
	n4c7syL8aUn9WN3mNkBuhZaTe4q6TlEI/oDzAUOZqXC1Z5Y8/9FXDMkAZfWageI=
X-Google-Smtp-Source: AGHT+IE7R8B3T4fgiuoLqDk3xF7+I+3kP37bpToSGsITYor/oRfOoUboQm8qOJh9YQr2roRMF9fkPA==
X-Received: by 2002:a17:907:8692:b0:a7c:d284:4f1d with SMTP id a640c23a62f3a-a8091fd825emr175510066b.28.1723128176714;
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:59 +0100
Subject: [PATCH v6 18/20] clk: imx: imx8ulp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-18-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx8ulp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
index 535b6364ca7e..5531e51a1e80 100644
--- a/drivers/clk/imx/clk-imx8ulp.c
+++ b/drivers/clk/imx/clk-imx8ulp.c
@@ -385,8 +385,6 @@ static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	imx_register_uart_clocks();
-
 	/* register the pcc3 reset controller */
 	return imx8ulp_pcc_reset_init(pdev, base, pcc3_resets, ARRAY_SIZE(pcc3_resets));
 }

-- 
2.46.0.rc2.264.g509ed76dc8-goog

