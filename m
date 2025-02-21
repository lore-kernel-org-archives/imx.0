Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782D325335B
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165019; cv=none; b=mudnHZKp/wKBkNh+6bV+WqTx0ZOEhDLReTFM5qUhjPl47cYnEZ8X6ARKD+sEKU+GRZo5v39uVQEVxFe+x9fXon07bvxTwJJLmP58dLCZMVZb+siIlD/wIN6cEwOTz8TVsmAMQsPQvaXpZa2ehDh7DgpqqEN1bSWvXJhlRmlKlYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165019; c=relaxed/simple;
	bh=712s+CZwtbCsu6iB8mRETbiuzFlVQdvECgHqf0Zlhsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H3KYiO5qANHhtDHju0RcSPNlFi9qjHCIGF4IVfFX8Rw6g+B0df+m2RNDSp2GY5fgteeNeddM9L4tpzbkUfOHzSBFFEcD+jpYIqZLxHWQ2nE7ke3dtt+ksjEfi9QTi/yp/A/MmeoAxAc1LJ3LXYU4OSlqVyfVLaJvc5Tc1ZcNUuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCpJ3bTP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCpJ3bTP"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso458685566b.0
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165016; x=1740769816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=cCpJ3bTP71oQ9FYvnEf8E/Wd8XypAtxEJvOb8UyUiktXosfrpGfb+nXUEWHLcXYNEL
         T6nDefA8jz00VJ8mzRi2p/H7QNrEuqpaaTEaVbyz0r/W+Vy8yB9mG8bQtulootgzwjfH
         I7d7SeybevIU0TFPPmldCHdb4OCEK/RvnM1Zy9r+A8y44mW55IhUpmoVwIjrEceRxPjS
         hiuFUcAEoXZB5eItmk+ykw/6P44wCY0Tpaf1xlAv5HQcMwS5JqyhGN4RnSWMUtRQHuRn
         pjhx90PTdithTQlP5XXVmBh8wpIzlLuOAYGyt7SSZH8hjCpwaLyDe2FNmH4MAGxpmxPe
         jNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165016; x=1740769816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=k0mxV1r1+jP+2Pu0yLU/hmwiNdvPdZQNvpvJihdvhVGzFq9DiWkdjKhvt7I7Z/DaN3
         NZiteCH/jKS/rXyRfJTvknFGbkug0IltkASRNWPK+8g9WKBoDb34lbIf8Q3eruWaUoBz
         R+AjAKhh1jt3kyVVWXGU92DJEE3IqdPzbNEeIbJCQZM1AdefVSABsl97txGkvhcjD+Ne
         xZNcTC0iXqB0BMM9zWdMT9IKlM18oTmfd5CfOt5j8rSjQdHCTyC6bK0SzsyltdJorlUY
         d7CXeLZ2a16RD/kBu2xEIcdVqNWz8PqX8ZKaC379WxGf+vPAbdhqav2MmWqP12eZQLcv
         n0aA==
X-Forwarded-Encrypted: i=1; AJvYcCVb0iUogGIRz940S29eYM/H8dBjCxfrIMIbGBAsm1V+F6qgas1+P7Lh7b/mpLIsueZ/ns0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfabMKQPdxswszBTaWXObPn1y9TMZcUF0j1HcbtPbckg3c42wx
	ddFLx5EfpYY7DKr3faHPQfr9P3NP+cB5G+3In8MuZCQo2dufo8Ar
X-Gm-Gg: ASbGncvreeOpz33W7FlKBSPlCJ+LuZ015eh1vov+KKHD1b57AgJWYdcNUetBBUYbTZX
	5tZyHAiZe/QQbizFEesW8RQ/22NkZ88PxX3/OWWbFkXZcMxAo/pIkABCrIn1kKPfulk6OObBohY
	nRDDzPQSNtMLH31vpmgAb13Z7ZBOmanVTSWlq/mRBOSC726XxjMNvtCX6cuHwof54k6SYzjf8Kk
	/l7DtczVp5rQ5VxeLNDtNPPxRRsbl53XyMHpPuxqJaepR9sKZ+GNq5KjN0Xf8YvQ21C4p+s24OK
	0UlskhBIUt+G7+WK14d+SsOUYyn+7L13yDdJUmO/vshwBQp7UrhuierUf/g=
X-Google-Smtp-Source: AGHT+IH2yYVlH5R4OYQQsbx0L1fsjd6ylbWYVx6pl2giZCsE6+FEB6nEzzNoq7LJ9eixK0JAOpFMOA==
X-Received: by 2002:a17:906:308c:b0:ab3:9aba:ce7d with SMTP id a640c23a62f3a-abc0ae1ab4cmr359498466b.1.1740165015786;
        Fri, 21 Feb 2025 11:10:15 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:15 -0800 (PST)
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
Subject: [PATCH v2 3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
Date: Fri, 21 Feb 2025 14:09:28 -0500
Message-Id: <20250221190929.31469-4-laurentiumihalcea111@gmail.com>
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

Needed because the DSP and OCRAM_A components from AUDIOMIX are clocked
by AUDIO_AXI_CLK_ROOT instead of AUDIO_AHB_CLK_ROOT.

Fixes: b86c3afabb4f ("arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..86c3055789ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1619,10 +1619,11 @@ audio_blk_ctrl: clock-controller@30e20000 {
 					 <&clk IMX8MP_CLK_SAI3>,
 					 <&clk IMX8MP_CLK_SAI5>,
 					 <&clk IMX8MP_CLK_SAI6>,
-					 <&clk IMX8MP_CLK_SAI7>;
+					 <&clk IMX8MP_CLK_SAI7>,
+					 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
 				clock-names = "ahb",
 					      "sai1", "sai2", "sai3",
-					      "sai5", "sai6", "sai7";
+					      "sai5", "sai6", "sai7", "axi";
 				power-domains = <&pgc_audio>;
 				assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>,
 						  <&clk IMX8MP_AUDIO_PLL2>;
-- 
2.34.1

