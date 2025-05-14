Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025756B81
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211126; cv=none; b=XnH6aRHSxM1hYTGAkRZGrFrAVi89V+PBCkv7NyIt4lQoLiFfooBgy1+1SDlSBMzXpY5DI+Ec8QeXaP4jGYVhq9xkL/3sBwi1HZzNArbxobT+sZnzhiN4LKh/I3uPn9ohOMQJ6nKel/EAmMCDoJSPzzxA5xApsTWEe3ZpWC1BVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211126; c=relaxed/simple;
	bh=e2pQqiVOxDgNFEozC0iIGMhFjYoToSACQa3AfvGruJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNoG/26osqBHpg8+J0/ApuqwBpXYWdT3ClFSggZPefZQar5zQxKpweoZiPYRB5TihK/OajDCR+50RfPvN9/jww1fxAKJWoLbyJkZCoCNQXhmJAdral80JhooLCC/lL9cQhYkqZt5QGrmQE1CYaidmm6y0xaSgdAH+hKoGm8F4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KX3849wO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KX3849wO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b933f214so3078481f8f.0
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211122; x=1747815922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt1EP0ezTYwDfM+B24peCLWSMczcGcs5Rkqpf9JI850=;
        b=KX3849wOBmQhjukGXneYNSyHbb2wFzotcE4Tr97eBrZiCaanUH+PVGvvscJn1MZpUF
         526biV6nGmyk8e13fRS+u4noKs38Cw1aAjEYk0MBkIzZcm35UMZEMdwVHMWl+uypdab2
         XorhRor2Q8APNAv4DQS5ZPwv6sqsvii8cIlUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211122; x=1747815922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pt1EP0ezTYwDfM+B24peCLWSMczcGcs5Rkqpf9JI850=;
        b=HY5x0B9pIWdLFGadL69z77ozjkmu0HxWucsiNR3rijgwus44q8mVN7dmnLdeZ8UXPJ
         fKl6Sqe7ha/MHIbLxwe5+o0m3KMZIINAoYwIcYqNA1Xe3e6gfAIWHr3NvPphort3ksMh
         9VNTsgqdMRRANR+zolD0juI+RGaqMyyBh4MHoCbfHUuAEZZ6lqSncWjJrgYmnlhPX9xB
         vTMhuNLNerP5hch77vdu0BLnZLIR3tYTE3DBkE+Loo3Y1/wGOjGFxBOcSgeIaDZCwASI
         fPr05dqdZmj2D8clcV2VD39K1HmEIM1f5F75XoUcu4hjJYz+7nnkV+Li/akQ/Jy/IGxR
         q+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV9q7i0biW8gxqTT/esldqIRmNoRxFDWf6lr0DnsQwU8XCZKWfX6WOPi5VWNiUS2bh/iE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjSYtiBfRj+DY21E+FwEfF440U6JpFVIrVwlo0MjtNfIW3mdUg
	3XyliiaKT0L+2mfbW8UsZtZ59H8vCds9ux05uz3ju6KdbqW55W5g1VwmIXXLe4M=
X-Gm-Gg: ASbGnctTvTR5upWLfPykabPUtZijt7MsLfLJyLGYNMlCMupTNwNltByD7rNp0LNaA8q
	9NMh7kHjIWfrTNaYbae7ymMPk8HGhAx1L6tAC9j7bJ5UUsUGlgvIO5NKYaMJiqMPQGw/mqo/Tbb
	e7GdyBTWSPHzln/R2onlHKBMLrbHhNzw+l3THPk8XVtkCXhn1pObtZ3i/H7SuCAU0ZDFNTyS9WS
	qMLKVFtTyjvjXtoXraae0hYQDX2ORq+xMBJ3IG1OshMr7UBht8s3HBnX3ZuHy9x7Dwc0bG6zPvn
	YGmOV8STr0aGiW8/pe+bs4JR3j3wI9Dzw3pNZLHfxnalQ7kfpYVXghyk0B0qHcjy2g4d9ygElCT
	PGsYeqMlIMC+bySs4BoN2ij4z1QF8EoZcWD8N3eM517w=
X-Google-Smtp-Source: AGHT+IFjDXXwQhSURwlfHmcLE4irqIStV0UgnScTM4HB5AXLneqabf/gWJDu9GBdpVyWbqQMxTEylA==
X-Received: by 2002:a05:6000:2505:b0:3a0:aee0:c647 with SMTP id ffacd0b85a97d-3a3496a42f0mr1760633f8f.17.1747211122654;
        Wed, 14 May 2025 01:25:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:22 -0700 (PDT)
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
Subject: [PATCH 8/9] arm64: dts: imx8mn-bsh-smm-s2-common: Increase drive strength of pmic irq
Date: Wed, 14 May 2025 10:25:02 +0200
Message-ID: <20250514082507.1983849-9-dario.binacchi@amarulasolutions.com>
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

Increased drive strength of PMIC IRQ pin to increase reliability on the
reference hardware.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 04112a83b1d3..ea8d741c6904 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -364,7 +364,7 @@ MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA			0x400000c2
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x040
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x041
 		>;
 	};
 
-- 
2.43.0

