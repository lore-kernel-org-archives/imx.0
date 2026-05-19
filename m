Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819DF38F244
	for <imx@lists.linux.dev>; Tue, 19 May 2026 06:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171430; cv=none; b=Kku5tcyolj7AW5cIgOX/NW8zyYC+Lg+ceUw4MhiB4F7Ox79uXS4Zzw00ceCJ/GhcN4aTR0OA5n8NPy3wdbbZ250Vbw1eOpc7BOQKmclGb4Ce4GCcwdO6crbf3ubPj6pmJ3Lfcw/cB9r396dtfw7x03fxXuqoa/B/yyZLOOqGz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171430; c=relaxed/simple;
	bh=0zC6ZGIXjHpNBB1sjVLcQWNAen7uiFJc2m3aj6/r9EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mILxxpHHUU2X001OiEwp3Plqnw0CwXSTz4gwE7SfsXLZmPDt3hosFegw87pLot3+RI53SiT2MDz+MsEpFbK4qkjgoVtdJlHplK5E/h9dq76hWyjloPkbMKHEgaTJroy9HIOXl1AGNO42ajGoKKggSescQtUi77FCIZVgoKpt40A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJBaFITW; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJBaFITW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82748257f5fso2587824b3a.1
        for <imx@lists.linux.dev>; Mon, 18 May 2026 23:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171429; x=1779776229; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaFowDnArVikkzYWN4H3NcIqxYWPeQu705hcoouYIWU=;
        b=TJBaFITWj9AHqJc5nU5dQJSLXZ6g1DY0lgbwuRlOWWbBGAZF0BiacOh8HAL7SIeOF6
         MeLaXlHGYuTBphwWJhyP13VlDb7D/jtUIiq/ZfR0UBo/djuuqbDAlvmw+crQyj0avQfc
         HSEd5SF6/2w+CKkxIWZK5enDojxpSntH0tW6wQ4ccXD/fz8jWSYS+8M1ki1qIfiJG1dD
         1rduMP1J9YY0tTlgNr3UwSlSoDL95OYd8x87ZL6w+eqx04FgzI61wB6R4KZT5Mqf/Zux
         zFHCzB0/FrFO8Oung5nqH67PZt3IpRWjG1adAQBc7M1llrkU8/ACU8Yl7xGRW9kzZNY2
         WMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171429; x=1779776229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RaFowDnArVikkzYWN4H3NcIqxYWPeQu705hcoouYIWU=;
        b=m5Has8f9N+bY01vM2nvpr5NL1ceqk/G3T3XMFOtTsBC0n+YbJKHzqxHx4SvsyPhZLc
         OBAMM3geAn7c0tJsj8DFu0SZ+XcmCDxdObgearUPWTaAbJc4AkJVAa5uuFqIg/eFhNF4
         Pj96NYJhXlexfmEhjKcgLClgk77OsBTTi20rHowo84D7Xp+JszJYSoRzpYPyPpbfnv73
         Em1Otrb3Eubs1QKbKd71TcmwI25jMC1wol86V1W7gou/qklFuuEi4ZjZ+/r+seV0zF4Z
         jXH1XrOGBAp7hafxpeuNYEDCBbqCE9XoMS/bCthgtvoBRgjrHGk6ANgdckfd7JCOzu+v
         8EVg==
X-Forwarded-Encrypted: i=1; AFNElJ9wtvQDf+IQt8fbxiL2N+bv+ldSGCH2NpxYjbPQM0YN/AXluA5s/zL8nAeDVEZwSGUsIts=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwBNJrhgsG62ul1mjXwGsnLmWgVPD0S2m1d7rDCUFED8TaIXSO
	MvCnm2py3qM6SUbeN3yN1WtVuH/o6tn8RU9Uv4d/mfW/fR5/x3epEm44
