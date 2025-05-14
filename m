Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885322172D
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211121; cv=none; b=lZbVDIVf8kr9/SdohJb2+f0Qk5MYmbtUQW1Kv+9WIvS7cOoIgu/y9MGKXPNfkKIrcrxWnt6L+gyNbWG2Fm0oLqBmtODVj8m3BxoyosBJ6GRn3exYFgogH72ygB6SkXf31zG32tr/uPmYDBIDxvnWrk/xwF7B6kdA3HDbuq69qq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211121; c=relaxed/simple;
	bh=N9X9vZIT1A6rctLeeZT1ABMvd9sNG2VCtajtyJLONQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYYpm56B7WJwKgrDEbjjWmVSSe00aPj88lfbwSSAe4rGBuRvBgU6SvyK41vBOlfbzJuhc0FxlHpKGxd5+PjnVpFhRbNEt3O+3ZcWC8FwUWXGfnL/7Z7EE5vmaMTu4uoS/2h4JdjdxT2Jmonh62pqn09/n/M6fQOBDDoR6m+R7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=d0w3evvp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="d0w3evvp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso64724605e9.2
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211117; x=1747815917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU3p2HZazfv/x9pcuc+uTWk5M51PePRd/7turTCqc5k=;
        b=d0w3evvpD8RbmSnm6rS6dDINPb6wceA+UC80oB8rcZ1Ovb7Xdxr/qX6R/OZL1D2sYc
         nwQNQKTzD+JPRhfLhIAY7YVd3LMZ/p1Ty/chbrd57RjXsDI7bHWCN7Q0YcB+5kzOTMHD
         3GPO3We/FmIlYAeMbujHAp1T75rgreEr033Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211117; x=1747815917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU3p2HZazfv/x9pcuc+uTWk5M51PePRd/7turTCqc5k=;
        b=vMCeEDYG9fDdcWXtYuH9StUVCuMqyh7puFMkJ5zuiSiOAIexaMX1ZaxmxKHmNEfg3d
         WvpcBTuqEW91g1eAcIWvmoYolmd5RFXdCL+D0W6JWCSTSADF+8nU6xg3ISMgiPStOATT
         ws3MnMzie5p6Ae48hhFf7nKYgt/oY7+0W9D0ybUKcHYGkrGgJjwgKoORJvdRx3+ba/jk
         7Lmm7GBNwfKQVquVfwvIwbP1fowAm+nHMtAbQAUrLumyPYzEirjOagBuUo0xzkGmcYmd
         03UEHPa/PqWL8mi7vN+hZp8bdQmJbLF7zOUi3dWhffDwaX3k98ihRKL38IAP0B3qLNWn
         6XCg==
X-Forwarded-Encrypted: i=1; AJvYcCVptYuLoOY1xpmGVidp16LUsGn2cKuX5ZBZPaQyALluihuwCN/YhBnA1ERWxqBtUiU8Jjw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/hIA5Qc3R1Nb598PRGguYMpLxPoYxkn4Q5kWIkthO3kds3sm+
	PORNGH2CiZtOwywdA4BRQr2HgHC8uxCxREN24z3Gk/aXky5qp7l8Ea3FsCEYtCc=
X-Gm-Gg: ASbGncuKUYG9gdkLS1dN86+hbl6bu5rItnFXMjimyQRyz0IDT7s7GV6YKddtaGXUpiW
	j1R4jviC02zn1hgwGIpxqCnblADcChLxHlIm/eF6eX8dmrf/SsKcOozGQkIiu2XTL6FafiChMzZ
	/E613ylvaiit98DKNY7OTfC3tsjvBGSkwkQMzoput66N1Exv/eQyED+Coq2Xy7WJ5HTRpGcpcAY
	/aTjOjoSLCl7yvUBT91JzG02C6BV46KZkDPVKVPiZ3+qiJr/0/zX0G3++jszCo9/BoyzZLW1Rr7
	nV+o2SV5geawzQlApDdIfmMBKOgD7ut+ghHIod5KcQrVww4lNQRDd0d0wCjFFG60MOU/MxKF+2A
	oURNYhVPGyCEZHeUxUzqaHpsNECZFDbzZhMMq/kjebso=
X-Google-Smtp-Source: AGHT+IH06rcSnfaOB2OZhMFuSXU3getNgBYXw3VlOzykqn2k2DHIALSzS9mBkCxcxDKGZiq9xxXxLQ==
X-Received: by 2002:a05:600c:1da5:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-442f20dc6e7mr19271805e9.11.1747211117060;
        Wed, 14 May 2025 01:25:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] arm64: dts: imx8mn-bsh-smm-s2-common: Enable GPU for smms2 and smms2pro
Date: Wed, 14 May 2025 10:24:58 +0200
Message-ID: <20250514082507.1983849-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>

GPU is enabled in order to use image processing so it must not depend on
display

Signed-off-by: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index a983072fb835..de70cd3a392f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -77,6 +77,10 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
-- 
2.43.0

