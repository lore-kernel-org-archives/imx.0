Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1764B5AE
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211116; cv=none; b=kesPtUVxQnAzOGM9YEG/Cs61s05vRCuj8kVEj7rezrhSVBBe7jjPTV5eNRGWhuJmE6tpV6Onj4GRAex6oIZL1/nJlQ5T0aRAqkBhARlWgCwi8QGjAHnXXubRQqZNHprjpEOzAcJVdUjQkRc+qV/uAaP3OwLpDC0jVCG1AtIgifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211116; c=relaxed/simple;
	bh=uiM6JF5iJm5AA3IbWqccn6aF5CeCQk9Fp9a1aKYnJ5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHtNDISxSGvBfHXR8jf+5Cv531qRdjez1zZALhfqVr8Kx7FvSOOArsv4VGvoLuG2fZ4InVoKatB4Xzz+/u/TGXXdk0xZp3ZSZV4cJ0fEx+aduml/mH8SsdhbkPN0Ydi0jrCxXKWvpQJMJ+XKDQjFFXeweQgRiWiIobVINh40vzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nLunjR7b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nLunjR7b"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so47786005e9.1
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211113; x=1747815913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APXOpnkKR2dL3UO348/Gsh5gr4ZIHC6LxJe7czOv/OQ=;
        b=nLunjR7bkvipVpkN41cnS1PfNMM6vIklgx91/ad6KkMu8HI9LHZezOpDPE5NUim/j0
         gwmNQNM46j/F/REVMWZfFQzsgxTRzGNlGOxPzK8Lejn3vTs+0BAdzCZTlZAUEx1Jp23V
         eUO99OEjf+ltjkgKMFXFZ1/BIFWGHyo7BIoDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211113; x=1747815913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APXOpnkKR2dL3UO348/Gsh5gr4ZIHC6LxJe7czOv/OQ=;
        b=cNOxb2UjzR4NdMx1lYjCNw+4TGWtw/U0elL3NuBNZqdOmB71tz7MwwHgP67oDGBbyU
         gRxVs1F/R3vfstbMlDD2nRH9CV5zsg4LzWDIJN97kBCd9eMhbtQaLbCJTioCHK6dd1ax
         zsy/cVQl6+KgQcFQJYQPx1n//TinuTJ3+EH2AUbsV3uA0zcSMZvEywT5cxudY1AEPjZy
         gkpbw8cfUbcSwf/pVGA7UfD7obLsIYvH9zpvxFNMhqvNiS7g3emlD7d5MG5j1x04kDrF
         l71BrVlIxYfWMEZyWiHYxlFhtD9F3eAyl9JN4H80gQTOjlpmG1SlnbaH/v5X4Nzv8tqH
         EqIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJRhj9YkuD8xtgES4mTU3ZoQ7QbgVMVwHc30w0bzatMZZSyrv8JPcOMpBOXz38pqIesDI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ4Q1nwQnOpI6/wIYzTMw21OUyEfIgLVgZWC7XZSH0lnASHS5E
	4Q79Us7O3i0ep+RIqbJZ9Vf6c4Hy0mllsge2KJxQYnJjnhG396Y5duPw92IpLUY=
X-Gm-Gg: ASbGncudGLTis3a/6p9tAqdSWXwprPp5HcsPyaPtqqHumMbzxk6yQStRyrn95qZnYSK
	VkxYFUHZbxefw4qlNl3cLN7+BDbz9J6ZJRecaNbS27/YmjfvgU6SK5GIo97dWX0sT3vp8znS954
	4ES3RuXCc2e/aWTJlQQ3x7s+E52P5xdxgurnUyk748yezCV9b6dSWcynTXOLmZgbvZXp/38IoEg
	6sHaEbMRfgcQSQtbry/Gyg+rVyvGVCGdTvoA8U/kdg7MPK+mQRT9a9FXcATWlwipZb91tifHQqR
	S7Yog6E426ksEnAP9C2L3e5gzQadzh7jtmXqi6DDrsxgoaLizO2PdP8n2WjgXFZtpb5U9NRxj5W
	55lb5U/pE22H5RJ3VUs+2v7x+IUE3ZiWHVG3ve0d6O2k=
X-Google-Smtp-Source: AGHT+IFPJ0BA1CsQj8STL33YJFdXEivrOIUNuDI5cLI9H+T44prBBCXb/RtByLVzJ5qOgclAySopgQ==
X-Received: by 2002:a05:600c:a378:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-442f20d9d37mr19135815e9.11.1747211112873;
        Wed, 14 May 2025 01:25:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:12 -0700 (PDT)
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
Subject: [PATCH 1/9] arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend voltage threshold
Date: Wed, 14 May 2025 10:24:55 +0200
Message-ID: <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Voltage threshold should be adjust according to the worst case.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index bbb07c650da9..5a1ec2f6a552 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -105,6 +105,12 @@ buck1_reg: BUCK1 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <1250>;
+
+				/* enable autosuspend threshold */
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-idle-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <850000>;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck2_reg: BUCK2 {
@@ -115,6 +121,11 @@ buck2_reg: BUCK2 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <1250>;
+
+				/* enable autosuspend threshold */
+				rohm,dvs-run-voltage = <960000>;
+				rohm,dvs-idle-voltage = <860000>;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck3_reg: BUCK3 {
-- 
2.43.0

