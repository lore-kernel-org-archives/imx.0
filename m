Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8612C491
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659152; cv=none; b=dEYaxSKWSog+lh3V2f6buGoMKYPkGQ9MERT4YQbBjVkMkMxv1gSvcIzX3y3ntkunxsrrGEhAPzmmHrgnDuU5DDDAw92x2NREb25sfz3WSrssC71Anih+GNVHeiVsIim88NTUp3/zBObReQtFpDw4deMrPrEHKV2H5dFIzkXu3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659152; c=relaxed/simple;
	bh=P+yE5KdCcIMm14HPs4c/lUI3dwW9bilamH4sLkmXczw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hhJB8qAuhI2ZGC26usDZ2Q/ISINWgRbllPHOaQ66tFw77dqq79FT8hP8FWhczQSNshV3geeH3iYs42V3NY/5/c5biEEreO3VYZw2zVk00WiSfmdsdDwDl8rwy4ZUGbJhAixh/OMy9DK6lsH5kSRbnzVDNRO5ijTl+7jKgJzPOq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7qsbrPo; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7qsbrPo"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5399041167cso3440183e87.0
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659149; x=1729263949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6d2HEGva1FumwMFJbWr9u9NWQ5NOhQR6SBLNsRd724=;
        b=I7qsbrPoNJAhAOGzU3HZjKl/x1P5/ayj1c5JQLWlGfslIvlZOX648lEyiSII7OMSBo
         OVzQAbC/0ov2lwgA9CY4ygCDzEA+ygc3iI7LJGccOD3VfKCZ5Uu2mN5FzCsxLDs+nY2e
         9VTq6BQPWEl3a9+Y3oe+Lj7kcIm+0gE8PSagLTg+1bPVGFevSHYWmxwhBFJQH/ySnni4
         H9xEJOoONDbMpM+FnIymgziH0PlO+YCKQkrfP3dQJx53n05UTswuaL/oUNKtkpEyJ76J
         S9H7TZ9Lpjk/nJVz4go3DAJ0g+lmRbRNo7AbxHRfnDA9kJGOIahHbjByU62CKel4yf1w
         Q09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659149; x=1729263949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6d2HEGva1FumwMFJbWr9u9NWQ5NOhQR6SBLNsRd724=;
        b=ErvmQRa0Q6m6Ya5Acerx2x5v+1sXsI6klxgxkVoW0jBXeSd98sD5EyAT3KU3zsdFZj
         MSEEWUIwMO2w9+qGzyGj+KxOdMfRm1z1dV/VhFf8oWe/yQjqLOtBJ+yHrZmsgdeJQfmh
         5kRCFEk4CMMQE5O3c+3nyDkAmhL8e0/vmvGybGQStDtkk69U5Lzq45H4u8bZyFcswbN5
         qt9Zn456A9Cmcale6fc2lXUnFS0uekG0CMrCWyHM0B6dtz+UZHE3uqr+dmdGJECgfIYw
         YYbXccdE7iG0hsr4TiH3HBJe437zvs8zKKtrPjlSg8QE8fJIvQvjm+iVhyzzFC24wDji
         noiA==
X-Forwarded-Encrypted: i=1; AJvYcCWGB3BlZNt7qyI67p4BKYHgVlBPDL+YNqxznYUUD7Qc+Z/zZl/yIi9l5C+kH1n4aZafeFg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCMDczGJ4OAjSQST1GZ/Vvu5bRP+W3F3NYiQhoNKnOBwHUQNBg
	fzI47u9chpUZRf9OmSzjHdbCbJ/2cue1Hriw1ifrf3iiSv8+J6WT
X-Google-Smtp-Source: AGHT+IGwGf+d6KP0pDSl5JptpFK3ku9j3zBqS2D7qrlBlzrhKGLUNO+lTF/x4nO5NF3hbj3e4pBmwQ==
X-Received: by 2002:a05:6512:b17:b0:539:8fbd:5218 with SMTP id 2adb3069b0e04-539da5938a6mr2681944e87.56.1728659148651;
        Fri, 11 Oct 2024 08:05:48 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0b5sm220879366b.94.2024.10.11.08.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:05:47 -0700 (PDT)
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
Subject: [PATCH v3 1/6] dt-bindings: dsp: fsl,dsp: fix power domain count
Date: Fri, 11 Oct 2024 11:04:34 -0400
Message-Id: <20241011150439.4027-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
References: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
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

