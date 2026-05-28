Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A900352007
	for <imx@lists.linux.dev>; Thu, 28 May 2026 22:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005972; cv=none; b=oMkNFMHdvohKVLE9jMQ1cl0SXrBUiJT30u10djgMlkea8xy6FdNW650iFc0c0merIoQ0wFNzyf6O+KprYIo8Q6W3sfrLtt93P0Yn5ezSdSo3499ZTMdUGqLcwcTkF7dW2D2l7Mf2CkcpzIQckXSctX+2SFMeHechTGjtSvzodSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005972; c=relaxed/simple;
	bh=PU1U667y2KkiOIYg6ogzcCeA/B164C/gv/LWDFCZzMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvMcDsA25GGIHxWGbXz+Gjd5cmdVGl0h60DH5qn26OobWyD8VADlycal/q7EepmD1Brih0K0LvK+srRwc2UMJgW1oE8r2Fk3xy4sD9n2BFAeDjhQqSJlBohR5pwmHx6A5JDoxK5cTUG1uq/J+ZKObjAVeiRzRM0ExPNB14NqKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCPGbFdb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCPGbFdb"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d77f6092eso7523366f8f.2
        for <imx@lists.linux.dev>; Thu, 28 May 2026 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005970; x=1780610770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bMfuCYDuzUQw576UfmJ0asuE98Zww1G7gRNmQ1InhY=;
        b=WCPGbFdbgxqPMOncj/lT2/tDZJWWaTbapYGuMv53JOqjmWRAaIcw2VhzXa3Zid9Gg1
         eequOCc69lqqczFmmQWrgUhRTg80efJvIjdt7kTsKHa0U2wBJlP2BkgoKJmxCVNRQutO
         YE4/oHZK09Hos7QkdFlQHRA0Apct3tEEo4RoHZDz65roLLdj9Ll3FeYRnlktfLkGM/4y
         t8cKsOglxD+QrGdMfYhg4k8yJmWitxTQk6aRCnZQiPBbMZ/IYp3dGT5XZSwsf3x7UF2G
         KIt9lXq8Uz5Q6eWLC23OZhWsur1jMRHwNdApGakVxC0mov0mswIzMdF2s2JJ3uVz6lbf
         1rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005970; x=1780610770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bMfuCYDuzUQw576UfmJ0asuE98Zww1G7gRNmQ1InhY=;
        b=Qaq5oTZHl/OB+our6CmP6ohXZsFLax7FsGNnEPdmE1tA3iNXqmOowZY5RqUpJWNMs1
         esCk17M5Y1NZN4KquGdE0cOjnI7sD4HdlMZ3capkN+inZhVUnQhrmsC4uWykpIU7Idm3
         07G8HJRBtO0UL7dhoU3wzpIV2PtBrTEjov7y6fd69Rpr5f/Z15Z4ABY6QLeCkc37H4PQ
         iC/lDra5Q3wwkWQj8GJ4WttcxOQCHjVguHYm0lsvZU733MjJihlAQbEFt6TNhAVP53fN
         5dX4uQAcFZz/vKgE9FRm8ST/jyrGpnt0A5ch3pLNQLv1MPaJJRHFRIpEhTrLT/nUUKzj
         rXIw==
X-Forwarded-Encrypted: i=1; AFNElJ97JB7NNoxJJeWKgGbK8e4pBJBesz2O064d72Ef+gL37Rk+Ndk9/EC2AGD7Eh23v2pUNxc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjpnnWffkl+RTq25A1Firm/ZPQmCHBbwnPXzjsIPGg1Dqb+KKU
	9EWefwskQGDyv28sliodhWeoUAJtnV16IpEfz0ha6RekW+UosAw13dIi
X-Gm-Gg: Acq92OFt4DXQSsuch3FE/OXW2GFRZMpqIyCg+NftGjwWuAOdcmg9HbLjPfJaIXI6jYf
	lyTEkeMmaDD5RXE4B6L8NE7i82d22tQcVO48iRhxuof+vIGUPa8//YwzI4DBr788CxDzzQywHdT
	Rfg6En5uEL0jJXl8uNRE/qULqCpehfA6ht21NUR64/Zn7mPc32NBAilObBfOFG9awHx/ZoNL26d
	F1a6xxP1Fb+FLo0wCTFlrSmdaCBM4QyfyaiilxWCowTTSrViIvlQAzIQ5JaRpPRin0LtB60FRzv
	vf1ximfJOtATf3gIzkLQHW0eEPc1TVId6cW3iB/MQfeR6ApzOqvFY8dwvmcp4s2d69ePE0oFkbv
	PLL8c+aDuha7VVMrN8ePhkLJSRaFDGPpfpw5MJJ4yfYQzRiXm/EQN8YbLnp1trff9J3IBF8YZE5
	Hk3iZ/SPmvTZGuNW+n69yzTt3k/TB3T1R9A4Z2dKQicXGcsM6Xc135LtL7wvFjUtxnUVfdYtmAe
	JePdSAf5XxhFZjIPzxytT+znJSFiQ7UbTsSmKwZG48UgvIq
X-Received: by 2002:a05:600c:644:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-4909c07b4c7mr2974955e9.8.1780005969630;
        Thu, 28 May 2026 15:06:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eec5eba06sm4911410f8f.22.2026.05.28.15.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:06:09 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO
Date: Fri, 29 May 2026 00:05:50 +0200
Message-ID: <20260528220550.34891-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the reset GPIO for the TPM device on the Sonata carrier board and
label the node accordingly.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 7985a42f5785..7a58ad38ffb4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -278,6 +278,8 @@ pca6408_2: gpio@21 {
 	st33ktpm2xi2c: tpm@2e {
 		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.47.3

