Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86D227588
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811652; cv=none; b=NpP+DKRsVBKPDeq0P+MFA8VG2tsDOWhI7qqSKjIVe8wWxQyqgZb9uL5+0eamep8qZESkP55QlOmtwwD5Ac4k3vhcmxPM/au685irjONyGpB7z60o31tN4yR/QEUMdr+o5nfZWwNvaDUtck9ex/+L+cTC98gQx+D8kIrPaIGZhWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811652; c=relaxed/simple;
	bh=e6CR67bIRx0I1NIUZ+DzirUjK8FX47WTt4E/ldbm6GA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=soOkhm2rLCIpL/9wjdkePvt0xcrqQit09tbUt7kdCmzoCzhFnnvG5pSQhAvyO3QS04c/YBbtQb+fx+somBVXbqFsyogyJq+VwYKlQJvo4XRPxGRJojtBJbvuCYw5roLqnTHAf+//Gd6BYfoeVMrOH7dXqdknqAxGQWLCZ/HtGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjCzJLg6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjCzJLg6"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so2418295a12.3
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 09:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811648; x=1740416448; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SCJ0pUE2LwQE2TDd0hXt9uN83Fn/ucHR2/2/GAmZHY=;
        b=QjCzJLg6TStlyBVhFtm7AM7cktTUPs5t0RWvK7VVIVvpjQ5goQbHQGi2WJKEjeWZa4
         r5cqo+0HYfKR4z2WEmuenqbCl/c99F5r2aBdXgX0xrUKizTpDa+o7v2hUBa/QyqpM5q7
         cF+xRWUjtaZO7SWwYdlLB8dz/tQUXjPEVvvQUc08TAmQNmSL7yXQ0FmG5oy2VMO6bOZI
         Zy/RuLp2hSarEpYprcQ5QPNXMXo+FpHl81FweBIQT734wjauZxW1CASmy24W+ob+mfjz
         xXqRHkL6w+I8fXKBlHs2FhSMpH1spYyUhqOHwtlVyYAQ5E0oX3sJCTKIzA3/JeqGGhRz
         U0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811648; x=1740416448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SCJ0pUE2LwQE2TDd0hXt9uN83Fn/ucHR2/2/GAmZHY=;
        b=i5eUNNQgpPHaXLfUmNKXU6d+XIyUxIK9UbJ69GPmM3l65nEjBKh2z8Si33VTjwOoZP
         yj+IfxPRgBzT1IdnewjBML4ryiR5DxlBcadSoNEfBtkIKMmIhSG2X/0vvMmxVd00dWGD
         2IbDunKl0r7OvllqHmEXszp3A1ns7HdR8/5Uk9/UykOZ9U4B/Mx3x2eIlA1Z8nPVg/JH
         fiEWjjxjz5V/BggoKx4qcblLxvXd9xjpWmUHJWimcK8EdvXf5U4eYAZNZWAEo0iQ/k9x
         c2E1Ss3R83IzN1YXZ+0X6S5TG7h8bX7jq0/GvIDMrcMg+Pxlm5LCwex9B2TgQsZD/4bx
         PKBA==
X-Forwarded-Encrypted: i=1; AJvYcCUMg5cd57qWipwzXgt7ya8BD20jrInhhAnSv86XLBL/RdbXrdSHk+19x+3W+Ayo2U3/+7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMvskCKnwlU2QqNVlcD2OofZcG3obhV33WhQ4nQ0vZZPRL6a3H
	Z06hi2V7jiiMDq+ZHS87Dn8bk0YxorIaJP4gqMBkGIOP7olvMq3U
X-Gm-Gg: ASbGncv4XI/W0NYAUACoD3FRJEtc4BNYN7+1T1UFjsRIoBfKP8UCPmgeVEaMa6ouTm0
	5xdmFwCsmuEg9HnG7RAq3gEE5kxnUfLJ38pwLLGxTHQlTy1KxePjBPTpJOqvC2Ek1CXK9ij4GWP
	1B1yhHUMidh/UJaPI0H/9Lrcq9pYUU3t0WSD4Qo9OAU2r1knAq83EcTmjtrPqfU2tEzZgv0nC6f
	UZmaAZ3VGynYbqOa7LTRUrB1iFYPrkY1NVId+NpZIMeHqDI/5pons0FopN0O6/ISvZkO+PCN8Fq
	YKGTmu0EB5WGhbUZdL2GovDKwuWS7hZCEUivRxvs/eeQfAlv60UnLA==
X-Google-Smtp-Source: AGHT+IE8uiVGrKUzV55CQFqCJ8GrM70TxsS8ElrSoepZMqDoUHx4Rfw20qczDxgzE3AFyPp76GMMbQ==
X-Received: by 2002:a17:907:9802:b0:ab7:bcc0:9067 with SMTP id a640c23a62f3a-abb70dd72f8mr1224609566b.40.1739811647800;
        Mon, 17 Feb 2025 09:00:47 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:47 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
Date: Mon, 17 Feb 2025 11:57:16 -0500
Message-Id: <20250217165718.74619-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
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

