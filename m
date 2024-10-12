Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402361991C2
	for <imx@lists.linux.dev>; Sat, 12 Oct 2024 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728745380; cv=none; b=D2kHRI47LvjpGn749m7xLLqodO7Llf7v+sEr3Tyss/mssmN7gCDWbKYaNFsYUJpI4L4gBxFymTPmqw9bPkfWAepB5VkdTE1smMT/4EO6f7VaCS4oOX++VF1YrgMVI8xuSAjdrnCwqHBpDoDFwd/YoNuvRLYruteLyvEd9WijpcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728745380; c=relaxed/simple;
	bh=W8yJlUz5UZxhN48KhcJWj8ZiGss+D+koeHOp9dX54p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raBtiCgwv0YuR+M66T/tIah0bS7K4ciCrmoS1aMBLD5+UIpDyVqZ4dvElvBj+c6tPzDCDMG9FxONGwBJofUpsarYUNBgr8EukQmI7J08pPBeZAhB+KBkKNjvWWUdF94EYcaIHQOZTeLwfwmZ9N5A+HzP7gO/TKexMjlwSqGTCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e00OOXTp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e00OOXTp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso352782a12.3
        for <imx@lists.linux.dev>; Sat, 12 Oct 2024 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728745376; x=1729350176; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKIBDz/pGEcC/RWCK6xHK9NwCEfuNa53f1N9XJeausI=;
        b=e00OOXTp9eC8MRVlol7LBBhG6m2I62QHipdU+Q0lo7csxFnHjQ7bszEPizs8XVNQz2
         N3iIABCw5aDnXOqgNZ16u+Oex3xsXTssUKxfz8eTvXcLgxRCrwHXd81FyfQCSFgRzJPT
         p4Wo9ow2ypZRr4YIjx2cEQHMSKUYWRrbKTY9/U9gR5Qn9Aa52V64uwqEpBNOVjG39aMj
         0M1L/sJrbLMvTMOpesGCJ6IAsrpGA5sxGo34DxTCcxGJLj9+azai7d4LszPteUFYFWoI
         z7tEa+HKyMaBmUdRLHCt265QHbbQmMyqgxPKK2hxH30PXx+geBUf7FCJkvB9yozy1XHH
         tbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728745376; x=1729350176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKIBDz/pGEcC/RWCK6xHK9NwCEfuNa53f1N9XJeausI=;
        b=sCC//6SRYHVM9YGrLRqKGbrz8ze6AL0c5zJYB7NQURsWxI65gbiKv2PkEX227xK9fv
         YxEGBszjTqWi/vnOWqxa9JKzev4NWR+PNy/7Pi50E4dJDnfF08fnuislvN2ghzHQe8Pm
         ABiqObm1rs4RtSDI1nbNa0dwOwyu+6N7H0pLZYjH4QkpGvSrs2poO144wX5jaKc3Q6Ls
         HIST4yVLo87Bqzae/raD3BzRfMJLjJ5/LwUC/o8NZ2y8wEmVUVD5CWKxjkKw2cnjSxYL
         9X0g+gvY7+SHLStRbX3NYTAMcxlqpBjjFWZRpGk7z0eYDAlSHQoj96HPaPWsH1aHyLhN
         OT3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVw3ppRNVVa7bnE1qJaCT1hRZfz+ME+dWaRTrVYw63IB5j8dSPPj3rdW0xkldH0jm1DT9U=@lists.linux.dev
X-Gm-Message-State: AOJu0YynJ0gXeVm1pWj8MGptIh4fjt/2hEw+Rmb45LzZZDux9qHTBa/t
	1tQzrOFmLlAmxes/VJOSNTkwJQAqfAuwvfBt6MLRS7NOBLhjSXWazQ7/oEJJ66Y=
X-Google-Smtp-Source: AGHT+IHfKJPB81YSI7X5tl2yziY2/V++B5J3JfUfnnFhjCThuVGl7ODACL8Vk62yQu7ZvE6ykFUcOA==
X-Received: by 2002:a17:906:4fc6:b0:a99:5234:c56c with SMTP id a640c23a62f3a-a99b93cbb76mr607047366b.33.1728745376503;
        Sat, 12 Oct 2024 08:02:56 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f148b224sm63730166b.50.2024.10.12.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 08:02:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 12 Oct 2024 16:02:51 +0100
