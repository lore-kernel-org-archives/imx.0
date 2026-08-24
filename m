Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FC13EFFBA
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584126; cv=none; b=HBGQBZPhSyZBKt+PWCgdCaK3/9mQo9R5jsqFgZEMk/bvFmQAD6f3+OE4XQ3dSssV8xKGmpsglPxnWCSp8jX5B3FDcduLgvMUWxLpWkVi78Z0vSASEllWUxg92ujHg7039YlZ96g123kieP5egNDEsPyOzhdJLsvptLklXDg48Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584126; c=relaxed/simple;
	bh=LDXgvPITOy7Wzp2qLM6nW2q3Obp/cM8X8a43ouCUsZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpNAIMKarBsTGTfDPkY9y/oHINankowe5T/dX+jZU2y1exxgllDGl8iNqPpRDIhVcTc1ZMjFj6A2eR3aOQNZjylPuYPyWc1JSX4GTz+KpLhxVrZ22T68BhnE6Vhljmco9gFvQmpDu0SH2j2cyuJEu44vqzwTK4PrytQVETkDzrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIKQKaws; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIKQKaws"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so6973466a12.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584123; x=1788188923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ik5aO5/nHcby7+rYjiLPtw+6IFCuHvPcelwFb5FW4U=;
        b=XIKQKaws0++JjRe6c6JIjmw0cybMX5/MFbT2nuF9uvRJ9RM6vyMeEDNvexKu6z7a4F
         aZ4QwKe74GwxeD+tewUYOYNjXX4XgwH+ul4zKxHIPvKjMrCUjIX23pgSIRKqAEsstNvU
         d4Dfo0u4xpG+pdMKW13axuy/Za+UofqGOPmoLsoVCi5B0iJgX7hHP19lGBpG2sRhCqRs
         zU0mBkIJeiQ4mnhZznbLCUZ+uiZNffKPPrGVczek4B0wFTjsc9XdTIplBuCAOco6C6mg
         u7pE/9HhSq2612HJSr5XxteRPhQLEyS4d288G0NxDJfqt3wFCfmt7J7BymsXBPOhNmrl
         DLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584123; x=1788188923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ik5aO5/nHcby7+rYjiLPtw+6IFCuHvPcelwFb5FW4U=;
        b=Uxh4Y0bwUyqs8a6BtBt7UxmHYNBRR/hropGaGDEnJNDwJuCygHKPxSkuMUlHNmre/7
         3sH8S3X/Ykp94kiJXBflNmawR50pHUTxi1SL+4kePP7io7YHpSAx7xuNRBrXBspM+zTP
         Vp5vbxkZu795SFKUEh13h9fiPl7dF5EOZwNnKh7pC5yrcHcBhkJnqmYUIGuZ8+NOZ1lP
         +jEzGmY9Omq7OFUvoqhaQy8PqwctMyvdd+8rjrOGWIAIXs+4Ak/Gs4pCeziWmEpwReOC
         bpTG2sO7I56Wl7PD88KjAlJEvAYh25geZXDA/Z7FK7ajhEJaoiw/rl9xIKAG3cgtPK8o
         wsVA==
X-Forwarded-Encrypted: i=1; AHgh+RrXdD4gLkb3N7ruWbimOmUPmYTD9pi4RIORdCOXhc0xNLYbuMqqu9A/kdt0ffvMBtm/VPM=@lists.linux.dev
X-Gm-Message-State: AFuF++kQS5tXTv0X+3SXETL7bXuyQ1fBHyU5Q0MEd+yVdagI3Yle5nuw
	SWzohzhNbNEM/PUIddUpv1hGXe6w5qLnGC8PmFMNUb+Wb5h3Dv59opKc
X-Gm-Gg: AR+sD11EMahiUXlhYNFfSHc3RsdCmaQ3p5wQkRXj1uVvDjYqmH7NTYZU/LN8paDt2sB
	7s8vTBhj5SUM4aIzjEOTBcE3jzRPs2jCJ9aiW32aDmZFgX9yM6p4mK15Qku1tNFa6loZLiFZNJT
	7yK7Ap2gRe5J7JJd3ucMer8Xyvmhz3rGq+CyrT2c6YYxy2aJ2cFbo5sSOLnJRLYEiBEJJmdy0DB
	h73d6MIWxCkA3mTPAR/HMN4MWLYzMXYCCrDukOMklbyDoDfldWbtQUmP2YilDmlXnqNUINoWbtV
	8jopUXltkskxd/xVrMrYcZW9aFQiUSdOCzt5FjWnmU/mjqttIIg6mXXlKBkY50xUZirDupald0w
	WBihgWt/HAr4luO04A8aqcJIPiu/wUhvIXekCnAnqIQ1Prvx+pxTiRNFVwymnFe/nnjxIs9+79R
	fBqzsSuMY9ZRNlk22iefsOfkjdBJ/pS+KzToY9C8/CUSRResyfA+zXqLjvvsj5GxI7AxxKptZr3
	gs9wHh7a9XU8OXzoZM8ZZQirg==
X-Received: by 2002:a17:906:f59b:b0:c20:7cb1:9046 with SMTP id a640c23a62f3a-c24924b7508mr2126766866b.8.1787584123091;
        Mon, 24 Aug 2026 08:08:43 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297189sm1273530066b.22.2026.08.24.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:08:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 24 Aug 2026 17:08:28 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787583584.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787583584.git.stefano.r@variscite.com>
References: <cover.1787583584.git.stefano.r@variscite.com>
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

