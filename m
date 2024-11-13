Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF42064E2
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731527605; cv=none; b=Hc8mp0u1IzhQTcJZyY2dKJCW+sjFu+SaUPc+r5q+18C0k44eAWtO0xn9qGIg9buCgMKH5rFZ6K/qQHJqXA8ZhSchHeSoM0+usdFCDV+iM6Xzz4kGQHucJGpJ5FB4TdfZRF1yDym+9h4btPLJyo/KPHpfGcpMreB61ftPfdpYMbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731527605; c=relaxed/simple;
	bh=Sv6D/+y3scZijLS9PVRlVeMuXulXudQKBAtm4AEdBT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCxwBR1jQwzSnqLlc4IP/POVZZ2ZmnWnzC/whArW/7I27iKa21Nf6brgn4RF+a/NHBwhPUt74Yywsq6JeygP8ai5gHjvxxQYQfQa6jwBBlhnwKxntAKPzD435dc4+8yy4GGj31pSHNaLCC4ucB15I7hDtaDHld0mUqYR07L4SyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzfoM0qD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzfoM0qD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43193678216so69385995e9.0
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 11:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527602; x=1732132402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lQpVT555kI9HxWkbuw1QfCobvJUnpBBYDf2BdIAaRY=;
        b=MzfoM0qD+RTVsmbt+sxNv3ayeRo5aD45hqg36y3wCdU2MddjAp2HZ0XVciKJ6ydTK4
         26Te+rQw7KWaWpDiOx1F7wy8TM4HX8RR8wyI+m4sfVc8cTbcloW90JPwFxHHpbHvPaQO
         44pchbg4sHtiYg4Wp5OIXKPzfDxTikobDkguEZ0pspaiHrsj82sTOvKwSS//A9tVZIwl
         Z2RnuxgM468zFaHfHgIeTQvLxvsxJie769uk3arcicsyN+uecDTnlNKytOGHkCsOXhhm
         L4AY9KExmbh61rDoamtW08T4x94yhw3xuAlIoNOKrkSyu8pKfGP/keZpIVfZaQcMiukJ
         AYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527602; x=1732132402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lQpVT555kI9HxWkbuw1QfCobvJUnpBBYDf2BdIAaRY=;
        b=oiy0GAs6F6tHIE/mt8Li/FcsH4aIrURXMN1ptiBVoYDcaAzrw6BMmXRlSeIsGMPmoN
         yPbpFjR/loOgbkJiEuDsJilAMNMsB5nES3ikToeUP+USyb6d4AFpO8n30LqbU9xIoVu7
         yHKjv2/WFiXHV31Z1yNPPe6etrLx03lH/u5yQ+au5XzJymMbFTcuLEN7kzSJgkEHd8rm
         jrhAWzZSwHoY2rhGyTyb+94+0w7jo7ipiwuDwHq6B5EWfruSpCMBCBnMRHj/gPdyBKD+
         6JMgyrCjlPzjprwgGgReMQXp/2c+x2DETpyqNjZk2PR788sWsdsvR8R/+qel7BMHdXjC
         0b5w==
X-Forwarded-Encrypted: i=1; AJvYcCVj1HOkbAKjjLjp/7bQPD3Uk2t2OF49PIl7o7zhDQ6oGTOnEG/MBWd/mz0TW3/EaVdy3Q4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZqV/7wRfMrubpZpeWjEfr2Fsk0llj8WhD9GcmXzDoEW4wDQKJ
	zdV5eJ2IsrkvqbRi2Z5jD7PRCPDo2wSgV/zlWcZsg414noc6Ad0d
X-Google-Smtp-Source: AGHT+IH2Z2a0/rS9v7IeDir+dpM0VmMRaelsOvWV9gMqaYXP9EFNgflc7dj7yYlfrWcH5bgnnm7i0Q==
X-Received: by 2002:a05:600c:3b9e:b0:431:3927:d1bc with SMTP id 5b1f17b1804b1-432b74fcb02mr189488175e9.2.1731527602016;
        Wed, 13 Nov 2024 11:53:22 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:21 -0800 (PST)
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
Subject: [PATCH v2 2/5] ASoC: dt-bindings: add binding for imx95's CM7 core
Date: Wed, 13 Nov 2024 14:52:37 -0500
Message-Id: <20241113195240.3699-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add binding for imx95's CM7 core.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..f11e03bbcaba
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
+      compatible = "fsl,imx95-cm7-sof";
+      reg = <0x80000000 0x6100000>;
+      mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+      mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+      memory-region = <&adma_res>;
+      cpu: port {
+        /* SAI3-WM8962 link */
+        cpu_ep: endpoint { remote-endpoint = <&wm8962_ep>; };
+      };
+    };
-- 
2.34.1

