Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239518FC66
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126290; cv=none; b=svwn1Ftymq7n21AZpDe3NnfeNyjTTjYTVzRDzettIfu5sH801l/edAGvNLj8fhaA56pZMMbFvjVdgtwFgwBCRWyxHNZxzzjfGCE071sYnWGry03qpKG1H9Dcux15V5AkV2poyNDsvXJEr0yhjlEZNXMNO8md+QoSeCMokxnHCx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126290; c=relaxed/simple;
	bh=IWr4xOLwFlcBBVMqbh/CeNYKnBYkZvyljj8xB0z/c08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuNp9YYCuspHm13uBiw15y6S/0jY9ZPXq/SteCjiLeaxr7qYGoZd16bbnj7OcB8H1+5Plr7+sGz6hCle0NvoNWWM9It4CIgtoMFImNflq/nqEUjTl+1KEpX2GrNnVddFvrkHYg4FzdYh/EWvXK2b3UxKbXCn4ux1r7hWS8cIf6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yleTqXre; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yleTqXre"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so1232260a12.2
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126285; x=1723731085; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=yleTqXreo7CskHbm8/nWvR+Kn1tBd4hg6YFqaV0uUv4032IzF8dK70snFmtkyYuPOa
         JdOaRCsSGC+38eEzsTr6meyrApjEQXiwc0sMyFkpjkSek8ftguAVRhFjKfGGCUui0iBP
         rS7yv9vhn0FUpuG0tTmjBCPFRy7OjRT+jsijz0gA4oMEILErwyfA8Tb30WvxyV1fBmK2
         rchRnBTgzfCu1efBN6qe7iHZPqxJfHwvNZiV4v5JGTbe0M4pcndJdu/V8yCqU4132XeQ
         LMSnkqmQIga7BIKHTO+ZtEr8hTD+4GEqVPGnPHPy04b6zD1v8qMZwshBHRXoFalJv9lE
         7MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126285; x=1723731085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=POfWOEkGDKLPLwlbcU74IwczxB16TnD1/onFrgBAsf1I09rz4L9+6vMTyrbp593Ue2
         q2mliL5ZsEAWcqs0Mg3lX3cTFT8Vhs4RO0GIwcpx8yUZyxv29p9Wpl91cjA7hp7pdgIM
         zRDo+wpZOj6/y9PEdwbHdza2vJp+X9Vk4eI/IX88vEeAiRdcyYhaSPHZoP4XE33zY58e
         ksXfJD3WWdPXGA5kiEkZ3kSooft7tyQElUlWFl0NudI9osk3/FzOMbg4UjolkAjjOCAf
         VsDMrXOLAVVQ+s06AOG+WP8S/JqO/RJ2iC0c9MlSnjboUdWLYNirUxgnmpxg9Ws3j4GG
         cz6g==
X-Forwarded-Encrypted: i=1; AJvYcCVVAYpN092idc1d+0t0NttQteshG4tsZOlLwrUNKlBPr6NnZabuA1WHINReWfuoTLB5X7z4Y12cxfRz2a6FmWUR6TX4
X-Gm-Message-State: AOJu0YzZi5rnoHcVlyKF9UkVRSgvf5/pDS0jKocrW5dap6FgfHM6utLL
	y8qNfqP4qGwBThshkJMM+iLQOGYe4HW86YF8dVADZd6kFdKdX8Cza4Iz77W9a8s=
X-Google-Smtp-Source: AGHT+IGQe2l23uShoIpRGe0OtZ/F9zcL/2P+TyvQ982GKO9ePP01YLyep9DwZHa3XED5ok4WlLQprg==
X-Received: by 2002:a05:6402:42c4:b0:5a3:f5c6:7cd5 with SMTP id 4fb4d7f45d1cf-5bbb23f7c56mr1647715a12.26.1723126284803;
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:31 +0100
Subject: [PATCH v5 17/20] clk: imx: imx8mq: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-17-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8mq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index f70ed231b92d..db9aaec42800 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -604,8 +604,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

