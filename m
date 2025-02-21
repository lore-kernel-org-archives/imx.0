Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E525291F
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165593; cv=none; b=tJ9W3R9OLxva9rUz3MeCtnjGkId1KZkW939dvs4Gp4M3OFFqQ3DN5txjbpHu86Zpzq5NKUbGa7PAEbAwrHJOobJ47vrGJgWoXCcKtuGwAIMmnpTnMnl6kYFS5Kc1Lm+Jo/98m7RRKSlHLJjtXWWQAZgcIY6OpdqwbXiMLGDUJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165593; c=relaxed/simple;
	bh=WkHeujAkkg3Au2pRr/mtGebqPA86rCCDJZj5FRsTOrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XLOUvftSIS2LeoiTs9LuIne3YCsUbz8JaZGaQXntAPfx6HSV7Epr7qKVoDujJKNm5Kavv7zdmZgOQEXPd213fxEYWuYFsUlRCeXNGxvANeT0phrrYMasXhfogCkUdxAN26AJo+Au9/T/li3nFP/ITHVhVuvuuo0CJvxg7dyJloc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mA+F2nv7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mA+F2nv7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb81285d33so487993766b.0
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165590; x=1740770390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4b85i48aqXbvqxKxPLY68Yu1QiHGt3S7QqZhpoTlOs=;
        b=mA+F2nv7IDGieRAXrebkTRGpUHpSEdqxpZHiYQoSWCWk5H71BZmqsDblOoKs70X8Tu
         6xnxsvNlmdOpwNOz10Jb2qYC0i+N0sdskS7nbTrcfGpA9V+OgCpHl9z6+4MdTxealm3r
         O6cS1BUm2cpDHsuXMwtCpqEN5M3Bdi0PaFhKe/V0rpH58hbtYy1g6etZbyPhqRPOav2Q
         yb+w+OAlqzdDlQMsGAR0yBSE+3MMwdQ7DnLdeEalQbF3Fg20WsaQMMCMXqohraG9aqZg
         +r19jMe98ywnZW1Ap9VaZkZw6drYU7JtMKy+yz87NQofXG2f3ki/M1UXZFU+HFYaN9V6
         W2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165590; x=1740770390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4b85i48aqXbvqxKxPLY68Yu1QiHGt3S7QqZhpoTlOs=;
        b=FKxJymfcJkL5nz597GR9uC0uILaOsg343UFd461/D9Ze6SbbKSvYmMx27PA8hWLg7n
         HakarvgN8GdFasT6nsVozq3Co0J/PrTcJ6lQ8p6nXNEZ4wmMwpxfRcOuNWdcjkmIi3gR
         YdJl1fFga6vhGVZyYqiwHqg0UsRU+Nhjgq8UaUdc+40NiBTLWTaLomVF+cAlpL/uSKOU
         Kmk3M1RrXz5E6Hhvn2MVcgnk7LrIPCW0IIqPzlHuJk4ahFOP505+S6URsq9F5cp3luv2
         aL1EOyca5nTJuEbVnTbvWlYkKgpugscCa3O1A5+6pTWo9Brre/kvWiwLNoBgbkO4M6oJ
         r+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV10mibesphD0+8E24B3cTatKL4VeNV/5JSn+3yD57MrikH3RGF0McvpNwAl91PfEDOR+E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoArNBPWxVPIW6t0CEdUY5XsnVnvys6z6iqrABoh+An1h9W5H6
	V9ZyUWeWjlbXmXrp64Z6GWu9HPxGkUZaMwOhLfkjGRxMYB12aVge
X-Gm-Gg: ASbGncvCerndCXgjbRfl7/ytNDihzao0qnlqeyk/RrHc7JOnJJuxb1oEffmpL4id/4t
	WLyRXDwiyWcl4AhV6OmLaatvR63k868Ns/igiiub102wEsiEfLR4CX+aNdwkT431PkKzPVyGcHZ
	x2wgeW6a+T50n/JbQAn1Ki4ahpSon1YSDTxxVZ5DKgyAy0huSQ2qrLfdmpy+pmjUUYVLGIdxtAs
	1YWxZbGRKoInVerDvNK2l1pX7ytzuqCr61e1dlNHPC5/CWACt+WhKXDV3eS8U3YuMgnKaW9ZVHr
	8dSPxXrFtvIKhWODMIJLmRRdKxghQJbldIrR3OY+v8h97k4gTX6CMOMsNho=
X-Google-Smtp-Source: AGHT+IG6R3La5hbh10fjcxDEk/iLRZQGIPtHw2SJ1aLWwKOtPA+wUEWP+H+spREkJWuxHbG0Va+SVQ==
X-Received: by 2002:a17:907:96a0:b0:ab7:f0fb:3110 with SMTP id a640c23a62f3a-abc099b380emr486410266b.5.1740165589933;
        Fri, 21 Feb 2025 11:19:49 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Fri, 21 Feb 2025 14:19:05 -0500
Message-Id: <20250221191909.31874-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..b0d6eaf70a84
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
+  issuing transactions to IP Slave peripherals. Additionally, this module
+  offers access control configurations meant to restrict which peripherals
+  a master can access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: fsl,imx8mp-aipstz
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: fsl,imx8mp-aipstz
+      - const: simple-bus
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#access-controller-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#access-controller-cells"
+
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus@30df0000 {
+      compatible = "fsl,imx8mp-aipstz", "simple-bus";
+      reg = <0x30df0000 0x10000>;
+      power-domains = <&pgc_audio>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <0>;
+      ranges;
+    };
-- 
2.34.1

