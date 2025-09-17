Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21386308F09
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096346; cv=none; b=oSkIGD0KXa/W7ZnuK+CEwzQCa/Gtj2m85+tnzfdKqCZDo3JmfwakvgQwlyxKfSoi6P3xmf8VOQ/bGilD0JeEjctop8khc2VI0PKq6XsvNPPYrcRdwJFoY9BF7A6u7nYLTLwNo3XSaoU7/6iO8EyQV2QpoBgzsAhAVuv2RFwM7Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096346; c=relaxed/simple;
	bh=is+QmPpGFqnxwUe0KKjrEay6S4ZGinDIfN9T4PpumlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiCxr9jn7QvgnMShyzhSmYva5n4qlMKQsi29e4AgMHyNwmRAy/epLHads/2Hj9nWism5KOr1liRo81YtVirO0Yis4bnOLbsdp3q4PxfTbX5suzdiX9pUtsw/6p8/AsQiHVEU6G425o5R1/MCJzQxDg9DUgJ3KQMPj9XM8kI3cWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=T3yRhx+Q; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="T3yRhx+Q"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b042cc3954fso1141997866b.0
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096344; x=1758701144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA/la65cC0J/yoE9Qt381Ko1XSyZ3tw4GtydE8nU3zI=;
        b=T3yRhx+Q89rBQG8Uad1dmfGJtWLVfPwB3inbKdIuV1sptma4QSXQmm9fuU054Pm7/y
         +1hS8iGrnPR/VI3HavjtSey7ZRMtLmPsHLwcRU7mWNY1GTL3/6sG/VI6HZxpROvFomD6
         iAx4HsKQRtZ3XTVR/axjdmcXuZEn2ZA4Mq1rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096344; x=1758701144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lA/la65cC0J/yoE9Qt381Ko1XSyZ3tw4GtydE8nU3zI=;
        b=NcJwn1cigs8iVS5j0cJaxKDvRxg9eRE9pqjokFf7EaJl3m1mkiXouv45ACXFNfbmiv
         Nh0VyZla20Pbnqxhp0xF4bUnV+/I5hRTkFRlLxG9CRu/UZkmO5ckc3z5/tlwxpm1Ijjm
         w7vA+zcboP7CQ+gucOS5bRdik9yPTG6zRWUMYiJvmtFi/GEjNPoJtzNSzTjVJ4rTT+JY
         JIVEwnNLsFiDpKO5tZTtj4MaMFamohLhjdM3CopweFEsiwyVkG9dQtff3oOurrNQ8n6j
         Lk6M5GK5S+R21HSA3CAO+YiZN8vz2XiFlU1DJ4sv0AVVaBRkGH2NpnGevz99v6xt3E/y
         OdRg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cof9kKMh3EjnZWuhseDe+bYk5iwTYK8NCnehkxqYQs3QBSdGEJz3gL7O5Rc8RNpbTE8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5JzMc9lvEkcNArdsaV4/9+hdcTnrnPfkaXWk1oQEkDRflyjmW
	wnPk/uOqFCy0/9LMIAk+1YJpg9rcY/Pa0d2TnZoEK7kRzSVXMwxhWJa50KlYaXXzKrc=
X-Gm-Gg: ASbGncuKRPSnxjeGXwfciiUy3C0OyX/uVRmFYs+0BSTyS4UdwfE39rllc5ConhEouMk
	cL86TkFU5e/DMa1RT7s/5ih9dDc1JvC5E7W05mHlt71gAAbzVKquSoa4+tu93DVvLxBtq0or/tn
	HqDTLQN2kqmsk+ytFp2NYlHjQtrBchcJSBw/qNeG2HVWcHtZsQZ4vc7ebUteO+jlG/rNljbmRpy
	PDFHYM8mR3V4mJcj6hPgh1kpoF6uj2LT/Ihm7cEjaOduu4vuvwKBEZDhCieYHZ2wR/0iAH4pJ8z
	8K3qn/Rnrtal0npjTvvx2a9L2nly1oAh5XAssjeF/tEsIlXQgz+3jeOrpkHBycaEScorMMHW3t8
	QUVIcR0pubjp/sxiP+f8yY+06+a1MmPomkguTN2dcAsJsNR4RAht1FkpF2dU=
X-Google-Smtp-Source: AGHT+IHgnDmHgbGe7M2wf+eae5X2J65rFCbRDo8gVvx92rWiaCFtz+XyS2dWxPaksXXrHlaef/NgWA==
X-Received: by 2002:a17:906:d555:b0:afe:ef8a:ac69 with SMTP id a640c23a62f3a-b1bb7d419ddmr158716766b.43.1758096343566;
        Wed, 17 Sep 2025 01:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Wed, 17 Sep 2025 10:05:09 +0200
Message-ID: <20250917080534.1772202-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the touchscreen-glitch-threshold-ns property.

Drivers must convert this value to IPG clock cycles and map it to one of
the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Adjust property description following the suggestions of
  Conor Dooley and Frank Li.
- Update the commit description.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..1975f741cf3d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,20 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Minimum duration in nanoseconds a signal must remain stable
+      to be considered valid.
+
+      Drivers must convert this value to IPG clock cycles and map
+      it to one of the four discrete thresholds exposed by the
+      TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
 required:
   - compatible
   - reg
-- 
2.43.0

