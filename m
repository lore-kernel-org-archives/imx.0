Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795169701;
	b=bG1gc58jODFpquWe41dHWVRN7Mh9e+0Vya1UxbsvV9m3722sG/8GRcvYUz9BQSwaZ+LS
	 vA8+nTD6NhOK7emT/MXFAPDZZDd2Qk+IGsVbXUFr8kKxNCb+ddLQeAUiNA4X1JxKYMeeT
	 Q1KHNvatYrIua2JbiXuC3Vh30ugTaXK6xIu/oCKG00vKg1JHF8GbGDeV2UnHUdlizwCGY
	 fsxo4GHe2U+7B3eWr1Q6ynTSqfI66VPTwRaHTPqrPgc+rkXPOe88F/tEpogxYPmRQgtBS
	 R/H18E6WdXMfrPE8vNe+FNdJDRnaXLkdf/ms849TmHH7i9jVSl3URUH+LHSu2qoDWkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169701;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=8DcVPoMTyDMFeCgP2Bb4hOxIVd8Rzj+Mk/EOJbdxMC4=;
	b=Jbt5RKdI93vFwFMW9jD4ubwX/WdhweeSQXtqAE+PYUc4h4c5kAfFnj8ZS+4re1Pd3ftK
	 ek4GR8cfZx+otxd62nkpprdRColJ6ndCBT1kgj7h5TyL7KHCe9qws3gGSM6Z0TN84qGBD
	 TkMlEoSyNlb1RO77msThpzhFt2Ti5ZZku0iz8OQExOyDfD2QDmpNQv4MWjrhH8q82cie3
	 RrufkmSE/z6IUupQpZeSOaI9EK12RkPVup9I6GcLYH/pp/H+aUDwyvBieC0R1p66+Glbq
	 0gdX5aTPRs4iG/OdNs/gfGnmANe6QlC/UgJsyFXsHuZGMfMAxRGOJOyl9kK73ep6hkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=drWCvDpV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F84F606A326
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F84F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=drWCvDpV
Received: from localhost (unknown [IPv6:2a0a:edc0:0:701:a74f:3cb8:3e85:d062])
	(Authenticated sender: fdi@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A6D24202284;
	Fri, 20 Nov 2026 11:14:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795169698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8DcVPoMTyDMFeCgP2Bb4hOxIVd8Rzj+Mk/EOJbdxMC4=;
	b=drWCvDpVxl3m+V11lVhD+cxvKZzjF5JYPItdT5AwcG2WxjmEFdgPhydL/7j7QSmmpkljLI
	vPydlOrSZdKUlUdGlJrtp3ARYuerT3nfEUNtqzJQCkLlz6ore7JBwew97RIxbNsVWl8DK6
	1f71iXdwz7RHtEmpax1c2J9zwwKzom/9DxZmjhwhXsyzp7fgbj+q+T9tmeRCCpNca60ETZ
	/McBIPVeAdkP7dqUd/zCAuJPG4ZHGbu+RsgXMtoZVt4kHh/OQoWtIcP4wBmf8LGZ18m22k
	kggPiq1DSpOP5YoRjkGtPxFrOcJZR24RxYs1ffWNm5ZGtosBGNLFwb8Y9WzCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795169698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8DcVPoMTyDMFeCgP2Bb4hOxIVd8Rzj+Mk/EOJbdxMC4=;
	b=DNd5fSNZhUpQn0k5AbNKBXhpi4j9kHx4lhWHnLJhIp0oi/fTS8CixBSEucWRF0CTYKi+nd
	PaUeTkYD4XAWPtdStIuOG+DsKlJ6pW+7L5JBxC1yXRGc7ScXvzBZazqfITDQiO9sHdh8By
	kJHZW5yup+AyQTWpt6XMmFZBmctvqiNgEwyJk2trPLuDP1QtF8efzB/u9TSAP4RyUt2epa
	Y/14BT7k0ZH+K0JHXsU0u8VV/UCIqUI4JATpPyr09ZyHChxuh0agcIuqSDzTyd2azyyiUI
	lD8HlHboM4Ys4qeWWnFT4GU7P1Fv6mB7DuRZLOv7CzkA92fQc5PAMVOSS0OnyQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795169698; a=rsa-sha256;
	cv=none;
	b=ViijXAsPeeH+CZynw+5unPSy6CID0wgx0YHSs6qxRgUG4fqbnjoWI0bvPbp7Dy/KbRr6fr
	EKiCeqOw41Lo40Ll52vXNTy5ttjIT5oqGXC6jjOLzNA1xTtV9KjO2cvq7ZgSZGyPX6HqQF
	40bU/nbNVOQWQwo5aeFOGPhFiEb/+u2dYL5Y/5qdrj/54eS8OOAM0oagdGNtbvGNIzMRSx
	wzjWnPZKU3BIGXqzMYOLLCN6m5OQDcTgm9wjvLx1K+gKRMhSQq0RLG2n0fphHJW8Z9b8no
	P0wmApUgdYg2AI16dBojrTHHxxPjZYAoCRUaj5vvrvnt136IKPeZdZOLck6oag==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=fdi@pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
From: Freimut Diener <f.diener@pengutronix.de>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>
Subject: RE: [PATCH 3/5] arm64: dts: freescale: imx93-11x11-frdm: use 8-bit
 eMMC bus
In-Reply-To: <MRWPR04MB12117CE93FD323459E370D08F94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
 <MRWPR04MB12117CE93FD323459E370D08F94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
Date: Fri, 20 Nov 2026 11:14:58 +0100
Message-ID: <87fqwvbyhp.fsf@theta.mail-host-address-is-not-set>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Joseph Guo (OSS)" <qijian.guo@oss.nxp.com> writes:

> The usdhc3 connect to SDIO wifi module not eMMC. Are you sure you test it with exactly patch?

Yes, you (and Sashiko) are right in that usdhc3 is not the eMMC. It
actually is the M.2 slot connected to the wifi module and it has 4 data
lines.

The fix proposed by Sashiko is appropriate in my opinion (adding the
no-sd and no-mmc properties to usdhc3) to properly describe the hardware
and also remove the warning.

I tested that in the frdm-imx93 and will update the patch accordingly.

Best,
Freimut
