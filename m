Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=dEV4R5q2jn9PYtn3G2iszA4mfra/IvPJBiYVXJ+F0H0aNxuuscw6yXKXuyhNoAw1hXf3
	 eHyjiC84qPMII7RWlUsrWxAPNjW1n9PNhhFij1XPeovdOtoF8FmW/ja2RuUUWKV1LBUhW
	 gwnR3e0VdAcWnHB/FzQNji8lBEttf5/Ri84vTkPuuRhupZKAoFbPqxBc0iwp0MapK/NIw
	 lrERbv9ZARNwW1J8lV6p5pzFNayJCyO7XufA0ZsX9kOIDKcJaIhW+aPHhhQDZuiIB/weT
	 9m5SOwYEznWOCRdtJG/Qh7nGJDmrPOj/zIpbVhQb6LAxBX76ZGQa2vwXqDFT13/0R1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZtisJYhM86UyOxDcysd9jBL2fDZTQgOga1PJnW60c8w=;
	b=KO83hw4eJUtLUYyXEr9GUamWGtYJeQmMYIWWMby4507eL3vMrvC2I48pXOVJZrr4PYPJ
	 FunyZopf52gH3LaSTin/5nId5tCq8ZfhyX6057K9QzWBuakidt+jxpvbsUomTW1icTq25
	 qh8WrDWxk03la9FfL35mHesS4FsA2E0JzKbPPn7Gx646/QB9DMAihAb3L6qZ3EQIYPfNM
	 evvwtRJG4kPjgAah5s5G42oviDV1VdqSYW+HAa0rdwXHYg8n+pwNkhV+WlUoG13FAVjXm
	 ukU2Tv1wHudjCf20M2U6Umb3pICRU/DjPi1fjyjwiPjCudStCs3fZxcAF88jP1FcZ7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=g5Gh9NCS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506DE606A321
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=g5Gh9NCS
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A1B792020DC;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtisJYhM86UyOxDcysd9jBL2fDZTQgOga1PJnW60c8w=;
	b=g5Gh9NCS8DCn5Zb41igXrUOwh8oxz2zAv0RbRFLEz1NvXCerXMjFEpkf9lW4Uarl9cCkW7
	HGLp1Bjk9YlmoWQ9KEFsTJ4Ts9F56PuL6m88ZhTvMMTQMe55iq6BcQDEV4d/5+cwFdfSPU
	WJszExLZKzZ9KLJqwaNB/jafPBFAoZkNtdlA/kyklxifF5UO8Gy/ZkKwgaqDG2wz2oUsFN
	uuW6ggS+/F3TA3pW4hHQMxRjAQHViKV8KcWYG6kS/bkW79w2uzJ7vF4lVmV7iPJbGnV9cX
	9zba42NdkoibfZaaGsZqutWlr0XHkOPT7jzXRtJ3DZ4Osuko65U0z9Anp6lF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtisJYhM86UyOxDcysd9jBL2fDZTQgOga1PJnW60c8w=;
	b=LwHN8qNjxymoJMW1tf2KTkiiPY9oG162Skwh8Hz9GSGg885POEkhutS1WfZuCPKBD4a6I5
	AoXFanX+Aepq1hkbgNEGaE0G4tbjyPjS2qvqGDuJkNBbFZbaGL62pMXBYr8TUs0zY4ZqJd
	ED6TiPtNQAUeRmcxtKgw4Mum0uQ4gJZCGZowrEChs4q5Oi5gMuan28tPQDeUR5q52nTuz6
	BDRHVyZdPvv38MjccPv9d4PTUhdLwPZ18awhNvtEZead6r6UB3VJqlDLxp3G7GqAWx0du8
	bgy2MrZafzwZcMWru0Y1un6DfLOYb3YsuTbsBAhMJ+nDHWZkFgCTEC0kyauJ1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=T7olXURK/CaoHX7hbUynCoN1Lh4/GbF22pfbO3CDfgWfVSqw/ESGupcpdaJ6zhhkEEllxb
	JJxZglSj4fl8M2aGzK7OJMlZRAyGnb2ROFPT9uxCdtWI1b/msn5wQr+5goUnzMvzlQok+5
	AWpcS3heFASXaXDdxOUX1dmKpa6MKvxCZH7D8bjPJ+ptfoVVaeQF7exZL0RX5PHT2e2Oj6
	ipTex6R/rGu5WZJla4dBmw4Ti9XJocWLYmqMYaKXKSFkiGxJemM/T8bbqJj0JtnKVSeQ0X
	C6JPRN27l1monEJ2xZy1KnPT26dgyn7ZMElLpnUiZvyvQgGNpC3agi3sJK9y8g==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB4-0016XI-0C;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:17 +0100
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx93-11x11-frdm: restrict
 USDHC3 to SDIO
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx93-frdm-fixes-v2-3-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

USDHC3 is connected to the onboard Wi-Fi module by default and can
alternatively be routed to the M.2 Key E connector. Both interfaces
provide a 4-bit SDIO connection.

Add no-sd and no-mmc to skip unnecessary card detection and avoid
the HS400 warning from mmc_validate_host_caps():

     sdhci-esdhc-imx 428b0000.mmc: drop HS400 support since no 8-bit bus

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 6e8351d120160..40997115e4a26 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -73,6 +73,8 @@ &usdhc3 {
 	keep-power-in-suspend;
 	mmc-pwrseq = <&usdhc3_pwrseq>;
 	non-removable;
+	no-mmc;
+	no-sd;
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;

-- 
2.56.0

