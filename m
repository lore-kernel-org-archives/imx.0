Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DF26E6F2;
	Fri, 12 Dec 2025 03:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765510798; cv=none; b=Ew3+Symbh03/hp+2PmXs7SPTog2AtavMkV00gLaOTMPUv0wahzjGFiixI2ruxGj++B6tvbk2OqPg2Tq3PP5B+Q0oYTG0fE4iIiOHoEfhagjkuiQMzOGfBzoGJmFNKc69DSJqPWT/N/0GNFyCI1iBufTz/ud135qPJ6blEtkh+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765510798; c=relaxed/simple;
	bh=Lp3UgZZe18SY9Z2JpdZDRLqqLbt10f/e50vq1m4f+Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6oahg3WV49BAbN04Bz95SdIxXkmMhCAyIbvZXrgky7zL2PiFW5lhSearLM3EnNdFjGjkVRpYvuMSFpCoHzGuTvzadXFKmmSm+DFNaJcx8NlKDdyqkvMuE7zQT4gYMgXGOyVLFaBAQNzMNCLUua3adry9ED/vlemMzOUBFNBZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=m/s6/cZb; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="m/s6/cZb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vlw2biAh27gxpCg6hQSXgZXlsXzzAsGwifRNjUZFg3g=; b=m/s6/cZbkRS9f4QZeRi5wRrm7M
	4uFAUEWUwfnzZZVVmeR9MemU4SXI8k3rG7WW6walFA9UPYsvVUuPQm1+EtsGrPT9ZwrlKvXwP1xSt
	eYHOVtHAnIUYwpEz0MIfMgrnf2YXas+OlSdc6RSJR4wdVM1PEdpbTSCogDUMi+mtXCiI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vTu0U-00Ghzh-6T; Fri, 12 Dec 2025 04:39:50 +0100
Date: Fri, 12 Dec 2025 04:39:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: Add FRDM-IMX91 basic
 support
Message-ID: <55fa5159-768c-4785-b0ba-5553193932ab@lunn.ch>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <20251212-imx91_frdm-v2-2-4dd6d289e81d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx91_frdm-v2-2-4dd6d289e81d@nxp.com>

> +&fec {
> +	phy-handle = <&ethphy2>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	pinctrl-1 = <&pinctrl_fec_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	fsl,magic-packet;

Have you tested WoL?

	Andrew
