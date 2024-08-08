Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B3518EFF9
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126291; cv=none; b=ljx0/doxL30aikyoOmGUCNWKPYmDPk85MyH0bgbGAxQDFXaeg0wtitjuAK1pOA71zpw72T/gY+v7eXcna8+pJGqXyzK9cNcIC1CAYFovJFJBw3dwQ6W9nuYkJDpnvFMnerWIV/9s28XaSULokRbgBHGO2j+FQqcQsNI9rfZLmZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126291; c=relaxed/simple;
	bh=e8jx8xmkdW6YnrISThEmwGeUauedgdSxxNVyoc0/+CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IskyRq40nB05L1fkREcYtaTY5RPWAxRA5+d4QJW5ClrINPV2gmo/cgLw0xM+nT7El11oxEXv2K8vao2tS2jBY2jQw50uRpyVypdlDDW8ItgjNmpsCT2PA4sOc5Wx78LUib+YkVJs2+sVWGbEoC9tF6JBBPhnFzEFEa05oUcooUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmWxsM8s; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmWxsM8s"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5b01af9b0c9so1082524a12.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126284; x=1723731084; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=FmWxsM8sxzxktT0kJmdJmARW1mp5pDuP06jKvuUNAIm407C0x+pBy9b3bHiSZLETS6
         9WDBSB35zBLNbf1WMRdNJYOImzTLAGNOXJ765ZPayPmC3C3tgrR3dVVEnr8UCoGrwcTa
         RLU6dhIM+npM7oIaJYITLLoMemGp6hA1V0ULMK4jLK7oYI61m62nOpVCMAnC/nbenEzw
         oPrK5HS1s1mlMB0T9wKrp/8iYo7UsgHvdBq/I1iBTsLVk1ZNLV6+99jVYOhSFMwS+Yr3
         36YUxPefvVtJNAylpzmxeXKvZ/ulGyZR91zvKnct+vdU6xHGWsHKjv702TndrNKabePR
         lwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126284; x=1723731084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=B9PAANT3DhCES6tBlDXNJilA2vw3b7eJLUzhwHpq4dI+I5sx55jp1EDpxLrD4wVnwi
         sdBqSHkAsWZ9m3bKqgtAWmv4M1BdjLcyU/9pwTKt2KrROYDG+r6TCYscpe/9ueORHZA5
         ZfyGTioHEWO3ddc79hXBO3TwDJoOiRBELWkW4/AH5fS17NJWpHW9wX5ANar9eOUV34o/
         sdnmdxvuftK6YfcTJqmqUBKcqDt0Ws8n4u+ZAlQ+LsBINYlLp0naha+O4faRtR7RCR21
         zdZrVEy7ej1OT7Icxtw9URA9cq6NtwqS7pZmDx1G0w2ovW9m+mdKUrNCDYQVbh2oqQL+
         KIew==
X-Forwarded-Encrypted: i=1; AJvYcCUP39vyX9mUQxo9/diJRU+oTudcscaNTqYuO1r4S6mmK8eW9s+7NtPZiw2YeDJct/E4Cjk6NohRZ6P7O0Ez6m3xhgD6
X-Gm-Message-State: AOJu0Yz+x8OJyNH94Jd0Yh7MqNRZFcJyff6IMqNh3vXffKN75Iwp2eHi
	yJZWYrzvc7Qgl8qcUX/3z9C/nP1zUTFc6JHPym3n+H1wicHYW0dGiTEKahMTYnQ=
X-Google-Smtp-Source: AGHT+IFDQ4xO+7IdMcxAQOisAYakQnBCgmZLgpWTWFQiC5OifaIDp2UC1DBibihQ4Kt2Bm/3m4eP0Q==
X-Received: by 2002:a05:6402:1ed0:b0:5a1:1:27a9 with SMTP id 4fb4d7f45d1cf-5bbb2231a48mr1923760a12.18.1723126283922;
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:29 +0100
Subject: [PATCH v5 15/20] clk: imx: imx8mn: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-15-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8mn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ab77e148e70c..af7f4c6b51e9 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -603,8 +603,6 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

