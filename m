Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=vTh3S5R4lB8IJ2B8dmZvT799/KYLUUaSxMlsYyxwxWYiwj1zlxZghRVtOjJS5in+abuA
	 OYp4uTnaN3CqmKNya9t8JO3PLWQPh9eAGBOLHH/EPF6JgS5r2/rQusmpEG3cvToAhpKGR
	 Cej5bYbG54wL6QvB4iCRrWzFAsUlvWISFX5VC/S4CnSHIv8bh+R2++MnTxQVjK6eCEVZn
	 4kw9hmj3igNAJV1AMsdqdJ2jjWYninj2kIGXkKUMYjh3EvRfA64NO4PMf4Q5cZjO6thh1
	 1SMFXtxeHtelndypkdlVSYUJ/vjuNgF+4QaP0tIUwH7rteUkoBpU7YyYCPhBORZoM+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=G5cgEc82dQLv3Zd0Nl+X4Rgdv6RoWSIojOhk7SkIv54N6CFKKPDxW2hFC4Y+G6RsuQ3i
	 5FxbdT5XDDcOqsPc0a6TcjZeOMtmhyFTJzK3wFbtF5+gH1qak5Jj89rMbbiU0OOwiQSLr
	 sNySiwSEfM3/HOKTv2e+9693W8hFPPoMfzfR1aPW86IL/vNtXfJhDIYOhcRa4ZmYplUsT
	 vanA2Xe5szoUkleUFIheoyLme7LQT+w/9EOJLvleKeLpT5FN4zh1h3DHbIBC+PNt8fRkQ
	 3ksvdhcc5iJU9gA0mzWTMsODUO5y0UYMvoAoaIa8pUUgKygUOlIeftUYmRnI5xfVF2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kcbwldaz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50600606A31A
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50600606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kcbwldaz
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BDE3E2020E2;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=Kcbwldazoug/OEH9qzqxE23OE/hpd7ZMSTBczCp7ZqjVA+aLlboiWgIr24ZmgRoHIi6lsx
	2tngYanTqlFEuJ6BCtqESGcL300b1srcjJtOeNH2S+zpEX6fa48bO9lKo7POy8ofzzx8GB
	x6eQCRzcjOeZxpMuTMRCWtX91+dy9Yy6m6xYjYutGJR3B2HFiCrsOd8manfFBN+7mBeTac
	k8uLN0aGinjJ0zzRPY3wvYudXD2avRztNG4wbhoawInNBm+EAOqZ7cGGC176LUYXTrZYs8
	S1TluG16DVLaHF/bDqyey+zTgqopTY8zTkfQHte6afUAC7CvQxCUTNeyYrRDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=ZnHVuBY2LXNoH7oAykr6PpYW8fpYm/Wjb8VRlh2LxZFTrEEkHAxpvEOqw+CzDtpgGNcyad
	CTo4JDo/1shhRRwgAeFXb57uvkQ14h0Oh4qIv2r8dN8GmjuUjs+R1UvQyJLA3CifhKY2QE
	RtrYqWOZSbnwX7a2UC84D2qzBDMWFbgVm6en2ucfn0jEgi7u/KgleWsZtisynwdGnOMEjH
	jhCvVZX990W7fxNeLIIPFzYrjqtOry6S8ZZo5tGEA9jBNZNzwH+5nK9E+DmUnbfC/hWHhS
	I3Cg4spqe0QGir36LlkAEl9QkQ8M/VjcWrb1BOla/aO6JUUhbZWhAwWPZE0gfA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=OPxuAL/dPMmlWns16nGx2Ai1y6mNba6rldF/0KPzv2N+PcZ1kXpI8iIMscfAyumfcPvoqP
	9QzyM+d0H1vIJi/+CNf0WJSWxEIseFW2pvNU325cDgwrvjj/z6ngrOxwYY+do8F2VNhT6G
	16kEooZ3SkbdDCR+zbi3GiW9kG9FBGbh9XFGiwSFsHWI6fRot0gDFAThSODNckSkklgNEg
	ACuDCipoT4IGCHwtLRTLGmrSLPNDO04tQIS2NSBMgPJ3nXYIeO+LKcFYZIe3xaWyurDw6e
	JwF9fCqQTGS16Us44nye1JyyeEvEPOPNLLKl29Bne1wtG03N47FK+jpCA81GZg==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB4-0016XI-0a;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:18 +0100
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx91-93-common: Add EL2
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
Message-Id: <20261123-imx93-frdm-fixes-v2-4-dd97c7fca4b1@pengutronix.de>
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

