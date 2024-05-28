Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B076F079
	for <imx@lists.linux.dev>; Tue, 28 May 2024 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880319; cv=none; b=jNRvpP83RgDt5XPUkzhtZXdjSOcDPOwjeINNXyGh08pMXAtJssr672u5wSYkm68VkWkOu/+9wQTaq2DvmTllSJHU5R2hKKSban+MRDjnnVofaheyzxHrAYvtyLzXQj8zzA52NeO3HwAg3w404IY6Fqcc2wf4IebmlFONWtJggLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880319; c=relaxed/simple;
	bh=3SuIiVs4ex3dKgKjRY4GThiMcpkSuoZTjKwprnKlHC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K4PDt+9MoDMTi3Xn38jH+Beo2bLoRuX4p/xtP5vX1q6zrbA4oCjgc517SSSgax2WKR9WpIsvLKkKpIingRHTsC2YMNWOx7ZK8t5ynDE33omf8/6t+/eFhVX/FT06+wW/lPdMJwiiHVzd/c6QsewMhgMNCWqo3lgPQWbEJqTOaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=eRnjEcaJ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=V+4VRrue reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="eRnjEcaJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="V+4VRrue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716880317; x=1748416317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dHKIs/KoK2vU5Vx0u2qFk5vGdrktdeEflK3UPvVVUsg=;
  b=eRnjEcaJoXo/rYp9jd0VtW+VKJ0rsYn/76Ei/uE4G34tRD+vgB/pXrQJ
   h9YdQAloIn48HeS19rZnpkZLLpfmOGq1oD3kyIAjglbt1zpyV7t3LGcSb
   WQWEkNIDFthB1UF63VzC1IBuu3Vxc8H9myzZcDE3ypFOe4zk+6IIvqyPH
   +IJP9OH6Zo/9sIsVjbW/AQGeKPYHl/DoT5KpwIBF8AEkeJ92RLkP+nWAp
   YabU3wYfZItlRC/4l0FMciFnI1RraMsqkxwGg1Zs5nylfI7FqtN+DhjF9
   Od3TFvKIFn2Nkevtpsqf98UTzopzv2tWWabDBYIfvQvyUot3mZ4SkElYy
   w==;
X-CSE-ConnectionGUID: ZN0Rvt3yQa+vyBonDSWnLQ==
X-CSE-MsgGUID: 6ROlfigfQbmWuUvnB2TSUg==
X-IronPort-AV: E=Sophos;i="6.08,194,1712613600"; 
   d="scan'208";a="37094739"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 May 2024 09:11:55 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F9FA1641FA;
	Tue, 28 May 2024 09:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716880311; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dHKIs/KoK2vU5Vx0u2qFk5vGdrktdeEflK3UPvVVUsg=;
	b=V+4VRrueizZhPW5Uq0k6hT3bRdJ9fFRyKH+Y3dYMGAeCNel8NW6qTT/9a3sTplPsHvaDnT
	jAC27dz5eDXRTr2+BOqfjBE/HdHcaEKwVjD0qTJGvct1aOaP9b9jHoqaWXlHA3iDHN/cHJ
	62iIlA2iSeCy1eMcKd5Ub3srYGMTpcODgUrfQ0jHkCNiidUUBp1Cw9Hb01FIQSs3M4g9RV
	bzDc2C718GXngwkMNSc0hPMCPZL7f9XSZq70eOAPcqTtSzqi0kGOFx//bnm7odr5X6fpM/
	4YoRMmvaAd5jBc2gA6NtBG1ZZSwOVhrEVIty3E9w9M4g65NsE8pHVTo2jp5xNQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: interrupt-controller: fsl,irqsteer: Add imx8mp/imx8qxp support
Date: Tue, 28 May 2024 09:11:40 +0200
Message-Id: <20240528071141.92003-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528071141.92003-1-alexander.stein@ew.tq-group.com>
References: <20240528071141.92003-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Some SoC like i.MX8MP or i.MX8QXP use a power-domain for this IP. Add
SoC-specific compatibles, which also requires a power-domain.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../interrupt-controller/fsl,irqsteer.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index 20ad4ad82ad64..aae676ba30edc 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -14,7 +14,10 @@ properties:
     oneOf:
       - const: fsl,imx-irqsteer
       - items:
-          - const: fsl,imx8m-irqsteer
+          - enum:
+              - fsl,imx8m-irqsteer
+              - fsl,imx8mp-irqsteer
+              - fsl,imx8qxp-irqsteer
           - const: fsl,imx-irqsteer
 
   reg:
@@ -42,6 +45,9 @@ properties:
   clock-names:
     const: ipg
 
+  power-domains:
+    maxItems: 1
+
   interrupt-controller: true
 
   "#interrupt-cells":
@@ -70,6 +76,21 @@ required:
   - fsl,channel
   - fsl,num-irqs
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mp-irqsteer
+              - fsl,imx8qxp-irqsteer
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

