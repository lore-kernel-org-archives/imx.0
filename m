Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992514830E
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173122; cv=none; b=pRWpDC8GaOJxY4aOJ/2O0SimPYJL42gmJflAsDTWM7v/ncN7fWdCI0VUHecvwAUPv5KZgQa8wRM97Rl+u3BuuyE5ogmEASSCK0urnh+/9wKglanaLGV70jnTg18cvIX/SALRF3a6kDX7myCMrb1hfklUnfqKwKomNVLf359+RMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173122; c=relaxed/simple;
	bh=LeSP685Kq7VRSSmr0/04GPkxgxhjYf+AaH4Aoa6qJmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MkFnNoDxvBGuY0yWzHNNOEsq3Y2n4Mxdo/1pSnrhNB8YP1dzRFIOTZ1B+EV3L0GytJHuwJXaP8+lUAk2o6N0Os9fNnSPDwL6/1fwqElwLtlHISelS6TvLhTHNxsxM+r3V1dCxgBheUzUrgcRkeNOsXdfhZocm2U5R2Km3BwTeY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rIgGzC5c; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rIgGzC5c"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4265921b0f6so1454775e9.2
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173118; x=1720777918; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
        b=rIgGzC5clEXdY5TknO6D+78v6DlCdHmgk0/NpZiFQJYEvb6MCMeJ+7Xia3lRDT85zx
         ZRHKwuabwAwYw3ivbN+g+F2GPL0EE5xbLJIvk8zHq1vKGtH0zebW8jkh3yxsu8oQ+GBX
         zk1OhxPVnGdurefnU6XlWhZfkrSC0B3FwZ47q/irBaMYFf9LKG0y32xZCLWOQ0EqtL0u
         yczKmlHHKGS3buLEtX3CWGUKFb9RLOuTg7fP02/WhJjMDs6Tz19n12X7jP4TjlKIV58M
         9dNkvG5KZgRmqouw0YoLfh2VsGaHBKrK2p4aqAZulB81sBxsF+DtKeIPOtK68ZPhYkNy
         nl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173118; x=1720777918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
        b=CtODqlRF54ZRb86+8AnOBMMy849lMetmQmgDsc75gex2CruTIfTjlyUx92Vkqqb0zB
         KEbnYlhYAno6BGPgWL7Qd4SZpDEMxrfDCOAzWrMnUtz76QixVzBCbgZH2u5XX8EtIy5c
         xevq6u2vD7MEumwASaOfiy76MSJMQilOQPefmeXX24dVxywRJR6YL81A7qBCRg2Tnzaf
         HUhoQSTgOwZ/FOgUhugeNrECHWtkk1e/lS5+PKxs2PO0bpnqMvh1mXBZVmZC6P8xUVJP
         1LwHDRu8lP+R06TbuG9OdiP/BgpX575deGGtEHgdrLRvfmkhq4vmnd512osWptNsn5Yk
         m3zg==
X-Forwarded-Encrypted: i=1; AJvYcCUwq3k3o4sAZhz9RFSFhtAxrb9vON5NPvF+/4PyQfrRLJ+KOYDU1uXt5e/+VRI+PjtTKdVMGaNQT99BSLm7VWX4bDko
X-Gm-Message-State: AOJu0YyWohwOTXZMq++TVpKB9pggClz1CgFmSv3ZEoC1tNqJtsVyM6SK
	9GUwAAY6GDfrba9PqJlGhm5QI3X6Ot+busmHPN7/zbyzkE4ANf7Ulxlm26h3lzY=
X-Google-Smtp-Source: AGHT+IG1gRQHdpu2sW5QFoF1LniSXRvboVCxaOleTK3xsQy/rvilU/vtH+YKOuVGHfgb67tw64B23Q==
X-Received: by 2002:a05:600c:4ca8:b0:426:51d1:63c3 with SMTP id 5b1f17b1804b1-42651d16511mr8916535e9.38.1720173118303;
        Fri, 05 Jul 2024 02:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:21 +0200
Subject: [PATCH RESEND 02/22] dt-bindings: thermal: amlogic: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-2-554061b52fbc@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LeSP685Kq7VRSSmr0/04GPkxgxhjYf+AaH4Aoa6qJmw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IlkQpQruYXCBJmeLjrsSCjy/A96oZulHmNT
 BgmKyLiQHmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJQAKCRDBN2bmhouD
 1ynkD/9TX/+loWJbQv5z+n7E0oNbl34ziXNPnnRwtmKBF+YXd72Utz+bdkjnSJutW6EqAh4i0BA
 MyGzrk7k8ABIGMvBwk8+5HQSlCAsjsRRNaMieuxVnqXzhgfaZlfvUsIyN57KSUpzGmm0xYZYW1O
 TwabUrxmDq49lNhaL1soSHAaKezV8cw8ZjHtnC+6NKewpbW39+ipivJIpNxvTdoMvccHUHadlIO
 IvgdAAL1dGmGkmkl6ARHXH3Agj619JOixf/ylFr965+UxEYWNp1RmeZIVfgAwCA/3LKf7sXSDmP
 PwKgo03lc3yyH74EdnS4hYtIBaZ6OG0jYx6A0W023nSkAmcDxYgAGRnNjKPbEvfEu8fQvOvjrBU
 YUO6B49ZU20YmCkr4fxDJdsEJIDr1aBRhTlf8ek6gwtXqxT35oFEXJVXFa4poX43FH6Oi2PO93m
 w0WE2laiwoSf7AvQtogVWJMfoHY0RNX0lE10j1CoYbz87yVdLjVg0BDNpby3/IUzXrpR9ZfkyqO
 WoFoOk2/daib50kAEnVw/D1FldDWwdUJ5PgCrnJVzAv9FXsKCYFIT9CKQkIu5tueI6e56YOLSrm
 d63rcP+UdVMKyrt1Fj9g67/8DyDGtZOMEn6oUAr+rgqb7HnNpqeGWljv/daZcqYKRwNqJ5cfDjw
 g5lf3f3ssrwlG0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and all in-tree DTS provide
'#thermal-sensor-cells', so reference the thermal-sensor.yaml to
simplify it, bring the common definition of '#thermal-sensor-cells'
property and require it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Guillaume LA ROQUE <glaroque@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..e52fc40e215d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
 
 description: Binding for Amlogic Thermal
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -44,7 +46,7 @@ required:
   - clocks
   - amlogic,ao-secure
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

