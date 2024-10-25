Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C945221
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729816931; cv=none; b=nctBvLBV5Ppof/m3WJeLlzW64MblY1ZB30TBCI4l6aw6O9zHRdFDBw7oLOITRX4/6cA+smva0wWLcy0GftqOetl7WdfWKHTMU8o+6UXL07MZttVmXA+Yk8ib90/q0/m/pnuYKM9xld1JWk58gcvV2BeeEPX9x5/tgTCUgcJI+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729816931; c=relaxed/simple;
	bh=kpvJRcPqWC+dVghUUdeaMiwqWPQQEmBm2CSq9EI3mwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KkPLRRbqB3H61Tbtbv37/LeiEnYCF/7PzCB2dQCLWjdk22Hi72Pu+/D5Hx/Tegbxe81/gOJqZcZ/zaavAa7mwPdMZFRfX640E716YptWG2F2sWAZqhvw75ZPW6BX6VXCl2Py73ty7aUj3nAUKF8PekNz27Qw0RAvQ0iZBZK0q/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NngXOX0o; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NngXOX0o"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e5f968230bso706586b6e.3
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 17:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729816928; x=1730421728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JH4ZQU5AFvRH7Qn9sg9MSQ3ssLfCpHuJRXQbGQoDWQ=;
        b=NngXOX0osM0twNX9gvccqhbOazhrLYaLB3gQ7RgRjKbht6HLEK7jgTjbbwyOlnxu0I
         XyUiB4fMLXeP2FN6kphgYXHzCBqyxgMqqM5ruVEzP/IIf40jdN354X9Bz0k66DgtfHG9
         5Uyst1nZBG9oE+mGrzO3uJdYKCsAE6bvXW7q4T3F23cOz8mt/gCX4XoyY7QM7H+15mba
         +yzueE3ruqw0WxhFbjtjkbC6bO++5gmubYigqZb9LGfp0n85EeA6o2bImP6Imke/7Xqs
         iovdirniFwN1TpsfmVPOkwL3VjkYE0XL0BtOwfzLKEOn7n0b/U6XmPZhC1dQ1kelGHFx
         c04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729816928; x=1730421728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JH4ZQU5AFvRH7Qn9sg9MSQ3ssLfCpHuJRXQbGQoDWQ=;
        b=IDSWQi1rtsaDSmOARPRxgsiznV7GR9e6Vte1kZJC775GeZHjBKvrZbKlJR6QjNiS9h
         7rL+tx3/hs95uGJWkhaLlFRmcO3KX9Hk9RNiB2xCm41Rs4ilSMqk2MRr6IzxeXjN6/vp
         R+krZOr5Yj+yjNL7nlaNCbkPDkN1JHNsCNz3OPAVZk+CKkDmPDNLAG9g0xniABwwFwyl
         SH7E9HaQwE2FySW+GlRJu4SjgMBNhAum7Zc6y56ULn3igrE2Q1F1H/Z5S50pXrm/RfTi
         AQbLPob3Re9mDI3/Ia4wLVMLct7a+zX9QXX8pwnqFkjG8YP6NiQ0pw0n29CNHmV8Mfw1
         kzQA==
X-Forwarded-Encrypted: i=1; AJvYcCVK98EpqcWi85DXXf1T0W2CU1s8vdJLpMtk7hdsu7R0nWARW8CdBmnGnVTETv9EQ7vEJYI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9yzwXLgQcb5qaziOPwcAO8bJ+59vXKYphZYurBtow8w6s96aE
	3GxHVBPagTWzi6PrBZgCtnd3FW+EJbm/W/s43WS+sAIF1KFOxxIT
X-Google-Smtp-Source: AGHT+IHhO0Oe/ES3dfFw2XAIiGrW09kdGvbnuxejTHYBTvDD9QQCbHbNJqfVJPaqKCqsiNhoGM7kEQ==
X-Received: by 2002:a05:6808:1490:b0:3e6:21a:9a62 with SMTP id 5614622812f47-3e6245014cemr8084123b6e.11.1729816928153;
        Thu, 24 Oct 2024 17:42:08 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a3d2easm27289a12.85.2024.10.24.17.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:42:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7 irq number
Date: Thu, 24 Oct 2024 21:41:58 -0300
Message-Id: <20241025004159.1571782-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Unlike the other i.MX devices, i.MX7 has only two anatop interrupts.

Add logic that contemplates such case to fix the following
dt-schema warning:

anatop@30360000: interrupts: [[0, 49, 4], [0, 51, 4]] is too short

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../bindings/soc/imx/fsl,imx-anatop.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
index c4ae4f28422b..ae708a658d52 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
@@ -36,6 +36,7 @@ properties:
       - description: Temperature sensor event
       - description: Brown-out event on either of the support regulators
       - description: Brown-out event on either the core, gpu or soc regulators
+    minItems: 2
 
   tempmon:
     type: object
@@ -52,6 +53,23 @@ required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx7d-anatop
+    then:
+      properties:
+        interrupts:
+          maxItems: 2
+    else:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

