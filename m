Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A26F235041
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011325; cv=none; b=XeFVR2GkeqdTVvOWZyMaGAuo/N3XXicBoFI2xJxaAJdz1AatVWa8kUwqfS9jbWzd+BR/I5ibmbuAbPKQFfCrFWznSbvXrgSDTgKxs9TuM9f7XcPvLLPjDE/gj7iskWbkh/2Q66Oc8icNb86k6LH0YDZfz6Hzhd3KGj3of2L/KRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011325; c=relaxed/simple;
	bh=Os18r53ZbPW4+3PxVUJh52djHd2zkWOgpdekfLd7+7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/00xD8ro+jX9GKAOqmPBdS0nNLnRN0GIFb//JGKq3vPY0FtI7QutBFPKTZL1EtvuxdVXkws4ROGtKgi3fnANyMXrBhCIuJuhhvlSoLFgYCYTLMhudX1dmSCLvPhlO4zfifhm/d6ZG6+Be2TtZijuI4LODDaibNdcaua/vidmGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UDj3a9Ia; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UDj3a9Ia"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso219250f8f.1
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011322; x=1751616122; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVQ26FYhE65N8xhWnR/yeeetwdVwmUBewq4SGVBPUKU=;
        b=UDj3a9Iaj5DAAq5IzaL1ADLcLt018sZhSdVwJQug+/n60QUj7j879Nu9Fl8dXcjkWP
         oMwC+V5njOmO9I86IZUmjPA/iM30Mj5niM5gTL2YhPmTRCaw4LJTF9//ul7365uhXx28
         M4xKAJ/TuDff9Wj6UHSjVWSrVG7WCF3OF5CeLW/4UFy2Mtvsv6/QV67oMI9hisDB16Dp
         9V6Hhgu1H3iOpvrZhPk6Qt/b+cbRlcTHLU5t2+uAefqiq5xMAyBO3krJ+UX0+QFJmT/f
         wOtjqpUtCCrueJ+2j2iEwHAimgiS+IbWaHrstCePrQeMjeGnmV7uwZ7QkOnJrErqFcQI
         CBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011322; x=1751616122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVQ26FYhE65N8xhWnR/yeeetwdVwmUBewq4SGVBPUKU=;
        b=HQrrPqcHcp7rBOK1WLJlZSCzRRWyAFcIsyuIjlnIsnde7jaWbqcCty8gbyZwTF/CHr
         72owLfJkT7ZIPmAYknhpiHpnopzSgFWTLkDE/l808WT9Pyd0oVbOzKNmJXenz3yeIPAw
         wIKnHCSoyLoUiqstK86a5u46A7e4QTA5alFlepGt9qbMRYOJShmZgbEP/kIMs0U9LVYM
         +hiD5pTjlR3rAh+pMTN5QxNNr36z8iXza+8CWLVKrdC0/ha274J9ksPaCF+FxxA15fS2
         V14L5UHljDc1AtH6dijtlwHN10pD+Lg75mYqIrSk10EEVvAF0+Hj7tp52jaRV0nXKN5p
         dLlw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/SFcJH6k4CFCb0PsAJatHGTImgxj4nguTHYUQtVOxxpXVdRK172iDXunJyMs17pUF88=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNCA+tQ2da+lD9qFJnLEPiHH9SnMVQKZNUBqLlmyoC8XKc9YYt
	CBQGNDQ3i0a1gcl/+hv6wp+rP8fWNMMgwlPeGZZVrvZfU7SBoQtE/e1vArCWpDX3sPo=
X-Gm-Gg: ASbGncspLGFhLjYAv7jeW3JU0hznQJE+nGc+N2UX95jdWvFIak38cIT2K/XYrQT0lXq
	mKgo2Hpc24wzn8DbxleYYlHZteRsF1hxQjzwTTKE/fzru/4oIcITZCEsjA6678QUasR/sJEsskq
	XZmMOb79PCzcPsgf3n+qcAV0kxu4FpVp/xi/HGZrVi6n1LpSUqC9pJuhtGu/jD7wJdqUXdNk8bo
	6TN3MtSWn8Cx08PsosKlavGWzGeIszcoeND42iLguZ/C0GDWjgY6SD9oezFOKeAWjkOuR8pE04V
	+LLBaeUOzjMXl0jXKUjeCl2U9SVN+WYjGmKmZhO/T9h//Cz/ZQLrVE7Gk4IpZBD8obCdVLzUa1W
	ebCxtz3+u2gM=
X-Google-Smtp-Source: AGHT+IG+OUuFO8zduSqG52Q/uKbJtNoMJ4tCAnBmQyaOHPjqHe1gEHM8je7qA53jNQAj3w0qWDlO6g==
X-Received: by 2002:a05:600c:3b2a:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-4538ee24a9cmr7911235e9.3.1751011322546;
        Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 27 Jun 2025 10:01:52 +0200
Subject: [PATCH 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix
 duplicating dtschema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Os18r53ZbPW4+3PxVUJh52djHd2zkWOgpdekfLd7+7U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/0+ng738Vf2atAtc8/9LZzBj/cRNYfbJxNV
 4fZiTT1cVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P9AAKCRDBN2bmhouD
 1zPRD/9ec1PBGRt9uSGVge2T/60FqQRPu2KOpknFFJ3Yj2DgYRFSk+cXIn3PZ4WYAVB/TIJslkB
 ZIl8QaXjr0prI1lcoi0bW4gqRy+srh++tfMfquip1o0iXOCp5aogQjaYO6u0UFcq8C3+GharY9I
 bMigbXVaL/jZ4lajDdJdM+y7p+5AcdOT9IvlYrTdKvappu9skwsr3bRnSI+mhOT63xhyIF7DWFW
 zJSWlLnRXfR1N+GLwOxrnjllEQNvCpAsHSSF7941WAxyvIznVNXDTgQ78QVhe26fbd/F1hs1z1Z
 DfpRyzJsH4uEFlNn8L3Y+7AEYG/kF83EVxbdZpqmgPnuMTyE/lulfK0LIRBr3hy35j/MxYpxSQK
 5cvNU8yfNqQRq4fBQJc9HR9Ns8Xyu23bvbjNXaNb0ek6aOykGhZ4Ggi5EzVxNKMicwX/XCmsDDs
 t47EZRIViAWLgpWgxClkV3I+AnGiIQMs59AEAbgFTc7Uj+WGvsYZbeGlbix9YccewK0RopMqYCd
 XmBy5pgRiTfFm1XWRcITflD24deF+yfdUT8arxFklLnGBf33AqrHY8zHb/E5u9Xov3xZTcs/iqJ
 nD5oqiQ3Dif0Jftw7mzCCalnUJJ+lJFXGwmWilNvJYtuB6eDo4xwTFz1Ca92alNdhDTpZIGC7f7
 FaegpyIa3vtZbbg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

A common property unit suffix '-db' was added to dtschema, thus
in-kernel bindings should not reference the type.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166
---
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 22dd91591a09428214afaa4c9c8e37aae9bd8aba..6a47e08e0e97b286538798190225ca2966a7ab34 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -76,7 +76,6 @@ properties:
     description:
       Adjust TX de-emphasis attenuation in dB at nominal
       3.5dB point as per USB specification
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 36
 

-- 
2.43.0

