Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D73E6DF3
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449996; cv=none; b=cX1bsmtE3rhACGMo1zx7HgQjEfVzs1iyMxeuYed4D+R+yeUdEuH3VTVPr8HYGawR4oNWdljR1qisVKBT39v9T94V8sqWsXE+OlAEVVevQs51VJ1ODVie5zQH1DA6NOjPgEH770u2yHJBdZ89DcYukECtf/a9Nf8JBgxBovUYTtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449996; c=relaxed/simple;
	bh=V8d2l5KSrI/IBbjUOMQ1WmyhZ85uFel/9Iqrn9rmxU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0BDuXRTxIVjYw1u0zfIpnrG7Wbalkr3uUA0rdnsmw538GsmJL41Hr3llWvbU/WX3GVJ+RBEwROnZbB7f8NSpDHcVpOh/KiCdsY/2w52OdbosH02aUC1oan7wyqLBVnlFT/m5W6t+k+K2oP6O97A/lgg918+rGmk46STpSBb6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+ZkPTJx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+ZkPTJx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso5463049f8f.1
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449992; x=1775054792; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQww7rYHgSiW8MzkVP4frc74sj8xqXnVytlTkph1S4Y=;
        b=e+ZkPTJxOR1e9rre7HgmlIMG74dKbqWoSpB/pw9zNfxMNToCESOwZGZLibtpm/BViy
         fVFbVo5rxBpj8Nc+hHmkmBMBCRCc63CUQ/wBDSN+wh9ol/Tzfg1jpu3WO/h8q4qAc4hX
         rqZ+V2pLm6AoP6GdfHpsgHmw2TSLZqcAXBE/aq97B5/bx4NAym243tXxXZknje/EOp83
         CmHg+3TDIeSIa33/HFC0+2FxC7RvobDguAbucB6DihqwpX0MqMicy8C8SgUNfKHqiOLA
         3JFSQi8oLmNGh+9gZMG4wHi0t68Kz9T/waBZABFrJHVgdNZryOA7cdTkGBxeirv/Kg+/
         s2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449992; x=1775054792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQww7rYHgSiW8MzkVP4frc74sj8xqXnVytlTkph1S4Y=;
        b=gYk/Y9r1QhvT6TIh+nqLTuMomO8V6ZLdROeSJOedg9E9ZE6kKyieJTMayOG1wO++mR
         +VziGpGsIwH1H/ArQ9r5+yjzgirQuiFhjyX1OXlIucdXOvc+EZTwQAM+CsL8jf0UVB12
         WXOUBIdSKsggPiHV8FADIu2WVdLjdYQE6JI7LToC8eawgojrKRhy34/izsiNZ56QqY1D
         NuWd5DXE4iARVHsW+8cusZjQRDxj2fNhx5983f99QBQCExqZhqUEdK5gkylMWuBhXm9Y
         LUevHUSRXWxQMpZm1uiSKegQp91NIE92Ln8f4RlWYk2t6xMifwWAP9SKVX43E2Z6GU/1
         sNpg==
X-Forwarded-Encrypted: i=1; AJvYcCV55o9O3jDEO/3Qjh7WxLKJidcilUOYiXTjOfnHV13wJ4pd1cZViTBxvf5WiG8b9XSzOS0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWZPKxn5DmgRg/SCZ6AIkXl951FXHm+HHtlEa+7TaPCsglScJY
	/mK357QHNOPI4xSHQXS91WG815R79cvoDGzVCd4cdnJVObeT3Lrm2OLV
X-Gm-Gg: ATEYQzy3JSgOtHPR1jLDLSkeoT5UlAq1jqp0oT1AT1QOGk2IVil7ubM6SkXXhx7KMLb
	AL7/qOlRvbEKOKCQ3Ep7EGw9sMm6939ZHELgE7Ovj8H1mIhygaeuAEpIOmG9YczHDEuAnQxbczG
	TCBC72/yJ+biWLJGy5opTYqHgAaxThsn2reK3iDWkcyJ9BNnqAKtkUnYrYI0EM5+xXu2a/yIwcy
	Xw+sEHSZ2FYqosyX2J+71hw/632nVMngS/laKW6inGhX1oceOZaXup8vsCIhnEvJ/pwQPaKXPk/
	7dGEPeehVxuLYWlr0APYm548rjeOYnXAuuls/+20xh3nlPsMj+8axp5vE4wgkDAN8C9Jv52Bi/i
	RbEIznXw6Jtzhoy4HZVhm+suSBuSYFMg+c5dQiRlOzbn3nw4iomNrKlKmsOQ0ZWg5SkGvXkeNuv
	mJxRgsBFwIgAjWWTmAlcqepNDMzgPRVC8rthOId/XqCjxtDqmdRarVvoL9cenv+LTG1v/gg340Q
	cy+1d4RNrtwfP9V3lFWbkPZMeA=
X-Received: by 2002:a05:6000:2502:b0:439:b744:c5fe with SMTP id ffacd0b85a97d-43b88a39af3mr5165742f8f.52.1774449992180;
        Wed, 25 Mar 2026 07:46:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:02 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: fsl: add Verdin iMX95
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-1-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add DT compatible strings for the Verdin i.MX95 SoM and its supported
carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
Mallow and Yavia carrier boards.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: no changes
v2: Added Krzysztof's reviewed-by
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..f0701143b237 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1477,6 +1477,30 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with Verdin iMX95 Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
+              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
+              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
+              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
+              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
+          - const: toradex,verdin-imx95             # Verdin iMX95 Module
+          - const: fsl,imx95
+
+      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
+              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
+              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
+              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
+          - const: toradex,verdin-imx95           # Verdin iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0

