Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9458D5D8E4
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711398788; cv=none; b=N1k7bzsA2GFhY5hTEgVKuX5PcF9XoLLB8UBAXJadVj9sgms0qCU5SYHWljtR1xLXJhi7kd2VLoQbBeF9rGTt7ikXG72xMI7EWv8KUyTGBfKmL3D5JChfw8q4IURXs4cpkqD4jRtvTzq5JoHpdblkXX/ErlBncUcwKt6sxPEUicw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711398788; c=relaxed/simple;
	bh=6XJEvL6Keu+x7laHymQSy+SNnk9GUCpJ3qj8qn+9C2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFeocAJBs7zKakCsq3QcCOLHiTfRp02Hdg6iegktQxdPtiQ0CiDch0MCugxD7v19AIqw4jV/nbRGR78gVSJFpJO8naH0ummcONkWqObC9tv4wk3rE+CfTOek2fnM3Ux6MPs6/hzBu678Eeh67PhH1jn+HXZUP1q9eqbH0/ZtHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a5leokgP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a5leokgP"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D745538DA;
	Mon, 25 Mar 2024 21:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711398748;
	bh=6XJEvL6Keu+x7laHymQSy+SNnk9GUCpJ3qj8qn+9C2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5leokgP7DgOlPH4dOqxE5KAP51RP0RPGFqROhG7RTKZd2ZWVWrgmIHwfddRRBP9W
	 ME5GaXZNNDEdJnQvT3+uWuIQ7e4f8iqiEOLi3sLq7mtYi34RngGzi0FHTZgBENHueR
	 g+0nLmhbjZt25/bKxV0WXmxvVKnJELt1WtUYHyfs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Trevor Zaharichuk <trevor@au-zone.com>,
	Greg Lytle <greg@au-zone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 4/5] dt-bindings: arm: Add Au-Zone Maivin AI Vision Starter Kit
Date: Mon, 25 Mar 2024 22:32:44 +0200
Message-ID: <20240325203245.31660-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maivin board is an AI vision starter kit sold by Au-Zone
Technologies, developed in collaboration with Toradex and Vision
Components. It is based on a Toradex Verdin i.MX8MP SoM.

Add a corresponding compatible string.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0027201e19f8..d892c4f9fda3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,13 @@ properties:
               - toradex,verdin-imx8mp-wifi  # Verdin iMX8M Plus Wi-Fi / BT Modules
           - const: fsl,imx8mp
 
+      - description: Au-Zone Technologies i.MX8MP-based boards
+        items:
+          - const: au-zone,maivin-starter-kit        # Au-Zone Maivin AI Vision Starter Kit
+          - const: toradex,verdin-imx8mp-nonwifi     # Verdin iMX8M Plus Module without Wi-Fi / BT
+          - const: toradex,verdin-imx8mp             # Verdin iMX8M Plus Module
+          - const: fsl,imx8mp
+
       - description: Avnet (MSC Branded) Boards with SM2S i.MX8M Plus Modules
         items:
           - const: avnet,sm2s-imx8mp-14N0600E-ep1 # SM2S-IMX8PLUS-14N0600E on SM2-MB-EP1 Carrier Board
-- 
Regards,

Laurent Pinchart

