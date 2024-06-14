Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BAB19FA84
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358435; cv=none; b=i9H29BCDfcEvCsBB1KaWw5g2cmEB8KKKKKRRPYzEHlsXaz45bELTfD/vBBLX2Bg9xn7BnjEHGBUPL1d198tZXwlwTfsTGaGs0t976r0c5AUuZtL2M+NGT9xTWj94rU06bLEpJDiSE9edMrlwQIFcuEtm+F9DAwb6c66VwV425L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358435; c=relaxed/simple;
	bh=dEicE4oTwCczzzSyDwiogCPoDffxWlAHYRiHMVel/ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FF0d/Yra0+LPfLfL39GGNAL+miIOCxoGjnjaKgp8VGvof3IEw9dAsdxqUzIzvTc1eBkAS4iq9Yhq4P41IcDBk3s4F7r9JL8viwXK/LeM7EhGaKhfEPvQ+ySeVd8DaURgwCMA17Uz0sw6a0RndZVsk4fvROWn9fX673F6UmtSdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1TU1z6D; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1TU1z6D"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so260997966b.2
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358431; x=1718963231; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4Po3dZkYUhaAL25RngwAM+jSmX3BmhwR9LwsGE0XuI=;
        b=x1TU1z6D5rZXmiPYcVrIC0O0RxQ5IW2jp4eh3YRqiiuJa9be3gd2cT5isrTAGLurDL
         oB/yoRDOrH9ATAv429ypL70KgqYKPJre7Z92Nqlpy+3I8gtgNSGYkQYlibFYYlosuTfk
         OlMtrCEhnWFqp9qk3YGiPDOe8F5KifKUeTL0sWydOpIJvQELKZ+JTQqEMV471kwp+Sn3
         6DLLP4b5XeXnJh7piGKcA/RAvWne37ITbXNJtLKyh1Jwpj/0RcmYcZX3a/6QHXomxYam
         02k31hpbhjaT9SZBWY3cSeth+r+Y2Lytb4+Wjc6/1cBocO8Cu7pPzCTdcJ0wAtDNbggK
         J9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358431; x=1718963231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4Po3dZkYUhaAL25RngwAM+jSmX3BmhwR9LwsGE0XuI=;
        b=lOcBR82xblotYnlR3ayr4WmnAfIJpZSbdN2sRNtM/XrZr0yQjS3oa+AAgjBigX6Idv
         1WHmAMY7aQVYfS1aqX7v8gtLGbgtb2MnGA1oUcWs+qtu59BoEUNUlJ1KPpEzi/uBYOZu
         OtTE1xSfndgBO73idPZTXd9nXJb+xJ/HyTvYIpvHjSUaiH2pnwcTKWUhhdzgdzH9ssxc
         nugyrXzVz3+qpBt8zfCDF3kxp8ODIiUbm04Hb4Yu2TPRb4G0TadxpPWnGxRoJ4S1yDLj
         x/6T4Zxl7BrrWMDWTonySB3I+ujP1RHTNpv/xBPfHMtFn7FjArO6G9N2yj2ns6xNjtvh
         fMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5RUSMrMYlCptWUCnopPDG33LsjuvZY7aDma05UWpKUtR9dE31x4fOYHIPC/3WKqWVBK0fgpI55f8ghB8oQkiO4y/o
X-Gm-Message-State: AOJu0YyYDoFfe6p+MtAzSiRqLzQKcewOxq21i6sl+XM8fwqS4rAYZKwk
	cwT0BE92xxau4yA9cE3q3Wb2mD9MneeQzEVDI8UVau9tFmW5+buYHLf+WA/wpjo=
X-Google-Smtp-Source: AGHT+IGj8vHnUjzyQXLjakThkDrI8TADcYkwvsTFTeOcX9PO/UorHw4DDlmq9L/9O6hUgzTRz1KoDw==
X-Received: by 2002:a17:906:ba8c:b0:a6f:6ae6:8ae8 with SMTP id a640c23a62f3a-a6f6ae68dc2mr43152866b.74.1718358431505;
        Fri, 14 Jun 2024 02:47:11 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:16 +0200
Subject: [PATCH 17/22] dt-bindings: thermal: sprd: reference thermal-sensor
 schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-17-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dEicE4oTwCczzzSyDwiogCPoDffxWlAHYRiHMVel/ec=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFuXyZKku6z8Qz5XDywxHtOOz0aHPstPB7Df
 ZOWxYleA7yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbgAKCRDBN2bmhouD
 177kEACWRRlV6yfOp6uidnIp+nHz4sLjMdBIDfzrzpVcp7iD4jWwecM8XI+I6lj6IDzxOnxVerN
 OZ6j8qRBgfiSEawZgjFHgIi85071JUuKrgk0N/lQEZXshx0xio+A9apGatt+66TWUfS/rLtkqKo
 +UAte/xkpG1cWdKplXf3ygInEaFnyLuZzKusoBU5Y0G4mBQNchDGKvc/zDHhQ7LOV8TDsk5Joxp
 lEz5NTW86srVdlZQRHK6M2NHNmjxQmYjTlZ4mNgn8ueEWPLyJXRKkJ8aKgAfFj2PufgXI1gq/gD
 Noq+61uXpkdFmDUik6l5ZRbEqH4NN/K6FHhtq+ZmT+IJpqkpdswgYK9qTCZ390I6B0mvsxx1nuG
 eSZwun4lh49YfJoX9sMvuts89ZtiJ94oO29zK+6bk8E1T2VKIll6F70H8KWU3GwqGhc1IkA3pkc
 YNqo4x1G9HZcGqtKg81wGxxPSjc/U/mOdLc6OBE6Wi0eFLbnXXlDEBqlnzMDHef3amQ06+52ceB
 pXkh9FevCjjNCUx0HZUNZjx8oCH+Kp+4RW7UQS64H9Ud244gGv7i5BZvyLsSXp9EKtLC89wm3GM
 BjrpkcZYfnENpVG3KevH4odIvbXlsZeHemznlCvB0Y77xZradFMiIqHW5fRUJ/4ZXs4kVHF3Ow2
 FzZcySJAMHGaqGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/sprd-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
index 76aaa004c8ac..f65076fc68f9 100644
--- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Baolin Wang <baolin.wang7@gmail.com>
   - Chunyan Zhang <zhang.lyra@gmail.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: sprd,ums512-thermal
@@ -77,11 +79,10 @@ required:
   - clock-names
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

