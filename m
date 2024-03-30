Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BAE14A96
	for <imx@lists.linux.dev>; Sat, 30 Mar 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711805665; cv=none; b=k90DfTVi5RTWjtOm6/LiQYp08DaaAn2ZV3km4iwojzMSZ1tg/5SgX0jwUyOvC+dxx4Z0H7cgUFmh1E29s/lTU+vuMcitzzHcaAK75T8RhJprk40xsmZktrQegPXW50SzXoGkRf0D9ey/0W9Wj4zC4ocu1u41fi3eWKHydB2J47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711805665; c=relaxed/simple;
	bh=LGw6kak4lZFihhndUY61EFLYz8x56qhQ5QE0nUpuhjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hMaCjNNXH8XMFcf1JvwX560bvGLLuccyjZrYYFKsT6ypTvdP/aPE7tsw7brl9lwwnm3H8MAa48U7X/ygPhgMIruBx+YdT/B53mUNQBH6Bd/hdVhOnlf/gvWiVQpf5I/577vBA7tLrp2HleFuLhwCMjGU0iEV74MLtfC4zPhN+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aupcDnp9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aupcDnp9"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so2382612f8f.0
        for <imx@lists.linux.dev>; Sat, 30 Mar 2024 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711805662; x=1712410462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwVvoPowNn0OI3aCiowgffdI708sY5tNSiLWt+MX6xI=;
        b=aupcDnp9kfpwuJGJ04riaWO02aOuJH55ofguz2oz6l7IESEUVzFeLD3StCwIo9lIWS
         sXT2Hwmw5SRIlJW0jjEn70zjTtgMmgiy/ivt7OpVnQEEGkXUPDvYmeUM+6/NCTBB9mRH
         nsEEK0BT5ZmMq9XpdopAiY90s/dO2DXO3o2TTEu48Ys+UXFoF+cmz2AYGcmvsSlCKwaG
         ahI+AkA/pByCTYyINymwZSSrewGAEDkHrfbiDnkDs2k6F+LVL+K7nj+76yGbAKjiE3Zc
         jWguz/SuZi/GnTFc0MFGqvftcX8mgNJJ+cC+8lwheGn1L84GCj+djYSCYvKAczSz30I5
         M8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711805662; x=1712410462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwVvoPowNn0OI3aCiowgffdI708sY5tNSiLWt+MX6xI=;
        b=pNBFPV4hjG6/+ZwmdqraRFy+ou8nD2aGyddGnobNqjp7PsiDTPs128VGka0SgmesAB
         fugGAwbBoXilVWWSQjHZpU6XFAho3ozTGFeQ7Bk+N/rwHktFfudpOfqUzycmDQj7yC2Q
         v7TgFGdjp+JwDyFavk/WdES+wPqJWTgnF29uXW18CAzO4syHPFo+BVfERZ9bqZ7qodry
         gI6wwFkpSZWaYpH+s6fALLt9qB+1KYEZ95TWSUtLsFx7hvRcO3BXVP/6O0zeP3R7DFdz
         32AHUiGH/Espb3tLCqHS0WrVdR2GPwUBfGiM3W0UFxKfWsS51LaLv5Tz+OnOeF9sJuMy
         16SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvBONoF6PucLYmX6xD3MVIc8/FnNb6rOVhMWWrt6NdhPxwvzGsS5ONl6U/8ebhvITAzFhkgMlQDa1vZU7jKj6NmceK
X-Gm-Message-State: AOJu0Yyv3oUkQoONtbCDYBABr05D9pknf2yK1ci5Jkgd6/QWfkoiHats
	DKJBto+p6xlB+TQ3baDFbZNOM+gz2VpPAJVD607GcptfiwChDQJ628mF0Aj2FdzIlA==
X-Google-Smtp-Source: AGHT+IHh9DQvqoy8Dp3di8r3TZhfjeHHkmjziX1hFRPX9T94+4F4w2FRwgmkStv6sOb068nXquIpew==
X-Received: by 2002:adf:cc92:0:b0:341:8a0a:a354 with SMTP id p18-20020adfcc92000000b003418a0aa354mr3626691wrj.5.1711805662301;
        Sat, 30 Mar 2024 06:34:22 -0700 (PDT)
Received: from gilles-Precision-3571.lan ([2605:59c8:6662:b310:962a:f8cf:49d0:f63e])
        by smtp.gmail.com with ESMTPSA id dw11-20020a0560000dcb00b00341c7129e28sm6454869wrb.91.2024.03.30.06.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 06:34:22 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	shawnguo@kernel.org,
	festevam@gmail.com,
	alex@voxelbotics.com,
	andrew@lunn.ch,
	Gilles Talis <gilles.talis@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Emcraft Systems
Date: Sat, 30 Mar 2024 09:34:08 -0400
Message-Id: <20240330133410.41408-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240330133410.41408-1-gilles.talis@gmail.com>
References: <20240330133410.41408-1-gilles.talis@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for Emcraft Systems (https://www.emcraft.com/)

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b97d298b3eb6..8b978c6f1dfd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -438,6 +438,8 @@ patternProperties:
     description: Dongguan EmbedFire Electronic Technology Co., Ltd.
   "^embest,.*":
     description: Shenzhen Embest Technology Co., Ltd.
+  "^emcraft,.*":
+    description: Emcraft Systems
   "^emlid,.*":
     description: Emlid, Ltd.
   "^emmicro,.*":
-- 
2.39.2

