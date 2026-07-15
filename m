Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C430D329371
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 19:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142571; cv=none; b=Ba4dPqx3pqjJs3rvgsL7CffrgbAgeH9dYGCUNVfVtCjV7+1Rj+S3Ndo6CPSm4sEnwzD8YTnNJJQf37oKeczM8IjBDV/cQ0kIhj+kyGWL5QpGLnemIMZIIco2Y95SrpXlUoHrOqICDFBu0t4utfSBZ28h5JLSKC2kvN7op0gyxAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142571; c=relaxed/simple;
	bh=499YfWkvij399Lmn6MOFAkHTTMRp3urw72VirZ12gVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EO19OvNvvNS2vvGuksd9YFAUSq1SkT2s7uw3gQKgjB2ugRJVkUFoO0AKZcX4n+uPV43Qh1y02GOZjsFSJX7wjQhxiYJ3LaeJu9RaCKGnBwCr01spANdasOLo1azbbK0QmQ+n5uN/wF3VZEWo6h1GZGteLuzyvxjYiphTFg+rVEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKycmDZ3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKycmDZ3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f6de72faso14119315e9.0
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142555; x=1784747355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vjquDoFxw8QXESgtnQ6Jsf5fdf872MsxxDRv+Zj3Uc=;
        b=XKycmDZ3AFfZwnsEZgibCpNNCKsS5gfmildnorUccfKTmWt/D31A7U2p/R6eEO55Fp
         d9c2ZQSTq+eFqeZ1XMDzdOznpDtLZQZT5xBW8bqNnX/vJGKUecZaezOL2HdFL47WFD3t
         Gx5ca2VTHMTPioHx8wJqdeVk20Pn8DMCGVQWLpRpfNIgOiZzGucinLfZEdMqQN1VO+tN
         fDzhhLNOAwzUZFwU/ijCdLSOrWga0GWthLd4fhrYq0gFA7S9VKQ9OUb5JHkbQAgJeF9d
         qIwgezSodbgJkCcLS53z64set9I1ieQatclIeGSUVI7xkjYQDG0RKSEBYTj5hUmAnpbK
         EOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142555; x=1784747355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vjquDoFxw8QXESgtnQ6Jsf5fdf872MsxxDRv+Zj3Uc=;
        b=fMiutKd1LeLmc9lhniPhFvzrWGTrF11J8LEZeTHV5opcxDNepqKVcbZUjQyevZRmB4
         /GW1dEwNDgjfNf0p1LaaG9By+Bbi2e0woeSTQ4P/3xDzo75LT649SfeFHhRQkpGvcfRD
         yQKn1v8tn5gTwqI5iLaeH7X10iBJLlYln/k+ZMx3GwFgNLmFAr6K5U3uqlyqibLXL6J3
         ei8jYxW8f5hJWkawT2AluUcMi+/OCr3kCPmxFef/Rfpq7FvLzjvRZ6Nn/wDO16CRePSB
         QfOptakF6HU7vs8gOf0ML0ICoy1tov5mBBHulHEVsY76M/2hgoBCQDsP3rpEqKzyTg9g
         NWTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/UW6GTDqb7+G0MSVGkLhhgn0weYNdzfF/9Yfn7WSie+VqoXlLAm9sJ9XAaenyB8k4tB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZj80hX56ntABuJmusiGpSosSRjhV9sOtWqaoinsi+8ozv/aYk
	cVEKjE2hWuIhR2YMIzsm2GhHBsjAZ8IarJ1j9cLbeuYwiledc6JT1WRP
X-Gm-Gg: AfdE7cm9E+nfqUs/VLC5Cuf1Faj7X6spx+NG851C7TaVXm4QGB7wgOoEdo5rjYZbb+y
	geFsAxd2RvEEDMVd5HgXwJOdg68L09lGkGm+MXCZtAPVjoNz122tqYu00SxS8Cxwoa2BecpncKr
	jCWhd+WRzHOWp9D8grzErG7ARv45bUts6PTmzf2bhunJ26rt+OXk4HEHxZeTI44qT+QrmG4LcpU
	9CVES98xSYPqY80Du7zVV1e4CGIVx2HxTF4tFp8t2fGN0d4xvTvyd8E7o1JrGH4roP0Bi01ko8j
	Kez5wtXsN0tS2/4Q49TY5zq1MFo0DrKXdfHzy0puXJZ+THUl4IqO94rCzkAoqdQc5ow3d9CgvSu
	XeGRmHUdK/7pmMWKMjnietVJtO/jSZfkmhtIs8NdKyEZupRhYbW6u7I5NNbj1CZXUPtrdJ3i8iJ
	yxTSYnvdvD7d+NpkjtErCPqBSu8kXQ1itvMEXVb8gUN3TVeOdJuVCSlcnGvtvBHQVUsbIPFBtXr
	LPuQvPuQAG67N+nYSIo1/SzKw==
X-Received: by 2002:a05:600c:3222:b0:493:ecf5:89fd with SMTP id 5b1f17b1804b1-49540d026dfmr4161485e9.17.1784142554590;
        Wed, 15 Jul 2026 12:09:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:14 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 21:09:07 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784142385.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784142385.git.stefano.r@variscite.com>
References: <cover.1784142385.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3

