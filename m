Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDC4AAC63
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 22:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683969; cv=none; b=tze4VDp7T1CyLh1TAq5+Twcw2Y//sYEAnHPbZL/u0/OdjgIo5TibcyN4fgGAz1zh2CYGnKpYyOuNu9H79lH2nbjRgJgHH3y6bYEJgHf9sxRNv3/nFSmCIF9/UakGg8ivc4n5IG4d1tKqRXFAd00x/7j7cAOI2hH/NA44aCqbSFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683969; c=relaxed/simple;
	bh=Mr0Y0dokj98ChZU0/4pYo8F8AyYpWmnAH/fRb3co0A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFDeITMJJ+/vvQ174JmjWDj8IcWtoaJxW9vkGKhuL7dLJ3plZPwj+h8cHhjqnsfAMujGDkibg07g3cK2u3x372YA9I5UF6nT0N+w7RTrHr/gY5aMJ16r6PSn2nylOubl7PZTv15dey1gurWDobfhk0xaC8hL8vJUvydDzTnCOFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4mvnj/Z; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4mvnj/Z"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so609545e9.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683965; x=1790288765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncoRs41lRHgHUmK4It/C41pPHXqjvn/8eqzWfObsejQ=;
        b=H4mvnj/Z86sfV2/tFg6BJRloSAimzXQLj9ssLoJaU6DH5bNMDmIeNkumz3m28MydD0
         xcfef6XKIph2PcqaHUsyp7HzZENDAlfGkFQPHwkMOBrR2OvReP+i3JjS5IFHjTIqtY4j
         uZLKkaWXP8ANdWifKJVJqCYmLrj7u5ucJgCrfUOBIDGE77WydjxlR1gDYjhtKjtI9aB6
         NXQE7rXCjaOOPkEKRC8e7IQm6XRtBTcfvHCA+pDiHeTPvnqHyFAJn2YNSt0F782N1L6o
         pryfkAVyi6oAG5O1JpyhuYLUgVSUhgwUWJLyPWbkRRfxtQHMdBc8S56jrKXeW8gCVuTS
         ZV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683965; x=1790288765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncoRs41lRHgHUmK4It/C41pPHXqjvn/8eqzWfObsejQ=;
        b=rxTTTpF0bYh9ybCnB14dkBZPQH1D9pLzuzFtnumA28+PcUExaKe8yM90DNwXa5rfMz
         mh63d58eDu9/e7IPzbZ8eN+sqbpWtnXrOxet8apmcLmgnm3l7+zqor/dQrD1y/9JYGUR
         iyJnJsl6P52FqqQ4XtQBD6h4hpd5pfZg9+HsETjb2BGhmxoS/hfkoq63Z7gEQjT6aa7G
         yxyAvyOkv7v9o4I847gy1JMQC71/mesjv9Wp1dAMrA4w4HNbbDYZsfFABM2xBo0RUG3v
         NWQz6d/hslyQ+yB6nrrzAdEOec7rWhJ0mfZx35+vuizBA0HpA/WJLRwY/q0u7gwE0QjA
         PGgQ==
X-Forwarded-Encrypted: i=1; AKwUvBySTovj3I7p5lth4EY/CvplxT5AEfh+06U31S7Kis4wPL7NCQQjnAMuItJ68kSD/ZHdItw=@lists.linux.dev
X-Gm-Message-State: AFuF++n5Mnm0jYADb3JXcTdsh7C+SnfdMZF+fGI7Hs3qkAoT61WFlIp5
	igtPVL0Y2O48N2U25q39vxDd1cg7Tw8PL59cWMQf4C8wjmwIphRC61j3
X-Gm-Gg: AYBFou2qmTT80VlPEBpUB66t26LKhUwo5Ee50UoxNU9Pl3v1RoiMq9h+kqHT18bXTYd
	rdbJ3iBaE0vhpfiw+7H23GvpxE9dR4V174nFK0XVpUpXDMiR7cG3XNeO4B4GPCWZmm6uYfzdAD6
	EnOHCK/qZeoyxO+EZ7QKnvE+zhzFfL6IEJlFN08P4wAgxPRJomU5tOrhcQ5q27/JCPENges4nD2
	0noqLK7kn+Hr0rCjvzpR2CGRff0zbLF3/VJk5alLmoS6dzTJLqgB/rgFpPNlFJY1B4f36MI75Ly
	CuXiJMW91zpym0wQS+x6zKJuuMgOnlW4a5XAi7tN15+5c+Yj1z2Ce0tmBzHBon3m6GMuQHea0ng
	sAZQ2wzdoh6WM0TSbq2VVLxDH0uxyNemmedcUC0cXRpbNT9pUHT7vm9dUFESOgIzXyVTT4S6/lk
	cO+1NjGEpa8yRlRhAsFosOHX1+0x6uVn+LO8RXvDysV2NlYl/xqweqnYKLY3bRO9OElR0f4FRg1
	xZNG8j7fnN/HHGXwQ/1sZSa2WdDPY+85ARpEK2GYVnZDn8jMnMQY5mzKgQVMQlREfJY4TI5BSgk
	M/hQ5dTq4iO9HOgsj//qQA==
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr3747155e9.3.1789683964859;
        Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Fri, 18 Sep 2026 00:25:45 +0200
Message-ID: <827798e569775b16aae6c65ff08e3cfbb2324e0c.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
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
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index cb7998616a87..c5f0e22f549b 100644
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

