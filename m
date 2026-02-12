Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478D353ED8
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913607; cv=none; b=kvN37rQ/TYBWDGXAfcxBi1yajzJOxetFiF2bIl/8zwlO6ibfBEVSx7R8kPhwPF86s3/ZrkxHTtYmtIhA25Qh2WCO+yrWHf6bobfyZDor2leKWwGEM4Rriu112L0m0PSIEkWDDC6fz3OAEhQIhRuKoJ+CM0rcWRKOesan7gOyfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913607; c=relaxed/simple;
	bh=IfJPTfD/j68xQystdzmnn1rusozs+rtcSj53lcL2wPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRwsH3HlO6XuqFUPOnrl/PUkABdRl7PMTmzj+13aVf+X9Sl0SdzhfAN6ED+43MigIl0ovoORlzxgdKWZrRS5jtsLNVqGv93iwbbDhZw+Ie3zc9B4ol3zwqON9yXJt2kzvUZwyfHwwoM1gm50upNsy9TkOLZKLt70GmOuVUF8u0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x+pWO8Sc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x+pWO8Sc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4194C4E40CE9;
	Thu, 12 Feb 2026 16:26:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1308A606B8;
	Thu, 12 Feb 2026 16:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19B7E11971BE5;
	Thu, 12 Feb 2026 17:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770913600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Pygeso/hMqg/e8j/lPRGQdP2Dp2JrXGGOdwPzlOloJU=;
	b=x+pWO8Sci3e/vAkcG0CjCHE7+PpRiLbF8Bn2OgYjOb2QWHixHk8m224SX2FmhaxMN2YTki
	ZXXvaZOSAVIiC057uD5EHXXkQ5ksgMFhtPjxaS/0JERCW4C1wiSyLm/eKLOgyq4qJm2gi4
	X/nZ4tpbdoohYr8ooiX0EK3Wb368cbNzOLVVLocGqC+ChUF+KA3mdgruoknTprigpn1jVJ
	iKBHHX5N4njDB8/haIRWvmkXSoP31fcB9vG45UYgMj5wZY7Bit4NWzRtzEofo54S824nJA
	4My5gcpu5bSNfZPMER8wBsO2kJ9J4m5AGGeJVbPHcFVZoiusoq/YEnAPSK6I/g==
Message-ID: <3699fa56-6eb2-489f-bcb6-0ec7f020999b@bootlin.com>
Date: Thu, 12 Feb 2026 17:26:31 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 6/9] net: stmmac: pass interface mode into
 fix_mac_speed() method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPL-000000093mf-2fkd@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vqKPL-000000093mf-2fkd@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

On 12/02/2026 01:18, Russell King (Oracle) wrote:
> Pass the current interface mode reported by phylink into the
> fix_mac_speed() method. This will be used by qcom-ethqos for its
> "SGMII" configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

