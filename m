Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B221CA1F
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920460; cv=none; b=QAsH6lq4a1jDCrPwymB0TsZ+CVMe3EtZTHlChZS3JbIYLsyDhS7kGzVW5VutvTOAo/krLyOe5RJPozwe9noB1/7OxRRUK4imNMoqSDMBppaTXlv51hRs1WYrZoq70iv8Ebp7x4OcMyxl6ZCvP6NCgnhjPW4ioWXFL2kciqck50c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920460; c=relaxed/simple;
	bh=TwhL9kHuNMw1ekpCMBDV2BMjjP7HjIb5JBPWSmFWyGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEuwUrW7oBLtu10ykykFoC0ryZbHu134lyJUYAtMi87ga6qKbT4z8Ij5sp1ZVGPd0gfs0djG32gno1o+QNE0jQbv7FjlSt2ldqBjpDcGHh8w3nLWAeG9n5PY3yFlJhKl5M9gue0dzx9fb549tXPQ1lvHGdv2pm0MVhzJK2u5UoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lik0mFSo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lik0mFSo"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af940717331so58856266b.1
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920455; x=1755525255; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqhbJGyWXO0pDEnjUQmQZz1y0G16+abJkAfpIFUeykg=;
        b=Lik0mFSodBlT1K4j5K9RxzRc3PTgzCqm2Q5+rPk/iCc3cIDpJE9bkzbjdVtsS0C3+d
         ZEi5MwvDAez0iCgdp3bWxGx09UdzNI8gmDAjho2sxfrC+Br3Zg6UIfmzB2QOldFZNlOc
         Q3rivZR4Roh4SbDzqivI9HxGJdpV1mt/cnmcQKAR4TYCQRrLJV3+YjSSEr7dN88M4wnr
         NKHnDvIPAEQVDCaUYNDBfIiEB+gFVBaGOjZyIGxOrmipzM9xgSRAbpsKoZozY8DUNdyZ
         rAMUPcBz4SBa0oBpue2SUCNn28UbrKly+KYi0H2z71+nFz0NYH4BtWoSeW6bWBY27cUy
         e8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920455; x=1755525255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqhbJGyWXO0pDEnjUQmQZz1y0G16+abJkAfpIFUeykg=;
        b=J0x8f1QWrd50VbxcfniES6nSVFBe3oCQ75RwKlwpb7XwUF1PCEvn3e8hpQHyvh+n2K
         IEpB9p9UMAOYfRp+/gPzwkKmlMpp26zN9HBQn8TRpF0Uib1xhbkGwJBhzSL2zk+kjB39
         5G7VkAo1G2IkGcUIzK8jQrLkCWwlAU1w6uCbQ8DdXpVAJWd1y62mwk1lJUjBBFht3kZe
         NomU4WMPnhjOwZOvkjQl9kWczKhgjHn2v7ZnBxuP7ODuPV7Yn1rwVguHvQ1NcBqU3O4T
         S+Tj9DEDGM/+GpmYNS7gvw+gPJAgv1jbwW879CLZCzt0VcZKRcSkcZKCq1lxdyZzugM1
         yanw==
X-Forwarded-Encrypted: i=1; AJvYcCVvw7L8xO4ECi7bzSVFHas09df3EIuzE1O9a8HYAq+xWrEfSkLsTQ8Zxh30m8zFYU/umLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP9SXJ0tcEqwHmDKHT2sIgM9tV/HUQBNHHHlKB5QO7D1gJ1k0u
	b2TzbOi5xHjku+0uprr2gTsX8hsn69LUrq4sMsjcz4y7yzU/2ZheQzxrkL6cR1MIxao=
X-Gm-Gg: ASbGncva1uHeVG0E9HcQSn4c3KmPttlKyWsrX/qfO4Ld7p5gAXgq80fYVRxTw/X8IDz
	y3StsNr+YS6Oc2ZVSvGZkzsLjKts69rc5hiTRNHlJdA1Vq26owbdRUCW/hrnI0V6xjekzjvY5lj
	gQVGjuy90boxpeOKW0D+GbHqMyoCOOY4WGaESZeRqR/s1FdkSh+Mm2IkTdyI7/NHg6X0cwopN8d
	qiU3Z6rOZZGU0I65S066uB8uRBedaKe5l9c3XCrChte0ub22X2lrbKoB7wRCyYrqOFxjSWcXLUY
	GjansV0VsuI8VHIQZyd1pG6odcwyhTLl1etTF0SBSGsz28UF98LOH0hczltXNXg5txQHBLeFEhR
	pXO24mk6WHwbRZREogH4vzpe7EpYB4LmJOpZi8CI=
X-Google-Smtp-Source: AGHT+IE/1LgQrqO5eCCRUgilyifCk6jF84Qp9fDrZOql9XlTeOhTTbm9h/YyeGwJTKKvwOp71PXCZA==
X-Received: by 2002:a17:907:2d93:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-af9deaaef27mr385687866b.3.1754920454644;
        Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 11 Aug 2025 15:54:03 +0200
Subject: [PATCH RESEND 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TwhL9kHuNMw1ekpCMBDV2BMjjP7HjIb5JBPWSmFWyGU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYBFR4XrobLEhq7B1bbNoPCguuPOvtUYVs7T
 QoK2ACsJb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AQAKCRDBN2bmhouD
 1wX9D/0fgTSAEgjcithvcnihEli0+dhJu1IjNs8D4hs34omPoQQtm7fLqC0xRc+ZgX+vvRs/uD2
 WJrb3kblxWU4xiiT2m000ekQdnlQJaQdGA7JPSgu1YHHgsZdPxdPCzmKkJnxWRBqmcpbAybQ5Yy
 aBb+UA7EY96reCOw9mokeqAoqnZ2UldILGg9i7xKZsJLQbKGeofk6QjjMnA1H/o5IKGB5xBG2X+
 g5TmwluhQkVyB3TSat40bnb5Xx97fS1rLdBvp1o895jugOym4riUHY1DdvdxmqbvimR8uLxq6B5
 pdpTg1Qys0jqZAewiH/s/zRgAARR7toakmq2G0iwAmekvGXDKwpcDQdpnKH8azu0whlaUXlL2Dt
 b8PKF3JNOH8d1FteVKbm2Lb0ODRIPukQlCgDCpJ36p5G5qLjsqKAuEFUVlUYo8u+MVwdsYSPtu+
 P+whAhlYtCLDufA9vaHELAT5beRGjxzHJzxGv5kIDu7kXC/gK8kzjkN8GCFzRdAh3zrGqFldfAf
 vauniUM6e8Ta4Kd9uO//LDT+PZ6m4psOUj6cgsQUekspxFkVGOpYhfSExqaC3LrPWJgclAsVIMI
 FwPf7TcgRnrUAZVrOwLY14f5bD/yb01z9NYzpvW9iorDod4J2OjqkHSpwJPkzp1ILLvEX/V1530
 QU/fB9vh8kGxMXw==
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
 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 3c0431c51159e549920b17cf2ddfd1b85ecde810..906735acfbaf94fa08244f771139df207dd6e4da 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -42,7 +42,6 @@ properties:
     description: GPIO attached to the SDB pin.
 
   audio-gain-db:
-    $ref: /schemas/types.yaml#/definitions/uint32
     default: 0
     description: Audio gain selection for external analog modulation input.
     enum: [0, 3, 6, 9, 12, 15, 18, 21]

-- 
2.48.1

