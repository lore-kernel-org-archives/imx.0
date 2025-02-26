Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0024222587
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588866; cv=none; b=hvqlKIzTeVJRL8JU/piMJCfVf1f/TDifq0NZBUkHKvwY93V0HQ2dKQMfDi/dxPNZEk3KpFtiW4bXNJ2egLIPNOmpSr+m07oLfP/czFpyn3Usy0d3LTvylBidjwrUTQ/Pma59IE0Y4fTD6pYXX2O0So55tLvcWTTG9PWMe54dlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588866; c=relaxed/simple;
	bh=C2Mob+k4J3IoAbjsCJdN2Pf4fKN/wfPJXERox26zYvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JzVcIkdW3jkUyAZH1/ODAlR18si7+kvhGLsTVi8NbefpSSx98VsEJmmB81DRQVnb3U6iPUMmy+0So7VgBx4kQ59aSUVNVQIZY0tjTSdZnrGHoIwwWYNzDG6jt+upAUrVb3qNNR3wwVCgu3pBBKAFr/CPQuwFvZk12HzZZLEic/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHxyPhx8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHxyPhx8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43995b907cfso179765e9.3
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588863; x=1741193663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuMNXFiz3GQQsxpeqmzCHgRVoLvWr6tPdor7ZIiVrdE=;
        b=mHxyPhx8GiXoQGhdG/T5IhZr2sHInIIGzsGUWPUhHF16ry2AJA3xEVL8pwsvpnp3sH
         Ic8gggidjlxBMHaO2lBycv40Ns+8ATu5O0/1wHOp78bIw7GJoAHTiay61Y+ZuU66o3FB
         JZO9MORF/V3+K9rAwBBDkYvRVxscuk0wVQPJSpBtIFfW5Y1CUmy82wPVhkM+Cpd2o3Ql
         0FcFnE/F8pib5T575TvG1Ftzxpdo8qO1Hz4yciS4LqF0IBY3hpmA6aShgO4vcHgp/SOc
         QcERQT1Wk4lAwzdNJbQcn1D94izgRMMQwRH2hfhc+mzqz1e3eTfE7LMRbricDIS7JXRs
         9axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588863; x=1741193663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuMNXFiz3GQQsxpeqmzCHgRVoLvWr6tPdor7ZIiVrdE=;
        b=fiLxuvM7tP+ZaUXlFj4pJ/O3EvdnqqaNkBgZMmuPIP8/+m19iatM56fnAkzZyLxyeE
         cFffqfFwKTUW3Va7U5EA6zqropWCvMg3GkCTEOIHPbpsjs0HBQWY+ECehdysqh5l/CS7
         2oN3yEvo6sl69iqonhYYq9BFSAoWlbLEvxeTjdZFYzHaovrkRij8NE9Qzw8zrdcI8GYt
         4BW6JxedFPxzKDWd/6q9vJxS+KvC6rafHih1tK5einYqLYgD4OoHPDuBM4JZHTo3WfUV
         S2EO/gvazK1KOBGsUIaOutFrm3dpLTLTTJCufs4n/rLaBSkY3HkeFJQH0QkEowyp42y0
         ewgw==
X-Forwarded-Encrypted: i=1; AJvYcCXFrEkqOGR8AaXB1RR+ARVkp1KsFm68omFFwI8VztobF/M4FdtZSvgKwT3yXw4NCXbxFwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ234GSVEB5yscU6j1K95eo1cPT3G/mOfAQ8rdd0LhZzhpsRRB
	B74Uf3cicWTpxD2gwVMYkEI8sd+WkIUL/TbTcsSVnjRRSQlXUwDi
X-Gm-Gg: ASbGnctfI1J/srabIXUssS4OXmb3QfNGwnIbZ15XYFGrC0+cmL9IVh+9KPUuSHLL14c
	UXr80o0jAy0scrWqh41Hg8xEPrP43iMCHWREXY4O+6kWjGNAslMqSSLgmkkDEoXUP7+l5w8uP8T
	aFmMrS98Uo7yruGPeHeeZWlQng277T1FBRKmUZVpYWuf8bNiRpD5OUm5Ppb9LKKg62GKE8+qnNl
	zoFuwz7LXm8NRQuUGHhps16JOb2SmrDYK4YngfIIl7HsH9nbvfMzSd/tEpxvOJgM5JfDNavGAO+
	OpKoMkkp+k14j6rNykSblbKqnURjG1QUTuywP5yFbqPHrMi7wKrPp2z4GAi8D1Fz
X-Google-Smtp-Source: AGHT+IGzw1JxAgCRr2hkHehSx21ZaK94xm+T4qbqC1Q9fKPlmg9xMtjNJBFuBwKL4xp8lj7A86l4rQ==
X-Received: by 2002:a05:600c:1ca7:b0:439:9898:f18c with SMTP id 5b1f17b1804b1-43ab0f72a40mr64043405e9.26.1740588862923;
        Wed, 26 Feb 2025 08:54:22 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:22 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Wed, 26 Feb 2025 11:53:10 -0500
Message-Id: <20250226165314.34205-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
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
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..dfcfe4a8ae74
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,86 @@
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
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+  "#access-controller-cells":
+    const: 0
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@30df0000 {
+      compatible = "fsl,imx8mp-aipstz";
+      reg = <0x30df0000 0x10000>;
+      power-domains = <&pgc_audio>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <0>;
+      ranges;
+    };
-- 
2.34.1

