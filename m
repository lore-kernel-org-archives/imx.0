Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925403;
	b=LYpSO2ALEScX2VOLSdXQmU9PIpedkaumkeEmyswsusb2WPak5vecCY6+aVFZuulVVF8k
	 5tM8r8ftVVPBlAj6o8LZ1Y2j1UkPlyuf7viP8I5lBQHYolCke6lP2wDXpAFXMiDsTEveD
	 KiAVIsWTYcXiLTtKtJKM+VAoSfynsSy1d3kDEg3BF4vYkO0aaa4KQ7RAcThmCaEcDFHKy
	 oY3txXzuYeiDbY0ICT0W3sxXmoN0LtIuLAaZMuh+YEh4yuDG3/AbFhpW2ip5xwSNN2B/l
	 iujozYF1nMVaplCQes2fXhYujLtvKHoHMSIxswmGpLHJY40yO8I0h6KKl8dQ4uOpX/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925403;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=6WQMx50c6/HUXnMlaTSPMugwkj2McUSU1kPMIyMEHsw=;
	b=KlU2rKExJ7lDkCRKZ0hpBCODxderm7WI0M83h92pZ3HDuomniI8ng9bIXngeh9LOhX+L
	 qCY93LSCcIa/mnRojZXlWkNwJIRBw3WM73MrvKpKlb9Q2MZm0VsF0k1D8ATEggEUvcJZs
	 2pgol+QzPaXocU3DNxyNFwqSAP9+cVj0gDHNMHNx2N8PjdZZA5xT0kBXjY34Vs6968aM0
	 /HrOpYlH7/GEnJxMOzcqUQCpSwRd/6KvV3VNo1rRF1AbvcxVa96q+HCTH+/23Z6phZ8PU
	 h7zgj2u4QyEfPII2o6rm86XPacFIF/apJeGBXavD7ZFz87EhtcJ4Gy3+1Gs6beHM1Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i4rxdppC;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E1606A32C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 14:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE3E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i4rxdppC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF3FF4E4157D;
	Tue, 17 Nov 2026 14:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D30B5FD6A;
	Tue, 17 Nov 2026 14:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3333111BC0041;
	Tue, 17 Nov 2026 15:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6WQMx50c6/HUXnMlaTSPMugwkj2McUSU1kPMIyMEHsw=;
	b=i4rxdppCKk1vAV1bBDPISu2sjhV/O07pkl3hWlxjoWPLCOJxe2H3awTDdtMHSzYR1sR72m
	6tnMAHr6C6gOyeelGfpnJSRe6/mgeU2KYHIKgBn47b6ymsa2fPMZK8qXehQWZJUes830Sj
	2ULJEn+uqisojbvAhQXBbLDOhtluiKYyOCHfeXO6Oydd8n21mN7G5lTOw/1vXbGWJphBYk
	PJmNCdInFgHIQ/4so57R+7cMitL7aPvr/KFKNtD+YZI4MF28GL6MjjhMs2QwFkx/8C1hsL
	eq5SMKM+hiD+6r2vHLBAnbJqRLdSh0N/Q/y6sEtoZoi1YhAHojuqy6vv062vcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: han.xu@nxp.com, Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: richard@nod.at, daniel.baluta@nxp.com, vigneshr@ti.com, 
 imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105095935.159650-1-stefan.ghetu@nxp.com>
References: <20261105095935.159650-1-stefan.ghetu@nxp.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix unintentional integer overflow
Message-Id: <179492539910.2259780.13383890149441799128.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:19 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 05 Nov 2026 11:59:35 +0200, Stefan Ghetu wrote:
> Cast block to loff_t before shifting, so that the shift is done in
> 64-bit arithmetic and the potential integer overflow is avoided.
> Reported by Coverity.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: gpmi: Fix unintentional integer overflow
      commit: 3b955aa675345cf494a67f95f0cf91eff33c1866

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

