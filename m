Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A2012BEBB
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 23:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727306465; cv=none; b=QD94rVCBBqxPk/k0ScNHpVaJROtpr2mQoAAPcDadszcxYWdkiI20LfJGSTIdmrR5FPqHeTJw55XI5iGC7dlulqop5YHkAwQsDlNx62C5T6JimBBt9Xs3Fgsd7aaSW1Mpa3ljovtdVpwNsbL4i8rpNDUj2/mFNCJzW1dCv0E83ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727306465; c=relaxed/simple;
	bh=m9vxbgSDXad9jA/1Dh0S14qqS2tOjY6TzVftilcJjjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OPMD90c/mSoA9B7KXWmICNOSyphDVX5C+yzbAYjIHL2QmaLfPUxrXBZ+xK/LuOTcGqOy1lXGE6pidYxn47BrVY49aymJrDE9P06N/yAUl8zwF2heNm8wHYa9SK4PgWTYTE4fvet/Cl/WWFPq8CVCyXuTmxefTSHjMgP9DGjxnM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I84oHCV0; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I84oHCV0"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75c205e4aso4070551fa.0
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727306461; x=1727911261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uu8cS5ZVBT2x5Y4ZLBzCkjnuT+mauwDzK9v+GQaA8mc=;
        b=I84oHCV0Ij8qqjNzSbSqy5xm370t0HeIrVyysptsES23Bfc8+pRoI4kF/OdblQfEXb
         7PFtWDcN03qvsqz3rWwvla093vvNkXQJlSgP+fPn0sFdaJZ8wuByvZTcLZmOcnRWF5ZV
         xmAcajtWe/u+cUHXuYDMmvnK1M98oTfa8L+zstmPrh7nit/zx2yHxWJ9aWsOtSV6M9JD
         7n3VS83TMvJD/OTlCXCZaoo7ZNNTCa0jReSc104iGqHmWQekK985WusKNDVBrgKEljmR
         jqnPqJP3zA161uQN9FR0BR0zGtlgxZ4NNZAdZR6GHRS6BGyXLvrkPnQJzhRxOOdC7eq0
         ePzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727306461; x=1727911261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uu8cS5ZVBT2x5Y4ZLBzCkjnuT+mauwDzK9v+GQaA8mc=;
        b=HO55Sz4nhBIcHD6bD4/ExOkNJaWOX6LslYEc6tbonphu+HfOZCoOT5AFoifZOb5W3d
         vV3VE9V34Cr/7TM74+8nJC7kWFE7JnrAQdX+TIZKJPjYTQ3NUgy2fvtXvQV+5IZBYBi6
         RoKMnbiffMoo7FEgejpMWu0I3RKzjjf0YHcSfzTvGasPrpeYAKjRJ3ld4UgfMVHSeQYO
         kTkvA1cXIrPUUqo4mSfq2SOytJMHIveaKRJ/OwgEncm+/L49KQiW7nsS2LAckFIoR25p
         JD0hnccmvhiBsSiSOruBxWNKVeWK5XLU5A/JsfzhelQFkQDXtTvULpZQ0s855JDfMRir
         OGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSPRp11PMdazsvifgBM/TNZw+Zio4cj6tfRiC7ZucHayiBs0ImO0jyC3EOsZbuxcJBhyo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWV64CF2UbFaWkPsqInEvptWdEQq9Ig+172m0cLVQTg3KE+vzT
	CYj6eU6qAtPaNHsrC/atQbKXGDEqUl8StJaqJMF6TGCP8SdmucxC
X-Google-Smtp-Source: AGHT+IHdvjn2giBUs0LazmE6P9wU7waFLc1kqAPFWdrrVS2sXKmllv8Wvmvy0TA72d+Ku978kbQ4dg==
X-Received: by 2002:a2e:a995:0:b0:2f5:6b4:1d2b with SMTP id 38308e7fff4ca-2f915fdbad6mr30761441fa.13.1727306460945;
        Wed, 25 Sep 2024 16:21:00 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c315sm2481026a12.15.2024.09.25.16.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:20:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/6] dt-bindings: dsp: fsl,dsp: fix power domain count
Date: Wed, 25 Sep 2024 19:20:03 -0400
Message-Id: <20240925232008.205802-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
References: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Per the current binding, QM/QXP DSPs are supposed to have 4
power domains, while the rest just 1. For QM/QXP, the 4 power
domains are: DSP, DSP_RAM, MU13A, MU13B.

First off, drop MU13A from the count. This is attached to the
platform device of lsio_mu13. This decreases the count to 3.

Secondly, drop DSP and DSP_RAM from the count for QXP. These
are attached to the platform devices of the lpcgs (used as clock
providers for the DSP).

With this in mind, the number of required power domains for QXP
is 1 (MU13B), while for QM it's 3 (MU13B, DSP, DSP_RAM).

Additionally, two extra power domains may be required in the case
of QM/QXP DSPs. These are IRQSTR_DSP and MU2A. For the nodes using
the "-hifi4" compatibles these PDs are optional, while for nodes using
the "-dsp" compatibles these are mandatory.

These changes reflect all of this information.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 62 +++++++++++++++----
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 9af40da5688e..e2f016af1048 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -51,8 +51,6 @@ properties:
     description:
       List of phandle and PM domain specifier as documented in
       Documentation/devicetree/bindings/power/power_domain.txt
-    minItems: 1
-    maxItems: 4
 
   mboxes:
     description:
@@ -97,16 +95,55 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - fsl,imx8qxp-dsp
-              - fsl,imx8qm-dsp
-              - fsl,imx8qxp-hifi4
-              - fsl,imx8qm-hifi4
+            const: fsl,imx8qxp-hifi4
     then:
       properties:
         power-domains:
-          minItems: 4
-    else:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-dsp
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-dsp
+    then:
+      properties:
+        power-domains:
+          minItems: 5
+          maxItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-hifi4
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+          maxItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mp-dsp
+              - fsl,imx8mp-hifi4
+              - fsl,imx8ulp-dsp
+              - fsl,imx8ulp-hifi4
+    then:
       properties:
         power-domains:
           maxItems: 1
@@ -157,10 +194,9 @@ examples:
                  <&adma_lpcg IMX_ADMA_LPCG_OCRAM_IPG_CLK>,
                  <&adma_lpcg IMX_ADMA_LPCG_DSP_CORE_CLK>;
         clock-names = "ipg", "ocram", "core";
-        power-domains = <&pd IMX_SC_R_MU_13A>,
-                        <&pd IMX_SC_R_MU_13B>,
-                        <&pd IMX_SC_R_DSP>,
-                        <&pd IMX_SC_R_DSP_RAM>;
+        power-domains = <&pd IMX_SC_R_MU_13B>,
+                        <&pd IMX_SC_R_IRQSTR_DSP>,
+                        <&pd IMX_SC_R_MU_2A>;
         mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
         mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
         memory-region = <&dsp_reserved>;
-- 
2.34.1

