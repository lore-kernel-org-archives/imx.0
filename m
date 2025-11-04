Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00013115A6
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245612; cv=none; b=URd3KL8HlnYNMY7OTudvJe2WhcdLin9rf/iCNcwVYIjGxOGpCIwSFUx2hXxcmoJzjsC6qvyeiLkUVpYYbG2XgCUSgeetmRqz8/gRfy9HeN3yfvLsoGvp2yJT+1QdhT1JwkaQYe2RFX29M1Ld+KfOo+xs2eIDe6UEfNlWxtYk5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245612; c=relaxed/simple;
	bh=fOmfcSFF9A1Q4Y/7H3SLjp+jb4/7FYshcOnLc5T7Cmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQbVVvKr5KLIHh3IHyBTU4yt7XHAR7zNRvQu0ok64/KmZa9pmjZOssLa9XxXKuJlvlHu5CJ2JG6QqFuvGrOWXTASK4Xi+phMTbaFWitIdfw6bAl1cIP6j4zM5CKYnlmMac7e43xxUB0gZC0kLJf/vRj3pvpmFe7bVBwKkOnmivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yNQSfwGH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yNQSfwGH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 576274E414F2;
	Tue,  4 Nov 2025 08:40:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A1DE606EF;
	Tue,  4 Nov 2025 08:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9391010B50942;
	Tue,  4 Nov 2025 09:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762245606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1GrrzAVKwbhM2pwwU4cPrm0agxpTJFh+xbdqY2wuQCU=;
	b=yNQSfwGHj87xTdQw0a8qYLTgJA7hD2zEh0mAs9K//sl1zoCY3GSiYzaUG/7P9jloJlmpnr
	a2heFhhbOjTKI+KDbIampUvBPGWiDOjCKiLCn4DjqMjQcwjo/31JgOwhV5o94iproYdqRN
	GpOpLGeImB1tCfi0d45GqkqLHMS31lrp7XiBm6qENt0zoNjYt1BUqkpE+0VWogmqozp0W5
	b7CZvN5izyBVZ2AJBl6P5152ONvNgX7ZDeRdrbnEd/buKSUBtVnSloZAGeEbydfk+5CQCk
	TLR3hNmXQl+2wiM0aIHvzl93bI+Z1pcie7e7BHSjJoN0kKADb3RhzNKunfbNcA==
Message-ID: <dcd43a79-9858-46ad-9331-44b222ca26dc@bootlin.com>
Date: Tue, 4 Nov 2025 09:39:59 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] net: stmmac: s32: move PHY_INTF_SEL_x
 definitions out of the way
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 03/11/2025 12:50, Russell King (Oracle) wrote:
> S32's PHY_INTF_SEL_x definitions conflict with those for the dwmac
> cores as they use a different bitmapping. Add a S32 prefix so that
> they are unique.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