X-Gm-Gg: Acq92OGary3IJ+J6L4bLBzxp2xYuMLjX5WsGeT/15U5rJly7EQ20AOpgYf2WyQu72Zy
	rOhdRORXnv2agy6WjDPrDFtcnZCYrKMIWNevYTCLR19kIsdPeHGtCX6TlgNyEPwBoHSkp9vkmw3
	VomWZSo08OFL38cAWW1YEpd4ILFKqvF9vLCgXdHpy6ZhuXnxGGLF0JRJL4/JKgdEejwCMqyRA4s
	AyjV3FMmj+xRBoLUQXqVI8jjIMPMEKOXZCZf/0yOUupxREKJAkAT5JiXXD2Axey4mGfqe/LGPoy
	OkePjqmS2CStOB/pBVdIiBEjTWDQglW/y1B7yD6Q3La6khLZI4DVu6tKUz2Dw0QBsw04CZE2qJN
	haRraZ+v/LeSAR2c15oRaVjNPTSg9aZtAEhP1bvjwPyS4B+C9kDewuzEKg/UftGLjOSwBz1TGgy
	qA/ULSiPeG+xJn5vM86GwCe+czW6x0qDyETyWvDYYC
X-Received: by 2002:a05:6a00:6991:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-83f18ec2936mr13806616b3a.27.1779171428741;
        Mon, 18 May 2026 23:17:08 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:08 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Tue, 19 May 2026 14:15:55 +0800
Subject: [PATCH 1/3] spi: dt-bindings: fsl-qspi: support SpacemiT K3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-1-c32afeeaf741@gmail.com>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=0zC6ZGIXjHpNBB1sjVLcQWNAen7uiFJc2m3aj6/r9EA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABUc2W1VixzhH7hLpeaG6o8XOTrKg9U9NOHm
 OXvYAI/y7iJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAVAAKCRDN9pw2gLgN
 2KphEACkcxli9ExmjJegRfI1bpvaXx+M8VAeND8lil9wDppDx6p+6FMOJZ9viYEPB0O0AkvkSyX
 Jig2zs5o8ncO/ccDhStDnS58EhQv+XRj3Tq/Zw08yH6BliD0E7JHdq8gXdDYR5N4wLYttZASKps
 OjqlJujIacLz3vS8ifWe0PZ3MBJ6R++kW7Kmz2D0GsxNGLaDFCCARbTIMK3it2fLrSAN2VlRBGP
 +aKHtkaQGVojtTEhYbidPNCg6TPmxLwe7l0G4u2aDBHvDg6TFKrMTKqeVZDNhVlh4oZT2qe096J
 qRVdbTuHvIoyHKvI5MxvDjz/Fppzyz5a7QwW+CUc71fZG/AWSafSiVbTpDzgacMuyGB8m7gw307
 Bb6I6eWd6aUW4GY+qIveZXZdKjTeOB1NbXVtoOTI89caH+fqU0P/3mgaIxPVJ85tW1fHU/AoU81
 k2yHqhTLzmPnriSXaRgzsO+vpXB+2/QuozX49/1tPQFXnFOADETQq4S5Quq0Cb61ukIW1KTsEKc
 SgRAWcM3YoKlfxFR1MpgarWEVJ4shSulpU0iD9bpyUVDivRvhONeJqXFamqTs0nnIY1l8lhLSnz
 bIbHQxlv3Po94qYM8c7E5M9JQwiuCOSiD1VdMtDm/i4PD2ODh16w+RfCpyENNiS4aJgBX+MbkEc
 J73oCNQLhERTs5w==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

Add the SpacemiT K3 QSPI compatible to the fsl-qspi binding.

K3 has its own SoC integration, so board DTs should describe it
with a K3-specific compatible instead of reusing the K1 string.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 1d10cfbad86c..025f10ed242c 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -20,6 +20,7 @@ properties:
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
           - spacemit,k1-qspi
+          - spacemit,k3-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
@@ -72,7 +73,9 @@ allOf:
         compatible:
           not:
             contains:
-              const: spacemit,k1-qspi
+              enum:
+                - spacemit,k1-qspi
+                - spacemit,k3-qspi
     then:
       properties:
         resets: false

-- 
2.53.0

