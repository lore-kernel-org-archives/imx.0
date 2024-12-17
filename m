Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17532BCF5
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 03:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734406118; cv=none; b=pT9xla6IPv68D6iMkG03rIPLWHxI232vWbW8ZpgnK3fG3qu1yyF1oo1F2yGcN2qjzsPbLGQPBwpKNyJXeUTNjP3KnLzoCzUqart8iSXozpVVkoMpOUU6+4HQgZEhUIed0ULz+eImvcSkl4gfeYUgul3CSb8pBQnvsfnVjfGWxkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734406118; c=relaxed/simple;
	bh=yBrDAAXumKw6y2JtZX/K7A8At2LpR6oDAyXEsca0iag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WO6SO30e/4I7DWNYiSj8nQaL+YM97ULLHrQAfiIQVtbAVSfJtXvrEOF40NYgCY8Uux2TdkBj+sHUqtst3NuN30x/LM/EujoPQIWkwBOv5ptFTO6kziL4vpkR1H/K3RQ5c2D2i2IBrOdx5id625ODLW7GKCO+9QrXZ+FFg/OAiig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=Goh5CCtD; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="Goh5CCtD"
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 65AC5165D79;
	Tue, 17 Dec 2024 04:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734406113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=89/Ied276i9FOsoHd8vBC5qsTunh5CJ0SvVAdLuPAlg=;
	b=Goh5CCtDS0tPNf+WJafGDsjV46WvVKe3mlRhlW6LAED2fz52JcKVwm0FYXThOcm/Tn/aED
	SLg6MGyhHs+ldP9qcn3PRVdJDDUvcdQPprh/FBA5qy8sJe6mbuDkoQiMQAiyxSACOJM1pv
	+sJk2QVvBaFGOZo6RfgKXP6SGRUmjkE=
From: David Heidelberg <david@ixit.cz>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: David Heidelberg <david@ixit.cz>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: media: imx283: Describe sensor address using the reg property
Date: Mon, 16 Dec 2024 22:28:17 -0500
Message-ID: <20241217032821.1712916-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the reg property instead of text in the description.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/media/i2c/sony,imx283.yaml         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
index e4f49f1435a5..f4ee991c89a3 100644
--- ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
@@ -13,16 +13,15 @@ maintainers:
 
 description:
   IMX283 sensor is a Sony CMOS active pixel digital image sensor with an active
-  array size of 5472H x 3648V. It is programmable through I2C interface. The
-  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
-  sent through MIPI CSI-2.
+  array size of 5472H x 3648V. It is programmable through I2C interface.
+  Image data is sent through MIPI CSI-2.
 
 properties:
   compatible:
     const: sony,imx283
 
   reg:
-    maxItems: 1
+    const: 0x1a
 
   clocks:
     description: Clock frequency from 6 to 24 MHz.
-- 
2.45.2

