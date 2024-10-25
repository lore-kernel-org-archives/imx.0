Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D156AAD
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 00:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729816934; cv=none; b=Rp2IyDz1htyDdl5rO+B9vfNazRKI9FHYh17oJzOd8mLTQY2br4GEU41gtQJ0yIgWFMPdMsutROVmm3vMgQwf2qzibRbYRL6DHZoYcwSUGkbBBGocqX6UUu68v+HTudfZTU3cvveRC8o4xTLYVVR9MYZ70U530xpkon9haJ8B/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729816934; c=relaxed/simple;
	bh=A0i/BPTOJCM56lujfQVhp0IouM3vgbmKHXveMTbOcQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B+/VDcg7iewNC2VUbAPimKuQoK0v4k/3q+fsipRrTxhbIJxnJekBd3cz+XxIWTnkGcfx9OtnVeOqzpc/s4uqN806AABADjh1wz7xdGhJrJ/2SK7QEs0+I4Q/ZfXBPH/0miMJP6bDDDCygjDllJrEmuieyrm9YlQkHcPTEzJKNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJdQEvI5; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJdQEvI5"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e5fb8a4e53so847425b6e.1
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 17:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729816931; x=1730421731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3glZN7tdnxqEr7AALFevER6kTHzPF//GTHKC2fD5T4=;
        b=QJdQEvI5UjW1saWEw+srMrSD1F0FKbiughpTgCa6XUkpBG1VRJbD7Qe7fjkZeyuPtw
         BN6UB9DNGnjH1xLVVzd8ADuGNrB27+G4BIIi/8DZvuLG3dDR6zG3cdRHtJpe/ryDyogJ
         cqvLc0OTxRUD5c9C6UJUroYuZol7+96Ih8bWOgLPr7/bPwgpakAdFqRYX/YWyVncMaPv
         wAU2w35zpgpqjqPBH05zVM4GPHEpHQSH3U0GNforOfsZaBuFekNLdcFYpuXPqDL//IXT
         WFirqgg/VsiiLD6PqAlnifiDAZvg76qB0xTUnGJlVuc4NTUSV/y/BNSD3sHxZAQYQemT
         /afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729816931; x=1730421731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3glZN7tdnxqEr7AALFevER6kTHzPF//GTHKC2fD5T4=;
        b=w5+zThCOwlvzWa2fbdKGrxvj0DxMbCka6msjT3nv1k8ngPG4gOCMIPStUBZ+jkShWl
         PWux4rdifRIbma1TtGnz80hhc+A6MdDRH68GD/7jgzBQu3h0FWt4IeWQBdxy7cQc3OmX
         lBsaZ7y9KQ1aiQbykun2Ksicu2pTd+nFKilTkyondaDu48ciOoQJZVJMKuJnHnHh+72z
         S/QycTlPJthNuqOXClocc89vKec2HfjuaGN4m18vX69udzubRnXoBdkgCKaMhytAd+h2
         BAO2ksOjRX7attbcbFm2HMXB1puRIp/erzqR9G3j+gFCGYishok+LkynDU/uVnsDZaRZ
         gTIg==
X-Forwarded-Encrypted: i=1; AJvYcCU5khhYAkMDH3XQcuhAL3gFZ3mXkGnCIAnCMjUCyBtsfxNXvav/ambb6Es4h1d9xsjDB58=@lists.linux.dev
X-Gm-Message-State: AOJu0YzY14IOMtquV/pndm4r6/oezNuUDQ9o3sArGlM0aacuMgZRzmVe
	4D6j73sXOhIAjNqSDN5UQ61lBDsadg+yvdAaPUKITTgaP2PT7JJ04SHoug==
X-Google-Smtp-Source: AGHT+IH/yxaa5bTSEO6mVFg+zirKexUg+7iL8/DIbuhJOrW61wjJMRXPmsWuAZESLfEU0XQz2w5jgw==
X-Received: by 2002:a05:6808:200b:b0:3e2:a1fe:f0c6 with SMTP id 5614622812f47-3e62450114amr7198590b6e.6.1729816931078;
        Thu, 24 Oct 2024 17:42:11 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a3d2easm27289a12.85.2024.10.24.17.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:42:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] dt-bindings: soc: imx: fsl,imx-anatop: Add additional regulators
Date: Thu, 24 Oct 2024 21:41:59 -0300
Message-Id: <20241025004159.1571782-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025004159.1571782-1-festevam@gmail.com>
References: <20241025004159.1571782-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

i.MX7 has the following anatop regulators: vdd1p0d and vdd1p2.

i.MX6SX has the following anatop regulators: vddpcie.

Add them to the allowed patternProperties.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
index ae708a658d52..f40c157908aa 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
@@ -44,7 +44,7 @@ properties:
     $ref: /schemas/thermal/imx-thermal.yaml
 
 patternProperties:
-  "regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$":
+  "regulator-((1p1)|(2p5)|(3p0)|(vdd1p0d)|(vdd1p2)|(vddcore)|(vddpcie)|(vddpu)|(vddsoc))$":
     type: object
     unevaluatedProperties: false
     $ref: /schemas/regulator/anatop-regulator.yaml
-- 
2.34.1

