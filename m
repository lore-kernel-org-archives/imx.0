Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF34052AB
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180656; cv=none; b=Nf0xpTFnRMCP345h38Nh9oa/HHHbmPbFFYusiiMIxOcUKLHfGxTqf6GfEIviquqek3NL3W0v6Z3RnnH21M8pzzu9/Emtp+haqmcO19n5jJ+V8mpxzWnXYmgLIckl2BOPjvXQKNUXhUdf3IIn4yKfnchaJdefwvJWDMFKa+L8spc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180656; c=relaxed/simple;
	bh=UMMlAQQ+tHH37+OZWlXTPeJySJPPJtpz3IdXhTev4eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bqblxv4bNVQzFQa1XzcGU3dtVZ2U223/dFQxPXNWhcdrStLTGPPFCn53ogmzGMw2Dlxmgap4mCQxzkb8oKqLUdC3hzDQZsVohxjV//Mfi6L3Qd810hBMTznljpRoV3Feqd/Fxq+y6YOrfalnTutxiMF/nAPP/Ft4NaRo9zdYdvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8jUDzEt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8jUDzEt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso12275055e9.3
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180650; x=1788785450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgpUpwzhe3ICsnKIHyf7lVPTDsFbvK8kI90BAlWw5dE=;
        b=f8jUDzEtCbGFl4HCSwDMlRnJ8ryoLHK8NF52TxzTjt7SMBqQ/sQIWSt6E/wT7lKqs4
         Fkc3fN0Dn8+Zhht37G06We2HNAspgBadon4cd0A4OgOvpn5OZDCpD73rQOxRRSFWRcif
         wt0272nY7wi+DASrUkvX3ICaqUH66/IrWBcKSPob8yz3excykZPPCgIeNEHirdoHxdjc
         +5kXBSOnIwfOJZdpo/yF0wKI3jxnQHnnMDivgKaAFXVn+jh0jszmvDIhkOdfnkSmh5MC
         X+BZRS6kMX7vh9tZFcHTW7ma6M8cKuJkygI2djK1dVHAzjAVVcwfcWZCiM/DTWi/Z6ZJ
         z8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180650; x=1788785450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgpUpwzhe3ICsnKIHyf7lVPTDsFbvK8kI90BAlWw5dE=;
        b=OeJgCagHjkLfBzc9Fv3ws4D6xWQ+gu1YbwJF65yc56guBbasdfWp1AvehzNVNjHJq+
         Gh38cOAasLMR2sRbMARcjPs6JShdU/xmSPzn+6zeQRtIpzmWsEk8bhMunJgRcPpEN3Xb
         hl+vr6p+jY+TyPNKtH78liUnL3G/2RYupT945Ce3GvCrAG4fPZuOQUdsptA9k3wNZ94+
         U4Cz1ujZrbR9PK6TQozalWKio+Jffge2sMOdBEQ08835YbcKPbgOhc7yO1t3zfP5DYo1
         XtfODJSNpyHQV1QYT/89i1SoUROsvoh0jmgdkrKRuhZq4YIyqYRgqmynifPOsj+9GE66
         g3Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rrg9u1npF+o8/5kcjKk2lk06g7modxptkejbK2fdO/YtWOl9ObMu67E7A2tzMAyxFH0Qco=@lists.linux.dev
X-Gm-Message-State: AFuF++mqlvzcTGoBXbAb9q2A+V8gKJIN3U9Mwsg2hWCX09Pv2ggLCxDJ
	QCKqwCxVZJwmFNu44JOzjCRqxsr/V1gvNimfk+wpmWIzZUofbiJamUYZ
X-Gm-Gg: AR+sD13bPPuNYxYzWN6svo3Z9YndUtlXTGc/HNUsqA9CO1ydU8PIStcBJNockU6R4N4
	Y1dlyJa8SRbz/ZugjaWr6tx4ZG/5a+KanfwcnGqdiVhPdneQ1EBYHOTvHYZfAu+j/dEQKZ0/88/
	ZQX/U2/kPe7w6O7fgyjsAMgx3gWrpF9HoHi37xbFnEDUE2sw097HDJxipytGKOYVmkYkGQtT6Kq
	YHuJjGaQrqitDo1Ec0wxQcmPraBQNHIN0UiO0JzygIh+VYl8+l5uqfTDbQX1NfTIN2zx/CGGVBa
	oK/AdiPqiv380YScYw051+lOLtBf222riMpvXaaLxQR2Hrt9MnvqjQbZyhjzHymS1PHiggYEuLt
	HmtGwLHa2w37HZrhAWX1+7JghiHu/QP/4F6w8PZyF8K2xBffuKULXmfe9ntAr+E9Dz2pP7QC+xR
	sOCR2rlmdzVnuwZGO5bwLBKTHaYlXfKecFZHdScHYadLKw2lqu1mhUGofx/5qs0mqxCw10IBtS6
	zineVrHVh9MCAbjXgYA13Q8CUNwP+WvYl+v
X-Received: by 2002:a05:600c:3145:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49b91c44f6cmr384483205e9.10.1788180649895;
        Mon, 31 Aug 2026 05:50:49 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:50:49 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 31 Aug 2026 14:50:23 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1788180142.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788180142.git.stefano.r@variscite.com>
References: <cover.1788180142.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v6->v7:
 - 

v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

