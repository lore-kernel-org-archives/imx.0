Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F02066E2
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360680; cv=none; b=L6NLcuessUHfqfz0GQhinCLPESSpHQ5DNpoeU+AqVOIn6inDnMpkye+sOzuTIZ6BSvOkxlChVb2rde4cuoTzvBRIwJVFd7z//BbE9P5NSYbg7zmGHzom/mkZAFOUIB5HvBsmCWh0yKLMg5uVxIYkNeWxCgk259d4FwWpIwtslJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360680; c=relaxed/simple;
	bh=C7U+gX2HAtTNvw4HTYyQ8sKcsL6nRwW9xlRDEvE3Fus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SJIvGZcktqYCRa6ZBUr+lk5ZO9ChiUu7WPV5XyxdUilrBomQM95ZuOQlWmbj3eoaCfQEWolazqtZGbrfyciwMUPys0UPuBn7DV+/b6/RwNKeYHvFmkZ9BQ19NeJooYDuaw81Xb/g/7wnaLUmpA3Ms0ytOArxNLigQA6Q99sEDDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im9riAHe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im9riAHe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-432d86a3085so27449595e9.2
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360677; x=1734965477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhaNNKCxtrPXfELgw/KHgSRSl1aX9JDfH4/Rbi26Vsk=;
        b=Im9riAHef2PxAAu0ckz7PqzWCaPKusY8737Tz/SBqiGv7pvlIz884fRQ+1qaEmQqSp
         Osfk9aaVxmblHdSDL2gVR/XB0VE9BlVPKK72Fk8PDeJpWn5Ay9AhxXy6T2xj5JT0ZOqj
         gkexYTxtJTwylA2eJ38f21tgbrP/g/9gZgDnoCSmTlv4o8PnktlSEn+9w7YOFrq+ecuH
         tJPpCS8160dqp5tqMu1ut3oQatgPezM6r2YW6/ftjTuU5aBWGkbVqqudN2cLTy6NBf9y
         7TzHy5lrMObGt3WryUwXvw1TtcSKtCDgW6L1e0bht0/3Jvwe4sfIFiDQ6D+2MFBk/0nS
         R2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360677; x=1734965477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhaNNKCxtrPXfELgw/KHgSRSl1aX9JDfH4/Rbi26Vsk=;
        b=ml9WdXWH4sCX7uVprY/GkFYtAR+hS28OVSne1skdKzXNsN2erlPtYCIQL+ys9utrSE
         dhC/3VDQW8NoHxmVp7D9dJ3myEGC/25HGeR7oHg+wAz2Z/uOBxwTGpBruBWyi2byUehy
         oaUv6ayp4cX+eSoId33pT4EL2ql7uvvbF0ve6tdKNylYUfgomHAytulQ/evOeMmTfM07
         OjjWhUnRAaxL6CXUcBZiXE8SBebSuLclJDRDUkNnf0zvZG5Mp61J6ZnJujz2dzj3+ipz
         uDVG+Kw9mB09gO8SlPklonQlEQoH/z3pEsYP0ViilKPQG7WwYc4Q9hdEkX6frcxjl9In
         VrfA==
X-Forwarded-Encrypted: i=1; AJvYcCWcHqHMur9dqFd0MZKlHe3WMYX8kmryimfODGyKNSF1Fab2A6Rni71A+WKDWwvNQA/pR+o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzA9k1mgI3xUI4NacLOioqRAyIwI1Y2+BPShXiDoNQPSZW51X0b
	f5l6uLje0QBupsfQQp94BR+v8inf9MMrGvNEpOg2CAfGIxEkv2wu
X-Gm-Gg: ASbGncvd3Uba3980KsJbylKOJslESUzHdqiCFss5poICJAqICU5Z6DzyOA+uCfNR0ou
	uCYYSzVHPV+YQwrle01JyhnpNqz9r1yg3dUn7XJNypCeRojFkrkBCUDzTjbGipw90LiBLCRSPnh
	bb2agk3NIwYCL4/y4WFZBcHQ8mk+mZw27E0Y73P+XdIDo0MYYcbtccrGByYQyVI+obV++BcNxZQ
	AxdX/817Fn+yeDbHJMlnDuwcXcst3I0OV4u3YjZE0oj35ADJwFW2JNkCwuRQuSDeSjR6BeunVOQ
	wnGr+/8EjWeZOMEc
X-Google-Smtp-Source: AGHT+IHp+aRH9ApI2wBs86oXmAT5Zyw16hcSyU7ofzYQJ6VdNQwOe2b+SoQNW7hpWBoCfEejVt7Ieg==
X-Received: by 2002:a05:600c:1da7:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-4362aa9dd6dmr112072165e9.21.1734360677203;
        Mon, 16 Dec 2024 06:51:17 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:16 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] ASoC: dt-bindings: support imx95's CM7 core
Date: Mon, 16 Dec 2024 09:50:36 -0500
Message-Id: <20241216145039.3074-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add binding for imx95's CM7 core, used for audio processing.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..cc1eb358f288
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP imx95 CM7 core
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: NXP imx95 CM7 core used for audio processing
+
+allOf:
+  - $ref: fsl,sof-cpu.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx95-cm7-sof
+
+  port:
+    description: SAI3 port
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    cm7-cpu@80000000 {
+        compatible = "fsl,imx95-cm7-sof";
+        reg = <0x80000000 0x6100000>;
+        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+        memory-region = <&adma_res>;
+        port {
+          /* SAI3-WM8962 link */
+          endpoint { remote-endpoint = <&wm8962_ep>; };
+        };
+    };
-- 
2.34.1

