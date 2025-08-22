Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DEB28AB1E
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864187; cv=none; b=A4J4GSNgtDvXbenydUtcizB2ljplv9q3oO65OUpt4DldsTCLBvyqG3nyjLS3yJvSzNO6tpa82izsjsC7/S9mvGYliDig8EbcdRWf1ftig0jJt4qHAlCg+RzY5NGX9L1awtZlwVLnYavtJUEnrjtYBSKUasqijyMqc9MfuhrU7Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864187; c=relaxed/simple;
	bh=BmyHnrRKvQpFyD/wXq4HnC2cRmGY7HJI1ForB/PRxpM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EUKKQ7GPK3WMbc7BlVVDQ2r3tYCqee2O2/bxvHDeKOAgSH/V2D72N02IwrHoBY6b1tQPgRh1/urHc9XFjSeW5YRRXtowN/1CXxZxkLcDLVQVCWifWYPRzVzSAGB3jfWiKIxKcSAUalT+rVbR+5guJ20uSUMD3foq4ENseM2Wy5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIdBP2hL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIdBP2hL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24458194d83so17189545ad.2
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755864185; x=1756468985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmR/EC3Cn8L6cUNQYNHnPUar2XNgRmm87IeGx/J4wBo=;
        b=VIdBP2hLmmE0WwFNmbpNkJflwvlOatqkRgp6Lsz7oWl4XPiCaDicT3GGPSQ8/AEdan
         XxhE9e7AUi3wRKO0Gn2UXJvWY0MbEDOkQLVxRyPoC0E0OWK6WspOgqilZbXVHJA1kALt
         Nf8VQqHAZrJcr/nqQ9WucNQScw1ZCDeM+eWRlVJsxLYlSSnjY0jS0gbnnbs7jWN2Mks3
         y9DUNCuuNHu3eOOcgqXBZj2vfvgZDFlJHkZDVSqNiSo3grBaoVGelQ9Q5YhRyiKO4Gvx
         meDAPoWTnl9GkACFZIE/w9DGhhjX08/JG9Ta5+Hwi7pjjsH1f+SXHf/l6d/ihCGkXJcy
         Ht2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864185; x=1756468985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmR/EC3Cn8L6cUNQYNHnPUar2XNgRmm87IeGx/J4wBo=;
        b=vb+UV0/wFXYHiBDSycvj09zb4eRRmKdVXTBNQX4H33FVPY8yUYoM8wTeqp9VpK+XRw
         gz3k4e4R29LKozRBLjzPH4KSTT4V056q3PzYMbXGvhKQBoUzqxybBw3owpwnpBLvaZ38
         Ep3IQY0rgrH7EBgoq8+3rETYwS4sdwv/JzeRhiqDv2iulq7zlRySWI1ZovimBjihLTzZ
         G3lARtuQTXv4iwml2ESaR7lx5+J6++sWTOPEoZEJYpeQ+Bucywf5MRx+8dGbpgbNWOZ+
         i7pu8RNg4MghT176WIAaakHBtTY85L7/RyifJaAidciprmIEGfCulZbTo2C87ZOBGgIS
         xabw==
X-Forwarded-Encrypted: i=1; AJvYcCXI7usgOOseEMaJdhxz3KqMgQb/LSFYNdT+LD1m96cwhHfy/LMyWRLqtQkDt4rfDWLabxc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFuekYzF3WtFe/kqW2yZ3N2pIPqqxq10F3aPxkbreTACydZ4st
	RTwxA8RTdRDgPJsKyJ1YU3W8Kr1EwdoTM5Za5P2tZaB44q+uDMfB1LYO
X-Gm-Gg: ASbGncv19hFSJ9D/MnwfIaB29Yrb+usO+9EjifB7xv65rE3ZqD8BpyNbkPBQ/pfwCgc
	aFrW3d/4ZQJhYNu9qXMUyAMxWwfFhk8JF8fXc8fLexXbN+NbDcJ7Ld5RcSgQ7jl8ppsVzD2LjuW
	1hkGP9Qe1h9eoKLK7ZFrFAaafvTYowv/6Ljc+nt6R2P3dsNHlFSv7TLu/eB4znKHGLAhPPEKdlu
	/tA1iePZU+ac1Fvlpc+McdPFKzcAvWYzk3dM05F0EDw80Dv6+FdWAEh9Y1Do9LCaMEPKQZtHpr3
	i7YuWCs5sqxKzIfD6iwbcWFkh8/zDz6tS74AbsBkLBREMry/X+ddVJq00u1e9SH9pgp8VpmiKyV
	xpUxgdOsoQZ44XimTZ3qW+4mTRfvUB3MvLcYN
X-Google-Smtp-Source: AGHT+IH47oNxHNWHiA/QQLdgkhelXlu1aLYuXEzULXVeFtTkiDXrRFNb7+py3C3th4KEJf8Mhluf9Q==
X-Received: by 2002:a17:902:d54a:b0:240:50ef:2ed8 with SMTP id d9443c01a7336-2462ee38fbamr40886895ad.21.1755864185349;
        Fri, 22 Aug 2025 05:03:05 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5ae1:41a6:4f22:1c64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2463604af22sm20501085ad.37.2025.08.22.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:03:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53
Date: Fri, 22 Aug 2025 09:02:41 -0300
Message-Id: <20250822120241.26419-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx53.dtsi has the following compatible entry:

compatible = "fsl,imx53-iomuxc-gpr", "syscon";

Document the "fsl,imx53-iomuxc-gpr" entry to fix the following
dt-schema warning:

failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
index 8451cb4dd87c..b77ce8c6a935 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
@@ -38,6 +38,7 @@ properties:
           - const: simple-mfd
       - items:
           - enum:
+              - fsl,imx53-iomuxc-gpr
               - fsl,imx8mm-iomuxc-gpr
               - fsl,imx8mn-iomuxc-gpr
               - fsl,imx8mp-iomuxc-gpr
-- 
2.34.1

