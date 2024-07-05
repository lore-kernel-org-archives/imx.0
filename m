Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF40160783
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173152; cv=none; b=LdsbhPfO0MeY6N3s9VqsP3nhncbXQWhUvLwyEvHvkRAQCYY5xsQ5hqi38QTEjwQhrqp0x4d5QMJBFzKNgvvXOJyhHU/x5m/nMWN3Y0oxT6uQ0jy2ERuE+ptWMiX9feSQEBK1nROxSbBh5dOyoFx0kE/Uzbj6MqtHKflDSoYu/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173152; c=relaxed/simple;
	bh=IKWqNRSn2TqsTvhE9YUkxh3RffPeZr4kiizlC1WJ2gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siAW8iefS+xmeJqB6exDZAnhoNMqD/I/R7TQM+5McHn2m5nz75pJFUkMhzoisxHas6gX2SEDi8mckXPVIfiJDbPv8CdSMT2YneAXcU4CLOB1sHe3Df9C1opQVu25xVnkjTa5EP+PRPmWWYTu6z74r23NwGe40StWNpJF49up+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OrX0Ipar; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OrX0Ipar"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42565670e20so15712925e9.0
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173149; x=1720777949; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIlgI7ATvfa56t24WLZv2N3r+FaRSfcqNDIIELB3K9k=;
        b=OrX0IparYIPR44qoG6usC28L7vPuCrA4HbRMsFZbpuxKLGjYB5GviiiuD7gpjMamUm
         cHLRFElqHmYmuNEobFnzyPB4i2ufM253geK+Mb4jXJd7mWPT8rqdnSJmCGPKnHPTCniL
         wEn1ts5JYXqfiypOV7lDn+qN0/8SvfxI4NnKrDeNsngOujyIOhtEObo9x0j5xwiELd70
         T8gq/CTW5jKa4zyb7eLK3HRN0Vlj7K5Rpmzei6wdLmk1w6tIs+K2ewac2PrKYdOXQj1M
         v2tRbW12lbw3OLppQx1J4vPL+DI+Z3y7S/lqNOFeSaOnpQ8v28A6IYH0y40mq18CRn6I
         uPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173149; x=1720777949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIlgI7ATvfa56t24WLZv2N3r+FaRSfcqNDIIELB3K9k=;
        b=YPCkeAAO0AtCGqeSku/E2tazzhWAIwOByd2Go1ZG+d0bkH10PmzkiP7oijM5bw/Kj2
         V2VYjaKiN8/MymoSJM0vu1MCYT8yoLO/0VzD7QM7JKAm+QtwRVH5Si8GaENwC455fafT
         i34u354l7FsqvMYIWM+XWzHlOKA8c7cvJpXf0WqpSXJMqqcFtd4NmPGnAOypKYpQaXRC
         oJV75gvEkZeO3zbk8XSCineXZ6F6Kt60t4r6L4f2CzaS43DOAJXzRGs8ORMypTU6ltkf
         uHpDU/uhTMyI7G8Qqbs/J1UUnFYL+wkVOexMj1tF/nkqBC1Kfyrcr/LASJwQ/s4amcob
         Xp+A==
X-Forwarded-Encrypted: i=1; AJvYcCXF+AH/b7mfVW0Y5BhdqdbDU0P90V8d6acFc5Cxdas4h2o39TChQpir63Lyi0cMqlmC5vlBmx0G4AuHvcBAAIV+7ApP
X-Gm-Message-State: AOJu0Yxk2QnKbBVpK73hgqfFZ1UJwbVZ2PQeABJ+LuB9bLEwZnUKMnzv
	bwWin3hg/56aE0pNo6MGElXHWU1BAGr0Z3GLrqVQEMa9c4nQJ9DJSyMsXPTqI0w=
X-Google-Smtp-Source: AGHT+IFYdBqLIR/9JTaFBXxYKpGPilE8OqK2LNR3FAi3qauVlnALpvoJQYHb02bjbWHRYQZYEu9JFQ==
X-Received: by 2002:a05:600c:4f92:b0:421:811b:b83e with SMTP id 5b1f17b1804b1-4264b190342mr38378725e9.13.1720173148796;
        Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:38 +0200
Subject: [PATCH RESEND 19/22] dt-bindings: thermal: ti,am654: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-19-554061b52fbc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IKWqNRSn2TqsTvhE9YUkxh3RffPeZr4kiizlC1WJ2gI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8I0O7SO6MI6c2V1rHwrBXfHjz7fayuCjb2vT
 5QKRdVQc2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCNAAKCRDBN2bmhouD
 129dEACM/HkC9ezNBuq2ZBGjirp82olHBKI4OVbJ44FpK6kq/5oyavQNNv67gqtmbfwg/+1ZfgT
 YmnKcEbPaJkGgTo4k3KgS0Xj0DMaW1N4/8uQs5Z5hf/Zw+00jqua2RzRe3K73g2qnBUklPFndd8
 LKWGCYDmTGc9Ff9Wu3djwXmslxZAwKUoZyjcePf96FAznTNekClRSLFF/hB1SwuEzRpVohjfC/b
 ROAqWk1gz3g4Z6GdGlwLdXvMv+l9/YveTMv9K5XlznFWOH7f2vqVGgS2YOV5GE2y04Qq0d/EanC
 4bYllTtcVtNocx4BTsncBd5bd+xL1U1Z065kx80B6hwx/+GkQ6bEB2yS7/5Rm5f73hIMVwuYOVg
 ws9M+6hb2Y3igrkvicIEKMzUfnSp0HKbLKhP1eNdQa8qL6GN5O9bvc8vaLzLvdQ6LVhNz2rIv4H
 PQOYt9hmIB3IuYBLwVl1SMNoj2srEJEZfGUuNI1+8K7cv0v4AXTPJtsfn1KbecOc3l3VIME3HNr
 +Kh53D6zCQYbFJy1RR0wAbp4f1RUGnv7uYaves2Cs3h1pu+8KdRct/Gq0+qEYKi9IPvetsAcOR/
 hgkko8KvukQb96Jaq51+8fMGnAYvOnMi5HfJTPBO+fnb1JpRVHwZhJmg2DOW618OIAd6wLAFdm3
 NRAZlVl0Ki08abQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 7ed0abe9290f..16801aa78bc2 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -9,6 +9,8 @@ title: Texas Instruments AM654 VTM (DTS)
 maintainers:
   - Keerthy <j-keerthy@ti.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: ti,am654-vtm
@@ -26,9 +28,8 @@ required:
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

