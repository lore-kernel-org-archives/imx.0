Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837544;
	b=W8c83Z9uZ3YrOuZgLNYJtEBiAx91jD/tj4fdWO/OzH19IRnYMZHa8hyApaatKhQ8Zu46
	 CYe9HGyY1xjaRSou75g/aG2K2ojh8+GEf/KLaZAnl5zyZS5xtcolwVPVTqgUnOnKtxElo
	 ZxNg61jK2KLEugAm4sE8teoBFCjQutRuYhHzpZ7x34e3bKk3QR1cChJrQZOcBmllFU7Jp
	 NTdTmiq8QSu/Iw/ZfRWFsaTvRXhb0zToonqIqIhwclsSQIW4wxCZyi8tOeJ3sE9wU/GUT
	 7Xax9DpJkWuvC68b+R/n++4MfKk0QQQ3abMUUnXWDsJZMSOuwxiP11KnYWBIwXz5wzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837544;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=iaqvgRtBYr1vwCiy/P8BDoJRixcx8rIq3CnR06buB/4=;
	b=ivsMVbHKdpAoXULXUBABB9TZUfJ/f4IzUZieT140K6ntLeeQDqD632Ymz3ThhTXeYjPt
	 w5xMxisoaPwaWlddLWv7/OfOmrPHoUemClsa9UunTPdptZyHePmgj1//dX3jQTbXBVeQl
	 k2Vg9PurUQeI7XiOilFRC4dU4n7yfTj0OMBA+ByKvOaPf7k3gh9io+tCRBbJqNbmzC01X
	 oPDEOX0fxOZ00x7zewajS0XTdv/oZ9o6nv8cXwBI+OgScZabeXoYobdc97Tn7VqMARgI9
	 2rM5NQoYC84N3G3iwvqL5/kXoKQ/0/fFckkXRdKg+/2ltPZ13MC9fA8/rtkQAl54ycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uHMtrG8C;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C625606A883
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 13:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C625606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uHMtrG8C
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ABF731A168D;
	Mon, 16 Nov 2026 13:59:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7878F6023F;
	Mon, 16 Nov 2026 13:59:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7C3B11BC0298;
	Mon, 16 Nov 2026 14:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iaqvgRtBYr1vwCiy/P8BDoJRixcx8rIq3CnR06buB/4=;
	b=uHMtrG8CfsDS6DrHfFBHZ0/AUBFDKdhoZ17yOGEElcPnGryIpeAnZ/27pbpEg8mL/eGxrs
	LoBdoI0Kl78K8/6XBS+HrZkCblz7bQDIu0o5L/WUqZMSJGjUz37OSbP2joRgXFFGqidjKM
	LtxHUVC7c/CFznxUOAmSP++b1pu6zc352tbuom1AVDbYSFduBRJ5kLcfLc5ZgHT7M/ZpjT
	hXNoYrzKr6zddLTvEK1klTrn4EW0u0/2joplpvGxBnUCdlgrD/1FhKejEtTWLKWeFzjq8h
	4TyHjwOglblNKGFpjjluxXrkR0XLfIvtNGXJghzmdaH+q5NB357Sh34m+O+9pQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Samarth Narang" <samarth.colleges@gmail.com>
Cc: sashiko-bot@kernel.org, "Han Xu" <han.xu@nxp.com>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,
  "Richard Weinberger" <richard@nod.at>,  imx@lists.linux.dev,
  linux-mtd@lists.infradead.org,  Frank.Li@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <87pkw4sx1v.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 16
	Nov 2026 14:52:44 +0100")
References: <20261030150929.2944717-1-samarth.colleges@gmail.com>
	<sashiko-outbox-191156@kernel.org> <87pkw4sx1v.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 14:58:59 +0100
Message-ID: <87jymcswrg.fsf@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

On 16/11/2026 at 14:52:44 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> On 30/10/2026 at 15:20:32 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] mtd: rawnand: gpmi: unsynchronized DMA termination in
>> gpmi_nfc_exec_op()
>
> Sashiko complaint looks legitimate, since you haven't actually run into
> that problem, I believe the fix is incorrect on this platform and
> therefore a DMA patch must be sent first. I will drop this patch, please
> resend once the DMA part fixed.

Please answer to your previous patches, stating why I should not
consider them for review when you send another series including them.

I will in the end consider this patch -in other series- for appliance,
because the fix seems correct on the NAND side, but is still probably
not working as expected on the DMA side.

