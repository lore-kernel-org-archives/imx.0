Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E11DFDAB
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920459; cv=none; b=VyQDYQhf1QdcMS0UZnRjzlosiSDvgNhzAsS9gEHn08u4U80nutbTc+2RGYXFXTqZ7nZjiCBUW4ZQnbIVaFp+GIPk/UVYrrMXJGyr/1zGgyf+bNZxpW/0yKwIkNkUdbwiknkwwJ5OTyDMg27WZjl8MoWYHXdAiovE8DoMygcYKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920459; c=relaxed/simple;
	bh=c3RG28Ko/mx6f7xdaUC6cmwJZ34iCoqiGu5BWiOS8Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEHZ5LHdzi0uTW7u+U9FkLWC5QkImq2HFOO+quEotmQRBFdCwwcBHtrpG/lg+ap/DFMHMRfoweP9SZdEnvMqHMCOdhp+lEn1V9OhpZxXOW9JIn/1JSYZi7JSaVnG0TO75IA/Ri5hzMYrCeAUL+O9uCcnVNmXmqlKeGrytNDPHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rWDF113Q; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWDF113Q"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af933e84619so68420366b.0
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920456; x=1755525256; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y33Pv3KzofFQINb0XIyuYWEMtrAvE50zQkghzUlQZqo=;
        b=rWDF113QbWUnXrp7tSgxA9yyZrJDlQ8yCo8w8iWTuHUKPEJFvwAxlBPg+Mr6NTkFTt
         JZyMIGsTtjy7tYulVdzEVdQFvw2s4bLZbwAiNZcGFRUujwvR7BSWyEXkN//pLXDINmKQ
         HSz07cqOjW6GsUBXLMgl4yECtIQCk8rwN4SveKKTnc74rwSXdQxHOwLIKk2RrAShbxmA
         Ejs6gQ6ZZr0X9+6S3RMxfk3WrBYpN7cMB7Vwy6NdCrCTtfFxwSXs1gYc6LNocPn7X3H3
         uOTTrquY1iHoSsjXdS4LUTvr+HutamLHvMInI/MxkWwj8+fUVt8NWlQotMSv6v6jKF3C
         NLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920456; x=1755525256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y33Pv3KzofFQINb0XIyuYWEMtrAvE50zQkghzUlQZqo=;
        b=LFAP/BgKk05B1Gz1zibvWWtXJc/QwtFIYb8XzO0f0F0ZKC0zHeu09gLJJgVc7+qSyk
         d/pJhVqHguNRnMcFzAGmxrLocgpu13CWS4OR0l/eavP8HOi2cyU/nLeJRHrlEKpq2E56
         qsHr5IcaZOlne4A1JNu6grCqHfDczgv25K5IW8/vz8DcrOpE0Y1yYq55cNkbiyr3NIc/
         nkhf9Wtl4+S6TfAB3IsRkyRdrgzDArFO6Tjpzun820mdKlZOoOGw0nSKmnVSqIBewOLk
         oXRJwAx8ZNwkqQh1WRwbPzMBbEMS1fW6HS4elATv44QpKijcCjsGJhdrshlN8lrI3xJH
         UBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyM1xVFL3lE/kn6I8f6vCfNevJHv2E+QfV7b80Z6/gTzX+YS5fVztwDjASEvKngGe/+QU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4mfqES1fiJrwmsG2GY4sFgpr/1GhoNDMNSMaFVbhX0IYA3DQE
	sljpenhXdVUbWiFqhxwdihKwG/0XDta3NTykt3M0o+5dHkhwNrvPX3vOtXikQcCpPB0=
X-Gm-Gg: ASbGnctKaa3h7OZwtJG8pSA/iAvAZeD1F0siatFCJTWvJblXaC0vWNzFEtvXPMYU4bn
	GPxjEoAoh2D46c6bVtnrSJo5EZ4Hdkx0BXTQBGJQCVul9K5MXfCDqzroQF8ToRRi/wrnb4aHWlZ
	c6iUhqBKtw3O/ONr2Tf0cll0mTylF8Qm29a1fsJin66Y1ECDkEjlLAWFt9UPtTxByVbL++TA3eS
	c2zuoifkZNCZxHU/P6W4DyftIg71rqwrHdTPben+lLynL5G6jiaIHZL3RwWPNIvidyhWn3Vx3P2
	oUQ9m3OdOHBkHSZmeAtDTRMGwyIdP4PtH5Cq1GRpsWzcsRBK2zm/MGt/3bwt0Qoz6bcxfqp5ny1
	VLMbg/jDCxLuAQ5g8fCRPSJpeBjIW2VlLLWd/pbo=
X-Google-Smtp-Source: AGHT+IH4Qf+ySBLIVJ9RkUzdhUf9nuY3HqBodr3qXxNFSQgHsOTF3ilWLqfyHr1IQq10+Kz8o09S9Q==
X-Received: by 2002:a17:907:3ccb:b0:af9:aaa6:a86c with SMTP id a640c23a62f3a-af9dead3f1fmr358990066b.10.1754920456487;
        Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 11 Aug 2025 15:54:04 +0200
Subject: [PATCH RESEND 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db'
 suffix duplicating dtschema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-dt-bindings-db-v1-2-457301523bb5@linaro.org>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
In-Reply-To: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
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
 bh=c3RG28Ko/mx6f7xdaUC6cmwJZ34iCoqiGu5BWiOS8Xk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYCAhXzoTChGKL7Xql44UhldrwIyMLU8rSvj
 ClxLJtPxI+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AgAKCRDBN2bmhouD
 1/rGD/95sl+p+L3yZcu4PpLeRAKVr8M0CAYYWYQISgDBn6rgUWKMSxWpjRCK+XTyJTfIVm2M0da
 rshpXmRzJhjNa2N6onDSKhQIhcWQxb8ziD1k7w2CoWg+38e9S8dzL/Dpfb8egWwXGVa/COwBnSo
 g4fNEx+07u433Bn5HQy8MfjFOczQXrOFsuFS8iQ8jXqER9zY9u66tjwNpkKuSandtQNQn9hrb3J
 gc8bWN3fkE5gVxt89ZVe32cD0Jg6cftQCiIG7K4N2zmSpzeiSPWKwo4UOvyqjE7zOFQI54ert7X
 gMFwj2f5Qxv6M5KuecERmUWYaVOFrurwMa3274qrvyahcAGfK+mDU06akPsgfdiE1Vsr5hTIZiQ
 4f+KYICmuJoClFIRJzuorhp24lAjhcEgcEDB9T2e2L2uQzYjTIrPiuMBEWYhPhp43mHSd1KTs9o
 FtpspdYBCN1VfmOyqpzK1nf9Nf6NEhZR5GsJ5AryaPV44iJNm6xIKJd724oyK+P8HL4Ae9n2l3p
 U5VFAsCg3b3+3mp+j9MmDIgyll8GFVqTkCzFndCkdhNQd7AJHdSHsi2uYFatm191/KHTZGuXRsk
 Bfj9yHmaePvlSvESbySzB/IoUn9p5izL5PH3oq7+Ly7Sbba6OFqrsGsuJsgk95oDdjbNnsK20KQ
 09bNiVFG/ckn9GA==
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
2.48.1

