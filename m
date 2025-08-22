Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6A029994B
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755885569; cv=none; b=pXCg+n9Oyft60Yb3OroGS7dlTQ7/idQl92FITb8rvt5cg/M6GhWu4voo76m1+zAyjrDCJYau2njoQZR72BVBTo2YBV9DsT7osz0zJjYuxlR1Cd0efYk5NL21XXjOTTOTMPSvkhEn4cAID0hOGX4c/SevpKuUiEDquIIvBmStSso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755885569; c=relaxed/simple;
	bh=7AXb6D8zIILrgdU6FDSFiqmilW2h/3kHCLZws9Dtjjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uRZqU/gLgoTFqoI5GfLPTuZgJKLMgS1dvENHf210p5ooO1oHpbwlrxLl3drhoZOhbr4DPTsjSz4TyRa/2pDuolxpqjKkvJkbzzmqQZzhEhDJU3biZnVv44ONtb9zrD0OqmUwjEYtW9Qr4BRlKu6aBkHYW8ek3RsnAwAsQ9VkgOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjyuGlS+; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjyuGlS+"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b471738daabso2183085a12.1
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755885567; x=1756490367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5S0VnWVEsWUOlbF2JNExqMbPEHI34IpKB3N4D9KWu/w=;
        b=HjyuGlS+bhed2n/40/9NIUkoEqsB6BlKjliul3CRGlgcS7hguj4xFcTJaL48QswJ42
         hIY8ZCAMXENcMBtfy4wzCH9iS/qn8JhlRe3ddOrw+4B8aqHclpIO/X4nvq4HSdwUxysq
         SdZmr43kr32CCjaN7ghNZjng1mbc+iqhjbLGgDkiFDUFbWkGMKLOvjfdC1DOokK7HpHy
         bCHtvQK4jTts8HNUmydEfNoTh1LdYt+P0jSM8DC3eb+7L+8ZBjSZChFG1GYsMCB8Wy4i
         UeUeQ17yEHXnEURuDj4iCVVuQxsTI4ZB+LZHYbLlC1J1xO6OwA0ODntAWIbZyFJmqrdO
         4IRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755885567; x=1756490367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S0VnWVEsWUOlbF2JNExqMbPEHI34IpKB3N4D9KWu/w=;
        b=mRtyo42jy2MyYrbaFGwt/b4QxWDSt0g0D4t//XJZl5Kue4Ri+D0lePQmyhvr639KDC
         St9xB9tyyVVRAM3xCWm4tKCqSsao36irY+Si6IVi56Pon/ykEcOR9Hel2ZG3+fXwEaOi
         vNvvb/x7wjQZGHGUbSSmJwmwcMMeMqz4gKVuS0c32FBqy3O8S98zg82tGXFjJ6YEUFNj
         HgesHPAVFqpgOEaPVqMCfQydnswuKyHk+y6NkoY+vD+2JfcH2GwjCuMqsh2Gs5KPlGe5
         M6MbTrArsLD6P8m1P9uLfhTf5n8oJPpEd1A0fokbdoOdekOrrN5cnSDuCkyYsngjyNeL
         rpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCB/f5bZQ5To1/sck3+NKOCXzRbxdhlEQL0YzaRYyqHR/XP2RfA8oziKXCVWf6L3EmV2E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOGhboRzUHFeEGEje7IrhACekAEWL1coFKFlD+glsMs4CqxpKU
	hthzwccKHAPsIP84ILdXmqVUIbUaReko5qQNaV/gGRxRoI1KvgwhMn8G
X-Gm-Gg: ASbGnctouxHcOR52uDgSXJrTmR/iYrq5PYh/pdHShm/gBGpE9zLg9QQi8XxXLsjJfpz
	Fo1ncVugdM70PwIxe9Wd2bb1E8xKykQE/ghQTbEQd9mCcxrvFIKrSRYvnR1CmIwwB4zZE8nWZYm
	MIMmXPnY6nSxoffEilXgjDHVSpB9EPJhIbk8E4NDT6d5q4Hq6QUFpmMOgYERuOogBeLjyT3oP6t
	SYv/KqUfxQRS0mv1pE5Awz8pBh3AU3PGJyIU7pXXNIvfGcnaMj/N4ClAH4vxHsgBQ+e9SmPOT8F
	NXF7Eu52PegQPTJUdSWWtIgvVS0ef0Vevz+eoMm5CCKgY2RDLwlvnBhmNfhIJqgR8QpD1Nh5EVy
	eZyGUEpCsIzcIARqtkrMCBTXUKDtnW9EfsFnu
X-Google-Smtp-Source: AGHT+IFPwieLOBgTuINcc+wKmOGc1Gww2KUqVQUwLOKZFRGimkYw5WrBP3+FtGEluZJwMaIuC4sfwQ==
X-Received: by 2002:a17:902:cccd:b0:246:4fd8:1983 with SMTP id d9443c01a7336-2464fd81ceemr27178775ad.17.1755885567198;
        Fri, 22 Aug 2025 10:59:27 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5ae1:41a6:4f22:1c64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466c2ac55bsm1231955ad.119.2025.08.22.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:59:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: cassel@kernel.org
Cc: dlemoal@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: ata: imx: Add a reference to ahci-common.yaml
Date: Fri, 22 Aug 2025 14:58:30 -0300
Message-Id: <20250822175830.91682-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'target-supply' property is documented in ahci-common.yaml.

Add a reference to ahci-common.yaml to fix the following dt-schema
warning: 

'target-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/ata/imx-sata.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ata/imx-sata.yaml b/Documentation/devicetree/bindings/ata/imx-sata.yaml
index f4eb3550a096..c60866544a53 100644
--- a/Documentation/devicetree/bindings/ata/imx-sata.yaml
+++ b/Documentation/devicetree/bindings/ata/imx-sata.yaml
@@ -88,6 +88,8 @@ required:
   - clock-names
 
 allOf:
+  - $ref: ahci-common.yaml#
+
   - if:
       properties:
         compatible:
@@ -112,7 +114,7 @@ allOf:
         clock-names:
           minItems: 2
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

