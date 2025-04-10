Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750821A83E4
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246779; cv=none; b=P3pj59pSusLp4TF/Tewk00vXw33BkYfBcPMMZNwdJxBGN4EXk1da8MKohQ/MOUTEApYANfA/B2u61R915bV5x48k5Sycclc60Jn2MFlkiPhG0ypIqNVcSLSArgV5cSyY9Tdfo4CK8HpIAPHg+SZmRP0nE2ZXDW2F884wJ6X1OHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246779; c=relaxed/simple;
	bh=J7pn1mNNX0KSqr0Y6dvmvs2JaP9VVUMsG3EejmOgzrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coRrHfOeVeobRGPf1dAsrWcG7m41ghFEeaai3vKpytancI32o2YLAHjlRkSAd7TfZVocUi6annDnKN58foh6maBoDTTeNXX44ZbDuANMS7GZ+NGlK5ECOVdl1CHPNMGmEmffBw/sDGlsRlhEQfG9a8vPeWdKPHOoTLBUumhcIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBqlc9iK; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBqlc9iK"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c597760323so28656385a.3
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246776; x=1744851576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mujuAB2P5xapTkmLzG9rvA7e+z7OOYkqAyA+5+v8/uo=;
        b=UBqlc9iKDo7aqe2evV1HlTGb6RQZQUi5cSHIERcaIL5zRxDMGk956KCs9ds8CT96PN
         dC9rJypqJlH7u6VnsdCxHIeETBmfNsuTSmhCI814aeFcEptxq6htn9QaPp9EFbW4kzjM
         PtORMN7Qor/+WJSnYa9dfaBRU5unMsI7lgVlJy4M+cjd6uW2KgW3bIKk5O290iQFSCnX
         FG67TGRTrXaeyccXgcrIRWcbeIucth1hC/O2fBH7gGLJkTNBLA94QgQTGvviOxy4T8D/
         PYhYhnuHd3irMlFxOKD7VFcX3tiyyhQujxD7euqCWEW9nkLdAMh3pF03K0eiODOk3qPi
         gSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246776; x=1744851576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mujuAB2P5xapTkmLzG9rvA7e+z7OOYkqAyA+5+v8/uo=;
        b=uKySWK2qz/2lAB2cfKowRFE0oTYCJl34bmTg4dPYou9PBYepWbw2jjJIXgPf0mVAc/
         nRzG2OKZ2ZUPVBjc6ajvmQ3eRCVy57lnUOo18tMhVgWrtO/KvTTf4a7/CT4J2xWDaCOQ
         qOhjSAG/etyGHg0ErEgkea4z2BlDySdy4yJBqyRaaegRFCItdol9oQuGGxk+Y/vtfk/3
         q00qj5ezhuG2caqexOqW3UUTIerdYHypx7zJ125Ur252cCwJUT8Y0T9XJp1BO9YLPx5i
         2THf4Ezt8RRDdBaPN34MH2YxRshnxTp5XF6drC5acdh4fqn7M3VZkMuOgT9MyaK5VQi1
         gXsw==
X-Forwarded-Encrypted: i=1; AJvYcCX20Kc1u4T3bYk5kGKFy58C4Hx9PZ1EDk7LEUDuZ7OKEvy8yzwdIAY2OCpuvo3yQ7OkOoU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH+bBiOKuigSvWdi4MfWPj8R6rwdj/fwXj7De4n/T714F+wDn0
	nO2BaGqtHW+Bk974RGvPsImG/lLjPP0iVYFpwzajazTcsw+C5cZ/
X-Gm-Gg: ASbGncscH5Ycx/EpugUgUxazA2kBTmah/3DNCp9j98mNZI6PtvAYUiuwoQfdAKFMMbJ
	BI1ps65X2Kxd5+48QJilnetdS3OW6Go12x3d/BxBu453TItoixTQuFbM9hK3+A5cdG972vdsJGn
	iaJ+Jldj5xZGg4LyqvaPKSonBH2da8L/wFOYAYSFqaJzqJnKDPTIYSxZT+x1K+OpLUXlW1mE3vs
	WI5FZ5GpdMzaK3Pffo5AVAqwEybNM8A8p26BcP+p8P/VobOhxmlt94O5TOijOIVhQXsG86okrjo
	nssuXWBc1mZs8Ypc1lM9EJCqpLmLagHDYM5MrV8pwzRhJVoJajANHJjFRh54t1ttkFqMfe8yKJc
	SFiM+EvUxQ7UPlNk=
X-Google-Smtp-Source: AGHT+IGiC0wxIKVAYN+qM9uXVnocF+7Ky9tlCEp6HAiLzbJqcU+48i/0+uDCdBrHmaGx1GlEDSsSmg==
X-Received: by 2002:a05:620a:d81:b0:7c5:5584:dc1b with SMTP id af79cd13be357-7c7a76d04b6mr178797085a.54.1744246776211;
        Wed, 09 Apr 2025 17:59:36 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:35 -0700 (PDT)
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
Subject: [PATCH 6/9] arm64: dts: imx8mm-beacon: Configure Ethernet reset and IRQ GPIO
Date: Wed,  9 Apr 2025 19:59:00 -0500
Message-ID: <20250410005912.118732-6-aford173@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 9ba0cb89fa24..ed7a1be4a1a6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -78,6 +78,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -315,6 +318,7 @@ MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1

