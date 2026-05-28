Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400942C0F93;
	Thu, 28 May 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977589; cv=none; b=QAVz407f7/JvfzEWU4DcHppD32/hSPVPELnqze7dCs9pGUWgPY+f7oVf3FsYiXrljU1GrqeBPiDAvZp0v3bgJj8SIUokJI0RYaV0gHC3ZMAt+eayacJm12B8tXRfkSnCq4gwumrd4FbFxu6DtksQa5oJidDeCVtSBBobsMr7MEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977589; c=relaxed/simple;
	bh=n1Ezd+3R118xxm/hNTYecxDuvGNzCJANYHOJzL5hmME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUD5oRbNwng9g5pw1r3FqQYjkxeg0wHnhmaouCTm3zpEPE2gHuClZGAQzTKvcfcSw47nVnCiWruhS6uoUEtrFEhhr74k30kbNyX5/3y6KDKNW9dSuCegaiYLfnxqg+SsRInjk0PY3jQG0yzY0mOatHAByovtV5ls9IKeHniGC58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=R4BkEky7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="R4BkEky7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nh2alkm8UQFjjG7G5D67uKRDFzJ1Yl0TShWq8gVzXkI=; b=R4BkEky7hz78XU1kosJmLQqR2Z
	fk5SOtgOSxfqIOEig/xqZz4ztuPkrBhh/TmgqGO+gBAYWxaQ6CkCQ3bZkHaFCFR1Cv4f0DbCK0bR7
	wJUToPLtuNL7AnLvTeoWwVbATsbDfaQaCMFT44EMl/a5Q/Tjs37sEIgSAzqjykDmP1fI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wSbTm-004uNK-2Z; Thu, 28 May 2026 16:12:58 +0200
Date: Thu, 28 May 2026 16:12:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection and
 driver_name support
Message-ID: <37324dcf-5214-432f-9aea-90bcff5fec32@lunn.ch>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260528020725.2265321-1-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528020725.2265321-1-chancel.liu@nxp.com>

On Thu, May 28, 2026 at 11:07:22AM +0900, Chancel Liu wrote:
> This series adds two features to the i.MX RPMSG ASoC card:
> 1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
>    device tree property and use simple_util_init_jack() to
>    register a headphone jack with GPIO-based insertion detection.

I'm not familiar with ASoC, but have been in a long discussion about
RPMSG and GPIO....

I just want to confirm the GPIO you are talking about is a local GPIO?
You are not tunnelling the GPIO over RPMSG using some vendor protocol?

	Andrew
