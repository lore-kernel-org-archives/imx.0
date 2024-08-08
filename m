Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDCF18E77E
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126290; cv=none; b=HOLrKqbMyBQ9ecC48xjalLv1r9h/zqBJQ9Jepu3la5I4jS7SsufiJz91cjVv/Axw4NeeUh+jaeQdmhsSzsj0P/48VE14rFT6s+2M9NVoxhQll6BIUv69Lm5vvcj8Qam00U5GWtIQddaRzu/IeMy6TRuErvzXWgxobvhl232Or/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126290; c=relaxed/simple;
	bh=n+1hhj763mEFqV1dem2n36RFOjE3WvEU7qjocs6Feh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbqulJRbfAqulsX8U4lQGZ6Efv33gEX9YdB5+sfQAY7i8WFPyOLEjK8b1hWvVph+M95j7P0V9TB3mQkIkohI6bI/ilM9sQbnt29F89nk0KMzyOmAPIl7WhZ60Lmu+H9Bkzjb26nCjZGKAwGVkdWNW9znIQkXOYtTml+zKcOo57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rR7aCLa8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rR7aCLa8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so1209164a12.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126286; x=1723731086; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lpweh87gijIIJF4cQA1mk27Giq5WUQNyR9nG1a9dx7o=;
        b=rR7aCLa8IuuJU2U600La06GfqXQehO9DXF5VzVOE1ErlqgjcPXd3AZMwXOQMEkmWJt
         j/VNoH9M8PA8Cin4aoOxYb3evtMCikRe6SkWAyy+gZrHGcI6Re34Xwv1jO3g79omXSw+
         PnU1WSFPcB0Cdqx58o+41JFB0BWKPp2UdHTHgG8xatmo3tjdtFprl3EhKG1F0Sbjyiat
         ryhtBN52/LGzdk06XHlVGadIgASYLEXacBrafjiDmpjMNPxgaAZ4oraHzJ5oiAUlqemP
         hTh4VpcnXpdH2SBgHO5QPWIMKw9p11G7xt/lZiNS8LMfn01H+LnlpqDkMYVcHQWiO2Qf
         /SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126286; x=1723731086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpweh87gijIIJF4cQA1mk27Giq5WUQNyR9nG1a9dx7o=;
        b=ZmIs4teYNppeM9n26bOkaFhjJHosw/U3QC2/2+FKsf0of4pWALmfxqgOqItLLtYwgo
         RBX7Kord9vNy/27gTWxVnF2fd4peo2P6XGydnhj5Rryr/O88+vz+SIFZ9FVZWFO5aTSH
         jAh8Akx+7f/adwLmZsXieQyvKHXZTDwwJir8xGojKaSC4aCM5fQ6hgOo3edCvQ1xEV3e
         Tdy1Ml4812TOPYijmtF8CkrFeNcfPBdEgeye+8hT3DZCDWRnTsbqAkpDA6U4+iY1Adda
         OkiAoMspZVaaUextEXBZF4PAfnMs9tLALlSe8+tMqe8XLBxoLk0FDkG/7339RxvMAYBu
         udQA==
X-Forwarded-Encrypted: i=1; AJvYcCVyIh4Vng376fMxkm2t1uaU+yyPDspWw8sn3UNiWiPxU9pnkj4v/oP4ooIXdjlIQhrloZi1uy6Imcjru6nlzXY/JOfd
X-Gm-Message-State: AOJu0Yy2327FB2usajgKm1r/cQhGLnwIyeWOIpotL7DJEfC+aqhkDD+I
	IjqkROcnoTbzMgJiJ5HgYEwqNVCuneoHudVyIWxJstnj0QTelUIkb3FuP/V2Eb4=
X-Google-Smtp-Source: AGHT+IFHP+WAJRQKtBDAPTtKu22SVp1AeXoLDnW177RheT0ogYkQLTg/lKBXGJw5OqPnaZBvaHWibA==
X-Received: by 2002:a05:6402:2755:b0:5b4:fa3c:d9ab with SMTP id 4fb4d7f45d1cf-5bbb2234971mr1842865a12.23.1723126285743;
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:33 +0100
Subject: [PATCH v5 19/20] clk: imx: imx93: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-19-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx93.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index c6a9bc8ecc1f..9b8006b15d0c 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -343,8 +343,6 @@ static int imx93_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

