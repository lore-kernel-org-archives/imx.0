Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A5B44D02F
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921481; cv=none; b=V4RMTrRcIuf9+iPOjZIB9pcABVJ9DwtOwy7CU+m1HmRllvw0phv1xou7jPihBXYkPEuiYx8Xh6CjVa85EYqTURRVd6IIYkn5hiV0YKxXQm8Ov8aEINyPrD090iFNiSon0LXZBQwEtnoDSVum0iXgwMGedppKnBZpSnGEeV8WJwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921481; c=relaxed/simple;
	bh=2MTdzL38FwzqI2w7zArkHtNA26SHQ3+uWzPtljqdIUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWbA4sH3Rpd5/PJB81Q3YQB0KhZZ8qTj0leWDzNmSXE/ZNlAB0e//hEmO4oFqLwQpeqR7cPITiLwIrgY4M/2qMuwlXYUshQ3qP4FRHzzImZ/9W2NVr5+4uF9eA2d+Hd67NK9CKGplJ3GhhWMALpz5AH4+J8kFZGJjOxB4nJj/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3CZfEJK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3CZfEJK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1266274966b.2
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921478; x=1769526278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79xLShts+sn9/YB5KF2cuQey91jFfbfmfoohIEeLjDY=;
        b=X3CZfEJKkZo8WvrxGlrHykJ3MPdDkjBNKokX3OYRFZ+gy1OjaYBljmrIm3Kuirn9Qi
         j3iF7/t9ybKnRj8kvo8WSetL03XmGrjGkV/+kG+ENFQp//84xKFaCQ+vv4l3wZJ1d8Bx
         BRSSQSQuLIq7/3b4CRoGSxx6e7gCseEoRxanyNsr2QbzFA7A/e3JNrmEymMvtwcIr3tm
         r5qFoJMFThUKpG/0izRUo70uyi0EaQwDVEMpqETTFGs5EQuJs97RlkPVznvgr3DiXGup
         naK7s3qYcNaP/Jjgy30NtkRaMKkclsrXtni7spuTllPVP3CSECtivjKOeHNWI4BNr2i2
         ssZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921478; x=1769526278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79xLShts+sn9/YB5KF2cuQey91jFfbfmfoohIEeLjDY=;
        b=wY136ityhMXoDpHBpdR8Tzpvz+jZd92/MN7HFrLfbxEZ1V5WAou4s+N2I4QAFRC61K
         Q7uKVMnZAfUTcbpha0dvGWw7QUb4B8h05ibLe+/Xy/eC3//RHedaJUOCzFTWVx59BgDf
         1LOfYTg5iCciHWu97Ijf7mg+MMDSYNVhiad/NmGpjd2vq0EbgnB3EO8D2Hv8zdAxsiPJ
         19MwTbgs+WPqy7wCb8eSfzVEgg/Xk8igH41dRYuqNg2JfuewX+Q06M8etn1j0cLB0nEn
         Fd6I2BLVjdVf8U6RajxVQWdmfBPPHRzJF71tvBUlwVeQCj/lWumYc3Tfkyu2WfqHjhBt
         Pajg==
X-Forwarded-Encrypted: i=1; AJvYcCUOL2F7XDoHYTOBDM62n8M7aJgORX5sPOx3t4ZFZQ0cIwRXJDBySaDHy/1pQSX7CA/Xugw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuOZw2GUCBXRKDz81QjknQhyt9Cd1rc64X4KTzY48FA1pavlTL
	fFolXXRStsN+s4qKoTdDikl/oqFk2PgLTGn3QDcaRXXRvzTDR8f7VtaQ
X-Gm-Gg: AZuq6aIP8KQfZnOUbBB7gemAhfoDlBAthOQbKj8QqpYHBPVzR8/E07blW1PzckJeaBU
	qOqTw3xAN68MGNCF3WyR36JB3fq03XduBVD6/tY2fmylbpU2oej2FZxLgk5MDHJy7q9mNAUE0z7
	g3IvNM5CgohA4c03rsixUhmbSUtKo1Kwct16MTbUm+UQUdrTSFGzjPSq0OgRYY10MZeST8JcSVU
	lS+WK3l2OdyG+jNv99OXE+4pP/RhfRGppmqyK4R72Y09fSwfivDeVIQXIewee91pbAmgFsOr83P
	kS6UZuNq2jInmuuXHIUeTcR61WX3DNS+gK5cSB9tCiqzLjtYqt8gjDhm37dIRc2HYAY0DbtfJ4k
	kCkwDBUTAz+bteaA53fhmuoBqBdh5ZkfboY0CMBXuTrkG+Te3dIDjWialmPxUmxoRFqDB0i+h2U
	NnSMUzpVGBg60ShNOO5uxOPwqKqN7OlrX66ib1
X-Received: by 2002:a17:907:3f23:b0:b87:206a:a234 with SMTP id a640c23a62f3a-b88003426b0mr227202366b.31.1768921477456;
        Tue, 20 Jan 2026 07:04:37 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:36 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Tue, 20 Jan 2026 07:03:27 -0800
Message-ID: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

Laurentiu Mihalcea (2):
  ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../devicetree/bindings/sound/fsl,mqs.yaml    | 12 ++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 3 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.43.0

