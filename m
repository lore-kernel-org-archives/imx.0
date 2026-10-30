Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356015;
	b=jU2hbGzqQtn3571KrkSm2zCl0Bk1cdMhyj+SD6n2pAG3indikPqenlf9GpgxNEOlW5rK
	 zz1pCARQ0Ugytuv34DW6Z92lM4T82A8HH9PISufXsz/3TozbOgEMzTSP5EWEJcTwykmjZ
	 lHiiKKHgT/rn9bk+/64no0ryHvfX4bZbWbruZok60gA96vDtZ1Z4D/R1Y1M7r0Is9lQP3
	 eMRTeYLv5NFz3k/gMTfj+mxLZWRp0UgbpMh4tiHecESY6ze+ds/OU4YN65ShFdjwVD2Ap
	 sKhzBVGoPmbz8ZGm43mwDnRCv7JZZ1QgyL/RSAdFLSCPHeiWbWQEkvfuuxcjkaweT6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356015;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=RR1F54y5drcv+A4tIQHG4ZfpQR+6/k3IO0e9rn0QE3s=;
	b=LtZnk9vKtty5sRc8cO9dQcF3rIAkaXmWi5JhT36O0GTk1Zhe9/Aw0+RjK6w4EqvZsAii
	 5dfpLRDXlruLe1Cf5rpqOjO/IwE3Gre2lUAZZ6nwebAY85v4hLEK6EPmjOLvH4y+aG0Lc
	 RlOwwj88CJNzhOchFqnSglTH4p5Dgloled5ntPNFpw97jj57DpKeL1V+vKuE8SbXShz8p
	 KumzQomG3QTuUdMq5PFiH2LTVeAg6Lvt9g4BZnSAphm5JJhoxSmtLT88Cxla/lWKHCZyK
	 /K8v8yh9AimZb0pXQoW00yfDf3T0eAhNfosNu22lGy5Y3cmHi8E7mShfg/RZohWPqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vumznZ4o;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A997606A320;
	Fri, 30 Oct 2026 10:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A997606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vumznZ4o
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D45464E41396;
	Fri, 30 Oct 2026 10:26:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6731603C2;
	Fri, 30 Oct 2026 10:26:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75DD9103287DA;
	Fri, 30 Oct 2026 11:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793356011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RR1F54y5drcv+A4tIQHG4ZfpQR+6/k3IO0e9rn0QE3s=;
	b=vumznZ4o/YhlDqvCPO6TgB6PpQPi7eFbzUumgVXbHN1PjGkAtHgef055JQtH86dxpVLhfV
	RCWeW4I/yhu2/s5jt/rkUjJfqtmDgUbvSWx9e29C8twC9wB+IjKbno0jHm1/5gtiHuMJko
	fmQYZW2y0sfgyTLpwEQt4zUcNAd7gsR59iOXSaLF9+tUs/PAloTCTYIWlQTpz/gv0BM6L0
	HeZQ8SyncywSA7zRbQLI/i8pHhngmF/JL6std7clx3aA35WWkikJnZeyO4SwavDaby8pEX
	jXKzceH6iEo5LXPNfqwuyfM64tMERtEbEb8NXhpfboohUqRyYg35c2NhIFLh8w==
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:26:32 +0100
Message-Id: <179335599226.822489.13265784162305522111.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

Acked-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com> # cgbc-core

-- 
Best Regards,
Thomas Richard

