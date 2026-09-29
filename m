Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827AA53F6A6
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695082; cv=none; b=TMfwfKgSZRWmsY5DlxdR+qigFFm5G54wt0fbACuwdwOS79so+YW5MD8/CcLSPSNuAXU+KBr4JQUvq+RUVnrqCOG+b5yd8g7yP3pFK6rkPHqfRhunJRBvMQ6u3ULMuPv3e4yj340US6fpSJL/+isqR4il7omfI4AonZun34vmIzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695082; c=relaxed/simple;
	bh=cgkMSwM4juxySH5oXoW3O7eWRh40ogW9zBygalx6hnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=My2K6EaZFcxCS3sWS/ymfJiI4ptt7SihJBzK9lZjxafS2WEYgu5vJ7g3KaswJ8tO39n6MbF4Sl5TIGerKQwCFJLAynmTXSJq0F2ygOPFLf7gZY4AB+qgvS/jB+CIAUFCiIoA+JoK4ERSmXHvJoaC6/VaRzxvhcg+iUWUn2qsRK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDoM8Sid; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDoM8Sid"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso32367025e9.2
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695066; x=1791299866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=aDoM8Sid//Wqb1gsv2mX43aHWCvqKJ7WUkQq0dU9GgNEhscmGY9yTRYakDDZdDmgs7
         Gvrx3SkBoxzYECzZuFpVsB3iT2vISbscex3X1zuI2Dt2uDMq3Og0D/1Mro6/fbi0DTGQ
         ESx4T40zQyrcX+H+XWgqwzgFUulEz1CXcdXOwy9zy1vc5E2Z9vP/ny9ByMGsGWrW1r7o
         3SQBtb7Ug1LL6o7uD+Y8iFEo0sY2JI0cIvDIRJOew99LCLYWX0T6sb3Y4XD+HdVkAVS5
         0Ui0a4yWG0YRykSQPs03Hw5j/EkZoS6ao1OBLbyEj+n5J27vKN44Npvy8+I8edO61ADK
         6O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695066; x=1791299866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=Rze8BQuzBHPHJcKgLgqR/mXJqy5h5sckvo4DebLTlmultqPRerz417p6AtHuTDQn1v
         fIzDf6JQFAFCUBMJy2JunqXNmsOZ9yrJfGNOB7FM40M+E1ua5Svb2pYBgY2BsCsurOId
         O9qGJg6BBb5IyttsMIAfJAG1xVY3ZCu+gQSAyq4RKhrzDXu3ZwMv1K7G0D2GT3QX2AUZ
         ZhZ5m4DHcoO+SeF0kuuOQKKUcBuSFNjw3pMWs8Lwcn2biF0ewKmAjul+xDniTWkYyAXv
         /xt1bLzaBPFyYeACaNxngAzYe4VTELsDjXHR350D9cQWnzXUVG6vB2Gru1MhurGl+3Jo
         ki+Q==
X-Forwarded-Encrypted: i=1; AKwUvByofcuDXHTpteiV8x1rcber7soywxqr+0CZfwJndYTliXto1+0rwG5z1Fi0n9SnuWxw3Iw=@lists.linux.dev
X-Gm-Message-State: AFuF++mFPx2nu+NM9MsciLrWnbb20heYsMKCibJawkALHzspgyMNmX38
	AA1sSFjXAcyGICe+SPbMbTrzd7mi0t35AIRAUSkvmZxsMgBCVUZtxlpFN63r6GF7AQ4=
X-Gm-Gg: AYBFou30MNlX6P2f7T8Hy9fveQpFqABdRKbJQnzrvOEC8lfY2sfnaOcj0kcXtq7BFPp
	dGaaWzP8KAsNc2McRXh24B4u3fI/JXY3tvpIgIPt+0rnMYwj/WXhZ3Ar6CLbz72GuQ+CDtL+Zbj
	cb+DZuwQZOkz80g1bz5MAC1EhI5Vizpy4bBbuqfSTZpqaDEJBOfb0sW4Z0sTmn+/6etdXuKvfsm
	Wk2GZos8Iwxra0gKBCyrEuUspYhO07iebLvgpwztcGQcCGsP107Hw6KoWBAaVMAgBsWsoG7ohg5
	D1tR4IrjlV8I+9xfhPv+8SpBjhDTso5OgpHPZXv8SAAxpyvoGBHLAJ9ONQo2AUwfTjL7PhqlLRj
	Esrdd2PADDZJKCG1rh/yMCyAMjpbbMboFxGRLAeLPUI2+Y1WXL4/E01jWpD7ILhj3SpQuGC2+Ji
	CdeGT0JMokHw47HA25LIVhyZJIIXut6n6xC+ndqZRkl4Iw7/Sqo07kJyP1HNPRH8OtWkaN7Ch5W
	lTZMdCIIl2yOKp24zogifkNaPAINOltxTTlTtlJiP3RpSmQYJguWLt+Z3/Ax4NOT52LQfh2SXnw
	W1MdmOb9jf/Tos4FEVSFRg==
X-Received: by 2002:a05:600c:1c2a:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a00c2a48cdmr69280265e9.33.1790695066289;
        Tue, 29 Sep 2026 08:17:46 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:45 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Tue, 29 Sep 2026 17:17:28 +0200
Message-ID: <c547995bcb14779a5883d855137148ebddb7ef8d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..233687131adb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,9 +688,46 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ul
+          - const: fsl,imx6ul
+
       - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ulconcerto
+          - enum:
+              - variscite,mx6ulconcerto
+              - variscite,var-som-imx6ul-emmc-sd-card-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-symphony
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ul
           - const: fsl,imx6ul
 
-- 
2.47.3
