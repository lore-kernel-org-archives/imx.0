Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309401CEE8C
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700514; cv=none; b=p7SijAsH9UI0cn6bM5pbfs4oE/p/vsebloV0xgIYAuU13iq692tXLYTPmqUEZtKAb6xSWxdP0o0x4Nyq7en5Jsv47YOBkFnQnkL5RcDfobg1VZp6O8mfZekho9p288PXe6ZfKYknyqa0qUfJnD/9X6r5Kd9fbippPSb+8hI0V4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700514; c=relaxed/simple;
	bh=u5/D8JkS0pteSch/iFvi0JPXftSiwu6DySluq4qPaU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAU9uBuIL5GYCwdbO/Sc/5uBavlcAVuNergPtxG1Skjyh8z0GGX1FHOZhc0dYeD4Dop52fdHWSGguE3kD5d6ykBKR2EtAZkQjDRpUX/wVqEq2Nqri0jwg7MGbiQi5aVaiXX1JHhVbqFSefefesaJn5g9X8dte6dOp6Hi0Jals/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbVQzetC; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbVQzetC"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so55586881fa.3
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700511; x=1730305311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgC15d/pQkY9/ZdNYZmW9U8JEuWcaoADNmU9EGiwgmk=;
        b=JbVQzetCP7IOcAUs/2NAyxno3/vbihjYnGW7GnITIiPR2CGYsqh/nmOFxps54BNXM1
         s4IS/czrjUVRCWsEHh4SSq4G/xeUxIbL/VdF4ea+lVcweyH8tY0aDxl+jWDLkVNlFqD2
         0TFP5TWs1+Vpr1RJHHPf0xr2hGqB/ci/GbqmNabmbws7CJ5AEz0ON0aEZ0i9JsFquYN+
         ojE5qncUzzqGs2JKdGE5yFv3QSvFce7tsazrBFlnpsxnijcO49VGJUv6RG7w2lMurRQJ
         fpnZsCuHfcpuCUQ0yJYTU4CVGgklLIAY3MRy8O1uO8x88500fMjO7TXHgzZ1cxSYTJ2P
         MIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700511; x=1730305311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgC15d/pQkY9/ZdNYZmW9U8JEuWcaoADNmU9EGiwgmk=;
        b=ZKRvpWAqBmS50uWkSmCR9eSX/7kYrTXsphjOUiP35ps3oFACeizaQP0/mmLMxeb77v
         8UMh56BDsz2uuJ+AcPBdIQ6d0TQ6WjBWgkmDGqxp1h2lpwEqP3UNonMsURfKh+njDjqK
         US3wcmj8+pIx0DyhECXicPP68TNxYb25zehxZRrBd1soV/ADLKr3uf+thR3I9athwena
         VJYFMQbJlUL9I0g6tZPE7+HOwKcgFYe8Jryl3vJrW3kIBkvcmcADcUydhN5vWxzMEFkA
         vARsyVHiBdCaWMCP1NWQzA4/XI7g/8TmoxXoRq/hVxhgKYPKHpMQ807HwzklVZSJYpuq
         HrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbvjwLA28bNXN4Nkqv0VF1mNeZI0plgJGCcye0CuKPyj6W7HzKN6elsm5n/Yrk7ebjCwI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpp4QkXeL7m4HGh9Ayohux3C++h2EbJoI0hE3l1qG/j6CwJMA5
	tF7jW+tNnFR21/LlEhwhzTxaO8o8D3YZBVvWv13Kqw7xJZAxWRiW
X-Google-Smtp-Source: AGHT+IH6A0+R1gxcuSRH5wO+QbdVBb6hBn6+S5OLqazKgIRlUbTwpM/jY7yy8fE+80bw1Otx1SyW+w==
X-Received: by 2002:a2e:be09:0:b0:2fa:e52f:4470 with SMTP id 38308e7fff4ca-2fc9d2ddc23mr14523171fa.9.1729700511046;
        Wed, 23 Oct 2024 09:21:51 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:50 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new compatible
Date: Wed, 23 Oct 2024 12:21:11 -0400
Message-Id: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add new compatible for imx95's CM7 with SOF.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..ab0d8e017965 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,15 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7-sof
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dram
+      - const: mailbox
 
   clocks:
     maxItems: 1
@@ -38,10 +47,8 @@ properties:
       Phandle to syscon block which provide access to System Reset Controller
 
   mbox-names:
-    items:
-      - const: tx
-      - const: rx
-      - const: rxdb
+    minItems: 1
+    maxItems: 4
 
   mboxes:
     description:
@@ -49,7 +56,7 @@ properties:
       List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
       (see mailbox/fsl,mu.yaml)
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   memory-region:
     description:
@@ -84,6 +91,10 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
 
@@ -114,6 +125,43 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-cm7-sof
+    then:
+      properties:
+        mboxes:
+          minItems: 4
+        mbox-names:
+          items:
+            - const: txdb0
+            - const: txdb1
+            - const: rxdb0
+            - const: rxdb1
+        memory-region:
+          maxItems: 1
+      required:
+        - reg
+        - reg-names
+        - mboxes
+        - mbox-names
+        - memory-region
+        - port
+    else:
+      properties:
+        reg: false
+        reg-names: false
+        mboxes:
+          maxItems: 3
+        mbox-names:
+          items:
+            - const: tx
+            - const: rx
+            - const: rxdb
+        port: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

