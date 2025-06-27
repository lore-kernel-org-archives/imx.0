Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321C22F14D
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011324; cv=none; b=bJELQemviFonMDQsW0lbV8Uwt+AW0J3+GpYuclNxK98Qbadg/yXO5HmElSEWjcgp41hSjCjINUG/uzGgsQKRpAxZ50ofgO9Tn48igGgiSpd63VhTZULeaj2SKQiZ+5xzZewLKmxjTBxa065pIYzoBbDqjeHC0Y47x5SrEba+wME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011324; c=relaxed/simple;
	bh=PwmTdHsj4/TIhdqdhH2xWAIrULM+XVHbnLKlVFqmrQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lj1qTmK+n9thJHLVxvlToiUpdut1nnGqzyfZ0ktm9LNSnNDphzoEGqg2j0SCbUbomJPjf82wt8FltqAmZuFMzOD76X+rbwP8Li7y667Oml+NRLPtttDI2l3qniNe7MBvvnc3IMq4XgHKSZWMaPow/YBopMiCDOXloKBkn/LQgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AtoDxvaS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AtoDxvaS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so261731f8f.3
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011321; x=1751616121; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYKyHT6aO5DOvkeXEodSr/zn4tG0sPpdUKZb0fO86vs=;
        b=AtoDxvaSkEERX9znj2MbTxSvo1CO4GJHQPTZ9E2OMHvxosOOYMHmP2wyn9WsYRuWbP
         eWUtVWJPgDwrQ2J0QRQSPtvWx9FqcIVNa4ACj5LujItJQ6A6smRVInxgzlUf8vjAXrF4
         1S+Dk9DMUON+X41HepGaZ/iVLvbYhHW4pUYfvI7wN4NRI53Dqd76ZKbqBXkvJUlBDqTv
         QGuUv7W3jRGqeUVNUKIchEwZswTi33OxQbQTD14xR4GD55AahBKvCODaC6ls0xKKuERY
         dIud/0hiEBq/D4xsH+gyfIJ3Xx55b3nbLDSjJx03pWVyOszJyPBwdZxt0WLTYAC0uONT
         WXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011321; x=1751616121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYKyHT6aO5DOvkeXEodSr/zn4tG0sPpdUKZb0fO86vs=;
        b=Rl/e3cnGuUL0MQdybvOBJJbQyy00OsGfJjepcJLRKdSIU3Np7ie9r99aVs9fePKhl4
         NXLf4HgSHpeBjDjiKPk6TlLT1oKxyTnuWwvF8ZK70o3xQK7xlUnlFfAbUPi3czm3Oqi+
         lEGHEOzmQYoNiXjxkSsnHNRY4pxv1PqAbKHI07LuuDYsSaW341rHcwcVVhFrTMC39hwB
         K4IvTygJslWVu1/3yae4EFJOGqXprTMQ2JL/4nXeLYXo7dWm2Lgt8PCfy2MGk5MbKNPe
         A7bnleW9Pr1PFnvnVBiSVRvPZNw6SJHEdi43gu7xqgYWGgshfBy9U7tSXamx3KW8T87c
         F6oA==
X-Forwarded-Encrypted: i=1; AJvYcCV2/+KXUkZbQnKh+NBRQcmnXw/dvzO22IMqcTdKIsqcME3o6gwqwc2NI85pfNVsoVXX3XE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrn/Ku+LFRkG6HppK2NPd1Ks1QXL+tMCshHV8lfQ8hvnyrh/b8
	D1IWuZrzGK8kQjh14+bSQiR99xsFCU6oVP9eF4KNjAMrMv2Ok1dDBZJHXMjpikxrMvk=
X-Gm-Gg: ASbGncvok3VLCzpHN8e50cg9BYezah2niJugynJn9EYm2pGeuKGuw1unTooN32zJg/v
	WAxHoLIKDaXAcIhM1xlMeQGa1Skgt/o6VlJcOj4PqOkZIPZLd5U5QWb4U07ZUpictM1fQ2L0RbM
	CFt3VeP+jJ/ADBYohgWtFEvEYx5cNvlGw4UUWtZuJRpVc2etJosZQM6J+nSz0dKVlabRTHsh2XL
	JE/94fSHUCij95AEcFhLa9DXM122gPGRO6y5Ylo9kInY+K9kgx8KGATbDSNbCGZiDKj57o3Uu38
	Dj2wGrP3Tr2AGo1sgwEQM9WA22GxpzC/4g1bStdQMpSiVhSMj5oPROkrrf5uKDiuQx+jtzAYn/U
	F
X-Google-Smtp-Source: AGHT+IGbEV2sUnNrxRFYjuNrRGMB7WXW//KusOejXZ3SR2Oskrso+cf6bF7nRXl/S837W13BPpM60A==
X-Received: by 2002:a05:600c:358d:b0:453:8c5:95d3 with SMTP id 5b1f17b1804b1-4538ee5d303mr8805925e9.7.1751011320856;
        Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 27 Jun 2025 10:01:51 +0200
Subject: [PATCH 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix
 duplicating dtschema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PwmTdHsj4/TIhdqdhH2xWAIrULM+XVHbnLKlVFqmrQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/zDffaVv55xO33AhhgMDKyChlptnb0LKWur
 /dA0UkREASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P8wAKCRDBN2bmhouD
 1yO3D/wMQLq1PsZux5RgQ00wXyiyyHfReZ+crthyF6UOADtqrkzEfMMHGxklbh8VFbm4OwQmyVd
 gQCQmXR3RSty42vCDsZK235jY80s6ogQudAcA7sudV9l03aos+6xp7c/FASx8Ziko10NlvSgyIE
 pfX4xD7FqMA//3i5ze18WV1q69K3iCcXy25FYV7bWbJJl1eHBBikOphoDL4HAeSMjG3U0GJ/MCh
 eyqUfl6OuiP2DJId69jXKDhc7OHJt8BGTBlh3KIoGc/3MF1ufLTnUc0cISc9cX7jk6aBSKBXZEl
 +U5JHKpIhuSPNZ4utuTREOV3BUO37GgGhdUnS6jOeLgePHd++txihWJ6zePHEzwGqkC7A7s2BeU
 +y7SXiwWPY45eVNiF5m4FlVdiA7GKi3KnaSu4BGwAg3vqaxS1ykJmQzjCHMmbwQK52sSFzlbnSW
 WPW9Qas3JC74gC623P192CvfOVPvyYv46Ul6REyHemhEo5eg7AduALAPCadm5Bk32gzTgGeOnKG
 uzNXOGn/N+8WVXWWKPBaxl1YaQeOAjaAWdAJ5M6f2iftZWDwXqbRpFmQx+EZXkzUEKWNSR9CVX9
 9P+fR7ARSG9kkSXJPCBWQec9OM4CShzGn9tpkRr7dESn6Gtteg9gCombIJ0NNhiw0s7muTsiNMC
 /rzMX3sNs4DelnA==
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
2.43.0

