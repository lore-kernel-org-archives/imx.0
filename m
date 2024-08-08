Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E266E18EFEE
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128174; cv=none; b=F8xcMluV00Rj0AGTLzbdRdxwclZAW6JU86fKidkzJw6UiLTf4NxRS6BtxNmPpgzD41fiM1Q4/Cml8LnKPejslaQTegd+HBg3RG0ltXagnCd2KvUGdylNVmoPjUvkdoteRUASWbNlu0kpCso6i1ww6f7NN6pzRA9deWFNRH/DhT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128174; c=relaxed/simple;
	bh=HMlBx4X05JcRgo1zDJUFrZT9TkayrN7B5twwxpWIidA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXY72Rf0iKmr78kcmp2HImTGYSMeEf60DU1pp/stLwnjlJzzXoSMXtH2U5l67L7xVma9yVMxfCdFWp5pwSOKoaS4CfrQSdmgGjeML352p0nnudx62E7OtkFxRfCLJU/QGBDX2pjjrCAGXLtPuxOLyqJibK2Dh8SgPvIAC5mE0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pfcsz4nv; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pfcsz4nv"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5af326eddb2so3486527a12.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128170; x=1723732970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=Pfcsz4nvlvnq78deBFTNVSlI3sbHy7Z9u6KVATpi+WyIwHI5matuPcT0zhaF8wUCxo
         V77g2+qLVwq4Z/d4crtawNiL31jseZxhuRiTLKbQYjQT3bXBjTvrRL2P1CrEbG1JNgEX
         O0D+HYNgOW1iejuoMgM9xcWmc1TG7QLPHgBI3ErSwoSW+yKoYop4L6a32uAyhNSsJCce
         GNgknowEVIpTxbkNzVXt/g1C6NbQ1SZ4/vwnShBNBAgyKpHNdU2S+ruF1yY0iuf+tTYQ
         e9ktxQTgxA0UAcuY7QL1FIhpyecTUVAtAz0O3QGaMTdM6wXXXPivGZ/llK1SPIDYnqhk
         KakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128170; x=1723732970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=Il6+BNZ10d/q67dzHWKIpu6aeAaqjU3dk9if9KhqXMOdOcSr32ZrLqYeHxJ3Mj98Z+
         B3D30qSFhyg2W4W6Hu7BLca+PN/CeDA11TPQsng6ucUu25o3ZWlpNUEZy20CAjNYsip3
         uNi+SmyJDNhNDOvz4rX2T6ZWlEGNO/OCf3rSNLaIsKlwKed6zluRqTQbbX2b2aq2mXxo
         G2jIH/Fj01YGkcU+1UL6CI2ESwyimKI331BuHcrcHyXUig8pcxplMSg0Zf3LCJvAN+Ek
         obdSbSJXWr5HN01TOQ+eunZ/n4Y4gI+mZRF6kvM5o/p5E3MLBARqZjC32u2oAJvWWkNi
         Wn2w==
X-Forwarded-Encrypted: i=1; AJvYcCVfDzu16FHs8X7vsetDK9/k0toGSXtNygK1b6pmFZFVfER23GNAT+tOM15e/P9t3LO/Xa85i5WNrTiUWJMB+tb+oZS3
X-Gm-Message-State: AOJu0Yx/4Cc30Zpll1Bx02glRAJMtLmxEkM1dpLQw/SXuMZ33haWkpHj
	7vWuHYeUE42Nmq9LkUj1JEWelVnGbz9eDN/61ib81EmjWucqdOaJqy54WwODJtg=
X-Google-Smtp-Source: AGHT+IG8GywzWr1gIp9i12RLWgA0KqKkT63htyiYzlG61i5bfa1BVS8WIMeH/VTqcF0FTAZqtfonTw==
X-Received: by 2002:a17:906:6189:b0:a72:5f3f:27a2 with SMTP id a640c23a62f3a-a8091f95f90mr126698566b.26.1723128170220;
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:46 +0100
Subject: [PATCH v6 05/20] clk: imx: imx35: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-5-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx35.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx35.c b/drivers/clk/imx/clk-imx35.c
index 3b6fdb4e0be7..00355a187340 100644
--- a/drivers/clk/imx/clk-imx35.c
+++ b/drivers/clk/imx/clk-imx35.c
@@ -234,8 +234,6 @@ static void __init _mx35_clocks_init(void)
 	 */
 	clk_prepare_enable(clk[scc_gate]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX35", mx35_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

