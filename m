Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2B47ACD1
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315294; cv=none; b=Vhu05Kf+OPOq9LHa5SZWSuC+0DrfMhO5zfRlspoamLyxPGiv7kUgaA6maPSTwt1llnpJKYSAdMqGDht2uwiish4DHNVu3JGhgswW6l6hI75VWFg1OwBDWxyJQeJf3ukkaPvIAGYrwcVrrd6oS8kyABfGBXpalguI+HGkNQFED1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315294; c=relaxed/simple;
	bh=9deJD4c057ciJX+jP/7khGcYZHlb7Vj3wZuZ0+Y3U3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVizyaaCHqUuWPycfKrq9T8KywNI076KS2wyOWi7cI0rLFeGGshX39tF2JVpBBG7JL1J2fCGgQndCFZ4Yyz/4XF7NvDRk99q1NV6HX35KHHAS+GlRVmB7/Cnjh6gZdNMqiSTR2rvdlMx3/+/gJrE4feRr1XC5SNQf9ffONaJK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrKEW8Pq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrKEW8Pq"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so1699595a12.3
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315289; x=1787920089; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnb1hnrwJYg9Ac5/Vnbdf4M0HUhLsGXMbMJwhXncPks=;
        b=LrKEW8Pqz13+boXhUWbhDNoH/NsZyau0rGPHIpfTGZjlPWFJaOnKQ785TjfP4mEddV
         nBrInBv/pZr33zJjnodH57Ri06925EdUpK8kxh20udU2S4tbkcuYDKUJ2Pot8BBSTFl1
         vIUl9GjuKNnmi1iwLDRx1CNTlaUXPEpafaA/qaXN/c0UZs6z9ZaZNc7ks0ktuYqjnWbW
         Ftd1iPQcPqOxOD/TrlJgiBm9hgmzhvTHij+7Ib84rCcklPzV95I8JY4C6E11VNt7UoFY
         RhhVEOLoJQ4eyu6A9FBlhbJbzxU6w6oX77Ga2YJLki71um706ZouB/RGdiZVHnJnhijW
         N5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315289; x=1787920089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnb1hnrwJYg9Ac5/Vnbdf4M0HUhLsGXMbMJwhXncPks=;
        b=SjYaUWMsdjEXL3jS8h+sES0eNBLZ4njl1KjkAN8uv6HV76nfEN6BBipPyCoGxTq+Kz
         4tak5r6Efnv+OSP5J6OEeFIdcfINgrXI3qxOp/2tr8vW3MWRMlcGyo8ma6d4btJ2drsm
         hNcziL2CaSeOJSr1J4o4ph49eEMOGgLZq1slL0OEjEXDqkOORea3qZ9ywVR2+PpEaDdx
         jMtmBv/sasOLZ25p7fjUjX8a9MHqk/t7VcsANAqNd+xigyVR1HrypjcfAqQ+SobvUMO+
         8CWDvv0NMMD80rQIrp4dHZw4uULi9GsYjz3SxZvNE2dxczfjFL/LZ1QyAXYEucwMHZUY
         8ZMQ==
X-Forwarded-Encrypted: i=1; AHgh+RocW+dpMw1VUbsqeaKPI1Uyyy1ldupONcNAx5xXuZhTLKRIoSHO6T+Og7m1y1db1oy4hf4=@lists.linux.dev
X-Gm-Message-State: AFuF++mAPwbbgGPyw+TKYMGeYu09l39wSy7LnMqpMSPX1ShSYOrNbo54
	XDVhsbwb44ouvb857kj2aoUjTaA0gFBk94sPAT/3ESoMMucN57wdFwMt
X-Gm-Gg: AR+sD12cCp1XQfuyLLkm+LqtINVOnckNT8CNKfZWQ7QE6NqxakiVYEviukYKqIgRBjt
	FEcPs3X6S05lQFSy0Kh/QrFEelbWDjAZwcjPjqa4BhnBn8TQiLNoK2/yJ8AFihcbiZNGjbvvJd9
	Crxfo1NOi8CcCDCoqsFAUXCXNLkZ7SCJEv8QCJRxXMQn9MvRira2bgZ4rN4tgAjJhEbSdC0q1rB
	RQ7bXAOE1YEHQVpIbSyfDkg/UcgGcA5CqgBvI2fr8afwo1afq+IDuTaYZTmwv2d3ZMXHLbRR6iH
	32VH4BV7fzt161ZYTadNK3J09KToYJ7+uvUPTsFaVdOXF2/buWSAA47zqzaJAD19ncqwVtl4tov
	bjqFlMvBcDzrtvn7G5BhZGwXfeMpu/6QC+DMMGc/C2vfRnSvtrD82iAvhNe5SWckvkZJp/BWuNP
	IJzBylHU6glKMAs6zSLPg43cXm9lzLShwukCKmXu73B61K+w0KP5odQANGyjJtETJhS7/zMzbFR
	ajBFytrqSCH3BHdWFOSk1ApuLv6w5DVfOQp+2WDucDRAp4yK27U5vCW+FEddiVORsff
X-Received: by 2002:a05:6402:847:b0:69e:9213:11b with SMTP id 4fb4d7f45d1cf-6a42f1bca7amr5773872a12.13.1787315288354;
        Fri, 21 Aug 2026 05:28:08 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:07 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Fri, 21 Aug 2026 14:27:50 +0200
Message-ID: <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
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

Both the first and second hardware revisions are supported, with
eMMC, NAND and WM8731 configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..20a225420d20 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+            - enum:
+                - variscite,var-som-imx7d-emmc-mx7customboard
+                - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                - variscite,var-som-imx7d-nand-mx7customboard
+                - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+            - const: variscite,var-som-imx7d
+            - const: fsl,imx7d
+          - items:
+            - enum:
+                - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                - variscite,var-som-imx7d-v2-nand-mx7customboard
+            - const: variscite,var-som-imx7d-v2
+            - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

