Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9532224AF9
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588871; cv=none; b=cB2KVI3R7K/rc3cmGUYYgrLk1zVghRVHzaQNft4toPxzHEGsIGQS1x5T9KBGPP2wuquhbpDr78OwobolEE3Cm/Dj2KAaq2qXQd0pQW3Ke2k1NYUtALm66tsB6sZOnokt9HLNTMZZ1oVqe+auUYHI21ZO2omnBkKPc7OQ5SpPcWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588871; c=relaxed/simple;
	bh=y6WLP7rMdro7X3S5FxjI3YJe3AluXm0ue73PBtIJwZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aaf7lvBu+GSkllsiBrdb4XxaBzHawc0Wo92NHcGdU6PBVbzRobgV9FErJAVGll28TIIHPjfOb1hPuslg1TDc2n6/91CuqBSn4P4Af8tuTFRp94jtqCK6ho+VaGxjfe9irdZSh/hc4AYM7d61Sdy7DTQKt765/WKAY6YQ2euJGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilJJcxks; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilJJcxks"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4399deda38cso322785e9.1
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588868; x=1741193668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sq6QQJrbjxptSVsPKB15/DnBsw03jMlmrEEi8aA8tQ=;
        b=ilJJcxksNdBrue+g3a8FTjSI2mvpwtH/cmWzLxWDZdTVLs+hq0M0CnTOssyYACcM+T
         JsZqbVvmB2pKqOv8xx1PuRLiNFqGYNoWtoELNw76nmy119HyLxA8Lq+52SWG7iQmZkS/
         KrkMCGrP3zW2MFedHazc83ERrM+jBmw6cmVR3iMFaFV+uEH4fHkzTrAIR/Ad7BHGLq3P
         NS2ZrqPZWSfn8zzm1+8F6HU5zn/wl/q0G+VgoQflak/2nRG7CFJbAPL/TQ9jbeAjyhxZ
         kF6KLogzMu/Hs9kV5vY2hP94JiDqERU4Iu+/LUwqbpd/CkJbdv65ioTOIgf1NLXA+xR+
         YUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588868; x=1741193668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sq6QQJrbjxptSVsPKB15/DnBsw03jMlmrEEi8aA8tQ=;
        b=p1drtfvIumpnMw3/gWMV5HaXR/tf1X0N4kLoP2XOwD3fmNxOS2+BF/5TEUYs+OdThz
         TEgOQ0UXgLD8sWql4QzBbCyyLjurwhmqgL3jO+Ke7FZHcpt0BB8GcXcxNr75qeD3HgHi
         uBr7tvrjjZ3LOwI2xMgvXc+alJnTOtqSVDCktlSFUmHwcVO72Xs7GVYcjBfdIktT63OY
         fUbVX3a7cCnCXgVlGKF42EpHtjIn89rHOOH3OZP10lPQn5pGuRO/rRZfIL3ontTqJDwM
         9YvMNC/m5+RBsogp/ma1hBCTCoasgqvoD1o/redzWMnpenPb7kL/Kwad9F6RAR7vDr8I
         qvwg==
X-Forwarded-Encrypted: i=1; AJvYcCX8JanbHaxseY17VDS2DB+GRBoFtLZ/UBolP9FVSqbzM7i1cdkpvFV0Qfdas776XxNMYcY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxorQV+gK188tA8OnbJEtHVIyptWuPeCRyF6SNvbuTKMq0I5ecK
	TUGmyfRNj6UyV5+FW9iUmYh0OlYz2SCOpMLgLp+uI6sqrBuilct0
X-Gm-Gg: ASbGncuoZl11W56jtzxBBBM9zYz/QDZLP09TSqzsLZShKvbbNb3tbDqnr06AR6+D3+y
	bHB6RZRN2LMKSPqz6KAUTQBYiU8rfTFy849p/CPODzOHvySSH87AVe+cXptuo/qATOiHe5zbse+
	pH8ULiM0sUpk1cgH8/WwsY0gCMB6FTLxelzNwDf9nN4lC6PUcEZ0taT4IEswfIDRyOxM+zVkjh3
	/GHlZ0cZpCvqLzQcbUyjLIxM4WmplyNlDmjbyni6+301c7wO2Ws/BlcU6KqVNh52ivDpyYYb52m
	l9T/5bQTjI3rFGn1984VOUQKeU2Ho7t0bS+dushkSsdIQgS2LJZ5SIJgizM7/oY4
X-Google-Smtp-Source: AGHT+IEXXamHHiDSidMVxG5Ktdrqqy0wdXIkMLj75ieYD7dfdn0/9TUpigpU8mKWwmnghiqB5cWMCA==
X-Received: by 2002:a05:600c:3b8e:b0:439:99ab:6178 with SMTP id 5b1f17b1804b1-43ab0f2883dmr71707325e9.6.1740588868020;
        Wed, 26 Feb 2025 08:54:28 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:27 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Wed, 26 Feb 2025 11:53:13 -0500
Message-Id: <20250226165314.34205-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..3097acb4bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <0>;
 			ranges;
 
 			spba-bus@30c00000 {
-- 
2.34.1

