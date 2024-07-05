Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAC14AD1B
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173133; cv=none; b=irGi1tMyaajMXZHxfyUZ1zdpR79zmfVI2anTsYyj04TPlm5qEgL0/0R0xiJb0/GpNtQKgTSpJJP227IgY7zKSPdvLta8FBoXWRpkJWsMYPZiUbtRkFMug2scRKhWt8WYe7WGgQQ2vqd4TEjUzFNKz6hLifmDt5fL3IEKJVG98lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173133; c=relaxed/simple;
	bh=EE6uH3S8yooWjBbe3+z5cTSmhQC7QX5UA8UWn288lQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xp19uvFgBT3ghXuSPq2V2bA2CZaCCQJ4D4LhgKtfwjxFLXqSGCBXIXCE3C/Dl01PgnQ+ccwp45ZgKB5DUD+qyCIvcIJLxpgzUaBJ9EQYI3z5sMUbne5OovLzBIvrGlyTcnw7kXL8iRrbxwumjWW8K6oAlBOHvduaBnGP1IFXzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xB1xjVHm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xB1xjVHm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-426526d3051so3238045e9.1
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173129; x=1720777929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ghab2GKTO4iG/9N3I+TNPBlHHzMyAOX4RVxv6IIXy8k=;
        b=xB1xjVHmb+0i6yqEbOwDESeKlvFEpAxW4LgCUa0aRbmI12ms2Ppp8oWMoMNGpkYN93
         Ar3flb8VR7rVU8iuschi/63lcHVHu+mLDKxvoOB3CS0Iaq6X0DTA5Vfmf5VeFEzBLhlR
         vCiMGOLgVjIpvAXPNtXs1hpw4Sh3IQIv3EzX4/gkOTHFaVKcNny7O7TP30BwqGu29v+l
         5SM3WO/4cB/gSIujF//SgjykTbf6Fl9XHvcobPzp9xkcd8mX4s1bJb7p/DinUZqYgNTb
         4QI/6WAhVy/kgk4iUZObCKPYIUSqBgL1llbRWEi4SicHP2NIAurRNIP/+TEbws9eGE7j
         YJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173129; x=1720777929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ghab2GKTO4iG/9N3I+TNPBlHHzMyAOX4RVxv6IIXy8k=;
        b=g6k5nLPa8pO7lkmn7UeUMhSbAY2wjPQIL2rc7Kxhco814AhEaU67u+Bb7Gi6WCpDjV
         0eGeWQ8YozHgm5W/ioIbiAcqWf8j1f5jkikT9FAk2b2R2GBx9kaRhtK4OuIOaV4iA8yc
         C8hGRnjMoqLx98tt51RKv9wsWIEjGnD3cK/Y2H3Z8KwEkPY0wafwioYckwwoDJm1SuNi
         YP5cydGwbne5XkJRREYI3D6R9qlShPDc37pXSukbrMb+GDIlKrhX8MPic8cGX0BlknHW
         6LUsbxdNYa3eIJy6Uv0wiTQ0n9G8udHCvS9/PMHy5Y/74U9SAbdUOTXMpYg3+dGWeAZI
         VasA==
X-Forwarded-Encrypted: i=1; AJvYcCUcerBThmAg/vuYKUUTVXrV2VhaNQ1h01T+3cib3edp90cKubedtxqSU2TLEjfsoTDVf1QBYPdovjNgLNY3X2ahy20w
X-Gm-Message-State: AOJu0YyF0IvoPSEgrXCJC0ex0moSPeTsIMxqUDyzAIwOnQtgRBKQID1Z
	znIpuZxfrxcl+ha3OBW6NTV4/VqieAUZBxXbrLPf4fiA0vIgP65dXZoiMg/sgV0=
X-Google-Smtp-Source: AGHT+IE77ma2axxS7rLu+M9xLG6/UwCBbROAMMPTCHGq3ZddU86XnrD92GQDQqINuNvkwWFdRJTeVQ==
X-Received: by 2002:a05:600c:b43:b0:424:a659:c169 with SMTP id 5b1f17b1804b1-4264a3dedd4mr36112265e9.24.1720173128994;
        Fri, 05 Jul 2024 02:52:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:27 +0200
Subject: [PATCH RESEND 08/22] dt-bindings: thermal: nvidia,tegra30-tsensor:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-8-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EE6uH3S8yooWjBbe3+z5cTSmhQC7QX5UA8UWn288lQQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Iqd0ph0CUxcUs3PavTyLzOqTzqJvcdDYmVI
 xV0u6SX2A2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKgAKCRDBN2bmhouD
 1yBvD/9984PhWBMPV7QZqKhGV74x0JxB9WqUhV9r20PgsjaVgxSFnDGL7vJURSZVChE68EfgotW
 e8Ds5bHK3sPvyMXGka0eR6bN/2ofZ/K1k2TNKzu5MSqXIiH6q09J/0ZNqTeSL2iCj/yxNJuv5ks
 kPCAvVtdJgZl5pJh7DjsV4D+olOP2/bTiPU+i221P1+jJv99Qp5EX2ARu7JOIdn64vgkC90cHk9
 3kpF5u/PFB1v9hgJlqqZ/0CGUbg1AnjWnRTHAQw4DwlADG6HEFXqNWs1lyxQonEq+eSOPSxWirY
 2zgz/c3Q/s5jQTe2Y5zUthIweqFV3PZazTmAqYupWbTA3BAUy2Dbav9Usv7b/af2srFLraPJHwo
 Yl37jqf94DcICjgA2GEBM2HMQO/6OG4B+jxmAmyhp/Wu5f4R2WRcDHcqpye8BM4q/fiZJsQMZ9b
 5l4kbYSvoMe+KDLf/vjmvbv1fMsaT+WLBTCY4Ca+L5YYXa95dmHNO70ZZzYZZGTYd7uQad/5sP+
 BxnUEBAAiShjPGx/BzeTqMptlVmMSAv6Sk7No484Ay3DvbRnfnVonp0y+TaQrJC2x3qNsvuQTnd
 9HXsS4VgpSZ7zYubV+ms+is9qumXHtqpl6yiLcn22+L7/b/+pZPWaE/l6emYxwyOgrY+72xloOr
 N/C7nljDb+Oo7lw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

