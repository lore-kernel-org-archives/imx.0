Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465987;
	b=E0ELig2n51pA57K4WCc6B2dK/s6o1b4IXRELIckeyTYbeYvXhN5uumXU75QyRIXlbSZS
	 NS41nY6Iq/AkniAT9rAK1nXF5ZnsOBLOLRIqxWcfncvLKmxNWXPmApyViL6/aF5fIH8Hn
	 clUOmwEYSTXwp5ySOV/8tLlq35LyJztfAKlabWp9uJbKzP9+8VK+3ibgIlR4bv6YdCzUm
	 aJAnOuWM4xF2w61OdSo3jownbLZUDyz4W4C4hqAVetUSAPBDt0Nr8aTSSmd76ySKEac3G
	 4H5N/sXid92LmvzsQ9cVErcRaOrL6sSb0U9lIF/I78dTEdIXLfHdGZDpbxQCnRfgsgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465987;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FWj5LUnrVFJezexmVCR2EhLrxxSIAJtvNmwpJufMB68=;
	b=XbCO9r5bHHwV+X38imTDvgylf+lO4IsOtdfV3cUwT/V7uAUu8JDOUzJZkMiw6tO8NFL8
	 7h0dUOtPPofgRNMxU/O1PkOYphy+gjsxB2Ctbsk/sNeuSfti+gUuhvqtWZ5iEsJ1B/gRm
	 gA1dpV5mCYPGv0UN6V1cXo+1HNj+TpT3EtAIpTLInU70kOF7ot1lR0tmCbIHYWTIwUJZ/
	 c14DREtuac3hBP+Niph3HAufw+6HOVyoS3PQcqXRcsOJNt+tZD65wcv0HMlCDzwPsgM35
	 ow27dDdvtYudO1JCwtliZqOmE7f7Y4HiXhx5p1FeBCSq3Jzp/0OOSLzNpzkDoVku6ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b="A/n/+Ncn";
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA2606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 20:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BA2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=A/n/+Ncn
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xVaih-00000003fTH-2yfJ
	for imx@lists.linux.dev;
	Mon, 23 Nov 2026 21:32:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=FWj5LUnrVFJezexmVCR2EhLrxxSIAJtvNmwpJufMB68=; t=1795465979; x=1796675579; 
	b=A/n/+Ncn/5K9laKrMVgxAyVPeU6Wjk3VyVLrXAKudRtlLQotNDbZ+qRmIl7QQexl8VJnikdIXAo
	7pH8br38XqdYtut2XJ0WPkIwwMhYbf1l1uXVgdImPGeOuwxbveTH/mA6bMgAVQ/yfiVEvmhpdFyLX
	F564crv6g7d/SESHZLkPdCkBHMalg+8920h0n9+L8yEj1BCTfZVyDlq8RUsLl8r48IRAob6a2Pb4y
	7iu+QwFOUeuXokOzxiJy29YBuZRDpqx+J7Jy/wPOsYPn+BG90ue2YcTRCrHdqIJIRWWYEIKPN/Jqd
	HOoNTjGY5FW0G4rgQy1D3iNy48Sn1dZCM4jg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 23 Nov 2026 21:31:21 +0100
Subject: [PATCH 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
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
Message-Id: <20261123-imx6-idlestop-v1-3-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
In-Reply-To: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=AUY2ja8XxCirP2QoDjD5UZpqa/ZPfxBH7gIhNFVOPf4=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKK0QCYfavdLJiHacwCF3628Roxkq5L1tBpwA
 IkILqTHqnmJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSitAAKCRCEYUX6QCjc
 8RGZD/oDT5Vqyz3h36XS4BnWBmGsEdpxDgFKSJKMsw430YzrtJY43d5tIhwGYQ7pWjR3nQx5qQC
 2ODVYtMEMbMU8TX2GQGG5QLxaBJgJ+ElTlsSREw88q7+bRYOcqha2KodbeyhceTvJbHdH8FUYKL
 n4Z8aUUWwPSNSNg7yr42Z574PnykDPWSdkp9+RPxIJG1IJo2cMmQbjeeQ+AkgqcIx/HN9bkPzZu
 g28wglabWaoqjsRG9WO4ZIIylBrRH++pfrD+y0jAhnsRjQyx96PztMnW5Zn+V5AYfRxRVIs7w9G
 IWvfxJYu51R7/uDFf6bRwjmIyRXx49T3g8ViV+dEyfugYBm3pJKqNcZgCzpT4DhhNCP4ahLnoGP
 k06An7xFxK/vnrPfbaIygo5xgHRCJNc1l5cFhjQx76l3HbRrfqtTfL96OYfzVh2+viaBbBPO8TL
 i+SrXYSRBcTuAx7VPKbbH7tKu4ioFHQ4D8MTvUvQO/N+B9c/e1/YB9xg/IbWbuTp93Y1LV6k6GN
 eOWBbNi2nErNTX7/rNY5Jrn7McErllyVL917YgyssUsY9K4+vWSjik2WGRIhqpdV3EYVdM+uSV0
 Q2PwiqSO5n1+gBQbcaOPsn1EyiPBaR48bIB2wjHL+ExmrNeDiJ4NOICN376yjqIyUVOd21pmQz/
 NIr6AuJdxq4rykg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

To avoid depending on PLL infrastructure for timekeeping, use 32K timer
for the timer.
---
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index 1000ee8b807aa..2e907c4163629 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -46,6 +46,11 @@ &gpio_keys {
 	pinctrl-0 = <&pinctrl_gpio_keys>;
 };
 
+&gpt1 {
+	clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
+		 <&clks IMX6SLL_CLK_CKIL>;
+};
+
 &i2c1 {
 	pinctrl-names = "default","sleep";
 	pinctrl-0 = <&pinctrl_i2c1>;

-- 
2.47.3

