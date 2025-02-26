Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE122488E
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588404; cv=none; b=YGFNid9iqrtcABjZm+9wbOnvYhzsCWCT9y3Mi31VM6UfFqWNndDw8+RuOs/j+2aXgdPVLSPuV5qTZgWigRIWrAt61mpBTz/BnnuTwc8+UvDu+ZYfq9P++OfKPet0nyLQqnQGKei+LwN1yYlMXJJKpnRq0EwY3doOHfQzmPmBiMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588404; c=relaxed/simple;
	bh=3HhpQLzDJ5PhgxGSSZYJ2mur7iygkWAwE5N74zfdasM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VEeY1T35O3y45V/ZPbqcKOzxk5UsxJ/Mow2ug+zx24Il10fcZnOfRNaf/bpOcgtDkJOzbNK5VTTSZaf5WXsXPn71jlQC5Y6WZg/9unGpbYRhc9iEQv3P4aj5Ni7jhRSGH3qRK4Tbg71epe6i7YxMy9QWmUMJOmQs/Rt09GgnW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6zry7Gl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6zry7Gl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4399deda38cso262405e9.1
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588401; x=1741193201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pnuI6sBYlkwLaLjuQ7fgcpXHpa/8YRA5z4IIzVEteY=;
        b=B6zry7GlHLpD69jVL3ZA/AyExtIjgVwCYPvVV1HsKzcJ4hC5ZOfTV7V7LIMuJgQFlF
         HutMTU92ytj3vZATTiiorjbV3b32ilvyE44HVxbio2XlH1lu4LkBaPta+hUv571AIgHl
         QCH797cnP4YQ2zZVaD5K405HCWUVc4VSff24UZi+Fj6k4sKWMXh4xxlmmsjZKrxSE9LA
         BjFNiFxTu3KU5ypj4JtqZfacPc/EDnSc9QxxmzKez9Ispaaxy3l4bxYNVyQDhr5+UrdQ
         Hk6X3YrX60ExqaJRuMc+7pN5295ZvMW9irBTkZcF2jooff6fJBbTgkkUg2EA6ClesRGo
         w3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588401; x=1741193201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pnuI6sBYlkwLaLjuQ7fgcpXHpa/8YRA5z4IIzVEteY=;
        b=VfhLBaxFcop5Wk6qUiymHD8evcXl8f+7nsZEZrGBts0auSzTMvOrZdN8olAX+eOJcI
         DlDVtR153BSPrr7NIiLLpKKctnaplgOsbttt4sHk3lOpwRdv6rEV/a6Pwhb4sI0jHS4u
         Zc/k9s4AT/SXIIJkRqVlHwePBpfF4h+PTnVvJV3thR3Wmz6JcaldrzT8csk/quoiIoa5
         pJoNo2DAZMcT0NCdr/CTM7bJsEjA2jNxkY24frFZirD3JPg8sskzF5RI5f3sT0c/39bt
         obxZLQTQBegKxhQqKmu4J2QYYcmCwAJb2nxYmPnTTzs9PeQRu05oMrIhHG/Tkymu9flw
         JuIA==
X-Forwarded-Encrypted: i=1; AJvYcCU3PL8sw5AG4i4QF/2l4cE9G7zk50HVFsYXO37bd2IOvRoB9Mfe7iAUl2Ivgt2e1FcdQTA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd0QRxNA7zoSe18JzpiI9lWc1gScEeeRUVcFzaTQGGZfOCcir7
	LsJCrGlDsWQGPl+5JNVjC8+K9NpVrCwZZJK9onz5IF0pZHqzFsT5CbgrSyBu
X-Gm-Gg: ASbGncsQ/0QcAaGzg2R6yqjcLi2wqkk+By3k7C25GbK4W5QxvwTQmOe0Cpq6XZ8N+6z
	j9yx16YFc4k/EN2lEajt2AD8HZuzbGMQSQZMM3lVw5UX2+nnvLj/SiRDssL3AZ3rVB9+yuiZRJH
	4FYMaXR7MoGP76+wpQQA6MDfDffxQQ+ZaatYz0zzAPCeCNat78iCL5yh4qSIaZNorbZMbp4qvNU
	JJQdhhOKNIMQ6mi5038y70nMGlYNdyNP1szbuwINKHfSlyZYIrhyUqyT2fzji+loXarw1lIX9/9
	JYkIWifV9ivaxZv9/3M6thBTs6lI4xPxX5WFC0FyhAJoTVXCYcuGc/Spi0RamDU8
X-Google-Smtp-Source: AGHT+IExPqM/gnSNIKRczXrwwSNY2JYUNb14I/Jluil+QDW7N2/0KA9eUaCIBmPYlFa5rXUAj1siew==
X-Received: by 2002:a05:600c:a01:b0:439:a88f:852a with SMTP id 5b1f17b1804b1-43ab0f6deb8mr72370865e9.23.1740588401209;
        Wed, 26 Feb 2025 08:46:41 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:40 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
Date: Wed, 26 Feb 2025 11:45:11 -0500
Message-Id: <20250226164513.33822-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP and OCRAM_A modules from AUDIOMIX are clocked by
AUDIO_AXI_CLK_ROOT, not AUDIO_AHB_CLK_ROOT. Update the clock data
accordingly.

Fixes: 6cd95f7b151c ("clk: imx: imx8mp: Add audiomix block control")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e0618..775f62dddb11 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -180,14 +180,14 @@ static struct clk_imx8mp_audiomix_sel sels[] = {
 	CLK_GATE("asrc", ASRC_IPG),
 	CLK_GATE("pdm", PDM_IPG),
 	CLK_GATE("earc", EARC_IPG),
-	CLK_GATE("ocrama", OCRAMA_IPG),
+	CLK_GATE_PARENT("ocrama", OCRAMA_IPG, "axi"),
 	CLK_GATE("aud2htx", AUD2HTX_IPG),
 	CLK_GATE_PARENT("earc_phy", EARC_PHY, "sai_pll_out_div2"),
 	CLK_GATE("sdma2", SDMA2_ROOT),
 	CLK_GATE("sdma3", SDMA3_ROOT),
 	CLK_GATE("spba2", SPBA2_ROOT),
-	CLK_GATE("dsp", DSP_ROOT),
-	CLK_GATE("dspdbg", DSPDBG_ROOT),
+	CLK_GATE_PARENT("dsp", DSP_ROOT, "axi"),
+	CLK_GATE_PARENT("dspdbg", DSPDBG_ROOT, "axi"),
 	CLK_GATE("edma", EDMA_ROOT),
 	CLK_GATE_PARENT("audpll", AUDPLL_ROOT, "osc_24m"),
 	CLK_GATE("mu2", MU2_ROOT),
-- 
2.34.1

