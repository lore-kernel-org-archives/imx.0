Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507401CCECF
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525985; cv=none; b=RmnW9ZixkDNAydv18Z80T35lFZd205fy5pLj64NQ0jG1AMKvkTD/RNPy4peIiYAkiaDJ0LN7IEDWcPmmoqV1ZsT/es9NOC5YizqlERIXbsmEGmToRwe2ueS9iQxy3032NDVzYAtx5eyTDKSEbQ8ib5ObEAakz/SWzrM3xt5zEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525985; c=relaxed/simple;
	bh=8DwlMG0kaTgTPAzPaMnX+0muBG330uuBVIxDFS2ZISA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KVaQrFdPG5BhTXYTzfMnyzIUXDWgKfm1X4GhK3itYe3NzFT3lQNz7JwfxlZldTFkPQL4ww04hrjXHzHKNAqrwiW9g2Y/tMCuNO0vTYorpPGBqYfFtRsLZ7Lu1TZmNlle4fADi3jJpC5FWWxmd8Pb3m/0vsapZKfDXrPCNGtR6rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXKsIJNy; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXKsIJNy"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so5256321e87.1
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525981; x=1730130781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxDxKHmPqECT4R1a7bYe2JPLBE82BXjHNnePjstN3G8=;
        b=CXKsIJNyvifTcXDpbgyfjWHkhpeKNy25dKWoUeFCl124p6dkpjsBZ6dHODpVDf2u61
         lj7y/LBls8kI2iqs+PE3U8Znxm4qnU5ITn7rK2uDCXey1gEjWajaNwiv2U65FL6Pnren
         K9S3omoG7/1bcenTPgtTc8ALAdEB0cMuIP+7FUlNSmFReiET5A5rAUuP3OdFg3wcltDw
         7auJLPEvs8OS5gaa+XQdIqqIbPoy8aaBpQR0dlu4mXPsz47ZBQbaNoTKzxfg42n50RVK
         hqn2pxayhq0lC38MUINmyeOvQ54tfeVnxbzUdCFAaXnpluF6Engr5z2ul7oqDZxnTZoK
         kYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525981; x=1730130781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxDxKHmPqECT4R1a7bYe2JPLBE82BXjHNnePjstN3G8=;
        b=efNlwQ6n/z4EW/SEGsMc54bq59PSaZuz5+pPVgSxaJuUFJrLFHOy/6i0l8KTQtpdVY
         n5eEVcPPCgeGANbYp8qZigx2A9XV1ebZea0hqN6k7iWGTAf65vhriYcIUyuFkFbvLqG1
         6SaW99YiOnDnryQEqryYj4OE08wjb3xYV2YEcSMc12/bXw+gqF1pPiagGnfiVFpDuFzp
         46A5hvos80c0BQ5b/dCHF83Ehn0TqLvrLUedYQpDnsnxVQre88kD1v656hbv2iWfLvnq
         GBC8QN0Vjli2gtWHJIq5TCFop768IE4xr5SNKAuJGQcqxb3SuHZdAiJ7jBlG/uFMGlqi
         Vs5A==
X-Forwarded-Encrypted: i=1; AJvYcCWU4AclFy5f6V4kafr7/SakLWH1CSagq+kcqABSDqkMaM9/fYho+gJ5tErazVRf0soRY4Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1VUFTXoizqixn9QdjIWiLp6rNYEoPFsiAk12lnBzS4jzYjF2Z
	sNlCZNfuv1J49ViVtzcvl5H9hfTwXXIwxoEc1IG6myGGlcyw55AB
X-Google-Smtp-Source: AGHT+IEOvF+I3X7eV/ZzXFntHrBLK7yKO+DyOsij8aWog9rupEjDGCjyG3yo/YkcA/eyGDm3liIWaw==
X-Received: by 2002:a05:6512:318c:b0:539:9490:7257 with SMTP id 2adb3069b0e04-53b12c04223mr241778e87.30.1729525980930;
        Mon, 21 Oct 2024 08:53:00 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm218614366b.67.2024.10.21.08.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:53:00 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/6] dt-bindings: dsp: fsl,dsp: fix power domain count
Date: Mon, 21 Oct 2024 11:52:16 -0400
Message-Id: <20241021155221.112073-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
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

First off, drop MU13A from the count as its already attached
to lsio_mu13. This decreases the count to 3.

Secondly, drop DSP and DSP_RAM from the count for QXP. These
are already attached to the DSP's LPCGs.

Thirdly, a new power domain is required for DSP-SCU communication
(MU2A). With this in mind, the number of required power domains
for QXP is 2 (MU2A, MU13B), while for QM it's 4 (MU13B, DSP,
DSP_RAM, MU2A).

Update the fsl,dsp binding to reflect all of this information.
Since the arm,mhuv2 binding has an example node using the
fsl,imx8qxp-dsp compatible, remove two of the extra PDs to
align with the required power domain count.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 31 +++++++++++++++----
 .../bindings/mailbox/arm,mhuv2.yaml           |  2 +-
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 9af40da5688e..ab93ffd3d2e5 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -99,14 +99,35 @@ allOf:
           contains:
             enum:
               - fsl,imx8qxp-dsp
-              - fsl,imx8qm-dsp
               - fsl,imx8qxp-hifi4
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qm-dsp
               - fsl,imx8qm-hifi4
     then:
       properties:
         power-domains:
           minItems: 4
-    else:
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
@@ -157,10 +178,8 @@ examples:
                  <&adma_lpcg IMX_ADMA_LPCG_OCRAM_IPG_CLK>,
                  <&adma_lpcg IMX_ADMA_LPCG_DSP_CORE_CLK>;
         clock-names = "ipg", "ocram", "core";
-        power-domains = <&pd IMX_SC_R_MU_13A>,
-                        <&pd IMX_SC_R_MU_13B>,
-                        <&pd IMX_SC_R_DSP>,
-                        <&pd IMX_SC_R_DSP_RAM>;
+        power-domains = <&pd IMX_SC_R_MU_13B>,
+                        <&pd IMX_SC_R_MU_2A>;
         mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
         mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
         memory-region = <&dsp_reserved>;
diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
index a4f1fe63659a..02f06314d85f 100644
--- a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
+++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
@@ -197,7 +197,7 @@ examples:
             reg = <0 0x596e8000 0 0x88000>;
             clocks = <&adma_lpcg 0>, <&adma_lpcg 1>, <&adma_lpcg 2>;
             clock-names = "ipg", "ocram", "core";
-            power-domains = <&pd 0>, <&pd 1>, <&pd 2>, <&pd 3>;
+            power-domains = <&pd 0>, <&pd 1>;
             mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
             mboxes = <&mhu_tx 2 0>, //data-transfer protocol with 5 windows, mhu-tx
                      <&mhu_tx 3 0>, //data-transfer protocol with 7 windows, mhu-tx
-- 
2.34.1

