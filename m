Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3001494C2
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173125; cv=none; b=tdaF8e22wvHqMOiauIv6VVbnG0ybhQvtIJ842VJP2yYY1IH+kr9u+wSyKMZ4bDNajxrXuhYkF3a3hMuaCTdmhbDzSgTBuoE5uAJnBM3k5VsWH6syrTAzpqqTK+Ns64OlZE5kuTkpFdEpomlgi/A0lwP8By8O3HoNHAoh36KkN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173125; c=relaxed/simple;
	bh=77dfRMvnVxm1OF5oitgwjLhiiD1KP8HFaw6H5YipzNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrYdGZDeDQuf26C2JhtmY9FIpYXjU8ruWzsKwoSTJsz4G6NzvA3x466XA8CevZggtp/5fhLtmnHIyMi6hnBboKvlNz06KEYA1kYNg+aDjToktKZ0Cvdq8a2v7QNAaCejKxHoT1Chv4UUi4FB84ruI7lwTF8lROPU2Ju63gc4e5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F2tYk797; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F2tYk797"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso9686255e9.2
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173122; x=1720777922; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MU2D03rBymimeEThachF3vpMLpUyintAFPPxBkkYiN8=;
        b=F2tYk797J8k2oNHb5J+3cz4mHB5p7VUDJXxlkf5xvbBB/oEHb9lGnvHg/bezDmGF18
         NrjGkSx5uxHs7iZf1FIg/h9Zbb4hnZ7Mdnsu7+XA00f5ZcOrLWk1eEEaKuLPDfbcGWVP
         BkMDJc72rtdU36hUCUkZz5dhkNrk423+fT3S69/Icr6IvEn+w26Eb4AtuLuvJwcTVMcd
         QsIaSOsZhn/YFfejOxbRV1N1hJkwpKmC4NJfyeU19FQ6Me2vQ0kV/pV6+LYqVdu0TeN9
         Bxthi0Op+9N0zVvjeP3mUc4Apwh6fXqmfnXSy1Pg847UnT2EyKipJwKRyyXaTyz5VxzX
         TqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173122; x=1720777922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU2D03rBymimeEThachF3vpMLpUyintAFPPxBkkYiN8=;
        b=YiF8O/MgLnyELLPd7gioyx6jenaDa91kXoeaPWrFO2M1kkfPH79s1t4d3xhJdD0D+w
         QdRD+0HTmzBAS/TOU362YNqhniVhFZeKReWz/EGC7ko5rRvqTglaMS78k26noQ1F7L4p
         izIVdMU/mW+9qFDyfNBOMBocGx+nn+5vkGUFzdXyOBsdh+sTG54BP1cyNPCVWOP4v1bT
         88PFLlLaMSuUciZ+bYzEZYSKOl2WN7Xsu1ZuV+0csBT5+OlBiHkZj+V/3WyjAPXcgVTw
         N5rHIuDRmBDcTTAiGMIz3U9rxZw/O9baN4TM75UDTkPd4lpZCYkxS6CNGCglhBDvIMVa
         x5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX8ePkLYRhYuKR2+8ICjCtQq2crgx/+1ss3qEPe5AwSX/elxZ60ykzyQrds3OJLBFHg7b7Xc/5jtCwqoRmEVCBIhy9z
X-Gm-Message-State: AOJu0Yyhr/WGTZV/b8Q3RDR13gAWuSrNcK0SBHquddHwjFY6X8vbqsza
	d0zlrjGcwfE3MEzIvs5FdSLDoInGi9Yb6kh6CsriJsqVBkiXFxCSawhzlnSYmxo=
X-Google-Smtp-Source: AGHT+IEcpp60tR4PKcwDGPP14DeUI+AoL2ftunbhF9352ciJ0gccYmGm6xSSUx+JTouCAodSiLlByg==
X-Received: by 2002:a05:600c:358f:b0:426:4765:16f7 with SMTP id 5b1f17b1804b1-4264fc79f5dmr12586365e9.21.1720173121834;
        Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:23 +0200
Subject: [PATCH RESEND 04/22] dt-bindings: thermal: brcm,avs-ro: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-4-554061b52fbc@linaro.org>
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
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=77dfRMvnVxm1OF5oitgwjLhiiD1KP8HFaw6H5YipzNI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8InA3pcGxOIaNi/3wwA1jD22EnC+9r/hUFT5
 oPaKfM6oyOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJwAKCRDBN2bmhouD
 15/ZD/9s57cCbSiSE5irX/Uur4kDRE/StNK9tbyUxFiaMjpwhSzBdaX4L7325iJWZtbhhpo7bDO
 Olnbs21yUzxNsQKW4iv88RhSDqHQikiZq7o5QSiW+fKeWh8ku21wgSZs2fl/JJF5pRtsswwm7rn
 /+XMjbE+UIp2qbtHeYCPE67y6pp58dKe21sjcb0dHUC7GORWROwV06u4cDth3tmYkfeZoK0ffJN
 HB0JWweA//qKV0IJX7mIpAhwfCh3Ttlh7RMzIYXM7xnLmAYeitzpOdYTJv/DbhvCtIakG5Tz1Za
 VCfME6nIO3DSJ9ETrkzVC59rj1OG4PS7eYAZ11PmQAXLZQharcnAk5bfSIoe5SAgqdsXY0iN8wo
 lF235kN83UGvPQ8Rh2+CCKscddW9fKr8igS7x0VVO57VhYGmscjUOsWPHaUqlwxyZKTtTb8yZr7
 A0ek8L5L4q8gp7XERg4FdEC122X7tjUQM8Itq4FytD/EqAYhQP9GoKpz6OJ5srrcTFHJXe2Za/i
 t9I7SfHCcX7VbZHck/tb5Y3+FEJzpLzVX7y8cxRMLr9bhLicB9XyRKb1SFbfFeugE9NfDcnjuWq
 2AYBQhZNcXR2N/xCjpthq4NDkp7nDdOXdTVqluE6epqCbmZb3MTT7/nGMdlOe7xuLwGyvEbH8CZ
 bl1TOEbO83/Qz4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
index 89a2c32c0ab2..0271a0bc1843 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
@@ -19,19 +19,19 @@ description: |+
   Refer to the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.yaml
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: brcm,bcm2711-thermal
 
-  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details
   "#thermal-sensor-cells":
     const: 0
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

