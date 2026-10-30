Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350059;
	b=0hyL9+TkRQhzpaXrSpMTqqGqBIQeeCPNu6dJ78kXYGOgucXAibkCL1gUhWmrgLFcELMw
	 MJHDhXp17+dQlmYW07tCuYQvYrSUTZD/+4phSrpNkf/FkxF7ZzpXmg1tHF2pQkoJQUrTf
	 tfHTzwLPOzqXd0XieB3TzHqKWhsKDKqyLxWsLCCWsdGRhx94VRGs9sQGCZkbv8ArSUxoV
	 G7GWJNpw8GZRxCLVloRZVXI3dhAHYE4Ooe4LxQxAQXdkkKfaTaVp5fdRjq8/L0ji62xJf
	 2t1FmHxLQQXWw4M631AY5kVVY6nSggVW0IfxrD8M3Oydr52akDOzpQ15vVnCxsLfKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350059;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wd8M2mrvgKIMbQLm6ZpnJP2zgHswKwBxdG5VWq5IGPg=;
	b=qdt40qqT/Vpmhg92bmPjwtQBkOwFO4bui4W7Ch/Z5QjE4Uv/f0sND+hjC8C49tBsmRey
	 BLA6WFd9gzERlSDuQM5Nz+2cMNzS6bdrDyIflU2C5QpjhPRpADh710HW/Ku7YN/jm/JBG
	 uZoJxyNldCVy5eaokaYKiVQAosA5CLMrBcN6xeDNt4itxuzo4Xgp6m9nfxjipUaZVkyct
	 S/ihm+pS2b/a0r+MsqZAO6C4l+w1STwoj/73IJhNalUtLnxiziSPqmhpBboPLzwCzHdKc
	 8vDFIlzEpTg/0YdnGLC4tsL03ZzCKcFFaRsKgdYAmJotrBCmo5s6JOCWuyn+VZzXCeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3PRgon8a;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=V1i+qmhh;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEA2606A31C;
	Fri, 30 Oct 2026 08:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3PRgon8a;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=V1i+qmhh
Date: Fri, 30 Oct 2026 09:47:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793350051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wd8M2mrvgKIMbQLm6ZpnJP2zgHswKwBxdG5VWq5IGPg=;
	b=3PRgon8aNCuEia+L337yySeBOYoXiX1nocIcfzo8bf7r6/lwSA2zavb6RRrScq+zUpBdUz
	NkwmrrtSvlAoLQaD6lPx+2OIdlbN0TXn1oJl7IxepLVS7ollWLR8hZhMTv0k9xpHNy91o8
	uawoZ4cn00pjckUE1tNcSgQkwRC2XxVT+Bm96/qipHvoIQpZLpUAFbQGWKbRhAnTGvHQgG
	qm2ITcP81yIDIjpE7P3BmpPHsYPXaH8cFwInBaoF3GgcLwzFu7oVzSK36oy6MvanHvSJ3j
	MqYkkctkeQ0s+o9Ygpnz6gU/P1HxhHw2hvAYHMe6ZeD6gctkq0OKghOTkuQSUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793350051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wd8M2mrvgKIMbQLm6ZpnJP2zgHswKwBxdG5VWq5IGPg=;
	b=V1i+qmhh5y+QG8SyPnmsY9EuillzshlgGOtJ5BASYlrGFsSBdcaH2/eKQmF5mLkbI5/Mm7
	oHPG0462Ns3DaKCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Thomas Richard <thomas.richard@bootlin.com>, Andy Shevchenko <andy@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
Message-ID: <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>

On Fri, Oct 30, 2026 at 08:11:38AM +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

Looks like a candidate for scripts/const_structs.checkpatch.

(...)

Thomas
