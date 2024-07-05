Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277715ECC8
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173149; cv=none; b=YlHGrXa6qJVfzXhiILqcDZ3LT492i54FkG6UC2xYyCn6OI5+4ZbNr3wQoAPgmBbHwtK2nukT8ayWwljoGkHZHyTT5gkmMYNwdP3S8Y/uK0vBJQ2jqHgfq8KhwsmBfQ4cn4gTNC+BzXS77N+QTVcPn7+gSU+6kpz6KWHCZ3q/41M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173149; c=relaxed/simple;
	bh=TGEUdfIgxrn5p+oeEOU3I8iRwVeJfrhCUIuhAZVBvgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hElDTf1+WVv7h+HwvKq4nWvzv51BYV7bvMUO2exQM5pydphGd8oS1JULRIUsMcP5rYqY18rhjDSVKQ5Fm5wDJnASPTlOnKAo1sTC5W/9Pomnqp8chBuJU9abdJAdIirMYcQsZJjg58JzB/mjS2P9JGMIrKQ5BUZYEzP1PlRH2uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aFIF/7G1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aFIF/7G1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e9944764fso1720081e87.3
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173145; x=1720777945; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HewTxIxxAw4d0VO0IzaF9nti4qYjTs9zA5y2utlK+JY=;
        b=aFIF/7G1Kiuo3S+4ZLEmoykI0o0SUYmwUqX+WFE0ezZ/T+Gf4rYBIlYNCqHMOcKZlR
         iwsxccnldiTF8tKcCY+df24d8aZca/UrPJRVTfMylrjKR48Fkp1cJqAO+iiZ/HAFpaGF
         R0qoy7icrRvhzkUl9XevkLJg3h/gVgU5zPZ++ZRXhr37ZlvPYQr6/onTIpGAe4MPIQQA
         YBsBdgKokpoZhOTwkiK1Uw7NyrYkRSSLkV9kr1l3avRLoFWsc2H/jTkTIkb+s4tVohK1
         W3wqN211dT70JAsdVNtqyRdinRQRtgkCPDdvCVkKVPtQ2GRdmFXOGPs+xLvQXgZQk9+H
         BYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173145; x=1720777945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HewTxIxxAw4d0VO0IzaF9nti4qYjTs9zA5y2utlK+JY=;
        b=cIsBrb4eYADrlIYpXs521NBJ2MhF8W5Nc4jBuEP5tzPohdnyBurRUueiLOswT9cVjS
         9HEppz830isQZe9CiucUsU2x87gSIYHV9Plhy+WkwSg36Xu3sABRSJMBW5F+fW9bTjpy
         AhBpx3pQSD1jq2tYjl4dnnd65gulBxCoC1WKb0kZXcZCJcAQGN8gRIlicvws+EM4cnZR
         fMenuDM01YhhqEJbEin5yI5WwsYIVbQIh8AKjHzgThxcgMOQhzGpzygBEyzsLwmdZmxJ
         jwg3u+kCXmuTwKKpZl9L942YfBPABwAS8kPUEQj4dJDe9POjG0km+QFdfzZIQ2KDA+/V
         wAPg==
X-Forwarded-Encrypted: i=1; AJvYcCVE6CeQqTFJqHOWWoDQ7e+cSTUmLUxF9C9O/jECuNxT0NAW5SUwaLNKpT7vu0fr2cNjgei45wBLDtgqtFER61AkIhA+
X-Gm-Message-State: AOJu0Yx/y65hFKBzX2UXIVuLjngdaM8lmQn5NYeRPl2fk6EGWA3HjnaT
	5v9bzEkz+BMvfrSOvRl9eTLFUawEdfWWqIGjPT4F4GOThz2sputn60V5palNW2s=
X-Google-Smtp-Source: AGHT+IGNfSuHZVFsjxGRqi721AgFHExWikVzZX/wJrHfHopGLF9m4l1eGZxSOMp6gJxffsVUPzQnDw==
X-Received: by 2002:ac2:5e2a:0:b0:52c:e112:4b0c with SMTP id 2adb3069b0e04-52ea06133f1mr2313228e87.9.1720173145308;
        Fri, 05 Jul 2024 02:52:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:36 +0200
Subject: [PATCH RESEND 17/22] dt-bindings: thermal: sprd: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-17-554061b52fbc@linaro.org>
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
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TGEUdfIgxrn5p+oeEOU3I8iRwVeJfrhCUIuhAZVBvgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IyLM7fgGzrFDU4lF7RNxv6EBHPu6d7Cyz/c
 4CXChnXZxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMgAKCRDBN2bmhouD
 1/CkD/9EEtVLnTR6HLb+RQ8ppD8kzzvgKrlRWNFNyulVlT+RxcwDrdvWUOKWp0+Wy529rcI+BQd
 kgGT76Zk08TYdy95tjLeShJw43znJlBAgXdoQpqcMYdANi3Cy7qwy1KuhaT6REsKsYLl0lTGPWn
 xdB96EUooRu49pYHGDExtWpxE1bboFwhGkQhF+U0yk3BZcPnT68Z2cPyDn+kkSjor1+eq+SLhdd
 KgnODZtv+sqS7FXy5GBAkZn5nBTKg/Aw2FN8rGyKL9DEjZxD0r5au7pi+nhVXXRkq9l2Qls8hG2
 q/OlwGwyhik9vnJmJGSEyqJHCQ5LeXWicHypvDdBQJI6NgYYxTXP763jyentekBZQgxNuKHhLKE
 kd8C7mWcvTxwQ/uYcQI/U2CUJmCndTpCjjqJ/pdfKQbt1Kgh41Ds+H0/iO0vtdvc7ph8O4lzV5n
 jR7OVueGt5+DFCEHEoQC9Q3bzDKkn52XbUixejyhNhyiuMs/MEYCxMwYW/jmOUKrCftEOFwbpFA
 6+vWwyww/34OR0DWbkr/f+2NJ0eIzeGTD3SI+t2lKPKRStxxS7J0ay86BxJeMhFy+lUpBuZUa5T
 5HhaVeWBMzKTDYo/rEBbLEUVxxJirKQgaBLueIQGp1+kir47wZidQZjkUIScpS0pSFVzMsTMbqH
 Z6z7AANGQXxg0NQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

