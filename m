Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB99E136644
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 23:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708991148; cv=none; b=LAUbsgNtVrIwLkiWD3AN9EGN6mzUfMzIuLVYxxEeBN+xlmUHOUyvADU4a/XkuHlPU8jyAaVn/XuUTszGsBSCm7Q5wGBz1HoIKcwJ5sXXoq7rNyY6Qm7bhKZFS/APbi2sc+QWvly/oQ9Nx8J38JQ8WWWDR4trNf1meJ5e2qR4VrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708991148; c=relaxed/simple;
	bh=ELvNOGdyWujRqFlgFnplgvQfFBySmgvbj61MCodDqJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIb/52PZYLJtUcq7iZ48PONKSFMRYE9cjrBal/0oSfpSh7OhGmZhFWJNDl8U1CbVOuNk3gnjKAXbnscdEuVA5a9pFAWeiohyYmBpXYmMeCJkb8WMz8meu0wWWWmdEPftLrFet0KJkSxJFT3BaaF3MbAFwpDLlYFJ3daBRAH5x2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM5q1Rh3; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM5q1Rh3"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7c490498729so185766839f.1
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 15:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708991146; x=1709595946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFej3XRK1im9Jtb1YXeIJeL5LA98qLbzr4AabBMlz7o=;
        b=QM5q1Rh3zAWbPuql4dy0QDoOgSJztPhlloP65mUobjmlR8UgAh39MJyRL3XBZu1SZ1
         GmzKHVGM/kvfmTIzlYiqAj4w7DmLmKsIqFaj2NY6xIPxTVYRm7XmD3oZQoEllqIRjyHc
         uRH/s/+aRar/IieaPvfWVzOTeWnuGl14QP/NNyQYkd1WQXFsWp/udtcsAjv26SnCYrrw
         ACy+mG9vF1kFR2NWzKjGz4yXuE4/6HlOPx9gu8EADSxdNudw6IFZZkSOyLRLzjnzela5
         3PDR1r68eIOjquDvlabjLfvz8c+gzEJefU2F8CRZaFBplMff3lY7R+ioizuzr5+86Utj
         TeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708991146; x=1709595946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFej3XRK1im9Jtb1YXeIJeL5LA98qLbzr4AabBMlz7o=;
        b=EYcQIo76RgGBlbAq3k+zPQKwXYtZpg/cWXp0Tm0+/H0XTsAT1cqChuPxGaa0invgli
         3oTG0IM0sDB9x9pwf/L87z1HVFbCdPYqvobi7yJ4I3/YBJozn7fj0+Tddzwxv1wjBPC9
         Etc6ec8u4LL7BMfJ6Xq5I8foMmwbjyHf+Kq06zKTkbcV+VbWs4gHKUjWUOIMuOJ+nTbZ
         HUIgAzypfGFOLZmn6ysszlhs5YnRVxG6iRDoeqz0eDbzAfcqPHfAQlhdYq625msC1P+l
         QyWMvN+6OG8gUp+p58jSe2n08p5pV6x5EdlCLnp+qSfOIkHZ+9ZJzgmXJb9ShSHI95Zb
         M06Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbNUPMGKEwXnR/TbrWEWLB211PEQGynb3rzAqFvziEWPNAhCeigGvtg+tgXQo1NCC+G8uUVnyb66SJjNHIj8U18gNY
X-Gm-Message-State: AOJu0Yyal5tkyAkuUNdS/tZfRNyDZTA08Z8roQ64Vvy+gahsL0zCZzxT
	xa+DF2RCieePyVrEK6cTTVUdW04rCSu7wqjQNYbBFkuir0tUFu8V
X-Google-Smtp-Source: AGHT+IEb//qk46NpdfE5g1O4nEXqBzzNmsQuvytZzFjujQ6auNCCTdAjrykOBRp3+Zzg/p2HzsqIhA==
X-Received: by 2002:a6b:6513:0:b0:7c7:7f22:c0f0 with SMTP id z19-20020a6b6513000000b007c77f22c0f0mr9117706iob.18.1708991145668;
        Mon, 26 Feb 2024 15:45:45 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9c95:d061:819a:2ab2])
        by smtp.gmail.com with ESMTPSA id c25-20020a023319000000b004741cf1e95esm1545317jae.11.2024.02.26.15.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 15:45:45 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 4/6] arm64: dts: imx8mp: add HDMI irqsteer
Date: Mon, 26 Feb 2024 17:45:15 -0600
Message-ID: <20240226234532.80114-5-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226234532.80114-1-aford173@gmail.com>
References: <20240226234532.80114-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

The HDMI irqsteer is a secondary interrupt controller within the HDMI
subsystem that maps all HDMI peripheral IRQs into a single upstream
IRQ line.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Marek Vasut <marex@denx.de>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V6:  No Change

V5:  Increase size to 4KB to match the ref manual

V2:  Add my (Adam) s-o-b and re-order position under AIPS4
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index c9bcb6641de7..18bfa7d9aa7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1927,6 +1927,19 @@ hdmi_blk_ctrl: blk-ctrl@32fc0000 {
 						     "hdcp", "hrv";
 				#power-domain-cells = <1>;
 			};
+
+			irqsteer_hdmi: interrupt-controller@32fc2000 {
+				compatible = "fsl,imx-irqsteer";
+				reg = <0x32fc2000 0x1000>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				fsl,channel = <1>;
+				fsl,num-irqs = <64>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "ipg";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_IRQSTEER>;
+			};
 		};
 
 		pcie: pcie@33800000 {
-- 
2.43.0

