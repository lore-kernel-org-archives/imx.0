Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40173D812D
	for <imx@lists.linux.dev>; Wed,  7 Oct 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372206; cv=none; b=a2qxtU5j1tqkZGKipYn6d6PJxYqt+9xhNfdE3JUP59cfqOmm0QRck1QTpuDL1+iLyEhBm/SM1cdykdZzQrDSWiWSDBZkwip8nsBFQWOXkWMTVuvdod/j/GdcKpcVJYKAHtuzDlGjpsv4pp5y+QC8e31FPZdfj3ZQgTg5sgOO3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372206; c=relaxed/simple;
	bh=h8d/UDxIiosp7oKyeZyf8gbt0wo0wMFoYO35PxF2CZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PeZO7xpqkblxrDAuHkqdR8Bj9fcvDeq/8hMNu1ZB1HkWwtJAYUYnYMNYyOkRKwLSVs7YUBXyVUOSez2u9SN/Zu7SAFnT5ovDc34r0tLyiKYdXjUl7+tKMmUhdDizbA4GmgF29gKuHgdLCWNXJew/jMqSKyLoYzTfLAE2+llB4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BX2s35zm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BX2s35zm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC5174E41117;
	Wed,  7 Oct 2026 11:23:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91A8E6074B;
	Wed,  7 Oct 2026 11:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90EDF11D5011B;
	Wed,  7 Oct 2026 13:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791372180; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PvKbS35WCOo741y4COP9Dw8++nPpWhukTi3m3k0URa4=;
	b=BX2s35zmkef7Sd0hozR3MEerPUh9PNugMMxhrJSYacDtHw6B6CaRddr7h/Vj4ELoYsW2PX
	dNfWX5KT0tPIYItO/7rQaJOqTGzOHCcAxzfznmT2WeF8PmBUBNiGlDXCjgSp7H8kba0se7
	bAX0oUvspDTjjIc3zY6v2GBf1PMzIuzoWI/mn7RCgtg7efTOgMYjJDvHqIXA4PLsDrdOnf
	bL/bxb7yDYjl0Gyz4KPA0uLBvD0RfrprksbARuYMz+KXXL+gvZBBDbedjC3D2MHsRrsyL1
	QcuG5IvKuwJPX2GbuKjw74wU7rms2yhkwyB5NYbReYAdv1Lq9dJ9/ugjJqNvNw==
Message-ID: <a259892d-1b6b-4caa-82d3-ba24efd5a409@bootlin.com>
Date: Wed, 7 Oct 2026 13:22:49 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net 0/3] net: freescale: fix PTP_EXTTS_REQUEST2 for QorIQ
 1588
To: vjardin@free.fr, Yangbo Lu <yangbo.lu@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 10/6/26 15:34, Vincent Jardin via B4 Relay wrote:
> Since commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags
> to ptp_clock_info"), the PTP core rejects every PTP_EXTTS_REQUEST2
> request for a driver that does not set .supported_extts_flags. The three
> users of the QorIQ 1588 (dpaa2-ptp, enetc, ptp_qoriq),
> so linuxptp ts2phc cannot arm their external timestamp inputs.
> 
> The timer timestamps the rising edge only, since ptp_qoriq_init() clears
> ETEP1 and ETEP2. Each patch declares PTP_RISING_EDGE | PTP_STRICT_FLAGS
> for one driver.
> 
> Patch 1 fixes the failure seen on an LX2160A board.
> Patches 2 and 3 are build-tested/code review only.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

