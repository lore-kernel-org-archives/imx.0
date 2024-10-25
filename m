Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5632FB6
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729818573; cv=none; b=DRAvX92NtqiJi09H0wMojVk5EVrK1AZ2ZyUB52qDxQqqauPn7nOjwYU6+RCB0R6Gzia+vDCrgJh7BLMj6cc7EFwmodTpSw0D3Mytwzl8ff2bo/siE7yBd8BUM1hvy4ru+mJmd0Oy1H/Ryy5Lf/D6WzhQGY1mPDbz04NAmF7xZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729818573; c=relaxed/simple;
	bh=+emsQFoCbsa5HyG/22HH3bVMiwgUB13Ah2l8gAn7jJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GnEBJur3U7r99BQcf9RG8wZWTGgiNIXObVC4aMt9NqWRMu746gM90AKlgcF0u8oMsc35k8Qdh+UD1CLcc1heCcUlQ0UtXJKX/PhSkY3rOSHaFffRBfbsJVPOrX14+mRcUcc/y/67Lw0f7rti25VE5vOq+MTK8VXMyfqfvbFP538=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsTYZ8vf; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsTYZ8vf"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea6a4f287bso925559a12.3
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 18:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818570; x=1730423370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGdp4UlHi9Rl6xWRgeoMoP+ShACtzGL6t7tsX92UPPE=;
        b=RsTYZ8vfAFBwGz2wp7TLiNnO1nVnEPDiGMv7s+Wk5Fxw/iG0ESDVZetXvvUwZPDggU
         kj8YpBBugELkykRgzSmsT214cBVL0HSEMXEqEUXG59cX5mtYYcIa3GGbjIjCrL+iTaDK
         dkAwmUPWn0C5jJw/IF812O5Ouz8gpEJw6B7S2Ryzpxdh2lPDbu0OckJm7dMuHmMJvHU2
         8hZ0PO65y86D/TFECt6XHsIkXyYQsmKwQEy/uJkF/57tdH7tJE8Y8sIVqctXP8zlBI/x
         gHlkDKjxc1KZ6N68E7Y0pHV44hrTwynA3xtXa3lBzDiR/zswgIr7cIIizaAFdJLNhodU
         LNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818570; x=1730423370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGdp4UlHi9Rl6xWRgeoMoP+ShACtzGL6t7tsX92UPPE=;
        b=GZtQkNp0rxss0ZN94nYGTRUXYR7vgk6C6HFCioacgX+Czp6SVlCRwYP64Z4Kenazs9
         TwD74E7o6M4qsTLHIa83qQcPkIQ5IVRPcZyyIIMcEpKVSHzGyGCSMn0fbQtMwxkSn+ug
         gQmg14DE/lc+3+il48i3PIpm/84JFfgwbgbnadXOQsky9asyJpPhJBPZ2Hx3YpKtSLOh
         PstTOaf8uycwTYBCkWPgSx0ay0o+Gm+LQKhmf3TwiDLtCKk6ZQSKICnSWpAIipN9zNeN
         R+xYOiqTQ7xk3YTVqA4dMGqok7ZpFbBLVvsLgoAgM4ya55DVoxFNqB6TgFEaou4Jw93e
         RxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDV1BZN+tvq96CnHfptZxN7D4abzndFnapbBHZTpuOayuJa6SZatGCeratndUGH9QyLE0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVSowTNQEJhQVR6NzECkhbdYG+IFFAQ60QRsdqtGC8y1nULO+s
	5UoYcUbBuyvJvO22mSN+DiedHK3BWmAu407tsE+7+SKVtX2/upjq
X-Google-Smtp-Source: AGHT+IHYYcX6rcKuACmUMAqT2j7xUKhF7rX1Eq0psxApSO+AaLQHyyTER201tiR+T8CoSPfZiRyBIw==
X-Received: by 2002:a05:6a20:cf8c:b0:1d8:fcf2:9ce2 with SMTP id adf61e73a8af0-1d978bb3472mr9319125637.44.1729818570143;
        Thu, 24 Oct 2024 18:09:30 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b93csm52875b3a.137.2024.10.24.18.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:09:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] ARM: dts: imx6sl: Pass tempmon #thermal-sensor-cells
Date: Thu, 24 Oct 2024 22:08:55 -0300
Message-Id: <20241025010855.1593365-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025010855.1593365-1-festevam@gmail.com>
References: <20241025010855.1593365-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to fsl,imx-anatop.yaml, #thermal-sensor-cells is a required
property.

Add it to fix the following dt-schema warning: 

tempmon: '#thermal-sensor-cells' is a required property

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..6c98670a44ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -631,6 +631,7 @@ tempmon: tempmon {
 					nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
 					nvmem-cell-names = "calib", "temp_grade";
 					clocks = <&clks IMX6SL_CLK_PLL3_USB_OTG>;
+					#thermal-sensor-cells = <0>;
 				};
 			};
 
-- 
2.34.1

