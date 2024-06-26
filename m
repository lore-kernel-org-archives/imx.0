Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778361E52A
	for <imx@lists.linux.dev>; Wed, 26 Jun 2024 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410764; cv=none; b=ILhmNs/mQqkTcBbsBGUQmlb+bHaaEwPr2QiRVWMZYYCzCk6n0dQunDh05l2uFBlI7MUW2qRR2UB5UbXjfh97xS8xCDmnl5NeSsasedd15Lx2w+ljjyNrXu+Zl/8rrJ2wjdrOjl9wxxnnGSSTAIjvbzC1ON9YGvN29Ru0QSsj7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410764; c=relaxed/simple;
	bh=VwUcb8oWHH79Fw1umc4qTInN2W0N9pzMN345mM9hJmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p4WC+NtXj4EZ8SN58/C8eFHLrXtTauxccdxAE9Ein0TyinYXhpwXJbgcfRviTXzKQ7fy71B55vfRSH8y0+VGDjALM9RANeSTV3Yi3gD1qr6NErFq2zsnwcAihemyw/57CLmSzm0SI/5MH1W9iO37WjiyHHJf1GO494q22haWjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSG1DiFZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSG1DiFZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f9a78c6c21so2229665ad.3
        for <imx@lists.linux.dev>; Wed, 26 Jun 2024 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719410763; x=1720015563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7OZc4FZ1pwpi69cXkTAscSyoP+AIQrq+v1e5Lh+p53Y=;
        b=YSG1DiFZc4Wuf9xH/cvlB4n2jEHTnoP6KmhCDxrmpEAJExgLHQb9fA/0+E0ls6jzhA
         3jrAs2H/QS/BrN3DOGywMhcbgnxCcXseEUhGYQLagGxE6PPG/2cgw8M0BBiUCiyYOoad
         T0Y3tiiHeWEHHWSwcgrsYVyxKx/a7WYTwXT28PmRC7cILmMpUFYHf8zqyc+r+DWrF0SH
         0ML34PK5h4tqGps9IYJPPPY/MOjP6S97RcM0f4EutMuoshqTXVA+AmetHqmdyVTvhaI9
         fYB7aKCUQr8tgyOg603N3GwVm78K2MC2lCoRbW4d4w1upTZCMlKAsGXuj7N4J9Nokh2H
         wwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410763; x=1720015563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OZc4FZ1pwpi69cXkTAscSyoP+AIQrq+v1e5Lh+p53Y=;
        b=PjD30R9AM08rQXZs+BNX1W0QX1cMekt1bwulMruPL/pyD5ykBOMcDpqaCjbcILfA6E
         88y2dgR8xDp3BdMK+TX1I94lfefbk3VjTAdsIOo5Ye0fjLQ+hwfJCSYKN89vb1YGmsQN
         IMCYkdiUJLlckGWAra4KZ+ZEylbQgdMDw20jTdmfxGL6e24RaK4V1GBVDID2v2ssbj6o
         Xz0TrQ2D82xH2ISdMbagXKqisq07qKrKmgl6xS473myThyCjeuY8ex+D0Q1HS/joLZ/x
         jmbApHqsRm3PTNPVnUO4utWWR22Bo7LVWGAxgYurVsDbXSV8L7uvfgodrwUCQ2CRR/Yc
         VJgA==
X-Forwarded-Encrypted: i=1; AJvYcCUmB0wNwshJOJH+J5gMAshGzs/OuLwhaRqouDNvQkhUeg/x8FXyMyZz69vpheN2mbVwYPZm2/LN7u78RcHPxKFpVxl4
X-Gm-Message-State: AOJu0YzBRr2D8wdurPYGyDn6rrwkwKwxevLZkE3TwGs/leECGDw5Ji1f
	NoSrll87gD0znAITVD81oeHC1d3gX+VrWbzeGPyf2TQGom73yZj6
X-Google-Smtp-Source: AGHT+IFuuZ3DHwIF7ceRJbn6bCnVZFhV28ZBi/KhPAy7/yf4Ap14MuOCehTYRr1CzctG46omNtILZg==
X-Received: by 2002:a17:902:d4d0:b0:1f7:2576:7f88 with SMTP id d9443c01a7336-1fa0d832bf0mr142067255ad.6.1719410762727;
        Wed, 26 Jun 2024 07:06:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b7af:6ce5:5240:a687])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c8c01sm100059845ad.129.2024.06.26.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:06:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] arm64: dts: imx8qxp-mek: Pass memory-region to the DSP node
Date: Wed, 26 Jun 2024 11:05:32 -0300
Message-Id: <20240626140532.615857-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to fsl,dsp.yaml, 'memory-region' is a required property.

Pass 'memory-region' to fix the following dt-schema warning:

imx8qxp-mek.dtb: dsp@596e8000: 'memory-region' is a required property

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index cee13e58762c..936ba5ecdcac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -63,6 +63,7 @@ sound-wm8960 {
 };
 
 &dsp {
+	memory-region = <&dsp_reserved>;
 	status = "okay";
 };
 
-- 
2.34.1

