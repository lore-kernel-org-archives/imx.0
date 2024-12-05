Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9695C202C3E
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397593; cv=none; b=uh+3a6i460wodtXXJaE4C1G9M82kLWrDymr3hclbQy8aW2v5BoA3tj2vNexShyyhuPYzSu7nHTYA7pdsAmWwPnZFhX9ZUOFA6rTqFqjO1sbNeUlUMilYq5cXzPsx88618uJITJTVz+yPJHQ6oOmT6NOqY4DY2ulX7h+tLLPKonw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397593; c=relaxed/simple;
	bh=tD42VlJ7PTzIYUr1JF29OIvvFzjhry4keUPg+5EL/88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2E0fVg7roiTJ6LnzEHPU2OZeTtoEXOoPd6vO3RY50HkjYxW4v3Qt+kihty02GhQX7Db99kEWSztbn5xPaJTZl2i2K5+FflRp1/Zk7swQl1mmE7BdFkgUpFvrDvyEOr05UdU9IlZ1wWAEgJfBvNMnig32jHc5uk8pbK224r6Igs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lrWWTPW0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lrWWTPW0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa549f2fa32so153875766b.0
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397590; x=1734002390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiY/U6wqtKU6IpvnYGmb6LinIE6E3Eav1zsujKOZRDc=;
        b=lrWWTPW0zvVPNBYR3SHHrrTsIkTIASz3JBCahe/Whko7gBgSCn8du/7fprvNHe7XbR
         aNL7Q0DKc6riWfUHX+NJvarwxblK/WKtosbKNQkhymVx0YCNYrcyVLJn+Qpvo4kavSGK
         AufBuMdT2sgjV8y0zDnzS202ZHMYprrq7WJjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397590; x=1734002390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiY/U6wqtKU6IpvnYGmb6LinIE6E3Eav1zsujKOZRDc=;
        b=BOX0qTcJKQRTA0cIB7IXCoKrsjUu6q2CbwmA6zs2CIt9bZGdAh73Q3sZ3C2wc2tgO0
         Uo13WidXlKuzCho7OLdGl78nNBhrsixZoS7Q99gdB2iVjbXGzmbMfYNihCk6gO8Yufzx
         VUwd978EToXazGSsOTFC4pej+Js/wIqq2TkHpkLw6gnfGmCal8t7qjEy5BGcEpq62z/5
         KuP4XJaoTILEtnG7zO5J4mkQPTcNmxK5m4JV+1nto4wq6ZUwgzjJcTyqdOTM7q0XXJtp
         6hbJunaVUOGhNaBv4Gw0mLb+XgWf6tYXVLAz9d2LjtNdhjP2/Wr87JvXHX7x9D6aPlvW
         YU9A==
X-Forwarded-Encrypted: i=1; AJvYcCXW1rR/FK3e0j6WSs9ltJzQ5Py8TzUiz0QFzvFA9/lr5k8z9q8VpRGNc+OZjaioOHnz9Y8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Thkb63S85jIOUxSi5BnXj3Raedrcbbf3uKZqximEL5VO6dtI
	XHwudYfrGhKnDh5c/zX34Ku8KvgBPqZQD163uZ5VwgVJperE8mwe5Fo9stS9XD0=
X-Gm-Gg: ASbGncud4qEDzb3HY41bcVRNfIBqwOdsFCeFeRlLSnXra/vPhFBs+nHj8v+Y6/84vAi
	WTw43arxCk60K+MjRZid0I8JWiXonqnCTlK6x5dnIClIoC+oMvceuL0d5iR1FcSDpLr/8z9CjFm
	ZPy/QeY6T1fyWZ9g+VNmuEUaWJtswp+SIHABh04dHOztcZ9Y+kmPToRI8SzE9PVxPSHFJFzlOko
	j1Y1qUvezgS0SbLvpczuMj0BtVSvWzofh90+vWDU8lIdwAoxG+/pK4/WbNwBwkE/vinokFC5rVa
	caL3nn59AY/HpoROHOmMBUbfWAAg3PMVBma6JPnfrwZeXQ==
X-Google-Smtp-Source: AGHT+IGIry/HdfnXsGul2UAgCCUzoUgqWIlhMfl2Bt3RhnIZpkxjsd0JhMpVzy2Qc3h9grs6M8D/Og==
X-Received: by 2002:a17:906:328d:b0:aa5:46e7:4baa with SMTP id a640c23a62f3a-aa5f7cc1bb2mr781689466b.7.1733397590083;
        Thu, 05 Dec 2024 03:19:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 05/20] dt-bindings: clock: imx8m-anatop: define clocks/clock-names
Date: Thu,  5 Dec 2024 12:17:40 +0100
Message-ID: <20241205111939.1796244-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define clocks and clock-names properties of the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 .../bindings/clock/fsl,imx8m-anatop.yaml      | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
index bbd22e95b319..f439b0a94ce2 100644
--- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
@@ -30,22 +30,73 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
   '#clock-cells':
     const: 1
 
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mq-anatop
+    then:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 25m osc
+            - description: 27m osc
+        clock-names:
+          items:
+            - const: ckil
+            - const: osc_25m
+            - const: osc_27m
+    else:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 24m osc
+
+        clock-names:
+          items:
+            - const: osc_32k
+            - const: osc_24m
+
 additionalProperties: false
 
 examples:
   - |
-    anatop: clock-controller@30360000 {
+    clock-controller@30360000 {
         compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
         reg = <0x30360000 0x10000>;
         #clock-cells = <1>;
+        clocks = <&osc_32k>, <&osc_24m>;
+        clock-names = "osc_32k", "osc_24m";
+    };
+
+  - |
+    clock-controller@30360000 {
+        compatible = "fsl,imx8mq-anatop";
+        reg = <0x30360000 0x10000>;
+        #clock-cells = <1>;
+        clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+        clock-names = "ckil", "osc_25m", "osc_27m";
     };
 
 ...
-- 
2.43.0

