Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07D64C9573
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659718; cv=none; b=eOmizA/Nf1lE1P+x9RKfjE4PNuXuHY9FeDldb1fMAOgB99ryWZMEBL/8vTN45biUKVeDPham2ry9FE86lsrr98HfmYcxXwbplRoHGR5JNaAn7bABE4v3Q7xSJwOvmrbttlSI1SJEi8WRLM7IgIGtyYIKtLiiXfv7AimfyrU5lhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659718; c=relaxed/simple;
	bh=iOmCO9NxqyQ+5yWQl+Ovx/mmtM/mWQRsYwhnpKqkdrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epjhSw8GOY6U9oJ0ZTxhS19eVfaIN/AqHMqI2VxNLQHleC2PhqKtFCvvbc5DDGpgYUgamcGkTBGFEOD5hIA5ZgZJg5BvcldhwjlyS5YcWBee/ojjI5nIL+Zzxk83/Sb48isAOHp1RAqQ/Vv0hdX/6RRwWpq/DB9r4w4SnaFiECY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS0aiTet; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS0aiTet"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so5630385e9.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=TS0aiTetURmH8vS08OKwkleDCaPWddnezDhOJ9HuCjCgzQfwTHp741u9rSkoXn89BJ
         EZh86oQiQWeRSsBcwSI04Qf1OE93KxFosQbTub4L8XmRZArmv61n1xVBLkoNKpiDOYtV
         VEUuKc/9kW+Bx1xGKXLAf3hvSyhWCjBZFnU2lzjobZU8FolBHZ6iWkmZuRRdY3RtAjRD
         A6qwRCUoGbdtPOFcNLlCOY2IYzleIM/NDnjmwcv2wezN9at43Cs12uYR8X63bEUsfi7x
         hkam2yWDKCtL+nz4Xy4lCRJala6nWQ90WUa2TyC0q1e/hnHggUpxkXgTxz1JwcxFk93+
         GSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=wH/m/FKRGhVkee/rZL789Fev+Pp4DbcigknEB/z3h/kUX3L8RV2DlbWBlphtGq62ZL
         R0M9tT1++lavIPPlWa4R+VWXOHw2agrj8MQqWAsqLh+BUbJj+7DhqV77IQj91IAjRvpF
         9HZUzRW97LjP7vPsptVaf59n5DUkM+ueHlxH1m0yPzAyurhekZN7GGxLHunS6Df+Cjft
         xDI1s03CmyCZP7haClPoCeM4gikyagc2dUHYjP4ts/VUp2mceWocV72yeI98bhvunaMN
         LHqQIP10SflY4pliazGYh/XdE3fwQN36e24dbBYecawIGN3jWiJOrKuut3WNIrA+Wlmh
         32rQ==
X-Forwarded-Encrypted: i=1; AKwUvByr61SAXU6KKFwZeo7vMRzbiHeIQUXj7GcQ8ynW+dc+mrKO1yeT2TnkB1iVhdDbOJzuZDI=@lists.linux.dev
X-Gm-Message-State: AFuF++nC2dCuTXAoPzWe5v/iBhFz+R3/Zc4zC/hDpDEUC8ztHN/OtQus
	hl81HQQngqhQ1Zhn5/O7OKHbzrCXEknXtfsmkAlR2Y8Tmw4OlcIMS8NO
X-Gm-Gg: AYBFou2VxpuKp502/+zzjnUjMwfPu5bjhkhk9dFmoSx7V+51n6zWj1xWZynNsaEO3DR
	Mahm8adqfD6yud7OncVpNwucr8QJXaMzWnv91J/n+tmfGY9hHI5Zccrpo/Xs7ceowtJn8wlpLOv
	0jnTOnLdOZVc78U5dUIYnr/Wmmzns7IccQjWQT9mC07K/DlbP3K82vLXZDsnDO4ElHvaxDQz/mz
	+Z3FSo9NT6VUDmDMgVLETTvMpYWo9xMzMBPxI5hGtbFYyA6+kxUjqs5IfxfA05FkvQZrcVmk4Bv
	WxItOAUZrUAUO4dhsaDR68f96hkogUjyi8eiIZTUZgA+S+YVvtFOSXkfCMB525k4QaD/xRIR2gf
	saLqZO1YLw9YYPbLURCwbjn8H3MZIHeJkFnwWeZ+DA0Lk5VuIj0fn5J0o3KA02/61TsD452mGuY
	oZSdakZbWyND5jfld/q97aMeS8FkST5J7gblS+5s7l0xkpkIMMFiSzCMBmVfELx83cIGhKT2iM6
	cnnP3tOdtjOv2v2XmlAPe07e3tiSnuwli8EqPraVGHXW5zrtuJrWPmd9U3oyB2qoAhMcz4HBUml
	1EUWWFYG3egXVLMsBZZNTA==
X-Received: by 2002:a05:600c:1f87:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49eb732350cmr85671685e9.21.1789659703973;
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Thu, 17 Sep 2026 17:41:30 +0200
Message-ID: <c13d304b5eb9a82717d192aed0d81ffef5573aa9.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 953950e55bf9..4d6a79bbb132 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3

