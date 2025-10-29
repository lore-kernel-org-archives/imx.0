Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17A3570C4
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746182; cv=none; b=BH9lZ1F55C2P1NTkVdhevR6SeFofxuirlQbpsRScaS6BPnM7HHAwzRdv8TGp64b16HEXJh3sDTm6Cxrpr6lditRwTsDbdGD5UkvV0ZHh2KpWdA2ijxlircHckO7QtVGomxWtMsnaCh4mAF1NrQsRzTP/d2g5U8wCs2fy8ObP+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746182; c=relaxed/simple;
	bh=1SwFiJpxAb50wR90lDV9GpdBP4ZnluzVr2Oqr/5Sic0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rp4EPuvUIwY055SK1grF3erxLqm7IQC6fJrg68Jrl2bHUwN8ixkq8zRxPihL3pintxGpLuCOSZoZUY877FdxxM3QbfrKsYxDYjPtR3YFS3ynWLuVY9Zr6PGyBb1SH/eIskBffK+3C0E3+2IKK7GD1CFffMTh4zNN+t5jp7whcvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkGGqjvG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkGGqjvG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c0eb94ac3so12941415a12.2
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746178; x=1762350978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0cpIgxLTVdTLX0iNNMuhpQhnr9g2pYoxLx5ardGUNs=;
        b=JkGGqjvG0ShjXeCrpJheMp6+DtaM/4nZ2qTgqcOYZSBe/tjPi4a9n3g67C+0JCFpIK
         sacHfhIyuUEXUxRD8uEGPFNozc/6sJqzmkknE0nm5Fp67lmnuFPUIkvqX4qRd7mhYAda
         uA8m5AQHMur0P1L8WwkBOeyIeIrCz3P1woh2Xz6/ibnPQK0pIH7r2g1AEWKYPQuxsiRt
         y5yAptxz6NqVWXGq/ph9Bpoz/pnxo7alqGUAAER/6oAHDoZQ6wQ3gy3dXhBAVqICqUT3
         3ns7W3TNo9jDlyedjcr7vbT/eD/RofJ+OsvLaQl2Np+ERSB4c+sOvduDh5W5l6KrA2N9
         xtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746178; x=1762350978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0cpIgxLTVdTLX0iNNMuhpQhnr9g2pYoxLx5ardGUNs=;
        b=w4Tt14TSPJ2cqi+PMzZ2G1D5NQMM1EkhXHYsqAZlle6kK54yUp2IA4lMAH6HcbpbmF
         Xuw5sUTDjScmKR2Y8K+Y/FganLtJWNX9OnVVIhSC4kVC/VwNyYK8EircAtV7e95ATahp
         aXpJW/vglMVBAI7K/NlFN1aQyOi9pPTOB+vb88RlwAi+Bc/4I/xVDEIzsufV5G/eTWyq
         bB9vQy13D3NFNHwPym1wwYMWL7qBgdbeS9YyMYpXRc1PF289g7tvGENgs6vgjrELXz20
         w1uJWsDLjkZQtAfDxG1Ywn4xlplILiv7TDfNM+eVj+D2v5hZSruCYCsEuf3K5X0Wa5U7
         uG0w==
X-Forwarded-Encrypted: i=1; AJvYcCWjNPhIn0Y9LRqabOhsbv1n9TapO+wW1xIGKur361tgY8jY93fT8GEVG7n/D9Kslli/jAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE04VyfYuYv1FWRXRZQizwHAQ2DXPcAsXrwr7uzzfEsPOI0YF6
	Dni4fuu+faE/gH1lYcw17+pLxlRxawTit99wV6a+v17eNuxNRUg4SmyQ
X-Gm-Gg: ASbGncsYDJqtvjWJw93G/1UD2DMxGQzymI66Mh7OU2KXM7132e1tkO2yp8lXwRBVyDe
	zTQGfswfhhAir+vZcwoOoMRjSZeUMD/waf5hsNyGZdCwFSqxowIlmZG56HAIPOTjfzhfuj4fSg4
	EQjC8rYhgHIZBdE3B92lXk0xgLfE5sw4g4Z2f/LbTxwAxpbP3n1CjfUlEptVVHOaCFGXyhVULjv
	UuN6XMUPCrkOG3/KvcTpxdOdCk2YJ/0uW/fCHfzA8glkBEyPgdeWk8ucRV4sNCNXzLquW/mrndj
	s/Cu1kf7tyxkIaca94b24vRcD0idJbwpmSSf2sAoK7yVxBD+cCoVFSE4a8+IbcYAHNoiN7lNR5q
	KxUmw6mhKutNVVAegnhFM7YNShyHQjuymGHlUidWXTvplGDYvo2df9oqUM4yqON9vpXFQ9uIIVk
	r2q/fRwpd9QspIaUIOqHk1iZs5Bw==
X-Google-Smtp-Source: AGHT+IHh8OQ9HuceV0x8UwkKlSqVAt2/vQfWGgDAkzGZJb3jVpWZ2ATrrXxIPTpiHa8TEAAPPuvBtg==
X-Received: by 2002:a17:907:ea8:b0:b6d:55ce:fd29 with SMTP id a640c23a62f3a-b703d4d6347mr263106466b.34.1761746178397;
        Wed, 29 Oct 2025 06:56:18 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:18 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Wed, 29 Oct 2025 06:52:29 -0700
Message-ID: <20251029135229.890-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..9b5d98766512 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "bus", "core", "plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0

