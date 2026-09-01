Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26ED4766A8
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268824; cv=none; b=MjIta8T29INjcN7bcm1nrNCEvk2lstJ6/5/Ifd25hzbtXer3zrhdMJVWXF7g4ltK0lOzMSduwfYshe4PYL/0ke+TZd7JF8dvOxLOQTtqm7Sv1DmoMwyps1MpHh6cK70Hs0lRX5WMz7ccb70+DyBNacHF71JSwQOA4i+q8To6pJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268824; c=relaxed/simple;
	bh=otjLY8M+I6ZgbZOeUnR9kBIt/DE5V0fH5Sljc8GFFI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c63hykQfhxzS15V6dN11z3A/1hesBwrxYE0gV5v8KLcAmnH5Z9AacF4UWT9OylxhyoYVQ7kSnTuFE5h5+adtE31nitS7wMQH0KOuBO2JtamZUdTxGrPXrfilvkvoNydHzRzo74hWU3b8cngbH+fk7H7Qp255NK0SiIrH589VJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhNCmj9+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhNCmj9+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c253425b253so133051166b.1
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268821; x=1788873621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=mhNCmj9+IpZDRA6c1oglqzB1/WFVb3Gxy/HOpQ5VnV82HoMoIdZTEZENj9CFc74fOG
         nlpEYIsktIdqKWyzJYtNp0y607czjmGCkHEK7wTmW2S+X8Yt3Irxl0uiaRqKSy6X4+OM
         9psKdtb2vDgwBDshU9z+L286Q0tl4hAwpnxtzSDU1Wxb478PrIIR6v9gBUuRZ5mejyHL
         QsXIjqxN4PeGz0l7S7U+00haFq+OF7Z/sxn8QM09aS+MJJQpaFYdMWfvEwy8Ty47GvGQ
         luvLJln2OAY3lxIyQMIPca1PgTcnFv7kQzkuJzd3RF2iL+pTTsrxiooRHrljbQq6m+k0
         /KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268821; x=1788873621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=H8oo0wSkwJHY97RN7UGBxMwZbrGwP8ofCN4794iDZgVSwtampEHG4HVeGgVz7PMcQB
         x9zcD+sV27/JcCBaHzTtJ4eUcaPEd8VtQ9PAZSuod1d+O44ckoC1C1YK8ADIqIRmcXNs
         33j5ORxxKE8g0LqSsoAYDEEVqY43zSPLzvIx753Ynd0HWdUJkUbcLIiuVzlhbBuMV38o
         Ez9g2wiC1cBXKN6Gyx+09HDH+wk9GtAqD40y6ZUN28l8gUXPer7sFcU2x3bvDBAZ4MDl
         BW+EUHWpybeMS/fLSm3jEg+pQ3W1bnCY8vkow/RAuW2LEsVSBqV2LBfleROJEitvBXfC
         NlUw==
X-Forwarded-Encrypted: i=1; AKwUvBxM+x/Bvv4E8OIdCe05j7v0HMiO/kaIn/55dT+bnIop9S5Mr15rF89mfeGurnGrqGmCjws=@lists.linux.dev
X-Gm-Message-State: AFuF++lDccK85v9bcrj+2Wgye4eHivCmAtIOW9hbpFkSy//yO4MBki+h
	jBAU4ANSux+S4dD0vvTOCzRzJP4Dyi9zoIF18fslRZ35pkP2Qy3Em0H1
X-Gm-Gg: AR+sD11Umy2kMJhMvDmqcxkHt+ARGQXGwYsgYcmnzS1yMIHBFlhhFUkQr9HA7yBDnJB
	oWVhrR0c4pBwf7a8GZuTCAXcVDBN/VP9vf2X12ZMW/ig9/kEQBokBf49EYb3LjzY+D22j78riMS
	M0ac3UIGCPIyq1ZSxhkSPXj605iEio4P3185+xfmEFt6p5NLenVXdLqki31mJsqyWctsom13l1p
	RyhNBU3ID99hdguf2iqHlZxmAtG8GcUlA+3s+prDrqNRMN3J0T+XGEliqOBss88eDoG+8NSlXt+
	G77AIkRRS4cJEaO5uABjR95Pj4yJ2dUyFnwI918UMEv+Ukb/rsf+RkKAsNd3Q1kVvJWP1oAoW+4
	j6iCROw8AyeR5aysLKhZYY/OvcBY5kEE6RcejyMDmXdFEXS7FTiWyXrpFhMrbE4gplCN3pHp0zJ
	vAZAYNGspLDKV0v0G+7djqmoLfjECKNqm6slHTvRekxqBV+l9II8vEDEywZfrnE9jm09O3U5TGO
	W/GQmar4PkxyG90
X-Received: by 2002:a17:907:9618:b0:c24:457b:86fc with SMTP id a640c23a62f3a-c25571d3b0dmr2071588666b.21.1788268820741;
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm580304366b.22.2026.09.01.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Tue,  1 Sep 2026 06:19:17 -0700
Message-ID: <20260901131918.1189-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