Subject: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
In-Reply-To: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Some of our sensor schemas use unevaluatedProperities: false for endpoint:
properties: while other schemas use additionalProperties: false.

The effect of using unevaluatedProperities: false in this instance is that
any property in media/video-interfaces.yaml can be considered in a dts for
an endpoint.

Converting to additionalProperties: false and running DT checkers show that
such a liberal policy is unnecessary.

We should have a consistent way of defining these properties if for no
other reason than aid other developers in the preferred way of writing
these schemas for media/i2c in the future.

Convert to additionalProperties: as a result remote-endpoint needs to be
added to the property list for most sensors. In a few cases some
additional properties clock data-lanes or clock-lanes need to be added too
but, for-the-most-part remote-endpoint is the only missing property.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml     | 5 ++++-
 Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml  | 4 +++-
 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml  | 4 +++-
 Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml  | 6 +++++-
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/imx219.yaml             | 6 +++++-
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml           | 4 +++-
 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml       | 4 +++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml       | 4 +++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml        | 5 ++++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml        | 3 ++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml        | 5 ++++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml        | 4 +++-
 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml   | 4 +++-
 23 files changed, 75 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
index d3329e991d1652936fcf671012b8018e4317ea40..ba166ecf4fcbb77efab69ebcbdb46f5666af8e77 100644
--- a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
@@ -32,7 +32,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           link-frequencies: true
@@ -45,9 +45,12 @@ properties:
               - const: 3
               - const: 4
 
+          remote-endpoint: true
+
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
index 0e7a7b5ac89f618e6cba0d86f6f7ea853e59ae1e..8b42440586aa8c853d8bf6046ccab0c3b23cb907 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
@@ -44,7 +44,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -59,10 +59,12 @@ properties:
                   - const: 2
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
index 51b8ece09c722e057fdb01b38d3e360e7604f39a..c15169ef901139411273e110523a311d87b4322e 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
@@ -44,7 +44,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -59,10 +59,12 @@ properties:
                   - const: 2
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
index 9eac588de0bc28d85f44663afe5472e35f1e652c..702625962d90ea7fafb4f4f4f865659097b51406 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
@@ -56,13 +56,17 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
+          data-lanes: true
           link-frequencies: true
+          remote-endpoint: true
 
         required:
+          - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index d18ead8f7fc43bfacc291aed85b5ca9166c46edb..52bb089bd67fd0f9b5464e068b8db0b8e4406b3d 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -52,7 +52,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -67,10 +67,12 @@ properties:
                   - const: 2
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index 07d088cf66e0bde362b12d3494e5c91a1dd96bf3..5f395cf04b95ca47d5e685b8c43b8265db6910ae 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -52,7 +52,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -65,10 +65,14 @@ properties:
               - const: 2
 
           clock-noncontinuous: true
+          clock-lanes: true
           link-frequencies: true
+          remote-endpoint: true
 
         required:
+          - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index f8ace8cbccdbac482ffba733d5b28a3a38aaf822..ce45bd8409597fa6989f632d68cd4aa1a468d152 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -77,7 +77,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           link-frequencies: true
@@ -87,11 +87,13 @@ properties:
               - 1 # CSI-2 C-PHY
               - 3 # CCP2
               - 4 # CSI-2 D-PHY
+          remote-endpoint: true
 
         required:
           - link-frequencies
           - data-lanes
           - bus-type
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
index ca57c01739d2b93100a37db56255ab717c1197ff..9b3738956c482d8826bf64f557c2e91630ea9799 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
@@ -55,7 +55,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -65,10 +65,12 @@ properties:
               enum: [1, 2]
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
index 67c1c291327b7febb6a039bf6f28c8dc1f32ed7f..b8db4be137085fe31ec2f076c7dc66b30bf0b66c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -77,7 +77,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           link-frequencies: true
@@ -88,9 +88,11 @@ properties:
               the link speed defined by the 'link-frequencies' property.
               If present, the value shall be in the range of 0-4.
             default: 4
