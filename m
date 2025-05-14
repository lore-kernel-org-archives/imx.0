Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1A1F4625
	for <imx@lists.linux.dev>; Wed, 14 May 2025 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206353; cv=none; b=ARZaf4YBYbfKWVhpRdyb+is21Iwjr0yeM0EW5vVqPIKPvV2waDISn897KY55PUsKC7rI2GGH+KBOX5jwyeUw0886MvD8djK7HIkyDre5JTy9IhETVekh2MZgNU9ad7WcghlXAdV+l0+nW0laWemfSYZcUsYvp5kTzniO4I4BsuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206353; c=relaxed/simple;
	bh=PSloMT7Rx2inJOV3KMd3Zck3Us+DxfashHtyFpyXkJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhvtCL9RLOVHgksMAAzckjCiFYqRHvRoe3s0ucS93iJmRZoV8WhgyyNvfwW+nOPSt10SBHVVe27v4X6ScU9lKJiu30AS8TPGLdKjAZDKeqvcHXYrxfDCToAaSudHVrIsaesktak4AyMMtSR5XEhnPqa/DNN8gfoKJznPgrNz8KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ja99/RD4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ja99/RD4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so47997585e9.1
        for <imx@lists.linux.dev>; Wed, 14 May 2025 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206350; x=1747811150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsjFEA09j+sM7FAAoS3tj2IZ7u/MK8eK35o8RJtHzgM=;
        b=Ja99/RD4DVaTlCH9/Yh6cimNHtMx9FLnLw4AoI6hyNKnB0RnINZY9uOcSSylzIbuOF
         KR+al0KaM2cN3M9jWjfAVwmivh8oDIIK6ZR2L9tFolDU1itggke0M/QigZ2IM4HqKv12
         IjvZIxYTPO2wnpSn+KNxEMPRas1akvuzTVBYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206350; x=1747811150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsjFEA09j+sM7FAAoS3tj2IZ7u/MK8eK35o8RJtHzgM=;
        b=uaMl27thnzcQ7c0ruzO/KcdZO3phXIVNKSWS3KIL3nJmhSMaO9fYpWJp7dlcY3iqhJ
         aVczpj/4bovJL2WsfvxbtpGhnN4NzIMbJhFs4zUXURwQOE+tpCV88jDagY43qw/7kDo9
         9YvU+8H1VzXzK5/7vXcIfLXtnrpDJVdFPi5TWpyjviXhvDIqhEzVk/tfltiQfui6fXr/
         MraiW1Hb482WOpnErjBVEMZq8hOBPz4S6Q9TE00Gtv7uIIhM79SDO1kJmKxPj8cvZoet
         9bHONEv1Q+G4k+GBST5JX1/uNrcz2qBTqXyd11W1JoQwMfDEG+DiTZucqQjh9w1+l6Xp
         6P8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4+albbRwWJSBmOITc0+v3mQ9284ug+/oxK9WHcCKC9hZWXhF9EB4JwK17Lr340TsbP0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/zTqhpdOrYGyfc8v/b0mbhGL82hxaai8qBaEX2JZakqjBSReZ
	VsPwAxKHAVZu2HZdkjEpz/SvMzpBPO7NXOluLTjge6ll7S/yNdqt40sMuclO/oc=
X-Gm-Gg: ASbGncvSFXx/WDamszYpJwhk1VI0/VqJk30k10nly5VjLBvCaUq6EqArPGjOt65Jaje
	cYQfLn4O9D+5O6KbAvhTTO814nW8WgXdGqcmfwpe+8xsXvY6v03dXnXtoTU8Wp7+Z/WV83NlZgV
	Ib9580CU5XWhjKqhxEGSGhuY3HQf/D9R1LgIq0+G26ioRm4voVkJ/7K9HevZ4m7sv9/yj0ESxCk
	aLy8okaXZyrVfk0cAKtdfK26QqWiaabFasXoz39821osrg9+jaD9tLlnKF/PmlMrsY2na6el5IS
	Ap72Zxv+stCN+wbKAs1/TLkfNQqK0gjuv+a7hCYsLmIGbgaW1HyIf3Ogfs/JKw/ay5gnDsyCfe9
	tZqMaXbT8V8xjK9AWQcZr7NR1d8JvZbGetad8C5C+KlM=
X-Google-Smtp-Source: AGHT+IFP3OZAR0dGoXkyYTq8TW0unWpQGNJt+dN4divr0wjJZfTsT15iqaNFB4zXPgGA9rG4SvnMNg==
X-Received: by 2002:a05:600c:3c8c:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-442f210f732mr20320025e9.16.1747206349632;
        Wed, 14 May 2025 00:05:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
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
Subject: [PATCH 1/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable hardware rng
Date: Wed, 14 May 2025 09:05:33 +0200
Message-ID: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Hardware random number generator is now used for cryptography.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 6159ed70d966..5c32d1e3675c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -29,6 +29,10 @@ &gpmi {
 	status = "okay";
 };
 
+&rngb {
+	status = "okay";
+};
+
 &snvs_poweroff {
 	status = "okay";
 };
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2
