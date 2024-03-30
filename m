Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8B22F19
	for <imx@lists.linux.dev>; Sat, 30 Mar 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711805668; cv=none; b=V7ggDft7I9fw2nKZ5F0kRh34UuKi/wTQ8J4rZm2p1Q4e5sL/WVcylerdSd4Z46IuC6y5R1BZ/B4mFAagPcgfOvJJv9rykwnuO4CvAu9n6sytl+cn7c1y/w736lrezYHqIuxc9thbwIs2hrc6vHrYQfiDmaIYYL14TTgUpXz7/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711805668; c=relaxed/simple;
	bh=oXYRNgJdWbjdepWwOY/KvRs0KAk3andYOyVJDfzA6rA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RcS05dJXKvFNfdwtoHP+tGBRIr8ClptIAjBD9OOpWMkgiiFKNKL5OS25dC3SqEnbIgof9fdC1xOZN22UsHMJZ67WRsE9eBINdzAeL3jM93hucr/zLWY9kthui2GqFsTOwXSjdkbB7SrJBta2jjuF06QMBfJnW8rgZrEUSlMtF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4y3K9n+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4y3K9n+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4154d24cc77so10533805e9.3
        for <imx@lists.linux.dev>; Sat, 30 Mar 2024 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711805665; x=1712410465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rymSuP0sS0VsQ6tf1rW9MJE5OL/RKLdSb3bB5F/aqEw=;
        b=Y4y3K9n+WdlEYE7IjWYDZD1oZBjba6r2bADl4CwUMEEo6FReIQUaKa9+IH3tO7me6H
         MoaLHxlUj5imLP5wRUiF0H6N+RwAmnTUoOlUNOz5iy9lUvuU5+Z7QrQ9nC1NOCWXaT3G
         450025CyaXfwQYvqQ6tpvpuu9sa712vgh8IRO325eD1m54k7l4Zsm17orZU6RK2gyB/J
         LgOv+i7cJfgD/Tcs9hrTsy8GYg1Yaw8Jdwou2/Apy9CDJGwrWCgK8orS+JH5umkS5GRR
         hm1XJGhhxp6QgZROJPiO+Feb84INFGK6Bmfh0xQ5lWlIqQH/Ycqz2eOErOenS7T7wM1O
         2MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711805665; x=1712410465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rymSuP0sS0VsQ6tf1rW9MJE5OL/RKLdSb3bB5F/aqEw=;
        b=gCtOkjmWio+AQT3/BbOka1N2li+BGV4RDQi4vZVgL1kR1ID8VABuF5wZwhgb2nebWG
         TdJqRg4VFxJ+njuNrJVp35JYG1CbJRsLUd9u3S5UxV3tDyMF6EbK2oz3tMMSy/LnqhNk
         0+A/g+gWdwW6/j7IFtgdAldzyX0aWa37llUvk7RrKXc/TbErfPLiywUSmaByucl0btal
         TneWQeGdSV2xAQa1DItlFZclrgSzEyeOC0ePPO8eDdq1QorJ6Juv/OyHioWTB7svzLTq
         nhJPJi8KHAyGglnOvRUzDbuPhx545ggmOdTQm0XOLx75XuC1XmkIWDcmHzymisvFGpfp
         zAcg==
X-Forwarded-Encrypted: i=1; AJvYcCWiMtjhDbPAgoYxulR1uc39MJ7vbT0wy7Ljz1LjbrnYBfbqw8tkbzWPioQ+Xm6LkfMQFrVcpuMAxpme0fMd+yT8PTp3
X-Gm-Message-State: AOJu0YxiHhnnTBSSP+G8uvBDRVbSoosw97XNyGQTA2o31hA1Eocw2fSh
	9Sf6mkdLXu2c6FwELhJ1KuVSdu0GtESXcKLRslOR9jopDs+guoZl
X-Google-Smtp-Source: AGHT+IH/1wUccWdZ+DMlCtESPEkHwH88ePvv0ej6zdewXAdqnjnXpdf+0VZv9IAKFLfQ1mS9Gz6jgw==
X-Received: by 2002:a05:6000:1863:b0:343:3a4b:41ee with SMTP id d3-20020a056000186300b003433a4b41eemr4744206wri.23.1711805665179;
        Sat, 30 Mar 2024 06:34:25 -0700 (PDT)
Received: from gilles-Precision-3571.lan ([2605:59c8:6662:b310:962a:f8cf:49d0:f63e])
        by smtp.gmail.com with ESMTPSA id dw11-20020a0560000dcb00b00341c7129e28sm6454869wrb.91.2024.03.30.06.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 06:34:24 -0700 (PDT)
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
Subject: [PATCH v2 2/3] dt-bindings: arm: Add Emcraft Systems i.MX8M Plus NavQ+ Kit
Date: Sat, 30 Mar 2024 09:34:09 -0400
Message-Id: <20240330133410.41408-3-gilles.talis@gmail.com>
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

Add DT compatible string for Emcraft NavQ+ kit based on
the i.MX8M Plus SoC from NXP

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0027201e19f8..cec1b31d0792 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1050,6 +1050,7 @@ properties:
           - enum:
               - beacon,imx8mp-beacon-kit  # i.MX8MP Beacon Development Kit
               - dmo,imx8mp-data-modul-edm-sbc # i.MX8MP eDM SBC
+              - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
-- 
2.39.2

