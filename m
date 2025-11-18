Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3BA353885
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472261; cv=none; b=TyBpzC8l2OJYbsBqsTrbV9/g2FVTBb+AJggG+bSjD0lYuF/HD34RhQB/V+eQ7Mtl9pDZFU8cL3ZQQHP+xvMo9oHdj5HFhnYXKL/AXpvYEO+uMU98KHvNBrhjbXt07L46VYDyOIVZU3OX5BKy/wHP5RM4++1iVqeuxVrk+PMRAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472261; c=relaxed/simple;
	bh=W3mroZUPay3ZZUMFk9IeIw1C7/7Dav7MAdwzRbZPD+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GTDijji1SCagotgjS0F296sL3/bfbceMhrQXSu6sfBY/BGdmshD6Cc/j75ay9ha7P1mSZiNyHjQ6cDC0RbfPP3NyWqUKiPWSH6xF79L2LLYTNTP3nzolHDlfY5zIhSyXTKi1ySHahAbuxA6ZuCBZ/O6Di/MQ183BryN639HupRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STcIFTUw; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STcIFTUw"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so4386866b3a.3
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 05:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763472259; x=1764077059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JfHC3Wbcd3Ds6ua6qw+uzzcAe5uA1zhG8wWh+jJWWKk=;
        b=STcIFTUwCvFqjyZW2JwapPXSrilxeWAw0OiO3Nrp8H4oh5VqKDuNysMXW6iFP8rjkF
         kw7CdqAO2limtJoxM4QPdITGE8l+fiSyWA2fWG0d1h/fv/ZAaOYkoYtH5VHu1PRRTze4
         uKYo6arERwPwVi4kHjOWD0mH3izfgXwm91B8ooOx+Rdx/Wlhnoz7GoqeiFSryABvDEad
         HhO9lRHgN6VdsGZQaNyDYZ6MitbIt8DjJ+bNy8vFiuUYX6w9meCt8NDwRFpz3x+HAcl/
         GNo0AX4U/JdE9ICZh4M+pNa+fRtQuIbPwlPawgGlK+VVhC6CbxqDEfMlDy9GBCh79Ae/
         8gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472259; x=1764077059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfHC3Wbcd3Ds6ua6qw+uzzcAe5uA1zhG8wWh+jJWWKk=;
        b=Aa16ZSADNhyxy0ZJgNRvxa30utA9sAYprTWGsGPUURpXcevLOEU9Xxt4H98WvgniiT
         93P7akc01IGb028OsVh+aq2uwZjhmauINAAo+ZzeTFOIoRNoMgYsqoNt7nI24Hz5TCFN
         ZUx19C+1AYUk16BuQ1LxlIFLUWUJ1p5swdOPmFY1iaHI9vxaDaF9oMaPCm87+u2qALC/
         gIwBeX4o18yDYd0R3pjdVCSYDQgrBZ3GlXQXE1mfqQYFli5UsfgDOm22aPViAN5E/Kyd
         i7dFsNnTELoNJVL+B7WKT74e+0zwKFuAUmgdSg11awHU7YUXAbI7QH4vVNralDtEk+3P
         EtBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJPHL776UtM5A/aHFk76serZHhsznMT7+aYOl6f8hZrQeqg6LqmjvjbAtW+AwHw1nqo9c=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgfr2E4x/spGXMBEGf5EL9XyNQo9MV8cf1FPvJiUGe1mqHHMyJ
	Qx1hUttEDCEVJXXuH8gg3M1oSCp8ilP3jsjtNkD9M0BiZUoKSTIWqEiA
X-Gm-Gg: ASbGncsfqH8JoR6Vm6z8fkofAc7QriiSBtAQ7Gn9EIuT11lNNbtbabJHdgKni8CF2CA
	QVza2w5OvV562P6qXPrDdMJXaSW7sWig7EcRyFOfzJtAZQHZ9IIeyp406VBKs4twxgQuHwpWecx
	cVoxbueU5IpSxzspF65AthNjZADb6CA1hJGTI2YtiNd9wjTAFVhrVIDOzleQ3EGBdsfjTHppKd3
	7VT0stOZ2hPIecoS7+s92XaoAS3mXKiRImMdRcklYfwDV46+Gn8yli/IUiR8VSYur8VRTaEC2lY
	ElInOttXAXeqilQqdSkwtj/54ISL64XsUAxRshV1O2R1qINS4Z0cYWoS0lJRwFDiLUuW5idcyeY
	u14HF9t4UI6G2/Re8vheE8ukVf48QdKCimIOjLlx+Y7jCF6W0rE+wcq5hHrem9uswU4wcQMJGT3
	26y70ivtMuR2ciKbTORnzSUHv9Cvuh1GQDldU=
X-Google-Smtp-Source: AGHT+IEjOHi7qZdY1X7C4XG0KQgH5xR1MDapZ2pWxtotMjqqRBYXWUWNxE9uH3alv8dfQKa3CAlMSQ==
X-Received: by 2002:a05:7022:3c15:b0:11b:c86b:386a with SMTP id a92af1059eb24-11bc86b3a2amr3153643c88.5.1763472259170;
        Tue, 18 Nov 2025 05:24:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885d8sm66885134c88.2.2025.11.18.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:24:18 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: bridge: ldb: Document nxp,termination-resistor
Date: Tue, 18 Nov 2025 10:22:07 -0300
Message-Id: <20251118132208.143315-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional nxp,termination-resistor property for the
i.MX LVDS display bridge.

This boolean property indicates that the built-in 100 Ohm termination
resistor on the LVDS output is enabled. It is controlled via the HS_EN
bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
signal quality and may prevent visual artifacts on some boards, but
increases the power consumption.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/display/bridge/fsl,ldb.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90d..6bc786204e65 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -35,6 +35,15 @@ properties:
       - const: ldb
       - const: lvds
 
+  nxp,termination-resistor:
+    type: boolean
+    description:
+      Indicates that the built-in 100 Ohm termination resistor on the LVDS
+      output is enabled. This property is optional and controlled via the
+      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
+      quality and prevent visual artifacts on some boards, but increases
+      power consumption.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1

