Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A18F2D6E75
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536850; cv=none; b=nugLB0NNQORPknWbNNPuJmjn5Tx/ovU3utja2fJqCL9MfyDssIZKhh5RdtG64Dxx3bIpKCGWRyUidbLFjvDFaslpCyNikKwdK+l2iwa27oQEYwJuZcBLDSEkrrUX86HeV3xxeFwj4qCaHOOQCkCJb+UVm5bpkKwQo91ndbiS4d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536850; c=relaxed/simple;
	bh=ruWPnO9A2gGbmS8eeTu3b6gEkGLMk0plthcFqBArp/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ArApyvkGd1YWGPp0mLimAC39VrMLasS91wv2Qz8BVmkrHl9+eOGiiotVuvoDXXuKR4wBcqlNQzKzqZtLrXUv2le9iUgjZP6DMojLxgO5idwzCb7ht+Jm5N81daDJAW9iQUlKdfYgLr+/MfhMuAo2Vs0Bf0Ie9pIV/WG330aYkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSWKzOaP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSWKzOaP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24b28de798cso48919555ad.0
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 13:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536848; x=1758141648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eaIcG+r++rKQesZ6uTroJVEBEjb38vwPSHlk+jRRLok=;
        b=bSWKzOaPynWW/7aHSnWpBqE/M2wGu4rmEsR9YY0BKxEqO0v0llZmIc7pg2O55xn1Oa
         aQ4RRg0ZapDo4sqbFvAjJt8qJRQnCRia8JSUafVko/Kw66iasBZikZdS+2T0IPBgEJjs
         WPJvEcqnGJ9UvE+ZRh5sUecPeTpJ3oHPCO/r6d5ooI4Yc72dWuUHMZxnfonm/bBLSJ1g
         oQl0p4LFRLy//ThTbh4AckIZPbAs4l4N5Ypr3qqUQGxfo86V2zKdwufz4Y04I/7hW+QL
         CC0f5+FEXvJW62sxArmSrMu4TCyZpmt10e5OIYRhNh/EvYy0XbSjNJ7YU3PkCFQrLHyj
         5F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536848; x=1758141648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaIcG+r++rKQesZ6uTroJVEBEjb38vwPSHlk+jRRLok=;
        b=XgONjp36JAhjntLCpdu2q3ScP7Au1eggWxXMPDr/aTC0unI9a4n+Oj0cps3kuLRl3G
         s022h5iiuU+65Tq3ErRius3CwTPxCWnXioJ4B87WUyqWhEQ0+1XE4ZeZ2Po+Erg2E8Y1
         7nKNsYD6bXAXAxFFJroM66Kt2mHZ/qzEncxcFgBsBVWmUbA12Qkusx1lSb2dASNMUWY/
         UjYAanFOP8TF8tVmpYSEqtJUvvDGB4yPewVddIXU8W2wl67cUVQJh7aLz7BTSFrnxEXu
         189jK6ogIrf0G1A8U+ZyLDH6AQH2KPfGq5ByTlYC2QTIAB9IaL3tgzYaYVlJIY0aWYEA
         +Urw==
X-Forwarded-Encrypted: i=1; AJvYcCX7XT3fv5Aaz7yU+ctr/CARrzVgoTi8q5GJG30GlB3U9nw29anElT6jUzr+gVeHZAUVbYM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxElfK3pWJA+yq/ZIL+2+yCaYiIXwkTCCLEXc8ff4uXm1mar2FC
	i5KYDHKWgocH0UOnpkMM6ax8ZVbcSAoZe3Y1wG5QnHss7JjMh4BC1Trp
X-Gm-Gg: ASbGnctoPI6r9TbOZau3svmnDc5fgThQsypzQ9vYBc6FoyVYLj2Rt1y3inypJWOKx4V
	XdROoDF4H5Ne+B1KVUm7szldHj9DucfnDhki+1fIbbrB9RwhWiGCYNr8/W30EGxhrBlEBmxtR7n
	5wmhRnDeGe+GEBbTeNSmJX16hHeWX19llcLaDDxupkDxrdwzqpJNaQBJfoNSyOLZYBJ3O07bR/N
	6rBkjaeZ/DXXvg2Y04NdMt12Szbh/2TPmT0MihUiEicDMzirKlEYl2mXYCgCZZCP5kgsnCfdFlW
	PjTXx6ZFTfwBBH3S5vN8Z/NTQnrgDeRbfrzGDhU1pHE4p84ZZyPwIEHpH5gCWJqmAWcjxItGwuJ
	1jn5vANbSz4hy9q0dgIU9bld4RrkZIzloPSSNqaOcBrAAwFg=
X-Google-Smtp-Source: AGHT+IE9v49aHrixobJrjLVJ1lg/LgXrVROV3HeQS3k5SxqiXiAnJBtHP++WEO1FJDJeeelbmzDCSQ==
X-Received: by 2002:a17:903:2282:b0:246:7a43:3f66 with SMTP id d9443c01a7336-2516e97e7dbmr243437855ad.7.1757536848226;
        Wed, 10 Sep 2025 13:40:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d19c:8c03:e9d7:2ba6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a274258b6sm36800835ad.26.2025.09.10.13.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:40:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Date: Wed, 10 Sep 2025 17:40:35 -0300
Message-Id: <20250910204035.540945-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:

- ipu1_csi0_mux
- ipu1_csi1_mux
- ipu2_csi0_mux
- ipu2_csi1_mux

As they were not documented, dt-schema emits warnings like:

  'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
  '^pinctrl-[0-9]+$'

Add a top-level patternProperties entry for these CSI mux subnodes.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
index 8451cb4dd87c..c5eea48c19fe 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
@@ -50,6 +50,11 @@ properties:
     type: object
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^ipu[12]_csi[01]_mux$":
+    type: object
+    $ref: /schemas/media/video-mux.yaml
+
 additionalProperties: false
 
 required:
-- 
2.34.1

