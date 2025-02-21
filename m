Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3E253339
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165016; cv=none; b=j5wcqZPtN9gjqLqK/qMMIa5EHbUzql4Ksk4bruMOClQQjXaSsBk4tBuNRptsekl1WYGF/9HbhNr4wNCtKLdT/rnIxzl25uCv5DEbwoWxJA4kg0QFnsR6Hdy/n4fPB397EWuYTcNY1/apmqEYjWwO5c4IUgQwOKXLlYctyPfIH34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165016; c=relaxed/simple;
	bh=gFt22yPqdJX9uvjOktQlvN65YTwavsxpkKOsvVw0/qM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fwi7s5LAm4njItWxsatS/fVIEA5yNxjUTUf0yt3IueVomIPFHRFzK/TY8m0jB3trijJip4SigNfP+qpYnJfSZPDWrrg/duYDXBdXCusSTE6cCIMknpOhLGWecNO1hTOhSPykjEpIvjcEakPZSARRENZpNC0WHRxjd9VUO6H+vKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvg4Az1Y; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvg4Az1Y"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abadccdfe5aso422099066b.0
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165013; x=1740769813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOMBM0/LptOoZWpnGTFXn3VuyeurWEITTiZxZ/wflWQ=;
        b=gvg4Az1YjC1Vc6lw/SZXIZxI1eM1sYK8Z4JAU4wQu6+D0Sv8+eZb+iAWV7a/kCzhDF
         pYgZE8/aSJrVT9NSIxX9IxpATtI0rAl0Iy5Wmor4SokytGZQC2Vf8dHnSub7oj7B4VBW
         1JdLOHx7UDHEcoAcPzgBUwKkvsKwQvdr+eCkAlEa1f9gplICIeTK5+Tnu/v3J1YrKM6v
         cJqeWTugEHJ16nWCw/IqxhlZqQs4qTXyY+gx9RDV/ktRUQQGGNdnamw2/y4Ol4czbA0R
         KlXLwCx9eJWHke5UHi+vqSqRAt3NV90IgCFssDu8hwLy7cg+x8Ptg4tAPsOKntRmcVGF
         kHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165013; x=1740769813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOMBM0/LptOoZWpnGTFXn3VuyeurWEITTiZxZ/wflWQ=;
        b=o1EBMmZDWNrWZtN/mCQSJMZdC0ythplztTmQe1N/U0gVOnbe4Qm8vXFsC3ymYbDBoq
         2Cj/jAMdvGicIah5xb457i0NCIc5htM8mKRpwhoHJnLS53eMB9b6g+i9ZpDnny22ZaAr
         lFqd3x1BDyFqSaJa07AqT+CcmtKVQP34jTquqPUUdWMx1XiN+RkUT2KY0k8maN6dD1Wm
         gZYJo0EvmNGQVBC1fbB9h0acK4cyevASugmcefmWCyTXgimgXiztkot8gNS+gYx7pgGs
         LWTjn/2mNWncdt5ktoPII7JMdqmt6NMQCbMF0A+1NG7aEi6zVI9eBCmORfjAsQaXvSoW
         eu+g==
X-Forwarded-Encrypted: i=1; AJvYcCW/9k1BdUf80w7XQ5XigJEWdMKUDjGb+dzfgV/XzwvLt19AGmgCVqMyNl87hTYajFYUdRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq6x6fyOhzYXar12tHEnSzKOZMR2N8d3LKxJV1hySuJT9PaLDD
	ucS7Q6kzt9Ea/ZebtoCU5Y8f75vNlP/ZU+hJ9iTX0zdxfhv8iUAq
X-Gm-Gg: ASbGnctfBA9rfvDidoK94nf6Vlh0Vo+RPin958/Ezls3lHdtBoQ8g4P6ecP3jsWykfV
	IZsVFm7j9d21udZCPIQqNBYmXbLJ2T3JpicyPMswhiuQB7zgzNpuduiG8nZ9FjOp/GuKsBxpsb4
	sQn+MO9GFsvsIfNYxIw/UkotrrxABxsYKsc7Qy/4Ja1ZaHzjFp8hWNag1qe67TDmZ70KjX09eUJ
	YV20HvEnk0/GNA5yOkXBOwpjpyMgxaPH4x401z1EMaLQKnaB9wQ8TdoAPvLYyAf7Ds4BJzwuaCQ
	7Ds367tc2GkHDSCVA4oNTrDE5yPbqQ6dBLP35oa8XE6++PUOaFsdVjMq3JA=
X-Google-Smtp-Source: AGHT+IH9dIYGKpfakCpm7QX9v0EfX1043+vTXy8S2cvINmOR+ptJQsFSlwJ4jw24HVfPeVBX1a9vlA==
X-Received: by 2002:a17:907:7285:b0:ab6:ef94:6054 with SMTP id a640c23a62f3a-abc0db35708mr483073766b.33.1740165013278;
        Fri, 21 Feb 2025 11:10:13 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:12 -0800 (PST)
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
Subject: [PATCH v2 2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
Date: Fri, 21 Feb 2025 14:09:27 -0500
Message-Id: <20250221190929.31469-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
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
index b2cb157703c5..62a180d6f8cb 100644
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

