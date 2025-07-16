Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7F2EA72F
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680901; cv=none; b=PX5pt38G9OFCEJ7wxg+LDAJVXsWyiS1F/acad14bdvKRFK6nkjQd7EMeIJJLDo9IOzJWt/Qvg966NtwDn/p/zX9ZYpSFr/lL6naKMLHFf4s/PXbk/qWtceiFckiaVYaZvytAKGYNHqGiJZuXx1Sm79ri4DHp9xqPrFPw+IOBqCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680901; c=relaxed/simple;
	bh=D9hK6aCg1zp32zCrrbFTJLWW5r7AZGwUreSAc0MrHXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O75BpiylaltK6mZGuV4akLSDrRli8eTrMyqIa0RjXRGjb9CNUjwPZksjm97OX4QLY1VJhfpnSxWGQNTKEGpR/zn/jhOCcxJQdQnAqYfRwDLZjSdZ9DTFnec5P4r/35NzsAEseftGRb7Hsy0jrnXl4MMpQJZ25yA6f8STto394UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbDCLLRM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbDCLLRM"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae9be1697easo199908166b.1
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680897; x=1753285697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=CbDCLLRMb3b6veI+ZjYx/TMrBg82ok8Z+8HEt57VRT/5T6IGTFUtFE3HQxSqbjQuLQ
         gyvtqCE7H/urcRPigMygj33NmmpcQEqb6aBMMHXHENT0mCCikl4iGm/e6yqAaQ6CmMZG
         X4/FHWG9CKWDHNM1SjSSv7xfxEb8FSzrdlSbO/a3Rd2GfaQu7qYzo340IG4QDjFnVEq0
         L5UvMj0HZ7rnr6TObJtvALHklOc+h/QScYKuLCJ2IvYvs6QrEmF55caRDUluZ32B+uKx
         6W15+Qg3i6cGCj3dWZ+t4/F8eYODlLa81JuE6yOCUFXc62XBPqeKwcOZxl4/BF0HdWkI
         ms1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680897; x=1753285697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=eTMjXhqjaAnQzprwHuSjy+Eb185Ew8luTPMSoSsSp9652zy6mDE1oiX1/aYthIgQu+
         Lmv9mKXwXSvVeoab4quLbtiZvoNcMz0c+Z2PzjKZp8haSM9hp1r/pFFBosZ+aERjcUEP
         FQVtRiHXHpUUSW35+nphmXYVtNMvjWN8Skp9RWGkY3kv/hgWOikhCeBun5HGeAuFPLeK
         XhCYZo78yOWNAokR6qhNtsnw6iWRSCjqLHmbOA1CMJcGYZqlGH0yTWAcQogj3/3FPQxa
         y9bVKExUHRs1CSaYpNWTO5vS0wbPNXXZOYNOGkHt1Bm2zVyCbIRXHlCj9svPWQ9d42+M
         6YZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUik9MWUIT2pL3IjSp3z1tj4NzZt9MhCXlzvEjDLSOXOT47H4lSIC4tJaebxRO0GxnlMT8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWt5343hL2N13wy/jBwh17Gn5WVPdinMx9nNGIa6w7CJa6gNWn
	cSm/gnB0SgpUseNkOJ88a/q49efieVV/4hI5mVUUlmyfnpwcC4cs+x1f
X-Gm-Gg: ASbGncv7d/OZyX4zfuO2xd0fYOwMZ5TQpGCTAtjgAgWZgy/2fGpmGfQoDGketYSDIj0
	zZX59cdoLwMyFOOnnqK5Ds5KmmhkUsqW4PEIrzCJfHfOStZrNSDw0/jP8WmBOZ5tSp6l5F0B4se
	LR6O4zVb8FwCCIcmKJLYGFPmH4IRQ6kkls9CtNoIQScKgopcE+BEMXmDE2qGu9fqYNGuijslTiG
	OFEKAaC8gHqqPRR4L1ekd3G8563DVrp0DC8b0we6I4WfSABUyAwq9lBgayEWwWJqvZMm3EP+TJ2
	HHgkPptwsDwvbOexz+vT0oVvQhC5R8NRJgLqiHtrZrx5wcigigy1g/1nBZNDEyvAm8ZRzxsbxti
	2JUWTZxul6HSVSaZIWJzNhctQew1rYEXD/MFC
X-Google-Smtp-Source: AGHT+IEtMqgd0cERI8zRb+TGkoaqjZkaTKRBSNcMuZ1lo/YTkdU8esv903psbEZ+S5JSVNmNrcYOCQ==
X-Received: by 2002:a17:907:c88d:b0:ae0:d409:5f19 with SMTP id a640c23a62f3a-aec4cdfd503mr8257666b.2.1752680896987;
        Wed, 16 Jul 2025 08:48:16 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293fe7sm1196705266b.123.2025.07.16.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:48:16 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Wed, 16 Jul 2025 17:48:05 +0200
Message-ID: <20250716154808.335138-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716154808.335138-1-goran.radni@gmail.com>
References: <20250716154808.335138-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..9cf2ab3b12db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
-- 
2.43.0

