Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD5D1C6FE5
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246781; cv=none; b=RdZ2uXQEe6sAd9mBA46CgrKvt0hvOtRiL+B+SxgOFtqKvwgY474zsn3Z85TpR5pKL+neDftQDlpAj6x2q15X0giEl2tDjytThjl2WISEaOf8Y9tb6i49JPwd4ud0Iso/xAVwOUarZyL8ngAq0kQGa2+fVxShPCH8qx1sXyBJPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246781; c=relaxed/simple;
	bh=7d9WLzzdEb4qiRgysSPnoin7PNjAJJvf4izWIeRTN/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHT8U9xOOeGBZ7bxofb3Z0qo3kXmBj2J6ZGl3qd9VYWaaNik0Kk1JWhdTu/EhKZpKBcDHUpudzivazAiYcn8ePmyAHxa80MlPNBvE4f6D0/NYOUJgw7BFiDF6R8UcHbfBUGay3YYhlTOipzyM26pyN8LDZLj+hSTXXieXyNFaHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG6t0HoY; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG6t0HoY"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5b2472969so30008485a.1
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246778; x=1744851578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AETJCm92Gaddp7KArrHx6Zkppk0IpRlpsUfZE9LW2t0=;
        b=jG6t0HoYs0ue5oYrrH11ZYfBNMUx22QR9mlWLMWhfGdmkhW5FYxsBadszyf635oOyH
         EvHdSG04QX14zy8IA8DqjUOSzy3u+gD0Dih480MgWUtly5qjZi6matbzsvaMBRiT7t7F
         Fi64qh7T1WdjDan+o8Ap3Jgi/RD3FXZ86MFsHDYRANcA6pcxd/h4n7VNbE6D3PpFENkQ
         InArd2nStsYoP3mbGBe3VxDUCyVEg7mZ5Jcf0Br9hS4fqVfVBWT2k23m3id4CD4Kd3pl
         Sjxde6rnyoTCxuCRIbEkwcDtRema497XGe3tWOozSzogSnMuQOql54k3/qYfgpFDbplp
         VYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246778; x=1744851578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AETJCm92Gaddp7KArrHx6Zkppk0IpRlpsUfZE9LW2t0=;
        b=GQb+zeY4QuDLraTGzyWrxmZNNtMY9ckCkc00njmQMkZs8D3w7SQawU9hU9KNP5tKlF
         kmh/ymSvka4t3Ob4+Fv004g5+ku6Pn8CMERZ4DPMTFV1q0feh4aNJtqJu5rmI4O+0lUx
         WpZ7Sre1aq2BNyglY3iR4A4hpseAHnpR+WbzH2BKUcNb49FOKmOIZiXwYMv99Vvd/Oc/
         iBY/FkAdWy5w/gR4it9vpwQa794KQ4EuQN6Huwy5/PHsnjSzAPjPYYsCzyfKYMFK8fLu
         NcCZd3jbT4qrJek+E+gyNFZGHVHfgTPhcrnbGC1/uECrgqoneFFu95fPvT+eYa019/ZF
         BAtA==
X-Forwarded-Encrypted: i=1; AJvYcCVfeNwCj3wzpZvg4kxJ5fPKg3r4qhKXUZQ7xvD2l5eNqT3dg9C0y5V5t0R6rvugV4WEgcg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJhhio8XVpau36y/VyoKvVul492QZ1YEL/+BgowiQgbRD3Luve
	v+s3eqq6Jx4XX+uxQoeXqzCR37Sntb5Zzw6VZ1sT3b+kyEct6TbY
X-Gm-Gg: ASbGncuHODJ9CEtWtQWvn8Db+hgHPbRjLuced7hNVcaQdxCTjgjl9Ryc3x95U/f5CcW
	Bfg5yYZGB/o6bp1R0XEhCP27pyykCc3HwVI0SJAcE4OjnzFD/Vr2uTz7glo41idOUP3tRnA89OV
	CfRwcodIX/FmMUKMRCjFGO9MsAYiNL2mwtUY0IhksH9gueyHwREuxkrbEHjDiC+wP8fb39tOxvV
	CgQhicsf1FlhXPfPgy2OkRnJsGGJIm0YncP7e/MLu30eP3e9Gyk7PjzfKTqLrfwTc/AJELBoSTM
	VyXRlSF2EPU7wJJU55lcnunQrwiV9o5mVm6i+cf2vNxY1e/WpZiGlIvfjtrhUBdmP9QWgjp8THH
	t0KJvWlyGsUjemz1NMi8m3GS0CQ==
X-Google-Smtp-Source: AGHT+IHuQHSJS//F0LBuhXq27KYoLsGaxUVz13ydAdOd20CQjtYTmWnqJXqodma0O0CBVkzHWRdo7A==
X-Received: by 2002:a05:620a:4310:b0:7c7:9349:e468 with SMTP id af79cd13be357-7c7a765485fmr117923285a.12.1744246778340;
        Wed, 09 Apr 2025 17:59:38 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:37 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: imx8mn-beacon: Configure Ethernet reset and IRQ GPIO
Date: Wed,  9 Apr 2025 19:59:01 -0500
Message-ID: <20250410005912.118732-7-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ethernet PHY setup assumes the bootloader will pull the PHY out
of reset,but it's not guaranteed.  The PHY is also currently
setup to poll, because it does not configure the IRQ. Enable
both GPIO settings for better optimal ethernet performance.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index bb11590473a4..b3692b367a42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -88,6 +88,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -326,6 +329,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1

