Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3202ECE82
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257841; cv=none; b=X/tm/1RSLvCL8nsrIE57klQ0vf7V1XN9OtPwdyJ5XREZOfscP8kCCM5eGGFnOy8X/5I8gcjvvpndi86+oL45ylBwKoIrGGi/xaPZs3HQzzjcO0WahPTIj3NoJ2KNJRRsZsBp0KPwGG6Pz2PlKkJyTGC65WZih1YsdRQz/xNkTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257841; c=relaxed/simple;
	bh=j0EXgrYnvVA59AWsBuPviuInGMrdX8MUdYFnXuN3nj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOek2eMyf3RxkAwqKXHfprTRi2ahnsGmhtjCssiPh8AhGLzZNm0oyln9gg86DrTUr17kPH1gae+9jTAxb2q9eEOaAllufuquC4/nB6dkW0PhAUw2Cr89Zg22RadeSaQvP+y2kVS1UxyTrxLOEwm/7egMcGgZVaS1s0W4FRFJZK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFdCzhmX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFdCzhmX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3b27b50090so841959066b.0
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257837; x=1762862637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=nFdCzhmXxUFgB1yrPfo7gaYuHoRD9LhiJQHrZ/It1JmywV4nMDfHh7eUFyrSLGsYPn
         DsZXeqbfDZZ775Nmb5AHldBx00MHAHd1yi/qS+VYeHkT/sBw3i4v7mxNqBQlmFjf1Xas
         8H/lVZmf1n91yWdBYax/W8IZgr2KxcOCdd/BTTEdcqyWoZRW5cPg4GgahhpkWjYZbt4g
         eIe3WSxsqYx9d8jIDj87FlMt4gAB7uBUcneqbxyMNk1TsZ6JLy6f7o1DtkOGOCC//yoi
         oXW3ZZG9I3gA2cszKHbbtAs84RW8wz0lReD1hYDWT5g6rstEG1NArWlhVdTUIByIJZ1y
         VKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257837; x=1762862637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=diCjvOos0UufXfMPRuMsx55gZ95MxMKzKqTFpBOJfHGRQGu7UWJw0VunZePaNMwVL6
         79V/eD/T4rDecT7ltqO5oWfGM2ArYGz5Q4Cu/uZZBEnzJkReaK1Ul3cLnrHDyPA/nA4C
         KMcwPUWzknGYRtCBXs6X79MrmdFlBiIeD41rUvGyFn/0Xvr/HqA8lqUeHxs2Q5grKbqN
         JGn8VcBmJV6rNQYBpOfB/FvFevo49FDDAPekg7XoQhRUmwY2fw94RJnJk/YC0Ptfw/Tx
         ddxphQeWWVC1BsOSHTu1alXUKrzCt5GyiLZWMCZ6efTOqtrcNfjTwSkqNkAAgKNhNDsr
         UMFw==
X-Forwarded-Encrypted: i=1; AJvYcCV6JU7Q9ti/cbNepOXrE5NdO/aOqem/nnxEjDQfw7uo2wboBTdrUvLdrvTMtD049REYdjs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmo7noT9b3LwEZDq/VTzPOzm1nHeBCdC8JggOMO2IvjZYF3zhu
	FIw9DVUMy0E8yCKBakeMHpnObfPMJL5AqOIZ10891MdYiYQZ1iLYjVuq
X-Gm-Gg: ASbGnctGBOxHNWnkSZG1kokLdkAqh23o7qk5QjYcSjct2njpPQskycnstjYoBUflmfa
	Daa2LhIhLMJq3mAk0ebn+epTd9jQKiCQi8aJegPzYmjSuPTAWkRxnRVPBmTVyBODTzup9F1rAp7
	X02g0BdvoTAe3JtPIGK9FZitKiapF4d2bfVwSi5tRb+CdUTun8vj5cXI0Xv3mFyAip/iTr2Ffbd
	GHiasEL7A/d7fsg+HA48KFWcgAfLkU9eJu0iwbIRoW8z4E3LKyJZ7vFwZ23IwGvzpUl//ql/rAk
	xV7fV3lYQsaxttyRQZprQY4Oe9Fke7AkAD/Hxx0+idmRpe06XHmE3xHTuir1ouLbVXcxI9zR2pg
	oX+OYziS9UlNiXoHHoKbcdLxbWSTnqyCvdkr0F79fbyNTD19sDWcQnynGWDwbkcabNw6ZiCDoIL
	G7i34Yx2E84oWwVvQNUWGOaW9QjQ==
X-Google-Smtp-Source: AGHT+IHt2fE/H6FCE9dPp9U8nFD+BbuQEZr0YcTeeDYKJn0Q0W8ZsDGbQTHbvxjqtH0OMOcDf7SSqw==
X-Received: by 2002:a17:907:9484:b0:b40:da21:bf38 with SMTP id a640c23a62f3a-b70704b654cmr1611290866b.36.1762257837013;
        Tue, 04 Nov 2025 04:03:57 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:03:56 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Tue,  4 Nov 2025 04:02:54 -0800
Message-ID: <20251104120301.913-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0

