Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924503;
	b=W4mONXP5G+uuCW47EgLWzith9E0RqH0dovie92Ib53C2YEULeDjnq3edicqiffTQFpB0
	 6s6xEI5oEY0jAAbcomEKbMTGeCyOXo/V6v9K+wCaeDuy9ggyC3CbfXjqAv9rDulSrdACl
	 tEDhmwX1yWT/nYq3MNCP1G4RLDn59u7bBKuCztLbWtQwreAVEVyaeeDnTF0MJ92bN6+F4
	 8fkGcLgMd50BDvb6bapj5Rcdu4i63siDMfWyLvv3M0dMaQDk10LSYpZpKvMh9vPLHTL5l
	 +cxfq4ZXH3Naf/Ckdp7Zw+Hd9bu84ddjZe+awZlCTbzpPXbXLUuf1UVoNl41NLowGLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924503;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=NC6ZdVr8PNnbXOJqM4/9u9Fx5qy89lUhN3gY95QsORE=;
	b=LnDg5/rXgleoZFb5LN6U/UXHEZ3BPBRVYp7+NcNhyEYMj1jXwc2NuxypGDpDtHoL2AsY
	 0RReGasLE5r/6kqWOVmTzwAU9l5uMXQ2Qqd8787ya87mvEWXRJzkPlhW1byTQTLjwa2Py
	 trEtuBcjn4q5a3GV8kA5+FLsHeELu/XQzkEyrs8QgEVqkoG+3O6lhYHITDkw07aXcioRm
	 WoIa2WxK7Z5pg96EO+vUqY5+HsKI9mQAnxM0tZy8mcOpN6Qxk5JM92y1l1EKGFd5Uwgt9
	 2GYDqrcABkYuJvKg4EseL6w0FIp0O4MW32oeFK/USlASqGW/U8o3fiwrgYORGUhDjDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=np0ax1GY;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30C5606A323
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 14:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=np0ax1GY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8DD0B4E41575;
	Tue, 17 Nov 2026 14:08:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A88A5FC81;
	Tue, 17 Nov 2026 14:08:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A87611BC0024;
	Tue, 17 Nov 2026 15:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794924500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NC6ZdVr8PNnbXOJqM4/9u9Fx5qy89lUhN3gY95QsORE=;
	b=np0ax1GYh8y8hX/axL4c6tX2KdsQYngA5vekITEeamJXrmg5sltJaPe9OWZkkhSkftPAXY
	VtQFeF6swqfLZqxWNM+Um1JQfbVJkKfFRXE/ufXEel2BgG/BajJX6tYxs4pbKCMIZRKAkS
	FdJ7tkG1tisvq2hfLpRNzJoOA6GBWwpjWkg1SryPcAKIKiZYgV5gRlW1jS9l3U5430sTvN
	R5cH+0+dbJ43DMk+lJHGWxk+k3e0lmMF3JhPz12q+FFy0Vm1vyenAKYQeggt4VZGojRn5D
	+c9Kseq0X3nA2m7F5EBf9DSQ+SSSBv4v+ei6j/bva7J92BEx7fGiBpHXb2uubA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Samarth Narang" <samarth.colleges@gmail.com>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Han Xu" <han.xu@nxp.com>,  "Manivannan Sadhasivam"
 <mani@kernel.org>,  "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
  "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
  sashiko-reviews@lists.linux.dev,  "Richard Weinberger" <richard@nod.at>,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev,
  linux-stm32@st-md-mailman.stormreply.com,  Frank.Li@kernel.org
Subject: Re: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping
 on timeout
In-Reply-To: <sashiko-outbox-191272@kernel.org> (sashiko-bot@kernel.org's
	message of "Fri, 30 Oct 2026 16:38:42 +0000")
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
	<20261030162041.2998170-6-samarth.colleges@gmail.com>
	<sashiko-outbox-191272@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 15:08:15 +0100
Message-ID: <87h5hflfe8.fsf@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 30/10/2026 at 16:38:42 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] mtd: rawnand: marvell: sleep in atomic context in
> marvell_nfc_xfer_data_dma()

I'll be taking the other patches, please fix this one!

Thanks,
Miqu=C3=A8l
