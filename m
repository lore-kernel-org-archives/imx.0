Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A749195FE1
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358406; cv=none; b=Sxe8Zh/N14t3iihjSkvcu59aWDen2zA5HTR8xPGXa9RqBZ5OHq7oPJWtTsorMA5QGGhiCdU9O0jn/gPlrKUJpteNScolvrhmemUUPl+/PwE3ojJJcKnVCQX45WG2dP7VeAIoqSf9OBsa9RkbikLSuYTN9Qxv7SvLxe/d/mpsL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358406; c=relaxed/simple;
	bh=Ai81JSuQOdlCv1p1Eoa8aLrKA1CvKqWZCg0pr4dpmPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nn4aGe2qwnhWiaaijQKUyPqeI1J0dgvk8CpAERTLhz2ihvcBe2sA8wbNKS3xI3vqXnc3Om1m43BIVNKbDdQ8evuxWEc9hWQXrtH/QPYa9LxCBSnPtYEWCwb7J6yLG9LpMXxOos1lHZQhWUIOXrkZeSU4RyVgT+/DXOLY9SPVDdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lg/dM86T; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lg/dM86T"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6267778b3aso196311066b.3
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358403; x=1718963203; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRsblTKIKueUASpgZPIAhHvU/Xf2tJR2h/CrNqwHNsA=;
        b=Lg/dM86T4SznddszNqJjYe40u8mXscD9YXxPx3WsWjRJ3SDVneEOUYPdOVQ4Dol/3j
         gtjdDoC6fdJZQ08gUShjuJ7Kr3lFgnN1dseoyf4s7EOuA/alA//y4/9/TjthKv5/3v5f
         kJek8YD4U+sRfjIIlktB/9lSxrC8SnCtjCAEt0lr+Tf9YC0/CzyprQpaTcePz3UTztNI
         mA65+dyJgTwV657HklA7tvblOBkxXh3a0bmaGOGxAbh/LHpAn7b3eTvKVbVm2qYeyU7F
         weTLhbcg8uRSt6b15RbVZ9dkP35un/C3E8ePmqwuF5DrMiMoQxM0JomidngylIA5eJH5
         D2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358403; x=1718963203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRsblTKIKueUASpgZPIAhHvU/Xf2tJR2h/CrNqwHNsA=;
        b=wZVG5BnOE83HVGmXHDRTybkAxBVULdCokr/bg8p4JZ2Y0vrpmh604+tNL8ZjAhi18G
         HZUzEcU4E2bUU56uwPU+VkLucqsvbXzgIiE2ZWjTT6/6ut9OqIuKlHOmFvMoSOOvRjzL
         fcxmOt5bH1MyfN00sAS3eUnhXBciDYZb60PnU0Qh44wyzVIsfXLmsJxnLXBn72NVpXbu
         zjLRQaLItGmry/Mt75ibbPVisNuJmfXAFPEtN5oAckNipIabwivx796pJG+Fg5CUIAW7
         0rHdABqga+nOcE4HBmGSYodTFjvozBNEJtuzF2QoL8ZoH/rnteqLJyVSNBZalquuTQVQ
         /g5w==
X-Forwarded-Encrypted: i=1; AJvYcCVJygUYMPBSYXsYFwrQkeAMKOmfpcSbtvyiCA5nhldxl+I3LCxtNC8qswfNlXUs7NGNRwD2ETF+TSd/pY1gdtTKjJBC
X-Gm-Message-State: AOJu0Yz1uZFu+ZXrPRJd1LQ8p1GpTj8FajyNRRz8d3fizAdM8pdbWo3Y
	q4RvmTXDiN2UHIx4bc3CZ3+Q7kDdINwwa4iY7OUqgNdMRSVehSQTr2yWZmJisjI=
X-Google-Smtp-Source: AGHT+IHzdJCeAm+5V7F39Yivzvz9eVzXveA/g8tczDyMLlUBzFf2wYZouWpzoH3GkUNVdrzOuRHhVQ==
X-Received: by 2002:a17:906:66c1:b0:a6f:5fc2:fe8b with SMTP id a640c23a62f3a-a6f60d1e0ccmr134676066b.32.1718358402837;
        Fri, 14 Jun 2024 02:46:42 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:04 +0200
Subject: [PATCH 05/22] dt-bindings: thermal: generic-adc: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-5-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ai81JSuQOdlCv1p1Eoa8aLrKA1CvKqWZCg0pr4dpmPA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFk+/e4mLd8U5fNTEKa3WDi6sHWNOs+Kjv6y
 YiAHKkIy/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZAAKCRDBN2bmhouD
 18tOD/sGEt/+Dkm52ln4YMwmPWkNNxRx/rHJj4mdO3bytCygp+noPWg2IhLxNuoM/XTWFt10nzG
 0f79B1p8TZZorhJKb10piKpMEwop1YmDWDY0y6qPPY3AxEVqdIHcPVDccIBLIlRTyWTIAtK+sKg
 fpKPQxaUgFxyOgFBwmxKkUTqkiHtac8RouoPVnrtIf6CMweyHY6E9DYmD3x2Ughzedz1SClLbQM
 k432cdtgiPy6APeqO/xVvX/cUcT2k6CuwHRfXeoESe+oAzdACJbUj5RJNjL1KqGKwIT7a/fJt4w
 MG6ayvMJ1hiYn+avP6uBw61Y9aM53Uyx0iksXCzovSiCvjdDPDT4P09ZYy52nXIXohF6Ct3Mx/y
 wn4qE+O1akccWIwrVF/7qUIH6/KZn4jARxe7AWsqHjdbYqNuU8D84P/Uv1JpfNok0Q4SuAx0gJG
 woHg0DyS6g5TiJHj+FO5JQ3U/yfgRX5eJgc1VqmKZKMTaAmLWhsk9OVBkLiYbIlNnYVZYwtZm30
 Wk+hbyjStKbqzcCI42C2wy8tLAi6YBYcouKGxeu4FlOowRsBx51ZFr7/tOOxj3iKiKOzufxqFqw
 /O3E5fAHfmLVkX7w9ETIIgs8/YjdsPoumGfSdF8STZzrKfdIqKokZ/Fe3XoS7ltExAkv5uMmVWR
 vOx428/JGca/mQQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index f1fc3b0d8608..12e6418dc24d 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -15,6 +15,8 @@ description:
   sensor resistor. The voltage read across the sensor is mapped to
   temperature using voltage-temperature lookup table.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: generic-adc-thermal
@@ -44,11 +46,10 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
   - io-channels
   - io-channel-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

