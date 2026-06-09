Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA073EFFBA
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995471; cv=none; b=klPcHRt6BxHRjZaLBiFHN0citz8o5RPKTQc43hCU2/PJQMU560T2nkGAnv633OpqhF7WTdhFNSX+J6v5Us3MjfsAbXrnd0xDS1FPYj17kh6skAHs6wSIgAWMotTPP28G5PmOOOk/Bka9iRnfYH5PvHGFVT/D55OU0FmPgGnKes8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995471; c=relaxed/simple;
	bh=Mtq5YoV+51lq6k6ws6ZlHrk+B3jv5pFSIEX8DYg4QOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YC1IgIRDP4s5Pz7RXw1PQM96Y3jpSsfSeEjHYkLvvn7M9P9dBoK0D4q2Lt7Gr3S7ILw9cgrKDG5tDrrc8dDNiOYHtlzRaL6AFXm0Cqhd+qxh4HpmUO/v93azlA60Q5aK07U+3vQ/U6G3ujRxAeSd9uV9TcY1uqhmnCda+XsyyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+WSAhBG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+WSAhBG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so2470650f8f.1
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995468; x=1781600268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=;
        b=X+WSAhBGni/8gSJmtlGqF02Q+0mWCqJUBHFf95BPZxKSAiV3mAiORi8sS5JFHPDWgl
         JzqPguCoglI/mM99orOrhwsryNpYXMuF+pH6rRDRLadY9PghkmXX5qElxAUpS9cBMo7N
         loEWIYY92LnRNIPJWRqXXTxi4IjYvrdIYJoFCPUysEj5mngyIMa6Q9MYzOyaA+y1i6AT
         Xv+nOKqayceZmmss6RahSIuPeDQsXbGUXWJIISSEOGsrGMz9OEUg7m780kUxKDnTZllY
         PkJqAxIUTs4Xk7dV04eUzF7h2QQiWedOK952IrXWW9wnOZEwraJ2QB9yjFXXD3tCT4zz
         y5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995468; x=1781600268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l5288BorggHw9MSbYVcCYwGEjX7Q35lfmyFOFJzsEoQ=;
        b=E55eZrKY5jM4Qw8/APE3NAWrO6pN/WKjS/xDlTn/sHBnvq8xKy+pzUor8UfdUPHVl6
         03/abCsMZmLSbQHp1GjZP2qzu18+fsSf1fByWrT/H4Nfj2GP0fKEQ+rcNC3OpZvj9qcD
         QhTllaBDi3wVJ9zhD/srYTPA+SF3sSrkD391uJaQlgos2iKBHsV73IvkFV3p+W9U76eW
         V0mfklYlNb7EUL3iJtgV9un0mRi/KGTAxINNBZ9q+gMjg65iZKG6GNdMY3SMEkPbgPIF
         MnlNCKmeE1Gpw/Lf4GIYjeQIeqK94vkBHOgkkgBRbx2baPbr5VKc3G27MeQt7hRKOkkJ
         7EdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8Ad1h6OwjWEAoKDselYkpzFDTYFawC8Z8S0XJ6QAs6/pggNeHonOo7QqZYjwSkAm2p5k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfnsc2HUyE5KkJY8vMf3YMfnVLYbjiZuAtgHe5clMGVrNzFUZh
	CPpRgYAjx9ogHq6S/V2pvLUjIDINS7iSuAY8rXQ4uayUu8kJ6P16qD0m
X-Gm-Gg: Acq92OEGmWskTmvyxesSTi0taAACYKFXCujxd9JMtFSHmOjgD/POEYi7NB1/1J/UziS
	k8jps/5umPBvGk/w1R+Q6mM4xMqxxj4Cyih6JAWCQKf1bemM/7YuNah2OISsbLG/eJ3SAs65+JS
	b0P7g80jS+O+f1GHGms3Bqg0N3sddiBSRfczTaNVkj7/IV0R97pkMarBIk4C52Zfb3PaEktpEN0
	BnMMmpmX1s0biRVY4xyaXoqLp5ffWpxqPKnRJe5cj6JVjI9JE5pxXukOAws5VaKlo7TjUPPfZIE
	xaVCTz6/Lhap/uL8AVwDMrGTp1RBtxVqJEp+o+ZU9imEfBf6xItuQW9Q6UTU8O6hQ29e2sdPnVw
	DFACxQsBMSvvrg3+p9ZjMDX+2MnpM1aJlTKKcGsx/PA1uUrBmBssDhP1QrjsgRTZKVTh+9acmn3
	kCJADGbodhwUopR0+oiBTw/0dn2IwBCPXdD3cfAkb8nIye0S75x5MGxOFl4O4GnNDYPZLmkPVQY
	CvK7uDYV7y/BwDsOsEFv4oQIRXUsB29dfafGwe4r0EF5WA=
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr300911285e9.14.1780995467635;
        Tue, 09 Jun 2026 01:57:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm305234475e9.2.2026.06.09.01.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:57:46 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 10:57:38 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780995368.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780995368.git.stefano.r@variscite.com>
References: <cover.1780995368.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

