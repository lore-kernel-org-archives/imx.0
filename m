Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90C3370EC
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615839; cv=none; b=ZdWG4DwxClULzps0SVU7S01M+FTdHvaywdejCht3CTbvg2oU+3goI0rTQHCNJ1NCILLqP46OZDehjlYNyRpQXjYwtxoBNBGshQZWWTN/nbbaR0SDGrubuZISoycC6ms/mc+/A6IsW/UpE8ZR0W9T+xZ3NwXuRd4wz8ZgrQuHoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615839; c=relaxed/simple;
	bh=jPnrVfAStRcV3rJ4+UMIksNxRfQShN7cPYUKs4GBfh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzkRRJDpo7Mg6x9RJ8wSrhPa7QXGD2SwTs73s0V7g8QDLzKvLJmfL69bfvyA2/5SKHgsgyQGVjBOgXLVGYV9m5EQPGbBOzzfl6kKPkWy/RKmsEjCwD0MPYq7Jol7luL7B1bPALrht8is6JP4sLm7xMANNbwFSfCmoLjpbf8L4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FIz/icMe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FIz/icMe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BAD0C1E485;
	Mon,  5 Jan 2026 12:23:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 577A160726;
	Mon,  5 Jan 2026 12:23:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A20D6103C84B1;
	Mon,  5 Jan 2026 13:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767615833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FxpdO0xpWYZr7zB9MVuZ7HLTobH136C3wl/FyW9od7w=;
	b=FIz/icMez1d+ePM8dPLynyFAZ0VZUgZUVwQmgrS5dlyfwgWOzS5LVCQpryCHkxR0zI11IM
	yOG/CSoXOXKkF13aNNmD35yHbAVkVzgpZAXPp8tGpUnG/49mZ1FYUPgzWVpkqbuKnTHYL9
	V4GaBgOT2jjloT6fuRpCF33j8pot7Uz8+EuOiwbo5tE/U5Fxpsa4aCvUdOdYflSqrwi5U4
	7booT3XccwZhIOmukcC05CxR7nlIFVhZ2a+VLMp+dd5xmvmEibXEHJ4N6BuKygHAwpwHbI
	O1ll3n3AKmmK/ipDokyyxgBlU8Nw81oM6nLE5zIt3iTIJxHQqgEt/3mdDocuIg==
Message-ID: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
Date: Mon, 5 Jan 2026 13:23:46 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 francesco.dolcini@toradex.com, robh@kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
References: <20260105100245.19317-1-eichest@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260105100245.19317-1-eichest@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Stefan,

On 05/01/2026 11:02, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a fixup to the stmmac driver to keep the preamble before the SFD
> (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> used on an NXP i.MX8MP SoC.
> 
> This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> states:
> ENET_QOS: MAC incorrectly discards the received packets when Preamble
> Byte does not precede SFD or SMD.
> 
> The bit which disables this feature is not documented in the datasheet
> from Micrel, but has been found by NXP and Micrel following this
> discussion:
> https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> 
> It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> 10MBit. Without bit 2 being set in the remote loopback register, no
> packets are received. With the bit set, reception works fine.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

I've also faced this issue, however I'm wondering wether this is the
correct approach to fix this. It seems that all Micrel / Microchip PHYs
have this behaviour of discaring the preamble at 10Mbps.

Some of these phys have accessible control registers to re-enable it,
however this register/bit changes depending on the PHY model. For
example, on KSZ8041, this is register 0x14 bit 6.

We may end-up with many many more fixups for this, basically for every
micrel/microchip PHY.

Wouldn't it be safer to just always enable preamble at 10M for these
PHYs, regardless of the MAC that's connected to it ? Is there any risk
always having the preamble there ?

Maxime

