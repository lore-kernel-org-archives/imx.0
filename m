Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700060;
	b=zSEQDueLlUuumPn+pgwNjAV2wpj1KACOMp3YtpLc5poszd280HAdPFG76+j6LktbTXcn
	 2ULvmNuFqrhTYX5wBhd48PlqBWbyA7qGqLsQDwdfq5WjiOL2FNhK7B/5V99TTkU1lEQAS
	 4x5qMj/i75zYAewAg+HhdXO/bV7mIY4wAcDPUJ5zquLM6njizcrbQNemPzxX6hv0cKfCe
	 2J8FwLnV2lSNrT6P6OroO8wKrZXstyENIQjbU4vWeQfyCU0eRMyrqL8B5cAP9CJeTy5Zr
	 qQ7cEbJrP1Q+H2hzo11h6zfyj4rPmrGvS1ZDEsvsktHNJZKtdzCtuqMJG0/+Z/rQeZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700060;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+msR+L8hupIZu3L7AvrprWnt14EoIGonWEztPzERWDk=;
	b=BP5C1v6VcDWqve0hNR8OwFIXjh7ZIAG3CYO9WtIWT+KltpLRlTA5Q5CWhP8enfEPPEbI
	 iTz4SrdlQjrKxsxdroxY64FBJyufJzShZE8TqC1w0baH1xIndPMMVvjf6teJHfre0cqCr
	 oi7c+X2s2U7u/dvsHuaqnG2ZU1cDB0LPD/QFIoo2pNQ90rlK739DmlS6uARAQIk6Yo4GE
	 GlZ2kWjbxv2/V6efYetFB3kene5hJwrtUA1Wyg8JngIxycjvT0KwnqYbg1VUjbTkytJ/M
	 XifmfMbfZx9HExUAfBsbh+Xiq2Y6sBbcfvJ+9nS7W5wt6xYRjIJl2MEaX4v7wguXBlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=DRTkaIZa;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12048606A32D
	for <imx@lists.linux.dev>; Sat, 14 Nov 2026 23:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12048606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=DRTkaIZa
Received: from L30177.local (unknown [82.65.104.223])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id CE22313F880;
	Sun, 15 Nov 2026 00:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794700050;
	bh=3DuhsD14Zo+NE2HJ5h/Fip7dpWi29Qk67BwYWlaEb8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRTkaIZaYSzmqkoLQbhO9xlX4cTzmOA5DYPOCj96tq1OnyApDP1+kVRiRn+70PlFS
	 qPeIxbFJcwi4DDTbEXyVTBvyTdu2k4FJIFH4bZP1fpta8kqGcB0JzORI4dSFxiGcOV
	 uABtjcmX33/nN78SOb6wasOQcfzoVwBA5N01QCLOOqChMfBiDzGQHh1vtYbhkIgrk/
	 dhC1DmBpCenH82iUoBWmtDFmYoXRDRD3RSGpRhPyr7pRd3X08yAQQoZXCZeVvI76BW
	 gPESwU1Cs/6ksgLAgZ9AEsHDdSnkUArgMn7MxrmEENwElzAtUfBr7gcOf9F0eTwOC8
	 6QVVl55AxHdwg==
Date: Sun, 15 Nov 2026 00:47:06 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v4 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <avjy-lCL2A9gEhcL@L30177.local>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
 <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
 <avi9N8P34X5uel7a@skbuf>
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
Content-Disposition: inline
In-Reply-To: <avi9N8P34X5uel7a@skbuf>

Hi Vladimir,

> I cannot agree with your API proposal. It exports to the rest of the
> kernel a blanket API for RCW override of any RCWSR1-RCWSR31 register,
> *including* the SerDes fields for which the fsl_guts module already
> exposes an API. So with your proposal, what can be done with
> fsl_guts_lane_set_mode() can also be (un)done with fsl_guts_rcw_override().
> The possibilities of abusing this API design are endless, and I don't
> want to have to deal with them when I can avoid them.
> 
> At a minimum, I would recommend renaming the API as fsl_guts_pmux_override(),
> and make guts enforce which register fields it permits overriding via
> this API. Example:
> 
> static const struct fsl_soc_pmux_mask lx2160a_pmux[] = {
> 	{ 12, GENMASK(29, 0) }, /* IIC2..SDHC1_DIR */
> 	{ 13, GENMASK(29, 0) }, /* SDHC2_DAT74..EVT43 */
> 	{ 14, GENMASK(10, 0) }, /* EVT20..IIC1 */
> 	{ 27, GENMASK(7, 0) },  /* EC1, EC2, USB_EXT, GTX_CLK, SDHC1_DS <- your series is missing these */
> 	{}
> };

good idea, I'll apply it.

Thanks,
  Vincent
