Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE491CABB
	for <imx@lists.linux.dev>; Sun, 17 Mar 2024 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710694137; cv=none; b=r6A6oQ1FySFK73iI8MadroomdRVVnSunflqGHyCaDhDG08l38AVrC1z2RGXtWX53a4GGggTwVvz9zKxrY8TWzYJx3rPLV6mOMVs/3foyUhql5mQ7JDWuMc0bvaP+LXhzITSXAGMR116R274pAcHPHl8upBqJBiJZVcHqWSBM9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710694137; c=relaxed/simple;
	bh=j55/1UNs0ew6e6Ao5e92a5hwLmDa5Po/NC4v48+5tB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxeA1KhuR7/NKkEgvs4ubq4eKmswNjSGLUmk6ctHTVyH10IT6mp1b9x3BbOSXMqS+xLAVN+CN8eTUufFW/AjmCWWmrc/38JxC5bYVv885ilhivLnHbNL8tNvRcRRJySEtewN2R3srIYGkGb5HhUFeKztguLpHD6uDJF1BvEYwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=joxycwIW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="joxycwIW"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67B95FF1;
	Sun, 17 Mar 2024 17:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710694108;
	bh=j55/1UNs0ew6e6Ao5e92a5hwLmDa5Po/NC4v48+5tB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=joxycwIWKBjp5XyXPFGJP44T70lsysaoUKPishP14S6hzbK21eHZmnjAnAIFW8rVN
	 xMiH+AqNIHvy8WOqJITuxxVO0+v9xD8vToBy4raaCAR8AmO+RdpB6J+wf6vSbJP/jE
	 Es9tqXtuCQpdEGdNywH6C50nrxF0UHoPlpKtNJjk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: arm: fsl: Add Compulab SB-UCM-iMX8MPLUS carrier board
Date: Sun, 17 Mar 2024 18:48:46 +0200
Message-ID: <20240317164850.32708-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SB-UCM-iMX8MPLUS is a reference carrier board from Compulab based on
the UCM-iMX8MPLUS SoM. Add corresponding DT compatible strings.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 228dcc5c7d6f..790de9e5fd73 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1068,6 +1068,12 @@ properties:
           - const: avnet,sm2s-imx8mp              # SM2S-IMX8PLUS SoM
           - const: fsl,imx8mp
 
+      - description: Compulab reference carrier board based on the UCM-iMX8MPLUS SoM
+        items:
+          - const: compulab,sb-ucm-imx8mp
+          - const: compulab,ucm-imx8mp
+          - const: fsl,imx8mp
+
       - description: i.MX8MP DHCOM based Boards
         items:
           - enum:
-- 
Regards,

Laurent Pinchart

