Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F41CF92
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062004; cv=none; b=C2KigbSMUY03uaYPxbPluQgRoVHHuX+RMEOzczqdM2KG/ok2baSSBlVzi86QXPbmoIg7gybGkn5U9ofz5e4HZaDE+31PjdmoYy27OvWhVPOfnt1TraKRyvmcSbuZ6xmFSn3t3orYL82/cLFTcvXXaQbBXM2c0WAVJtlEzJ1ucW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062004; c=relaxed/simple;
	bh=KxhhSwZpJ8R3MqZlHHkvsmpFuMpX/g8ZczfW80IX57A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=THOu4D+yjTW+ZaZz5N8FqdWygeATnkNLNi+DihF7kJrYbXNHnY6VuJhJvTxTIOSXtJPdXo7Uskjsx2WnuJIPbmDmIAMF7nvTc23zvtdTo4u7a9ayeMlT+Zbj9pOIhjxw/t7JSpxuFQbrmHwrsX2/I8LCuhAQDUZMfYKwbUzMG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjjG4rqd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjjG4rqd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso31517795e9.1
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721062001; x=1721666801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BE107BcHqsNE5dZ7htAOIriFiMS47OFGE7QlqBRD04Y=;
        b=IjjG4rqddmo1+R7YwUMVwrVcPjgO1ncmI8THmZufkkQQKruPFApvvzYEz9CWBq+H21
         uYex3oKr6pdVuyW90krpVOL5AHPwUQticSVoMPR8Gg3VPp+wBc/d8f/STlLzG5ciFwKf
         E1hGo+I/VphlIVHxiUiCsnBqcgXIa921l6IAMPas4utyqA11KL3A3xgn5S5+zJKFkR7W
         bSgkHZCpiVbSD0Ee96D1cY2Xtq47d6F1AkG5VmDhmKUl9eaNZ23e1HQVvcdeQMQWGVky
         sQrY7Y/ei5qfmlVkBFus5154hc2vGomkaJoyvqnV+VJ2Le6ZEZX7QMCBzjqHbSZ1Ni/d
         YQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062001; x=1721666801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BE107BcHqsNE5dZ7htAOIriFiMS47OFGE7QlqBRD04Y=;
        b=rwz+n1wCgqtmweD95TbFqZKC0u08divdmuYF4moNnNuVlzeWjfSDcmlHME6wR7W7bU
         mJ9mhi5UXV89/s0BdL+AW2bz0Fb6gzmpqB0xSjhlYK1wDWpHbdThk51Dvahy/x2IPLXM
         a+iV9DzFsMg4Zzl1MKJgipLyCGyBJmVEJgVeNna3sr/ga+gIuFHn9Hr5PB2LH9vNGoze
         HdDln4oPI7xpBdY52Cmg503KwjqTH2DsvyWR6LlEhZsY4zFGTBFXvh7CZZgwcKLhRyGM
         py6f1zDcbeqTSKgAZvvm6xVds1WXjpz9FRJXbRwAnuFNIO7mbhb861JtzKlm17Kiy68p
         IsNA==
X-Forwarded-Encrypted: i=1; AJvYcCVX5khdZ53YIAgFqpYgoNs8WvTQ0bw+q3yQ+3YsJoDxzdZF3II8+/NQi/z0s617R7N+FDIUlbnuj+s+6WJ6zSvr2lJF
X-Gm-Message-State: AOJu0Yyq8XcaEzLfsEZKdpQUqvmzyPV8WSfb/5wAAcEwfHF/4tHStuzq
	MyTaPo7+7xcQORXBWvu9CUG0Jmb0i3nFdAgujeQcCogM/5sDBMdf
X-Google-Smtp-Source: AGHT+IHIy6chjAutKf/iJIZQURe9szXYTSWbYLQqamzyq1p7dzNS2ZlGs2F6yEGiZtrsigYIbUcOnQ==
X-Received: by 2002:a05:600c:4e90:b0:426:5d0d:a2c9 with SMTP id 5b1f17b1804b1-427b8893008mr1417175e9.10.1721062001372;
        Mon, 15 Jul 2024 09:46:41 -0700 (PDT)
Received: from playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e7749esm94316975e9.2.2024.07.15.09.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:46:40 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: reset: add schema for imx8ulp SIM reset
Date: Mon, 15 Jul 2024 12:45:12 -0400
Message-Id: <20240715164514.8718-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715164514.8718-1-laurentiumihalcea111@gmail.com>
References: <20240715164514.8718-1-laurentiumihalcea111@gmail.com>
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
 .../reset/nxp,imx8ulp-avd-sim-reset.yaml      | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
new file mode 100644
index 000000000000..ae03c5750fa7
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
@@ -0,0 +1,59 @@
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
+description: >
+  Some instances of i.MX8ULP's SIM may offer control
+  over the reset of some components of a certain domain
+  (e.g: AVD-SIM).
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
+  - '#reset-cells'
+  - mux-controller
+  - clocks
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

