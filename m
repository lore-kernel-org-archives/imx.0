Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C71142046F
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851739; cv=none; b=nsysu2FA/bCgevFPORo34CJnoiLP4T9Kb3NgU5Kia08gawCj+5mdgkQUiAswBh7CSozGmEvpLqhyDp5qnhM7mRbWwY4dYO0MEgptfOw+/5V61aTPhzKULNbuYUBzs+ipT8c9a0KdX5dpEG/2/4RY9nQUH1yNWahQ76y6YHdPB5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851739; c=relaxed/simple;
	bh=L5cngSrji5pPnnXpeHyTls2MaHRF8K1fdS0dI4G5Bnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSdd2jFhnriQtmp0nzDHqlKRk94ICwegs/9J7om+TYzjx6e1LQHD9+CRdbmKGOYGMq1sEv4EJKQrFwdBetLDjp3PxHy1mPbHINM/8ISm7A32ga8bOAXvxxahPLGQrDJ0Q5LxDTpSaLabMu7x0mNIRuZWYVdhRqLnHk19Pw2Dad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSSGuXwf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSSGuXwf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso111305e9.1
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851736; x=1788456536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBAqHiJFBlluHKmrWNHYLsCQylCf5RMzSWDONfpSfgY=;
        b=dSSGuXwfn1ZIJD5HdwaAoHiegVq+1GsxNmi1wQlBcgciWjA2VsyO03ZIlCZoh0zPja
         XWyBTVSaz6xI9QOaGB23zy7niJd07Vxg/D9MNo32f4E9ctLebs0YjTwrZlMMXdpaKk/Z
         uS+Mm5OBVl70vZ3XHf2cZnSF5igYXUvtlAPZQM6AXW7kSiRXwtYSr3OO1P8PFISXdXBp
         r97ySqFH2ImtEeTwxHF16MspMlOjsUfZc/CQwA4HWW1yZA1DmzWGF6Iul8lygwyW+CtT
         3Meefd2+FWvssbDJuTtfDv9IWAhCrM67bK9qRgf4X/thBbEN5jcQ8dPnud45I5Fp1M0j
         u1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851736; x=1788456536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBAqHiJFBlluHKmrWNHYLsCQylCf5RMzSWDONfpSfgY=;
        b=gKpFfUELNGzqrOgDlTuB02FoeWei5eiuOnwrQGK0dnQLXPnGnJBcK7kNjYt9XJBghQ
         Q+VLwE2n7wWZwONMh0GyQir+Pt/O0yC+kF+hGh43z6VGpl6bNT9XN51E1APYmSgN8uub
         vPqv8xZLVx92YpTiyrHpbdXbQAABGcAh5Zbk+av731HuimSudwG2qKA9qwQxDbCnns2z
         1AQh1x2be5L75t/d1TeBTok7N09/T4Qfsv4QjGvPajn2al0dwvREiSOZpqtPoZJUl63X
         xhfTai4LOgoMalZyUiZ3OHShGVQIdOoL1H7HZADYkSCqPndnMND3iIW1++w9AwC6Jw4N
         IjeA==
X-Forwarded-Encrypted: i=1; AHgh+RoSo9MzXHxu4H2KPq3rkv/+6BegvOL4dBGR4Onrx+O/U1h32jEpuw3eNdK3YVRyzTjcK+M=@lists.linux.dev
X-Gm-Message-State: AFuF++mwYJtZy/FhXKw9oBbaRhbhU+/NYt3MJIHjq3QYISwLuEtcwCyc
	IpRembNEan2XJAAjYKp3KxPasrb8ihHAjLx9oAv9oMOTGXkxCpDMHzCk
X-Gm-Gg: AR+sD12Up4lTYGeadYEWUhANVusIwCmmMSlTj5Ef9RscQCzC2PFCBIV+SKTAggWv0AU
	lG3OwgblebJJvqHVyisk2doFwgGuNqVh6LDjMjUUdjwaDIcA5lrS2QPvSwVT71IMgJdSCNULbo+
	7tv6L+DSe04shT+FWGS0fElCrh1r9GUcD5TKrF8CJqhZ35sPZwuMwrz0gaiWGmHWhaQHl/nPP88
	Q9Yb+EATLOaOpTHRdqm4qoIlRJrAT0xJJiYgXEPLuetTmtSPNzGIcQNBmPxx+poi2Y9DgQQLCte
	dST0yTkKPQ6nI/HJHJ37bp4eXFW/t2Z7PNDuJtTyMS+TBzk07yWfMSP+qRoQ+m6ib+pmE2N63iZ
	zL6wa2moiBlJskzbEmXg0UB6KNYjOQMmiHYeWkOl7dAaQCYjIsSrKBRIgwIaFjqOTOdpoM5HnOy
	emtypslCktO1nhpV3vW/vWVjcyxZOpm1Zeib0OMFLDHPBAsuYwqgYCLMzn26+L++mdiaWItlcsV
	4XYNvq9sPpJI2GBMHY4jJHEv1AE3udZAYPsktCg2RQHUTdvAufzkIx9AUITC1+eMw==
X-Received: by 2002:a05:600c:46cc:b0:49b:909e:922b with SMTP id 5b1f17b1804b1-49b91c17b6dmr7287535e9.1.1787851735928;
        Thu, 27 Aug 2026 10:28:55 -0700 (PDT)
Received: from GLaDOS.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm2174405e9.0.2026.08.27.10.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:28:55 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Thu, 27 Aug 2026 19:28:46 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787851637.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787851637.git.stefano.r@variscite.com>
References: <cover.1787851637.git.stefano.r@variscite.com>
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

