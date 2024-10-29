Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA75205ACE
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203378; cv=none; b=cj8EeD/4K3Qq2gcyoSQPNFEbjEfVVXEg4QvqPFQP81/JtKFhnjyypETevMESHYp/le9kIXEmko20Stb+lvz7vfOw2RWxI1m4sDjcYTZe4I49R5+h3T50MEpLITm2LDDmka1MCtsK43fWMyX6uv8k91EjfC/Q7jUqMHWlcub/FP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203378; c=relaxed/simple;
	bh=IpIxLvmjOGT3VfhdAj2bmkiSYvXUo0NOGqRVzaQRZCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SF/IMxerySwbYoTkSzlugOVykJ+8yZMAdCbBou1MzXvw2uZXaCYKPkvZzsqHBykUYF4jp/IDNXXKc5XJE3Q+UUIV8fcrNmbApKD48kIqLyFypKqw4Y0SnVzu/oLeumrV0ktxFp6n0OeURFQFncIWj5qb4EDWiSE+ZsizTavgNwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBuadVW/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBuadVW/"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e983487a1so3912510b3a.2
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203376; x=1730808176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuLe4B9Yxl7fGAOhoGDgJ4H9aWstcn4mmPppsJaFprE=;
        b=jBuadVW/cWrpmY8PuGS2mf4H3TJoKiEaxa7qjHZK1XHSx/NbylMo6J5OEcuSt3xG2q
         /AdWM5MtX6tL1v+3VO5cghu+7BUrEhZD46IMRM8aSHQ3Y/+cUgmE8JnygE/7sK0oJ07+
         xmP0Eco8tK11J+V2jriKXCXzqhIhiUdWDo9EMOHmXJLi7Y8DXglOlO+bOP3yuBqpqXwh
         8BB67cJFK5WzOUbtB5H/J4eEOCF32JNDLmeMERbWfYzU9AM3Liy4xC3O6NPGUbT0BSD1
         TgVRPHBu0Sfhp0nZbaNli9wymhw0/1FuX+6KwLEwms5cmbnEf/JTC47bBQTitH7Y2jjI
         K1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203376; x=1730808176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuLe4B9Yxl7fGAOhoGDgJ4H9aWstcn4mmPppsJaFprE=;
        b=OP7f/tCCXwi9v0swWpjjn5Bw+FmxKlISWknjEcuyQBeYsSZidcmStbyXo7+Oi9lHV7
         kxUlO4Z4rB/OrJ4F/oN7LewgmtvBEuTdENeSvNmMjGQawg4SBh1hJdoSuAWlbRG/cD/G
         GCaGWdKpoMFSoZEyWGLDKONJaKhSiz+3bpky5eLexZSB3+6KTU0r1gErElTQVbcqAhmC
         RP7Ker/7Th2Ves8j7E62oKm+Ysn7kAxphAD/jA42p3/pk6nycP92h5kNfl+wCqMfgs3p
         8W0qfYqXfMB3Evs5jN9MA8GCkWCBsOpIzItGR3Dg/grhgfa8AYJmC5+EvYelXImZRV2Z
         fJPA==
X-Forwarded-Encrypted: i=1; AJvYcCVAPEmv/LhpiUq/v5vQM0V2kGwR3TtT4Jx+4ZbwaFDZ+ov+1Y8mCmtIFILxpzGiiB++HXA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOpKoT/MZ2bhyWCB5WKSJ663yXScMde+paTkgvP6jtergKonqz
	qNPdw0OiViewDNmpqDMOt4yR8E5/0rxuaXRWzyeAOemuFXMvs0Sc
X-Google-Smtp-Source: AGHT+IGbiEdJV3ydS0kSLnafJ9ewMOqHsVNosLuolIBvEY4inEwZ5wIYaFPuZwSU7Tw9iUcPvg13Dg==
X-Received: by 2002:a05:6a00:230b:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72062f86088mr17177530b3a.6.1730203375835;
        Tue, 29 Oct 2024 05:02:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 05:02:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Tue, 29 Oct 2024 09:02:36 -0300
Message-Id: <20241029120236.299040-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029120236.299040-1-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Add 3 entries for keeping DT compatibility. (Ahmad, Andreas).

 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..840e19b2ca0f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -773,7 +773,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..e6fd47814665 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -648,7 +648,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1

