Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D913315D5B0
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 19:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712086563; cv=none; b=lb0hlMJdVp6u5XfFwW4poGH/Ln4p/DRlARrS2z6PFHIl/Hxd7aN5pr00aMMCmFy66Zl7UjUF+PcRYACF3pxgl2cPp7KCki/NJk/Qaeg1+NvWCmi70O4Ts83MzpeCcf4eSr51lUT8Rp/ascDRjcjiWcCLqCXP2+Gj3mf1gNGAbiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712086563; c=relaxed/simple;
	bh=jc7cebTA89vu3ctiegjexYTIxBYLjo1OtZ8qSUvC2Sg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=czOhR0Vor2snU1ToZAtYxKK/+BA2fGsS8IdUxCeM9RRcmZtVudNMRsmfSIYoUok8B4IxFIgpyFJeONpTO41fL0tV4rpCjT0Me39qaMGsfkJsWJm+PLnXVwPqwH4IR8Y14oqP07Apr8dCKLNI9JkIIoEsCwvFQlfItgg/i+ooYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mg+CiMAe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mg+CiMAe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0fa980d55so45068545ad.3
        for <imx@lists.linux.dev>; Tue, 02 Apr 2024 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712086561; x=1712691361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi6o+FdEdaIXxVNO48cVV2DPK9TKjcoqynKwgHQO7GM=;
        b=Mg+CiMAeh22IypBBMzRFRFx+lP1fIM6QE5wRQia05kddHuPdS1QZogRm3ng3Bz/BkG
         MwvWDQCJBTjmNrQoW8zWG89xRwOx9R7I9YMAEVrJsEcgxH/bcxMnf6GFHUytCqd6EyeV
         hdecQ1uC86ylX2aD+ZaaHnastDBmMwrY8NJ4tswYeDHbewEfQLHoBoxq3wHY/VrKM/iL
         lvgzPtGfEbD7YXUNexI2aVzm3cNTdrzFyAdCILaVVlXOOzhzN20NkATAqGTut372GN2y
         Yefc/AE6MLpCTHnwSwgCE8KfjdGs9Ybw0dDHskjKCuXpp57/lF6lPwSr8SdXwo7u1pvW
         H3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712086561; x=1712691361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi6o+FdEdaIXxVNO48cVV2DPK9TKjcoqynKwgHQO7GM=;
        b=FKq04dMZrND/SWcLYqPhw/xdeFqQSO8oezz4e3+poJrSaADMNrTMUkfKRituqT9LFB
         JCEgSHSPZW6aIIntqiGZPl9Ik3r6e6SSU460oR25milDBAdZmGtKwYZNYDeexVHqSs/2
         w7+qyuq87YSLFLeaxeXLRLTAMtUnSc6iMZ+ZYKY5J3V3Y3zGQk/iorxytkozlrGtCcb7
         ROL/ub04JAdNvAl2tQ8mEhNvMCGxwDmSsjm/wDz8bts3i8XPJMUklE6+KbfmHAQM+iRu
         m6R+nqH3McvqBEjVygCqLcKO5WvXr4/3QZ2dz1tsXuMriisiSNxpmTamMXBzNaUgXX2F
         THrg==
X-Forwarded-Encrypted: i=1; AJvYcCW7YiIbUrp5pq0RuFVbqhEW4jGNrxao657ekaiJn1n6TCdiF34dc2A3NKJ3TrFA0G9UHZGjeDXdQCbHgYepntS6QoqM
X-Gm-Message-State: AOJu0Yw2oAEFhLprUboOHyF3ewytiYXCbg4HjHzAEx2l49UQRurJqXM0
	rKwtBrNX0tX15ym83siVzqfLpcdsoSjQ5gLRse6rTRMkXljLqQVt
X-Google-Smtp-Source: AGHT+IE9b9o1NE9CkTOar0PYXIBWXkbziM1GUuV4KDxWrSFl2kVLUyILKpmyGmu4ieeUNnr3lDCuFA==
X-Received: by 2002:a17:903:11cc:b0:1e2:45cb:eb3d with SMTP id q12-20020a17090311cc00b001e245cbeb3dmr745523plh.3.1712086561123;
        Tue, 02 Apr 2024 12:36:01 -0700 (PDT)
Received: from frhdebian.. ([2804:14d:8084:b86e:ac17:f518:b547:13a8])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709026b4600b001dd59b54f9fsm7775841plt.136.2024.04.02.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 12:35:58 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: arm: fsl: remove reduntant toradex,colibri-imx8x
Date: Tue,  2 Apr 2024 16:35:10 -0300
Message-Id: <20240402193512.240417-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240402193512.240417-1-hiagofranco@gmail.com>
References: <20240402193512.240417-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

'toradex,colibri-imx8x' is already present as a constant value for
'i.MX8QP Board with Toradex Colibri iMX8X Modules', so there is no need
to keep it twice as a enum value for 'i.MX8QXP based Boards'.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0027201e19f8..6fdfa10af43c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1218,7 +1218,6 @@ properties:
           - enum:
               - einfochips,imx8qxp-ai_ml  # i.MX8QXP AI_ML Board
               - fsl,imx8qxp-mek           # i.MX8QXP MEK Board
-              - toradex,colibri-imx8x     # Colibri iMX8X Modules
           - const: fsl,imx8qxp
 
       - description: i.MX8DXL based Boards
-- 
2.39.2

