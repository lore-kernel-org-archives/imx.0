Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496142;
	b=Ujg+tF5bPfp+uPP6IpLDzSBxV4t3wXos7+nW8tD2MGb6jk2B1OpG4OiohURQHilYVo9i
	 s1b+rGRUlIT74Y0k/jG1djmiyIwnLcLt1X30IMWJCRLg93lkO8F/EAMmJOlYn1QvEbr6m
	 IGuZNwJvAhrJonaYFEohFbwtihmGE3HBsUJ+Z1FYSeGySyVrUgTQxbho4CzZjVE54RVae
	 +Hvyv715z6KbX/uNJgghukIjTEvEuZZp0YPJncSFy2KVA3trYKxnbAInUMK1lZXj42Ryl
	 81DL3pfmJaexfiPzqbKJ/ey1YYNP6uKYT5ppSD4mH+4vlw2okQLEVwrx0/kuAniyteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496142;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r1ul4jZ7Bbm65R+bezx2ySnoUE7BxylsA+WdAUXidRw=;
	b=cKfcvndKCHlibVM2MfiJ6sCYmoXapCiKFOghDaMzfZdRj5tWgqYCFGADuODV+d/wshz4
	 9o9KxN0QB51fH/jC6mfgXij8lwYHTIUOyDLT4W/SLgg6SrD4+NJRFM4rditiG+aBYKXp/
	 PR2rBaHomSaJY7htAvvAsDkvnm9WgC21t5NFMJlszo/WSirwE6+C3bsrtKa3gu0VcL+HU
	 ZhObbbzNTbhCOrpwOMknHFukBu8HzXeFOltZmBI6SJdVyXXMzEyeA2qztJfYB5l26Aepn
	 U/GonuDhg9v1RzFEhn5RcYA7dt1B2Zfo8VscTRSLOGRVpVJ/jv6mtbiJWD0ykfOyguA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ABNK9CUs;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E86606A880
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E86606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ABNK9CUs
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C3236231CF;
	Thu, 12 Nov 2026 16:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496140;
	bh=r1ul4jZ7Bbm65R+bezx2ySnoUE7BxylsA+WdAUXidRw=; h=From:To:Subject;
	b=ABNK9CUs6TSHXA3A+bjNHHCmtmZOgheZnqdFSPSlkCZmRBOL0li2ZoOytuFLlkECK
	 JbcVOHYwasj4/2UxPvkkMuvioGCdUKu7rO4eE6fP6ZTun6v4/z6Fpqr/pllAyjqG8n
	 oCyeMMnL8KmECw5OjMZwc9EDv1wqRb44OtYk7XO79Gc+ukk9a2991aTAgursdPITYj
	 XUiFkM3IuXUWZMST1AE6DpqkD5R6fpBn+W7Xznk5yGKnRVSyk/YN15nIEpr8nUBz7e
	 k3U39tz0tOJ5Rfp5JgNpgD0KI8MQNgESqGm1jc/4Z655AbSelo9L6eW9aEI5MqI4vH
	 h0nMSnXsxIShQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] ARM: dts: imx7-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:48 +0100
Message-ID: <20261112150849.177133-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri family pinout defines the SoM interfaces, SPI being the
single SPI bus available to the carrier board, implemented by ecspi3
on Colibri iMX7.

imx7s.dtsi numbers ecspi3 as spi2, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi2, so ecspi3 is
bus 0 and carries a single alias. This replaces the spi0 alias
imx7s.dtsi gives to ecspi1, which is not used on Colibri iMX7.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index c4088d3c5ab1..bd66745312a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -9,6 +9,8 @@ / {
 	aliases {
 		rtc0 = &rtc;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi3;
+		/delete-property/ spi2;
 	};
 
 	backlight: backlight {
-- 
2.47.3

