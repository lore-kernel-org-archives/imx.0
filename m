Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9A222566
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211125; cv=none; b=Ep1lC1Q2Tv1P2bLF5I5B7iSGCLiK9IWaZIRSDc21Q5J3ecgwCj6+pof9l7rzBj1DDlgCz8gH7Z+fddXOx4OlZkYYMOvHzJcncf+d6B1aVos1bhYz8xgQ2gu3sTIMcKQxJ9BYtXwFdtQ6HjSgT6GhyuvIklR5gb0pPhvj7Bofkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211125; c=relaxed/simple;
	bh=HsVCl1yxLXvhDf43Nd0AQkKlThmkNlDCATxWj7ZdQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkC5z4yoeU3FwCryrnCgtRGQfP8tpLjRmftjeWSINxFdnLpL3UIJ8P65k3CVgaD7WUmQhxstXBlc5+HywNg02NtB6zapUKmcdv73kKCzCcRSIvM37A9Bb+DATzDV1dtRw0q1AVs5R32KtQxOTaSIyPrGlmigoRdJP7x0lyUT0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=f9h/4Guh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="f9h/4Guh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf848528aso56951245e9.2
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211121; x=1747815921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TYuMpa3lECo5TxM+RObwV30bGxY9a5ZOYB/MAe2Vms=;
        b=f9h/4GuhVyq1F7lfvLwDhtP7XsLHEkTnmpNofoWSlj/IcvnaUm7KQm5MqsALO2KsdR
         vS85hCu4bOvHeGd7RMBxVcyUHZYEE3N3CVAM60D+/snQsjaoC/dH1zHAH6O+j4+PLJb8
         w7YsBeuUaiozbEmwMBOnxD+MbDMSLE6saooDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211121; x=1747815921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TYuMpa3lECo5TxM+RObwV30bGxY9a5ZOYB/MAe2Vms=;
        b=t+jws6j+FeiAAHosQpAQNsV+0nHlWB4xz4tV7LO9JsECcn1pnnTcEFZ70TUiL8QJjJ
         25ORnyL82+GBN00j5dFSYpqAZvqCdm9NyA2LOsLuL+V1W5obf74r09AjmaKYIb35uEm/
         aQqUTgiqS0Zi0CIWXdsSmVgiVpjuP/YdgSQ2CD+pjwlei3F/6FCbZcf9RUshkU2wFYVu
         PQjLZ7Rof/Lhy/WiwbhyDr5Z4PhZut8OyWyL+dDVb5hy2TgADWNGAMh9EI2yQNhsSJfe
         qU0sFlvOKiaQrnae9ahoZLok7/Gy46p470J/A8qtTiRV3J7hsAQj11Ain2A3LWa1SGD0
         8F7g==
X-Forwarded-Encrypted: i=1; AJvYcCXKyDrHSac3JRgywx52SSRcj4ur6gs5G/McEx03LY7kOpNaqESzGumfVjDAcqo9LsAXBEk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCaLzCploX4YSw739R8Ytbk/pNvNcspJcc+OI8oWLpBlwoXGja
	32nFtQ5q6sunlU2IbVTFfu1tLs0IBozSnSruZT26mskpv/iPiwwJ0qXTxAP3xmY=
X-Gm-Gg: ASbGncsHHzk4olHhscSarqTb9LORws9LhWBQ8YEKNVrb5oXtvjkPnidP0NhAWJdKNLu
	hWpDXNPFcHZnEHg2UkFlYyjdpxQr2Bk29gMf41EsPugZihYj0u/7+/+wgcdi1Hf9a19Ml8f8gsT
	R3uk+PMtU0/52gEPoj3LVHos2obVQp5i/i01Pr92STH1ZpsfQrLzrOzuYxx1cPfPhuIUMzrNJCd
	3FNc5PEOEdKXgmqiD6cAxe3ahKTvIqXrkrPBlQtYvQ7ZZyeQE9NK+8/f7eglTmSk9Jgpw3PhCm3
	MHd7W4UgbZplha6g1lOTgq01J0t95aUH7OEB6qbrtSbC5GH4k375iIffZC6paja+DyFsazURgJC
	qY2lOWbn6fihYMv0tDdZHlNa8Wk5PnQIbs15SPeGhkvcnfKEbVuczcw==
X-Google-Smtp-Source: AGHT+IElgZGelBk5zT2GgVn2jS8QC31s8cj0ziUv3wJ5MYE4/n7YxAgcmx5VnwG5fRUicYlfJQi+aA==
X-Received: by 2002:a05:600c:3c8e:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-442f2179bd8mr15288665e9.32.1747211121301;
        Wed, 14 May 2025 01:25:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:20 -0700 (PDT)
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
Subject: [PATCH 7/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_3V3
Date: Wed, 14 May 2025 10:25:01 +0200
Message-ID: <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
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

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Buck4 is called Buck6 in the BD71847 datasheet. This buck supports
2.6...3.3V. Set the minimum allowed value.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 81fa0a8767e2..04112a83b1d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -144,7 +144,7 @@ buck3_reg: BUCK3 {
 			buck4_reg: BUCK4 {
 				/* PMIC_BUCK6 - VDD_3V3 */
 				regulator-name = "buck4";
-				regulator-min-microvolt = <3000000>;
+				regulator-min-microvolt = <2600000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
-- 
2.43.0

