Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A64EEB5
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727027007; cv=none; b=jY/CLA9Q0CnpBXPjdGHtqhs0M+QCTPW00ThzWfq4Swfe50lX/ayMoEeaSYFVuqCOCt5E276tqVaWx0aG4Jo9GS48QUIdJg75jp/H1NjF15X30OMbqZfMm0oG3GfFdZyZ3vRmx00Gq/ejCMGxOUiRuL2Oil6g7Zu1pdYm9lEZGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727027007; c=relaxed/simple;
	bh=mjvAP+JnaPfWNZUJhTl7ospoADxFXh1F9b20zOwM8bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N/v15s/t/RR8gFw9HlPRS5JJzQ1RsdLAU0BtelA6aDfE/Ux9z+6HDYM8p+XIdltnlmMzmOYaUK4J3VO0CaiEjboYjk1rzxPEnEwjGeF736xnshUdymKylUuGzKAzJ9+Iw9c1ShWTFHZn/4+2DgL02iO2tcMiz0ywVG5cO0fEl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb9FFMut; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb9FFMut"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so46024525e9.3
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727027004; x=1727631804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAjYhVQ4C8qjWITifRAvYNMOE8p4qGOmbG7rB+b/sOU=;
        b=fb9FFMutJFY5Qtw9hyS2xg0w5Br9T7Su7RlE6wn16voJZg2PWstied4K3plrCsk4O3
         BjnrKrhk5P8VpJoTPqyNMECcgQdoy519/2XArLK3xxXnvEGLImQqtqt+ZOXdd/JjXoOX
         hptS6kCXFnfmkUBspfrlUMUgY9bJt3PL6+w+jmYg6Kf5jZ+R5GA2ytasHPtPkbI/MKb0
         Lki9YJdYq0WI9z+WlxxqAMO8AkqV9Zg3B1TWnSPuejxhZ/wpAg3bG+ExD2D6fykMBTrV
         ro8ofJrYWNn2P/vOLvZ4Pj/KpBuQZf9b+w6CI8XXAKt5KF++WlkI6ys3+qKsLI/lM1gO
         biuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727027004; x=1727631804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAjYhVQ4C8qjWITifRAvYNMOE8p4qGOmbG7rB+b/sOU=;
        b=gIzioxtyubqlxqtnhOwUOVhVyW2Av5cVU+YHYAhOKJ1C9WZDyiRjHpWozbxpHU0CFF
         8024Dcu721mOgPueWqNjY2S8SK0Rj3Fd1aJoRxEBoGRYnMOI1PfOdrjLWmMrQF+JOVkR
         dr4lJyLiDszyejO/bxxrBbuimTPtsAlXsqJMFPhDEyogSqS3Y/zbe6p/hGddyLh5OieK
         pMBTn7YF4Vk3EzS//tVpCfHGqDsGhBw1nm/f/TwJRUFLBRzBAtkUk6mrTWWLHavIVj47
         asmIx8gX+AqWYYV3P3vDUjqO54WfuPmuyPhYfuDwVm+E2ZJkTr67CxXbolSSj6P6xQgD
         DnwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX7myv/4/KVdEJQ7oEdVJr543EbeCFg6//buFrvtFXvTAYrP+4dfI9T8uX07tdippdh28=@lists.linux.dev
X-Gm-Message-State: AOJu0YwctF3mL29cjpciCbutKFtb5XjcigL6SRUKR/CUCZH4E/QRVgqd
	cxm1FjMKI6AnZwnyuTax/An7VzCF9bqPen/RziYAQh/Q5eRsU9oK
X-Google-Smtp-Source: AGHT+IHp7HvXth4+/t06EUgh6Jxqi0dI/PkunLPhvuAKvjxVJB+S7Y/BjsFPWYMR3mh0rKxVkNkSRA==
X-Received: by 2002:a05:600c:1e23:b0:42c:bcc8:5882 with SMTP id 5b1f17b1804b1-42e7abe418fmr105816945e9.7.1727027003879;
        Sun, 22 Sep 2024 10:43:23 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7ae60ad0sm80758535e9.1.2024.09.22.10.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:43:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: reset: add schema for imx8ulp SIM reset
Date: Sun, 22 Sep 2024 13:42:23 -0400
Message-Id: <20240922174225.75948-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922174225.75948-1-laurentiumihalcea111@gmail.com>
References: <20240922174225.75948-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add schema for imx8ulp's SIM reset controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../reset/nxp,imx8ulp-avd-sim-reset.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
new file mode 100644
index 000000000000..f6797966fd35
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/nxp,imx8ulp-avd-sim-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP System Integration Module Reset Controller
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description:
+  Some instances of i.MX8ULP's SIM may offer control over the reset of some
+  components of a certain domain (example - AVD-SIM).
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,imx8ulp-avd-sim-reset
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#reset-cells'
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+    syscon@2da50000 {
+      compatible = "nxp,imx8ulp-avd-sim-reset", "syscon";
+      reg = <0x2da50000 0x38>;
+      clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+      #reset-cells = <1>;
+
+      mux-controller {
+        compatible = "mmio-mux";
+        #mux-control-cells = <1>;
+        mux-reg-masks = <0x8 0x00000200>;
+      };
+    };
-- 
2.34.1

