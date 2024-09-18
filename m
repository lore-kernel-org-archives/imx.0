Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ADD1C9EA4
	for <imx@lists.linux.dev>; Wed, 18 Sep 2024 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726683737; cv=none; b=JgDSq0e57chtwD2mxw2YfHef8L9VBuD2oMY6Bebf68Qjz+Y63HgKJkTVRGE4NSPN6R6FChWL4JNLFoP9CSWoI9NkemPwaMtH/aD+Qv+mb4bifcKhGvYcHOqIT5AQ7N+Ab9Z9m4C5M/G5Tb7D+cNG4+Uzl1n0nKuyOjV1OhzgKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726683737; c=relaxed/simple;
	bh=UC56d/wDo4fWA78feoHg6QDV1PCP6dZckMEAl67t3qE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=No4ksEhkBvHN3wrz1G2qEtfsJxCVhH2NKO2T+jkJCYfBPZ60baZdPS0cj4P4XwU6lJn/rq8l7TAYyiP6j1r/1aPYzer9zDUG4mEpNMCqEQ0i97QdUhiKFErHrGndNOGdEz2bMQWDNkglapbmb0ckK5Bs7KbUUG32kHU8uLVBDNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYLD59CH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYLD59CH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365b6bd901so8046160e87.2
        for <imx@lists.linux.dev>; Wed, 18 Sep 2024 11:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726683734; x=1727288534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSJkyW7PtmsR3xBcC4s2dK8tXSEoVtyj6mYraRaugmc=;
        b=HYLD59CHvDqzniD5/CjIRXDeaI0ICzU4MKmZcIkA7xtZDI2zQH6Kr7X57JuVqBsbPh
         oUrpzyPwni+6tvkK8HQjKiCTIl4hAv5NTVytObdDpDr3bnLwq+2Ah/9tXLqeKsJfEPnZ
         YN9n8unzh41YBO5Ov+sViz/Yo0xPtsWetdA3ezbF3T4xUGcmjBDYKUStFfHjhEoSbUfI
         L0nGDf16TCNi9N16VtdwK8tAo6MncOG5BwlsVoV4XWn4diTFVNm1tUSerYgMn6AxJQPl
         g/FcDcneNDQo5Eoxe3fKd51l4H+jgmnkZxvTovEs9qgg9lj+gd+Wtw55VtLwSMbnUAxV
         HeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726683734; x=1727288534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSJkyW7PtmsR3xBcC4s2dK8tXSEoVtyj6mYraRaugmc=;
        b=LszPYbcJCxNsWMotDvo51+r7fG2IZhZoJl2Mkh9aUPfUs1KMS78po9QgzRCfGhK0Gz
         5FGWXpKhAcHFzH9hQNu58qAawFCoxzSuECVpytMrY6XsktfKFVLW2ExSqY7w/Ie5OGAG
         OZ9YHJPGCqQJSWhKYe5VpNpxI3tpf/Btw45irBcSmYRTM8UEL9qR5E9GVreGREvVz1Q5
         5DU1QMhe1yFgf9WFxtFj4/F3nyeNgLxnugfWMTsnH5wqwz41pEAJl+OYu6oFUn7ex4Ro
         +evTv5b0VuLZvm7dHR1GaZqws/0v6WFUYw28+OszM3z2E428oi1y0528g7gySGlF48uW
         vlig==
X-Forwarded-Encrypted: i=1; AJvYcCU8r4pyG68NPPLZYxmfuLCTSdQf+8PcrFSdrgGTBwdyJDDWDujxi+NYEwVHkZn0pauDpn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjT+FgreCA5uGW77yoNOSMumm1dH+Lkx1+mbZm0yyr2/6jNGPR
	3NCddiwM048QFBZnhvre85BtyIJmkxhmgAB6pkPKauBh8G/KgT7w
X-Google-Smtp-Source: AGHT+IFrDGvV5858WGdycyJ2YnkzCRsAgTv/brwvViai7wsUYS2uRl7bXI1hX02jiCpLYUubqCIlOg==
X-Received: by 2002:a05:6512:1052:b0:533:508f:edf1 with SMTP id 2adb3069b0e04-53678ff4e66mr11144621e87.60.1726683733341;
        Wed, 18 Sep 2024 11:22:13 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb5312dsm5200146a12.23.2024.09.18.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:22:12 -0700 (PDT)
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
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: dsp: fix power domain count
Date: Wed, 18 Sep 2024 14:21:13 -0400
Message-Id: <20240918182117.86221-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Per the current binding, QM/QXP DSPs are supposed
to have 4 power domains, while the rest just 1.
For QM/QXP, the 4 power domains are: DSP, DSP_RAM,
MU13A, MU13B.

First off, drop MU13A from the count. This is attached
to the platform device of lsio_mu13. This decreases the
count to 3.

Secondly, drop DSP and DSP_RAM from the count for QXP.
These are attached to the platform devices of the lpcgs
(used as clock providers for the DSP).

With this in mind, the number of required power domains for
QXP is 1 (MU13B), while for QM it's 3 (MU13B, DSP, DSP_RAM).

Additionally, two extra power domains may be required in the
case of QM/QXP DSPs. These are IRQSTR_DSP and MU2A. For the nodes
using the "-hifi4" compatibles these PDs are optional, while for
nodes using the "-dsp" compatibles these are mandatory.

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

