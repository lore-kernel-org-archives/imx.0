Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167429;
	b=ca1YPmDt2H1TfXSTU0a39RqAf+wPfmTlRNNNVSE0f63+p1DEbpYSu2jcloP87sD0a4OL
	 UIflz/NYc450H/rJ3ZaSivVBE41GgHV4b5XGcKLJKtasscr6hfKWRM6LcUmpxP9C+xPAn
	 s3n3T3Qt0iEt6YqAR4vHiP9XG9O892nqi4lfo5xytAt1m5V2wneMn7FD+hEE4BIw5jpp8
	 bKqucLqeS9lG92qpTGX5tkBYlmTb3xE5cuVOc5+aOCA1V7Xe3DWf22fcRNZ8d3garZ6JB
	 8iKfdNio/gEZ/y/uGO1RL6KMFBZVMweZ+kXR94xbriRuf/YXFUG0/vdT231hql1slSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=LML4XyrlFAfqdlC/OVyaYIBb1WuGVb4yNMm0jU79DM2tgAjTXVnwIU/f1UJIr4kIxxD/
	 DOq8C1Cb4lnPYA2/BV2gwkS+zN4UkOqaI0fffN28Z6Y0xW3k1bm8GT54o+QDy4sI19twd
	 RiTD/Aif9Bw+3znEjYZGQBhoa6AsfR4YxtOsdpZOEC3ownXTi0NhvzOnPjKdP1Kl4z+3/
	 3Rixuzj95MSrFX/Poq66B1KM5duF+UmeQ7j67QNO9Lo1InABj3rSS1C3U5x4ZdwAZzpkj
	 DTSf7cOvdnqqfHWsUWVC00FAEwT3OMQaHGSR2erLJnRSMb/TRT6ucCEa0hM+WC8tMow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BmyIHqko;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980F606A33A
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B980F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BmyIHqko
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0EEF2202052;
	Fri, 20 Nov 2026 10:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=BmyIHqkobvTDx1mvjrQJX6zuMrQH5fIc5A0/6kriEzoLGnk1DKuijyRlyg4S0z6lsZONhD
	MCQDDSsyOykDj17v7wwewc+FV2lItknqXdlKeNsyeBbLZnyqGPw+IiYvHni7/GRpyo0AXL
	A5K7dlv4kMBdskLc4JtfXQ6ibeG96HZeGt4v/q7SRBdpq/UgWlN8tIcyjYW/f/qunXvSaA
	269GXwq+M0KK+g9G4slI5Ytuj4WSieM1l5nQN6mERq/F4dRMBxhB5jZv0PebYMgxDvjFNw
	dnI/yQvH8uYL3QOQsXfHx88iZHuLMkqa0ZZv/zvyu1wuCSe93gSkngWSZrp2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=YIqIpSFZF2JH7VrYItUYTZIRvmZemmvTh0uimy0c6/DRD9G5Dr4XjMWnn1lHoqSogj/ftX
	GD9EdCbZdLEMpq17pW1GufTl058U7mFIoQr+yG8MwkHnTMxMIhJRmK4lYlymGWY0qavkc7
	pOMGz+5mC603MYH2cYut8VUonDf9aO3S2CCMx/zTmUSp703ut/BjH/h6ff57mFM7so/5Fl
	/jQlDUb3ql014NMF0y47LWAkXe8BmNX4HPsinAe6LsXWIzMU8+Q2mrAy0IYtGxTglFDwFV
	vRUptaa1cnu55ur8V2jWbbC/DCjbXJmnq8GoHyuZeq0yFHNWrLFunCcDUjNtUA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167426; a=rsa-sha256;
	cv=none;
	b=V/Q/cB3yPbnIWX/3lzbjwEGu4BHmQKiumOFLHh2qZr8qMr6kX+ZJ6Hl32QrBDGfkQ7tF/O
	voRpIxGzQVFhuxcqmxlYmkXEE0s2v52dTDYTn3Xf0cycXmoz9QpCPYu2vQLURxNUpylJNa
	mDl61Fm46kF0RbCA8VNXBf5wtwxhD1iLaHsqNflWmgluNVOP7+F9UxgXhE1Bg36ronnK5P
	Ws6V2qab9bCbLecCyUB1SY0DKrCl1zPdyS5AWH0DdhKfjie6r6Wi/F+/tt2Lc1KAODrkmy
	c4ZHxMY6RJp99Xkrn9vrxcCbJarER3VoSnooUWiAUApTODZLFBmErCMelNxKJw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-1U;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:07 +0100
Subject: [PATCH 4/5] arm64: dts: freescale: imx91-93-common: Add EL2
 virtual timer interrupt
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
Message-Id: <20261120-imx93-frdm-fixes-v1-4-78dde22a56fe@pengutronix.de>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
In-Reply-To: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

The Cortex-A55 CPUs in the i.MX91 and i.MX93 SoCs support Virtual Host
Extensions (VHE). When running at EL2 with VHE enabled, Linux prefers
the EL2 virtual timer over the EL2 physical timer.

The timer node in imx91_93_common.dtsi only describes four architected
timer interrupts, omitting the EL2 virtual timer interrupt. As a result,
Linux reports:

    [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt

and falls back to the EL2 physical timer.

Add the missing EL2 virtual timer interrupt (PPI 12) to allow Linux to
use the EL2 virtual timer.

Tested on an NXP FRDM-i.MX93 board. Linux selects the EL2 virtual
timer (hyp-virt), and interrupt counts increase on both CPUs. Timer
operation was also verified across CPU idle transitions.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>

---
While this change fixes a real bug for me, this same change was already
previously proposed by Marc Zyngier <maz@kernel.org> in May as part of a
larger series.

Link: https://lore.kernel.org/all/20260523140242.586031-10-maz@kernel.org/
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee084..af4c93c128d31 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -82,7 +82,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <24000000>;
 		arm,no-tick-in-suspend;
 		interrupt-parent = <&gic>;

-- 
2.56.0

