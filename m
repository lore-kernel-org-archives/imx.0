Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93186199EB9
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358413; cv=none; b=LagowAw/XS0BYh32i6/lEEkIs3XSstyMiCw2WNdviyrpKkTvUW/BGF3KTb/c3MTQiyWrm7PJaDkUUDwLaRRjNJsuzLEe6XNW31ekRh00m1xLtys69osWiG1U5p5gOvIo7+Elr/ivN4fDJOXZwgpc+PF5Ae49sEsengKQSU8otOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358413; c=relaxed/simple;
	bh=VJPDXpI9a+tnKsAKTdkikW8im2YdBEsD1YQ0PHQTdfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgsqwvK0YcWOv8iog7lhc+w7p3YtCMFfVCquZQScahSWY05pyhoQlfzpXQ2quP0X4sMxwK1BlStnpymomsaXOLf5KgMXEYTwu1lN9KTCwpBFD70WzZAofw3e15EqL13EQdmK3yRZMlxH9GNzYpzHQvbJeGCLsUbHxcE4k24xj2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3V+Vipq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3V+Vipq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f1cf00b3aso309755666b.0
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358410; x=1718963210; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3IU7+TXLvfDkHuXEh0I9tjkuQWX38Z7PszEGMh/894=;
        b=d3V+Vipqr8MzoCHp6EP4IFhYGVjp++qHm1fOVoDyH93OrKSWoz+PGx1ZA6xFy8ZF7f
         UNl+V47QeZFrzK06G3Prf3waJm3KkImfY/KOP69RkMrVU+8NpoDlm9LkCjUnVmTGA5Zn
         q5cweDjajE05VUnFZX7DsioOkrSxv2HGT/nnN8qkAi4vlfiizajCEnfcs7FWJRpg/Zb/
         mRHwPFm/zUsVlBAi6F+OfirtrQ/yXNMUtN9suHa5nfMX946iUFmA0auUJURQyLD4ldQw
         o6VtR9N+BqcdJCbRhzRnhLa320rLYGhaT1WbE6joWPf52NUUfNWgWz/5LO3sxYZXEdIB
         8Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358410; x=1718963210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3IU7+TXLvfDkHuXEh0I9tjkuQWX38Z7PszEGMh/894=;
        b=FHs3FnDrA8WIAzF2TCImvC+LaRidd4qyn6kwXlmPi9MViaIDM2tVuXlEaXSALXicte
         Q1R9uMlIjLl59ovrk8adeTfwgCl4dz6H30sS11GOH2geoiaSNzv0e5g/aQpqva0pMr4W
         hhKa9xAJERw0k9y6mGdxQTagZiTKSNR5cwALVt6GA3qUeFuvotHHEeujM9X579ZKUcvS
         ByOWWQ2v7pjJS2Lx9x6t5GgZ5+WJzIlvKTkbnh1L0fGyRXvGy+WDWxRbHIlk94KbLSyE
         GhbnBGnvah8t255AN3u3gr+zTdSaBNzL24n9PbfBuryCqBXpJDX+X4cTutTmgh2rg3Se
         Fz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaAabpqXkhXmylPCahMUD/w2/dfliBLJJZVwezH8qhD0cbcUIDALkEEVbOCAME8Sr0AuABH99Bdn8/Zm21HBQsLvGF
X-Gm-Message-State: AOJu0YyNpIespfYm/OJbLtYkE2oTwYoYpgs69Y4RtPpUqd7Mqaf9WkoS
	P6kyl+IzEffPHTX6GOvuxDZBeauc/DUD3lQ89wF0cbg9hteQlyIbGBN2oTHDyRM=
X-Google-Smtp-Source: AGHT+IHzJUpHJvBzO1v5iLmWnz8CRAittbY6yI3kGFRmVAHwcqWiqXe7ztIdEf/PB4A+9kWWiM2SYA==
X-Received: by 2002:a17:907:c302:b0:a6f:6337:1ad5 with SMTP id a640c23a62f3a-a6f63371be1mr141309566b.27.1718358410044;
        Fri, 14 Jun 2024 02:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:07 +0200
Subject: [PATCH 08/22] dt-bindings: thermal: nvidia,tegra30-tsensor:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-8-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VJPDXpI9a+tnKsAKTdkikW8im2YdBEsD1YQ0PHQTdfk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFm5f4tbEdT6Hj9kos4aHIzliPjW/NKGFDxx
 Ipnt4UnJqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZgAKCRDBN2bmhouD
 108SD/9u2rmhmgwy0Iz1Y2lIEPUPCrVcvZT6yoWrfj0wgLw7Qozmtm5AmkEjCDpLjfJ0jn0Pqu3
 KmauRx7VbqoERst4rURkBcYMHLAC0w3Zu9vxRa1RTy5YiVouiBUrD5PCMYATOck/MYTTtkVOfW4
 OJ7LkFnf/Y+0CtVMtdYcN1F4/vdu9NG2saYtCHkAlaKJbb9WM5cdo/4HjDrgQXMAxGlSi23rsPs
 RBU858AEvvdeIaDL/d/1h+dtmXG8FqdhOrknzLOj0AABWGmpZCrrVHw4XWVGlhcNHHRiZZy0GPR
 YRWKGN3ptlFG2yMoUpM0bfupahX60O8m3ivmBzvk6QGKdF88dXCDP1YmPqyWRJQv1szVYj3d/WK
 9O6yKUknXbaNp/s0LvfthEag74z249rHMFB/5AdMPnlB1hKRY2PFRcOYBuL38lL7AfRgPesk5v2
 m0doaOAEtBfIalCR5zavBZndHesTpQcRLybosB3oV0eEEp8d5H1+M8UImCyUIisdmO//fCQsnTK
 gFveqBq94NauRZXVPD7mvqyNpoysTViIAQKDTKiw80/qqy6Wo8eHEd5VCfYXOEPNBjCDZY0PdhY
 vFo+tFSggr4iLZ2hdbNMoK3U3rYVOTmozWqyyamilhIEZSgZ5tHcGmTmEEY8Xk/rEZefiRxoNIw
 6rrAEJr+a9MpxJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index a35da257b070..972d608ddf95 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -27,6 +27,8 @@ description: |
 
   TSENSOR has two channels which monitor two different spots of the SoC.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra30-tsensor
@@ -56,9 +58,8 @@ required:
   - clocks
   - resets
   - interrupts
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

