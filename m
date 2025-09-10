Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE447225791
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469952; cv=none; b=A0/vRp0p5Fp0CCYx3o27md50FDpUZXxNNbeTYp4f78ZcliIJZh2qoj/PFfzsIpXEu0oLoMtYetjLo1FWIF1wE8gCGgHFo+Eh8LA1t7SoCzSYTLwoNZmVKPF7IqIcVErBPJDBCQhn/T8T3OqnS3mx8nYdhjDZqRCVxaWWBGfsmt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469952; c=relaxed/simple;
	bh=K8Fv1uPBo1t52vTaFQURmxLqrjDhPhb9s/yoEQIvg2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iE+bmc8deKZvyCxf7x1urpLqw+hVIqMglSXK5WrhJMq0yeHhHG2z0gx9KNRk7of8v3vHsUmD1LiZ4Lka4+12oAYGAgP4f/JNQ/mYzvG8ezBArscLJnbByqx/ZTIQCem/TK3hrUq71ibT48TNXFwPM0Dmot50oBswzBROuN3q1ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U27GvvVM; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U27GvvVM"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4d5886f825so5440219a12.0
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 19:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757469950; x=1758074750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2Wv28uVFgIwY4UQs+1c5TBH2NyPkzg92eGQhJ0dgfI=;
        b=U27GvvVMXDibg+P0+LNkbCImayEX7NZiiopCELfGKFQ6uPDImi2kVeE20mDbrwwJn6
         Ei8pAMpgSIroZrEna3Omrpn/98NdND2Zwhwk9p14eVciFuL0C4DvIhlXRVvisjGug3tx
         wO3KTY87AIvxDMPmNCnYFDu6lnrET0edvYxQDbKtlXTtQpZrzVJzzdxi5pd5WSrpPrpn
         6e+isWwrHPkxt4di5g3mk1YMY2SVuk1MZ1/JYDnnpq5++WU9Vy0lhW4DZpN+iCjg8sdu
         GKRLcVuRn+KbLMT1u1QHx4ZYJl/+3OT+CsKvyveThnAjNmKlUsVcoMyhfrmzSX+C3DdJ
         Fjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757469950; x=1758074750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2Wv28uVFgIwY4UQs+1c5TBH2NyPkzg92eGQhJ0dgfI=;
        b=D3O1Ot/Nltwhx44MkrY3WPrcH//4O2CsL1fmfaOvlzAIPeGe/TeIi3tNEZc6RJXpGe
         9rVvs57CcubOBAGsXzmj/WlzPg/gzWjxAFWaxt6DP+3ffSltk3o8HS/1HZqiSuosNHdL
         omOhFiIagI0UxS8iQGnT0AQML9Q+cPmu7NlCun2AjTpA1wkJdYkuDHwb3SrVTL97AiV2
         AlRr9py+2w8UIYaG68qtK69s35TRsrSr5RON7xSAjnb+b+pizuE9k4pOobZsmT5RzWPl
         BTd/tpjcutE3clC1ZKJHHss7qzqJUscA+7y23gnoK2eMwK2leqNwfwPYW3THtqEowZRg
         hYBw==
X-Forwarded-Encrypted: i=1; AJvYcCXGwknBdYLwHrSNhBkn71y+4SDXdhyPip4aiz/IEyBDYpkCT4cMKUpLIEBpHgWFPWYqd0U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiJd6GUAd0iAnD6iKQe80/qt9J+CQknulTAoSlT8l5K6yrpaV5
	jD2erOSydmfgBtTVGBG54ziM1sALvXHHxeIVfofHgaLiPc5G8xZ38KnP
X-Gm-Gg: ASbGnctc20bO6quF0RMY/YXdazchffprzG/oM9Wxd3kcyOnUOnMr6HpVNS4s0SPVcjP
	DbcAWHxg4gvRMyHVpinTWQpQK/jWblJt+oUq1V0hUplUevUkuvVL34hiZqbrfRJC1yKtPyEJ+qB
	vDUdvD3kwSDFzWo8bmG189Yd0VODhlBf4mHgqoIQi014Z3YxvHUxXG9GF0jth2wjd35SyaMUs+D
	750NMUaJChhdKZxChAq4St3ns9fFykE+2WHVci+G3D1jZprCwQ7+OUEM+Bp6mjvvk/NX9H+s44M
	3kd8riPyJLFmvKEr3nAcD0NxFbhxJR9B4OwyPSWcc+2FJ/KUMVT5je2quQiL6NxgJwiPuUG7W/V
	J7snRtWO0vUHM+kHfWAJ6gRgm1rkfY2XMlFy3rssHjcUnBVM=
X-Google-Smtp-Source: AGHT+IEVBLAzfDT4V42Ob7mMhF4hEh69hyk11soKUt396GyM7UHe/sGizvdubIBtjiwfPR/vW1jErg==
X-Received: by 2002:a17:903:b90:b0:24c:d6f7:2788 with SMTP id d9443c01a7336-251741866e3mr168780505ad.57.1757469949993;
        Tue, 09 Sep 2025 19:05:49 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:05:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Tue,  9 Sep 2025 23:05:25 -0300
Message-Id: <20250910020525.342590-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910020525.342590-1-festevam@gmail.com>
References: <20250910020525.342590-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 7381fb7f8912..074c48b04519 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -776,7 +776,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..745f3640e114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,8 @@ pxp: pxp@20f0000 {
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

