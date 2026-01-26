Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA314339860
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434171; cv=none; b=Noi0q0h7Yn82j56WOwm2XfA+rh+75LYzeaW9FoNSA1B57MpjGMDfdVbo5MhE13So7PuJntw/cQZaehN+S1Hgs0gip5UA+Z68mOfFwIFtZTx0yHeILXjqLSwbi5EpIgsuIxzn6/6eFSAuUZ2W9PgZ2GQT/cGO5RtDVh+q/SUq7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434171; c=relaxed/simple;
	bh=e5/cfbgmcZ8VtWGWKmm/w6akYaG//Yt8RiRfZ6FFiHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8azk2ozFVUHC+q5GXv6rzVp6KTd06Fv6O9JiZ4vybJsphprfI5FTj7QrY4Bpyu1BVUqOTC+UYp6CqmvDS9TYrf3di7Pb98b+JLUPZ/+mMoOMB7OC9eaE+rlZPBmUMq1fxe0dp7TpsKke4PY6g+DkE2mgqBp2Hn5otOp3TLOuBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BCrSE+mw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BCrSE+mw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2393C21A84;
	Mon, 26 Jan 2026 13:29:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 150F460717;
	Mon, 26 Jan 2026 13:29:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99E0E119A8633;
	Mon, 26 Jan 2026 14:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769434166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4VpehwRlJ7i5t1l2Yl9R834m3oPT3yev9rVS4TQ1wVY=;
	b=BCrSE+mwhylQ4tQixlFfLMNCHR1HqfQYOItuKPvQ6/aoZHerpdcVoSB7In1NJ5PwEqF5kM
	irzRf74H31TNzv3Dyj3h7OlEmNZJUVjQUUhru8R1ff2RPeqJGgi8gnt9PkNMTXXUKq/k+Y
	DlzUB+84WjuXD4FN6wGA7IwcLNav2zCTomQZNN75hCIiWBBzZc/dtSls6bNK+hDxUGcDkp
	5rLG/zkVRryOwJ9NSRIri6OQ8llqfnNXCmbfz3K+MiooPSWiRR+e9iZZIhRt93ZDxZlDXA
	T62L6mnYQ4tO7Amw1WOFEWb04bfT1scWymEKbqOvFPiaHJGhS6TPLuFUFV15Nw==
Message-ID: <2ce008fd-cb9b-4f5d-bdb0-cccb1f09eae8@bootlin.com>
Date: Mon, 26 Jan 2026 14:29:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: don't pass ioaddr to
 fix_soc_reset() method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 26/01/2026 13:33, Russell King (Oracle) wrote:
> As the stmmac_priv struct is passed to the fix_soc_reset() method which
> has the ioaddr, there is no need to pass ioaddr separately. Pass just
> the stmmac_priv struct. Fix up the glues that use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
