Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7CB1A0B1B
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358442; cv=none; b=u1G5uRACCR3pCkazeSl9CtMuUcfEOx85p7vfZ71pplUoeUwV/abacv9F+CnobB8blUbP/TuUABJGH5zHzYvAJFkcZKTJKI+rO8hTPoWEcqxbGS3/hRppEjTLFtjBW/Vh2vaSKSOa2qZ/D4nKL6Evra6q3dLZfIu6I2JLEDIvf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358442; c=relaxed/simple;
	bh=ag85uAiG2r/HEMDYvaptkcg1a2CH6uLufrgsLuM2IrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeOdZ9XCKxRNZEn3AEr8/YjYJ52zo3lboQ7k5SnGtYwBHX83clqarzeLxDxxTH2d2tgitU4xvUQlGIGeT5TGrZczDPEDZb93bbkJ8d+MLSYu1NeHlnOGPOUFeLwGSXuiVZcQCsAO2FKLeJlh5sKE6I5hvP5ZCCWUAeQEGs2A048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjBwTudX; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjBwTudX"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso2254858a12.0
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358438; x=1718963238; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
        b=zjBwTudXeo7d8s0pKWYjTexM+H8Cvt5WdNWaUaCQTtP8v3Q/Y9eEQsFL5BJkEym9z/
         eLQlFvRoDk/YorSuwXJNfW+3fNuUFXtHhbRHWgpmzGzpvt23Q0/2Wceizud0hJk8SNhg
         NvuRIv/GZCXh4CJUaSWEhPc0m8UGkXzxlG1RuDyovpWWMfrdj8pbCYzcCDGrnLYoXc2X
         66H+JLkhp+uuqpNJdPZbqkEUJefpGuqtPmwlA8syXxhyqE6DVQJhZr4VOXY00yDuVrA1
         KUlr9Hz6gG8fu9/C1/LDpB9D0BlECrS3zIes+HsI3P+sO6YJ3RgU7H1a3toW48D7l2TV
         V9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358438; x=1718963238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
        b=dIxwnOrE1EX4QfFeAwheYtBnfUL3u2Ui8pwWYSbbYDig2CsGeyw3GUN2PL53I8wOBF
         uqMn5rqitjLPqJR2l8SH+ivPYAIZrisztONCvf8UfOadUUEp9n1ZIkWa7nqkER/Svgzf
         zV0LvUDJxxExKVrxuMpRbSgFVttDt9NRUtczzGR82t0tLWTtFzSiCZHhN8ioDFwR3QGa
         6/+kesLe5Ez6PXrs2F0bhwPgPWTrYtbmCvPoVirPD1QmIe9Di03THNSsfx9mdfssAicL
         ZU1kYtuMBQPfPnaHqxaD9DddfiQVSyW2KcLxxXbtrUfdfipYm8APD023uVA3zCKoE+fs
         8nMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKXV5/dehGB6H3gduvliiNu5RTvAqovgaJwmCQugSLMK0TIarS5NRV5NRs8VmLFJJyGKSW+kd64yiNFT1gV4sEOpeF
X-Gm-Message-State: AOJu0YweNzfEAkKcDvTj9aNtg/tx1HgUwe45aSiHk0sCXmfhD/ZFsgO8
	vR82rV+Jz5fG0IGrubQpmr9ZSBbe5vUXnlrTTypdYhfQ5zbUhRBCoYjLQis25ks=
X-Google-Smtp-Source: AGHT+IHImE03me+jBXAaJKDis3LvJaHdcyhORbJZDZPs74Uw4HneHqZI29aXqpZb3jL7FRfyUVcimg==
X-Received: by 2002:a17:906:f74b:b0:a6f:2605:aaaf with SMTP id a640c23a62f3a-a6f60d204a7mr143354066b.22.1718358438479;
        Fri, 14 Jun 2024 02:47:18 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:19 +0200
Subject: [PATCH 20/22] dt-bindings: thermal: ti,j72xx: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-20-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ag85uAiG2r/HEMDYvaptkcg1a2CH6uLufrgsLuM2IrE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFxyygP0KDRWxDno4kM9DyJJF36q0Pj0JLXC
 R5ZthscE++JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcQAKCRDBN2bmhouD
 10MhD/4/36ep6K9C/2A0+yLh/7h03kLK7tqhV1a2oEMiR/3bLKcpn6umQP6r9gvpMHFlRX5wP7v
 2Qcy7ULesoTVCRfLz4eewatjk+KaHWQsvPJPW3mM0/NcAviaPhVr4Rhx8aGE4qMZvaATX/EFkos
 sdCgL3T2E1K7AQatgcC+1b+PKDToD4VSvpUhUlBzal4f/lh5VFfaPlTkFL2hXw8RqukTXlnjwGV
 Z2dOi+pr+iLn4vPMTgOjHlqHYOY+Fw+LFfy0eGipU38yT3nZhlQ31rsNf3X6DNHQ8N4ZP4JWQfo
 azTKXqmkvo9KhPB1EyU3x1F3/rlnS9RNBFqis1F5jfUByE3A4wy8b3SskCx6A7KcUmHThp5zZey
 +vSWFb21wO7P4/0EM4SrAxnaRrSZ3EcyxVjx5jJlX9gX43bj2stJbhNQXNUKbMAVvz1tlqf8xX3
 GildL9Wcxj8bvNFfcGI6IrozJSx9uVjfA3xFZdHpjC6HD05/qSDT2Rts54sh8RhFhEGpir4fDaC
 gf3Yu6j3t9hhKWwwOaELcEKJw11d8RG23XGWH+voe9MnFlR3dGPlHvIAhq5lvkvvXNc0r9PLnj+
 V4Qlq76yHruzbODm+mWzdVMIu3SBsg1YxnKVpDzMgR9XhgoI0DAS8Kl0elUIaSplgkIG+amxYMv
 ym9A5pI2M7JT22g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
index 171b3622ed84..82b77b9795a3 100644
--- a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
@@ -22,6 +22,8 @@ description: |
   Temp(C) = (-9.2627e-12) * x^4 + (6.0373e-08) * x^3 + \
             (-1.7058e-04) * x^2 + (3.2512e-01) * x   + (-4.9003e+01)
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -64,9 +66,8 @@ required:
   - compatible
   - reg
   - power-domains
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

