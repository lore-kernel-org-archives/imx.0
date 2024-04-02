Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34415D5B7
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712086566; cv=none; b=e30/XGOfLQ6TwPz9gs7GI5ldVNIdcEfiQjsI42a7SD1SI/DshY+KpvRZibN8j7EEsX1oMvKdAh7EEZeG4y594rwMUnKaksMwKMxsiIr/d5CYxXjjOrGzK6Ir12tXVN8Z9z8oT85ncIdTDMce8YomUilvGaxUHs5ktJkXjyp4g8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712086566; c=relaxed/simple;
	bh=0tIuJNvFsc0/yZejA65A2Zkxy0hhzxdsvdn7WTX3Si8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EfxJPg1XnQr/VTcH64RYJwx/3VUQYk8qDh0etrE7joIXDY9gGWakRqZ0wefYQIx+fGY3tInE4rhqR4bkjxTvHUkdPrXyZiSVCNPC6b60/2ztCjr4uFY5sr16TE3IXF0MOwgHX2nJb6ugzw28rSF91ybkUbAJiWfqCiiTc3YB9tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKE+eP/O; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKE+eP/O"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e0d8403257so43143325ad.1
        for <imx@lists.linux.dev>; Tue, 02 Apr 2024 12:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712086564; x=1712691364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYbnaHnAGjSi67+NJWyZTmxz12NICwI8+9rmQ1o+iIg=;
        b=FKE+eP/OegKQ4i0M/pWFcEy/sj76JvWbUyWxdwlVqW1RzecfUwTUBFXi8Ct0EUH2Fq
         AGXXT2Ctg5CwGfPkq2Nw1tKB2RFt1Cdy+whtqG7CjMSbSC/+UceW1WX5WGexq9T7Dnbw
         VMFSe8ZBK2ow6+qeRz/SYetcZt9oHPvbZiXSgsHep7XjWoSNpgN7Vz52yHW/rj8uohbH
         2l0aL/nmNfBuZunac3NxDe4pJcpfgZ7GwsAK5pyI8VtidM45TZqeGdD7SRxBRjBKe+FU
         KVyWFhkLP5moUqM3d0ih+fCyI2ChG/zNh9BuXb9t+D9IghdhpRVWAs8TQjnpuFFtTZOm
         qqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712086564; x=1712691364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYbnaHnAGjSi67+NJWyZTmxz12NICwI8+9rmQ1o+iIg=;
        b=XuxSbKVFfUoGXIzlOCpfl/H5UnaizW72/xs707E9INsOoAZphWWjOLoNsXJu5chpBA
         qU0Ay3ttvKfp+DcaJFi2dk+0vkPDK3o0UpbNynRvG/PznerAX2HWxjD1CRR+tB7idvrA
         YBd38qhPhV32bei+sz4wFMG4to7xYZ/PYaKh5ZERAzl6B1YSN1kVXC4r/YC10cpmCymf
         Fo40O+i+OlBKeLadWHZSF/mxHUbF5/kxajDsB2Dw4HMwrPSvvMe5jo6TQo206YKIExx9
         yF0TG54fjpPl0Xulu/vVy4kBiDW3NDGP9CEvaJWAcOlXNM8Je+ndEVkPJUNXiHtg4b1P
         qAbA==
X-Forwarded-Encrypted: i=1; AJvYcCVK/wFgId/CCV+fmWUCxHZSIHG7/EYFZYoy8wmEfDuhg0PePUxQcVv86M+TvBppnmBO9ZGGwa1y0FnSKz9dUq7NNJ2H
X-Gm-Message-State: AOJu0YyFxBFegJd8nHR1EgC0l+z+8fk5K2uynLcqQFyBwAJOqxtniHdh
	5wcB1J9H2E0ZojEYp7f8oTBwrGYW0r1RBok6bb7DwnL6orrRP+aH
X-Google-Smtp-Source: AGHT+IEPSU/1XY9EHbykDe2oxo8f0Qt9LIq0jfhSQ7ADCMVKwNg/qNGXLeCEnjDk1wHyy/bAdLzrNw==
X-Received: by 2002:a17:902:ce85:b0:1e2:8bce:b338 with SMTP id f5-20020a170902ce8500b001e28bceb338mr807799plg.5.1712086564628;
        Tue, 02 Apr 2024 12:36:04 -0700 (PDT)
Received: from frhdebian.. ([2804:14d:8084:b86e:ac17:f518:b547:13a8])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709026b4600b001dd59b54f9fsm7775841plt.136.2024.04.02.12.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 12:36:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] dt-bindings: arm: fsl: Add Colibri iMX8DX
Date: Tue,  2 Apr 2024 16:35:11 -0300
Message-Id: <20240402193512.240417-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240402193512.240417-1-hiagofranco@gmail.com>
References: <20240402193512.240417-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Add support for Toradex Colibri iMX8DX SoM. As the i.MX8QXP variant is
already supported, update the description with i.MX8DX and add
'fsl,imx8dx' item as well.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6fdfa10af43c..f872c6ae151e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1226,7 +1226,7 @@ properties:
               - fsl,imx8dxl-evk           # i.MX8DXL EVK Board
           - const: fsl,imx8dxl
 
-      - description: i.MX8QXP Boards with Toradex Colibri iMX8X Modules
+      - description: i.MX8QXP/i.MX8DX Boards with Toradex Colibri iMX8X Modules
         items:
           - enum:
               - toradex,colibri-imx8x-aster   # Colibri iMX8X Module on Aster Board
@@ -1234,7 +1234,9 @@ properties:
               - toradex,colibri-imx8x-iris    # Colibri iMX8X Module on Iris Board
               - toradex,colibri-imx8x-iris-v2 # Colibri iMX8X Module on Iris Board V2
           - const: toradex,colibri-imx8x
-          - const: fsl,imx8qxp
+          - enum:
+              - fsl,imx8qxp
+              - fsl,imx8dx
 
       - description:
           TQMa8Xx is a series of SOM featuring NXP i.MX8X system-on-chip
-- 
2.39.2

