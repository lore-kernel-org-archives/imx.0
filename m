Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E62DEA96
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870185; cv=none; b=LdNpBkjkT+vywTJtWV/T68Q4qgWPnWmxF3jbfIihxwaWTmd5FxcMgDjU9ESaQxcZRIggwz5IKf4z0PjkUA+qPNFdPh2QwUTuh4V9KD27UUPplY9HsVMMC8uZrGZroznE/OB68GDJ4dy75h6j8MbQUXePKSQ+WD67ChEaWsCqDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870185; c=relaxed/simple;
	bh=RJXStlwzS4+/UQXUO3hnO45i3KP2svoFAvMb0SbrmwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwLOOaW0501Ip+aTxj0/NXbSZ7q72GAv6yUmOtyl2K4/I+22Cy96kHCtUIsNDFmtsHa7qLTVAYp7cFQnrjuDvjWmBe2dWJv71AjoSK8FUfvv/3YStyQ9A+/szQE1SwwGXgOm+RGb2iDJZpvBJjcMeBY8jr5tV/b70FPD9dJMrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TXjcgEo6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TXjcgEo6"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b04ba58a84fso460066466b.2
        for <imx@lists.linux.dev>; Sun, 14 Sep 2025 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870181; x=1758474981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMdgI0iZ2TvocV4JZ7DyZgorR1pQL3heQi0CeqfMARw=;
        b=TXjcgEo6BMJcuCpJ4aDJ8EGqkqqWKdUcifTW/OFvdkassNy3jx7bdBrNZsNgJKp4XQ
         yUnXbz1myQtLpdOuunlL5Bjn7PRfgJ3ZdYLyx1uuLStqHhJov0gjikCpKCq5zUZcXX9y
         2pfQwUdJUUdSZX8ELk4pzvV6Pz/pL8PZiM04Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870181; x=1758474981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMdgI0iZ2TvocV4JZ7DyZgorR1pQL3heQi0CeqfMARw=;
        b=ks6xUyH8JH9qPX+PzYuQrtgvpibGnMPWlpLUivQuJO6/RMjfvhdvOaNPkuyJtHIy6+
         qcocLAt24ZtgfAWUaZ7i2wv7E3uq5IMS0t8kvDJ70C8N0aneBpd/or4OH5ydvpKg1ElB
         M0SPZGvJimda54H9I3wMnxzTB+mxv+qitOEqW0kTmWf7vAWGmFK77EY+YCdjHqf86u/3
         h2mJ1bVymvzAzQC+ff7gNowBkg8mG5i1mBMyzF/S2HrxWAYAu82OpwSi0eZInu2LeDJ4
         aE34a6LTFirQ3zIFxbzO2ylxjrzuHc8CAhfa9fWkR9v5PF80SAzVOSedCGSqE44R2bFl
         P1iA==
X-Forwarded-Encrypted: i=1; AJvYcCVGlL4sbbNHLdI/+BEqYjgfinR75c6JlGkZGrFItOH5/jrryrHOn57/eVpw/SfRv7UWJ5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFzChTedQXJoypIf5SO7pJHI88S3zZkP4yM6Sta8LrqKH1Cum1
	wcFy492btmLzfbBygDy5TsJtqMhf7LcvNzJNW+ESqab96YHnVglJpttGEPNn7b9WCdw=
X-Gm-Gg: ASbGncsBx4AbFLKgJNM4+eUsudcNla2kP5yhFEoPWgNV1Wxe8u/UjeyUztxD3Dy1q3C
	m5mZx1aMd91LU/esh9Hame7JH6XVc6AtYvPzsAfxZAKd1BDuAntDOy5PnyNsNAVS5TjT4glOADQ
	962JsyLvoYg4itm6W7JgqusL+MkCwcmJmh0WjyvCqUNEvwY11CY59YafML/kTK+CYZPSZwDiU4R
	8qDmi4o5huDOK8toadx4W6tBmUFgMb3KHAy8tb+MjuRKK5baheOGKwZ5S1ljhCssepyerJKeNTX
	pls8AUVP18MsCELU9J/Ly+vDaylEezkOLshjTV88qANxdOogtFB0GVsChvTttPoC6wjsOyG3uki
	x17woiyGBLRTC3yS+q/W8P0n4x94bfyyVyGsccp/Ew6KgXXTD5xQTrs4X3rWYLCBNcNQv6Vb12G
	5dzwX0j88g2gwQimms09LndbCJB3VQ6BzgmJEXA89niS0ALia4KgZWfNMFGbvoz4B4
X-Google-Smtp-Source: AGHT+IHfjFWKG/mF8+Rc9t6eyI85z35rKOGB32yV2tBXoq5uOjqdENe0BpELyw7Da4eiS0RVUPNPpw==
X-Received: by 2002:a17:907:c08:b0:b04:3a46:c4f2 with SMTP id a640c23a62f3a-b07c383f1bemr990265066b.48.1757870181371;
        Sun, 14 Sep 2025 10:16:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v2 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Sun, 14 Sep 2025 19:16:01 +0200
Message-ID: <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the touchscreen-glitch-threshold-ns property. Unlike the
generic description in touchscreen.yaml, this controller maps the
provided value to one of four discrete thresholds internally.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..310af56a0be6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,21 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Unlike the generic property defined in touchscreen.yaml, this
+      controller does not allow arbitrary values. Internally the value is
+      converted to IPG clock cycles and mapped to one of four discrete
+      thresholds exposed by the TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
+      Any value provided in device tree is converted to cycles and rounded
+      up to the next supported threshold, or to 8191 if above 4095.
+
 required:
   - compatible
   - reg
-- 
2.43.0

