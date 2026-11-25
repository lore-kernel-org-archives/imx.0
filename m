Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629808;
	b=EWQL2R3ceGF7UKhMTGR1C8eYLwkuwWOSw/ZhQZLyo6zUesxehribtx1uPN2l11+YERvK
	 NtNvPBeeFVH5VOl6L2Rcv6qPxAD3SEpLLFnUam4apkz5tz4VsIIPLkqPC3PGWkO1w/3jQ
	 xTKyJZz4w3OXbhUagzXrSVziiIBEaTiMDfvCE/R+yvhmkPjgaabUfF4eaw2nHZE/Uk9Uh
	 3mxVEkB1CaMOKBBfWDQGIFY3KlZQgcx60q9ubPUSDv9YBRrUNl1Ybc8HsWYiZuziW6X9X
	 AdUgHdluiiLvdCMOGPcEZVraoAtnLrJreKFPwkhVwwiuQqUrcOKrtQlYA6K5FNVLhZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
	b=3jbO1Qh/zzG0s/cwxzr4R4F1i8jGPEF+l0BIM1engSPh7AB6A2Bl26Mp6WDRZ2mqVWS/
	 V7Jg6AWPL2yfyLsxASnaQWuwQX/ynxdcmISGE181mBRly6a2T/kC8JiKPbCJfBhej/7YP
	 kxkV0lPmV2tdvPx5TqcMABH/kKviXVisDXiD8SpTHCdfR0wIby1bIxak1s4JTrOJYhd38
	 QIRflNSAbQKmwODrW2s2nS67xSxZ3ljiWJesUFYnqzXPBEbMJ7X/LeYRJLLY/JfhyIzup
	 0xa67draDYG1UWZKT1FymvOKJ+ABixFpSHxQ0h7ZNZXRfnL1sKVYetEjGYwWvMZDQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XIZS+0Tf;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CA7606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XIZS+0Tf
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso5382482f8f.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 10:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795629806; x=1796234606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=XIZS+0Tf9nfJEpGkpUMDZx7rg8s4xMMo3BAZq6D8jDzUDAdUaSBaIZ2rXd+TMq1lPN
         /tBc5atTXdmQgRPPrpRvt13Dvs9P5fhZZ+Y34BINGPzmgWvPsn+Ez8s1wENQfdnIHA0q
         jTUK50Yz64r/edlsCBpMS5wYUrlrz8hbAt44E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629806; x=1796234606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=ZneG+ZZXf0/xUROrB2ndLvFbnfexGjlMNIEdLIHiVWLvaZUrpUNWFqV5OnsRbFvd37
         p/PQtQeMJoOx7dbqezctyipNHnkKSGlxXGOMObMDCxgo/J6fs0bCtbLpIJcBZ2LkZ/R4
         K7v7tFph50hb65WCE1vRCkDBDEs4Tr3StwwYDfKZu3ebyE0CLCMkVsBdIKMDgenX2gXM
         SdpMftrHFitAFYfGfEia3IA5O9fVcBlVAysD2bGsMBFG4RSJYigJenvx5VWo9DrlJCpR
         yi2arxLeyeYIuk4/Beqje82aetVBzb0lTzU3dqyLXz1TPChZFwxPfKxcU/NizPtseEYq
         G5Lg==
X-Forwarded-Encrypted: i=1; AL+hErELKGFUOUgXQb3sMS9ajvARds2JRvT+H6lOOSeL3awgb5RBnCnnICiO9ZyEZWJHf0Zl3aA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8JlLt59suvzmODFx7Mc6dTgmfjccSBlCSM5PSTHwLxxmS5yqn6
	o8bUlo/Kr0YRMzHHsPyUZ7WRc2OySL9O6wv1gof4JgiaiYXa8lnXnrG/FHP6WI6K1X0=
X-Gm-Gg: AZFdTZezcDkIq1FEbRuL9SgQOmik8HCSe8MXcVr7Pl8kUVn7Wxeao/27Y+XvL9S15NA
	yy3K7fqMV/hLpf5cXX2A2eTcvTuUyaSOIoK+ggUOC5RxP600VRpNr+g1oa9o/DZJBo1xCrN9bYJ
	qTtGvNBCCRMROp1TRGSztcyJbJFsANjdWXju/G88noNqrjpUC8ZY9aA8g6YOHlUcItxwoXI5L83
	y4+W/wyBVDzmc7wAKudYSDi6SbUPr1LQBbA6Gs6JTi4OkkW3Vi+Rp+oqqTeCloSK/yHGynT5qlt
	RfYfmo43QxvWg1b4cBhweFqhXK8zMpJ1+wmLQ+vLA28rbuu8WsSbYU4/u5tMUn1dKuFCmt6DRZQ
	q80bw2dsiubSBiEcxUaR7aeiVlSRAxsDh32Bb3Dn8f7h6m80USmqbND9+fQL6H9gRLJFpYNpC97
	xg00MTdaRU07BAhLgB/Dweuih9axUJKXjvjuwc25C+APO7JVOWOSqxt8EBfHJGbcazDiN0kR0FY
	uDSCcRAZ/LQjlr0AsmgRf2hUiibPVHljCGjB5wgjroB23+Mj1fAr7PVe4acqQs+4l8fPdU+di5i
	XWNA3A6cEynV4Nq7beRMORbUGM/X9TvZvlb6aM1r5E5aOcU3Szafc25ibqLspAIFu0uukjSsWFD
	Oc+be9qjWz6rl6gLGiyUkE3ZxWwPZxMcAwkI9K7Pm/3Ysjtgz2qPobnwe00PvSlFk5Oo6IWo4DH
	aVZJKjv2d4epJcruhaGLs1
X-Received: by 2002:adf:e00a:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4abb3a4d2camr26718119f8f.36.1795629806160;
        Wed, 25 Nov 2026 10:03:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm19644251f8f.19.2026.11.25.10.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:03:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Ager <florian.ager@bshg.com>,
	Haoning Cheng <Haoning.CHENG@cn.bosch.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Qiu Guochang <guochang.qiu@cn.bosch.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Wed, 25 Nov 2026 19:03:11 +0100
Message-ID: <20261125180316.882220-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM M2 and M2B need UART and NAND access.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Rebase on imx/dt

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 96f084b6ade4..c1ab536bb1c2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -17,6 +17,7 @@ &gpmi {
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
 	fsl,use-minimum-ecc;
+	bootph-all;
 	status = "okay";
 };
 
@@ -33,6 +34,7 @@ &uart2 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -75,6 +77,7 @@ pinctrl_uart4: uart4grp {
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
+		bootph-all;
 	};
 
 	pinctrl_uart2: uart2grp {
---
base-commit: d868355562901bd5043b52ab903811bd95a7d65a
branch: imx6ulz-bsh-smm-m2-bootph

-- 
2.43.0

