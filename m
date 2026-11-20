Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167428;
	b=3USt2x5drqzQt8fUk6ShvhpxGHOQ0Z9/JIi8fw5xI8ZcI2XlfIDbagcgF9f/89MByHrS
	 CaGjIcQ2w35UyCybBW4GWRH24ZLiv4UdgvaYzXvDO151OJE3znNVFVyMsXWV+dDV8Iab8
	 shC1qt60qUrU7NOCR5BfjkcC77KlkFdoOoxwxAfBwL0X9DC0JlDpZzrKxDUMBY7SdZkGA
	 4ExRa2WjzWq+xpZozKxqxe1mSLRJ8IFy3sHQvktamSeAIKBspgIsWX69H/yg4EvsJe2BU
	 XV2zKNW0INTovuIsySsJqrxQckwBzI53Dow0mh7ZRgVaxym+eV6KzYYaLZ51OHPR8ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=rQIbTDPqM1kGhmjmlo8VdalXlbJAiuRtdZwXJ1lLpOc=;
	b=LgahJ1c76/fO9fDrxUe14MR8iBHMuQqf0oqUDR5n53Vxnp7QSWZF/90Rfw8DE6IhinhU
	 r/MPsggPu+Uk+Ivl6yioiRIi3sDSjheAYmFw3JodXPw9fhDa4tZQa2tMqpMJ0ND1qBEDN
	 YrR+C88h0otKplc+1xJNj2qeUYXx6M7JCaRah9N51bayLpvLa6O1P/XN+i+dv4JrahjGy
	 Jahhr0tmGz7KRxQKO9GcwiCcuA2R5g4bcqg7WUan6wmNqga/+DA/flPiWX7YOQ8LaanCL
	 87E20i6kjdmDFUwLSl5YdrIqse9eDUpcasnJKRSR/HmjCBPtDsauiYmjYGJLk7c2HZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P+OUwZLi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96DB606A335
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B96DB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P+OUwZLi
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EA610205B41;
	Fri, 20 Nov 2026 10:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQIbTDPqM1kGhmjmlo8VdalXlbJAiuRtdZwXJ1lLpOc=;
	b=P+OUwZLiqMnCGXLmYWvt1iZfw82Rk21aiy1iOLrfOT5yQzkLITUknmyO3+nqIb+czQx//o
	oRmBU4K8KrdrFfkRAzexYS7CY+IV1LAZjNqKvWPQkYhWuCAqEE2VUfZpL5YNl9UjiZmHka
	2A0F6dvxmWSJsjcGamzkbuyw69GZ+MF/MwXZXPxZrupb57Cr1oCv6qrkuvUM3Mdx2vLfmE
	2YsMKIpTvbYmroaTgVuaPb8gDB6O2haUU20BUkd08+nTT17N1sE81XLMMe/bU0FGOMotpw
	qGaTHXeZBHMSQpK5m4YAys7IJF/zQpvN5zMqzt55NiAxJvCGPWegMKIRJTO+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQIbTDPqM1kGhmjmlo8VdalXlbJAiuRtdZwXJ1lLpOc=;
	b=fl05Vht4e6739plESL9sVFP94kS5cjxBBI0lRv3FLwzKk+KqvtWfDJdfrQMSpH0jYseF1C
	2wzAVPA0ThM+X0ThlC6jlbRU5S8byJKQQqBLN9mEyWku5DtTI0a+Njy9n5K2B0IMztxV1+
	19yy+WSmjgirvoMXRjY7Oe3sCILr35BTaNN6rfmne9S8xBF8vfcwK9dxIUxTh19rjc6zw1
	NZWlSIVQbSS+lALFBE+KaXH5dPsiqK+PAQfQ25MHVC4mqBmTf2D0WB7Zykk1MsIBM/iKO9
	x4YwN7oZNbWjeChODEygEIZypeFF3sYPx9C+0YjI4SUkTpE6EHNm8Mj62EF8og==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167425; a=rsa-sha256;
	cv=none;
	b=EWMWytVgopVKw+1nKLwQ33OpYY5zcjexx08gPySa8ODEVsati7+UD1ik9todrKqZoaZjOD
	/oROixqM6S6RaOhkgBvvLshySbTxaKKZtFmWUroor5L1rALMm/9mOGoAV/7nFjIP9NAfnK
	aAx/6FJIIjtI3oQIaqEMMyw+TyqH1wKDLAo3T8uWhVeZzNMzbr9WCOB389SNYGB/57JAFn
	sNymnpZg0MN3ISVm/HZ1Q/y7WvcokVJ8VaBn2WRaQR+qxjtEwUQsozDUV9WcD9H2kLpVpm
	ihnZUUNd5wAkRj/cjMvS1ILIxgome5ptn9ZIBImm8h41B1qxkT2jTdMV8CFqWA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-18;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:06 +0100
Subject: [PATCH 3/5] arm64: dts: freescale: imx93-11x11-frdm: use 8-bit
 eMMC bus
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
Message-Id: <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
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

The FRDM-i.MX93 eMMC connected to USDHC3 uses an 8-bit data bus.
Correct the bus width to allow HS400 operation.

Verified on an FRDM-i.MX93 board. With the corrected bus width,
the eMMC operates in HS400 Enhanced Strobe mode at 200 MHz.

This also avoids a respective warning:

     sdhci-esdhc-imx 428b0000.mmc: drop HS400 support since no 8-bit bus

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index fbe3543e1ee8c..af674f3f48364 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -75,7 +75,7 @@ &sai1 {
 };
 
 &usdhc3 {
-	bus-width = <4>;
+	bus-width = <8>;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&usdhc3_pwrseq>;
 	non-removable;

-- 
2.56.0