+          remote-endpoint: true
 
         required:
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
index d96199031b66c5c162a034824f195e277f2a1795..7499523a6e0fbd64b9b980333adaa14a0c40a33b 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
@@ -61,7 +61,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -77,10 +77,12 @@ properties:
               - items:
                   - const: 1
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 622243cae03caa5d14aa312df40ef5907e190d2c..358c0422451f7faa8e0ebfc9226a5cfb087e3598 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -45,7 +45,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           link-frequencies: true
@@ -54,9 +54,12 @@ properties:
             minItems: 1
             maxItems: 2
 
+          remote-endpoint: true
+
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
index ad07204057f979ade534d29c99c3aff7372bd332..eff212524bf3c7b1ec6aa7e826d4318d58ba53a5 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
@@ -60,7 +60,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -69,6 +69,7 @@ properties:
 
           # Supports max data transfer of 900 Mbps per lane
           link-frequencies: true
+          remote-endpoint: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
index 2e5187acbbb89728cbb8a402559d24766198a3da..cbbe3c9ce151eb33d2b0cc1a44e6ebf66d9b59fa 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
@@ -53,7 +53,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           clock-lanes:
@@ -63,10 +63,12 @@ properties:
             maxItems: 1
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 382d7de7a89bcea11be384a2a3800512994f9346..dd5c5715fdcfc00e6d851f375f41e4d077b92bc0 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -45,7 +45,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           link-frequencies: true
@@ -54,9 +54,12 @@ properties:
             minItems: 1
             maxItems: 4
 
+          remote-endpoint: true
+
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 38325cf318f7bd2cd60a4c7bbb6a65b54b855e26..dde4e7426bf00920f1bd9ed1bf4d8594932dedaf 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -51,15 +51,17 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes: true
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 0162eec8ca993a7614d29908f89fa9fe6d4b545d..9b78ff6bd5f114c7f63ac90e71fa677445ddf702 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -58,7 +58,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -73,10 +73,12 @@ properties:
                   - const: 4
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index f0f9726a2add89492b8c56e17ed607841baa3a0d..4cf49472c24f1b800f6d2e41b8716e2ac32f959a 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -56,7 +56,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -71,10 +71,12 @@ properties:
                   - const: 2
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
index e4f49f1435a5c2e6e1507d250662ea6ecbf3c7dc..75b78a3e925ed2fd09f56c8349d234a32739f141 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
@@ -48,7 +48,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -60,10 +60,12 @@ properties:
                   - const: 4
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index bf05ca48601abda53d60a3d03aa556e7b8fd825b..e6aec7a1ba2b22a11111d19a61384f1200041df5 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -71,7 +71,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes:
@@ -86,10 +86,12 @@ properties:
                   - const: 4
 
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index 872b8288948b2bba743f2365a55165181df156ae..d30ef330e5af225728d1a6c40b26050cd33ba4be 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -38,15 +38,17 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes: true
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 38bd1c7304a59bb5fea90954c1e4e626a7c86f2f..36c3a0ba7822475770cd903cec3343d31bb66520 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -48,15 +48,17 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes: true
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index ece1e17fe34553671e61c965eb1833c5eb08131b..0bbdf657a8c0643ffe512ae04c14dfc8e6b4fc94 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -50,15 +50,17 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false
 
         properties:
           data-lanes: true
           link-frequencies: true
+          remote-endpoint: true
 
         required:
           - data-lanes
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
index 1c476b635b690865cff0882578d72b1db2dc7c50..367d669ad864ed6b2a8762f953f58e206c8c8194 100644
--- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
@@ -96,7 +96,7 @@ properties:
         properties:
           endpoint:
             $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
+            additionalProperties: false
 
             properties:
               data-lanes:
@@ -105,10 +105,12 @@ properties:
 
               clock-noncontinuous: true
               link-frequencies: true
+              remote-endpoint: true
 
             required:
               - data-lanes
               - link-frequencies
+              - remote-endpoint
 
     required:
       - port@0

-- 
2.46.2

