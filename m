Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB542F619D
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257857; cv=none; b=Rp8F/o8PNMJdOeQ7UKvq9JINuXGoTUbFWJjRw89Blu6SNcFnKV80mD7PmTX/UCYliHQsR0mM4xTbwUJip0YF0KRACDxHBv5HvJoCK8QemyFl6UE6f27w4H/kwDwfLY1oeXtO/jU9rML99a6LoOxHKOVSo5PigpezxIvfae6XSpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257857; c=relaxed/simple;
	bh=v9PIaHoOGqn87lRlESH/AuFgCy5K1+8Bo9hGHBVSeHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdLpYNehc/6fygWFnrO5mG9RxL/Esa3duLYnCUW89sKm5lDaFHJ0wiRTokjxp5A32Z2OBTcXwYU+Ry07yJ5CtHRPN7wdWEAe/G6O6veIsUJHp0jAbJzeauS+GuLp1kh3X2i97yGE0K966oETAuzktGHNZmeXetJcaWpFs9VL1gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRJuMJOs; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRJuMJOs"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4aed12cea3so977820566b.1
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257854; x=1762862654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=BRJuMJOslJqLyD8DxUxuPsY5jQ8sqLFk0MuZFXX2HHVGfzBqigdX6V0DDerew5auaz
         l4EVeRaJuUDirxMXqKCckKjLG3hst2qQxbptrfZzbdkK1iY30PtcI24NloUUmvF9zg50
         U9fojsKZqH60Q9VEyy9m+GGIvHYG3CX8UK0l5Vx2QoWThUs2YtJuWdNActq3IRpptFqO
         pVKnq3ONzv0WmnJT40qBO3KQp7Tulpkw/3/Hwb1O244/q9P+SfG1la3Bprl793DeIWFe
         GKNRR0Rvx/Zz2JXdlRirUzPOToc8PCmer2tBXUqAZGMx4kg6AbFOFQZO2oaMt4m+ibrq
         zvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257854; x=1762862654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=d0JFykbCIxS0PxY7ACK5Dj8nCeEeenRkvxhFHZtdPt6lt2JfS3GgxvvEiPeJ6bXge9
         qXmvPBEupL/Xwpgs3kzej+G8GXmcJ0xsnFyA1ydt69lXmXOPaHwA3ARv7X2FzI+xNdR9
         n5QmwYnKQNQnTSTAcgn7FJGfKRZD6Fw3pb8hQ3xRSmoDK4siBWXLqVZdVFxJAwxSEAlf
         j5trF7BAiKzTnEoiC2qU3WvZCN/QEZOrCyeITo3BLDICnLUBP7KOzFvqysX/JlZSzZIz
         JvJyBHgx+ihapaCiekdANPut+cRlP5yg+uTirJ242H3t18dzQ2IK/CjOiwh1evOP+WsB
         t/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKhdrpkXAwFUvMS6hlGHttos6aIcELIFrdhcpqym0MimYWPv2zArnKVd67+SlOyDKIg6o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNWK83mfD8ogpN4uTHjb/wyLdSrVOAKPoNofKo2I0Lyfqy9Ip6
	LaoSr1t/XSkYl/CP4dOqhk58WTcP9JiKlakVXoWh4mCov5S9bX3f195s
X-Gm-Gg: ASbGncsfHvFDb2nq7NRHwhPu3TnfUK8CmwIwU01phPGY6Lgak+htysT+1XBSgCiz8lE
	EK/2s0S/jehc1Qbku/cAp+Hp7sV0aeAPhDm0cSAkrF5HzkYzz4+fsRW0z9zea9Da/Z1NZ6rXuiL
	r7orWfyDJ8dr3PdoevTU4luK3UTy1t8Q1x7jFDoA/9QES+bIdoL2BEiqnz6PPUGDzUEXJ2QsSNA
	ACVXWWY9hYuNc7xo43TdKyRMX4yJ3K5FY3ZiqBZu98fAXua2Ac0A7avwN0kU7x6h9OyhofiosdU
	AQ3H02KFcec83dnPZ9EoJApSrZuAny/1QN/y9z+RC2yoPM2PU3hWATOiUSFRs3dknOR2hFgGT/Z
	pcC/Cuedz/Z7xHW6Yc/0Vjh96xzerIS7wUnKxdwYb0Embb9z3T285+sq9sVo8yFqf2jxiwbhsBE
	ZlJUx0i+KzGkJerNCwq5m6D1qAxA==
X-Google-Smtp-Source: AGHT+IGGkO48Aav2aGVAeolzrPvhX0A2pS6by5Y49cTXFSpgxjQYcLbUpUeQ6msVNN8zrd86kzhCLg==
X-Received: by 2002:a17:906:a24f:b0:b6d:6c8f:6af6 with SMTP id a640c23a62f3a-b7070139726mr1396558966b.16.1762257853806;
        Tue, 04 Nov 2025 04:04:13 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:12 -0800 (PST)
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
Subject: [PATCH v4 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Tue,  4 Nov 2025 04:03:01 -0800
Message-ID: <20251104120301.913-9-laurentiumihalcea111@gmail.com>
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

Add DT node for the SIM LPAV module.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

