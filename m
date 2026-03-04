Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CCC37881E
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643614; cv=none; b=iy1w5kiRbYdjyKg+VItEJPhDjLxUNKH/aqYa8SOtID8lwsDnjmaj5IMZxGYnj/clln6M64Qg+BYGB2IAA84vS2qbf3Hk9zhRgvVzwr+hwSVUf0y9ERFkpTsIlMzJNk0GF3vKvCBLOqty2JJf1Oqj6Ntj1VAeIlqgfIihPK+BW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643614; c=relaxed/simple;
	bh=oV/HbiXIGFqrXpt9NkQmx1zq93J5pU3le82qoXLezaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gm1tZ8K6m0KgPUrFNA55dK6qICwxi8/5OJ5FNy2xggaqgTBGrpZcVZwywEiieyK9G5KPwVbvSC8Z6mA7j8vbDyA7r13AHJVZi9hI2Pwk7zp2swWdYtbOfthKQVOqEGBWZ9HOveCDpYJwKKzd5P0uE+pKVTiRVUmDGI9CytNl0GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lb9vuFTT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lb9vuFTT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48069a48629so75316895e9.0
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 09:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643612; x=1773248412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMoZu6JsfBdWs22IfsHWSodVPNZBAYSFrj3NGjYl6jo=;
        b=Lb9vuFTTgvdGCYxlz1mRj+q37V/xGYWLKNmGMzAG+JHuFeiuNzTT9+a3jKtHlaXWB7
         h+snoIYXKWnVGf8XozfAOa3EMo6YxiuDheDV8Q8saX++RKfrrRGs5hsYmepUddNyBvfe
         JB3b11z3mDMDkc+z+RdowMzjw2JbxUTjxWqaI9/pd/TOl7075vSXvkBW3OH3S79QxIv5
         mLOn7We6pEJzV+jRGiJI/t0Ws1/AFhZ1jFsyyI25a4Q8aHZLpexUBho7yQ9X3Y/yYien
         FTMWgW2gmvwsRJWuMvbPRmGo6Pyu8WD/c8gph8Q3XWSWiT+HI6EW11hShF21fKjFcbtR
         IgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643612; x=1773248412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMoZu6JsfBdWs22IfsHWSodVPNZBAYSFrj3NGjYl6jo=;
        b=ppAcw4+23+runfRe6kh+mAze4WOsjhcQbb7sFuZBVtki0l4Imii3XjWxJ8HRDb/4Lm
         ZAkqJogBEOM7SKDI6G6tLr1Z+cvTtlZFQzBGmIqpwi95X5vdvhrKnxbZ4gft6OJyL0q2
         QaDQgmwZUhhC9dsFuESTkKioL8IxnrhpuWaWCmn1blG6Ero9ZCopuRWhn3XWTuwwxSsR
         CO24rkXUUNap2evt1oGxVI3FqjMjOqJ5BJrTu3uniXyWsmg8k+nmddtIzJ7KAgHpiB3z
         QHRxmRtjq+JvSKisf/XDbQYNUp0mycSilhQYXYavQYZml1gGP6ZuedyahKZ/4cZHHKmw
         XLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMDFwxJdtWOzs8MsfmyQkzQLVZLb74SN7LNfNjcji/7DvXQFNhLS77zLxC8//4+yzZYno=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKVE2yg/G1EZmZCfgdQFeW1Ps/qY2cCGXVaNsFhobYH/6pKx+t
	/IzO8+4eyvDXFHHds7ZeIYeKZ612JdoNMQ65iZCAcpsXrdFDFSZIubH7LHUDFNKa
X-Gm-Gg: ATEYQzylJnJtTMoNCYe7N3jJT+8Ad74MIuTi+HrbuJXBaSC+zfyObQw9T+ABnubcKvT
	1IWYce8IT+QAfZ7T5OUUuWFLqQ5LylG/NqRDIYWCG0jA6WVfBIloibbZmCov/Hmp430qOuDKEnb
	oSYIn1YeiPPEVNG6Q8Yim8buYUXsfyQP2lt8Ox+Z+R5+kALvrdISkURI3sXpfp39YrwyM6I3kGw
	l8AniLgipV80HCdwGaCY4z0+J1ib9LgF0bFc8/twJ2HKe6Fg+lmwlAidV9mpjM3NYAL6BTqnoHS
	FeQzz1ul8mX44tfv3NRSgthV6QbTLGXEyZSuK5iapjVWJ8wxJjBjOabnMeBf0IPfJVvVSJQreos
	5Xwd3H3tB9l62eJwGoCb0yw+B/lXYdeFzXWzNdXKEte8qduU4e6LfmQjh5bnLEMM3MyFkTnnofG
	QXxwQY/ij4gMXAe7fVD4QUcL8bWulumfRaQ+R07WV7XIGSqc5WgRwXflPz+INqM6XLiYGG+Volj
	QK6NzNzy4YnXlPreP2RrNyYeWH2JD8NmmAc97dR
X-Received: by 2002:a05:600c:35ce:b0:47e:e414:b915 with SMTP id 5b1f17b1804b1-485198312d8mr54301665e9.2.1772643611400;
        Wed, 04 Mar 2026 09:00:11 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851887fc54sm69946295e9.10.2026.03.04.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:00:10 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Wed,  4 Mar 2026 17:59:53 +0100
Message-ID: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772642881.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772642881.git.stefano.r@variscite.com>
References: <cover.1772642881.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Fix space between BUCK4/BUCK5 aned parenthesis
 - Remove unused pinctrl groups

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..be2b88c3d9ee 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1545,6 +1545,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3

