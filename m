Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB883304BBD;
	Tue, 30 Dec 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083276; cv=none; b=hQ3ww2eZT5ZdGU5nrsiAIlxM1rx0coNDWebc/d5omIALJDlXHJpOPT8mXohJ9rUeP2pRIN/AiUbWmbe5wRzfizZ2ZU6LdkfjrRM6GYmQibrxfaysMtTAYMigCsEAX4Orf+Xp90gWvxoX773QKu19uM7zX1Iz3A11U0p0teHDUio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083276; c=relaxed/simple;
	bh=FIR3ooFo7+8BFgEb51+fJ7l2bhQDYE13eiH+Ek+Ziig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jl1OmQsiSjxOOnHL0SHoQIFCsYF2ib+gjMBthc7vSBfrquwHqQ5qWqJSeRHVndYHwZW3/NlEzChDi9MXAMPBeOlgNiM3exrXPb59vcExyumX0KCV1rnnWJmq1tSurJUt080PrRDNyAAzZQ7QoxbbVBemnefvda9fFLFgX7Ie9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZJTwRdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZJTwRdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5318BC4CEFB;
	Tue, 30 Dec 2025 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083276;
	bh=FIR3ooFo7+8BFgEb51+fJ7l2bhQDYE13eiH+Ek+Ziig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZJTwRdUNraCuZoThxKB8cf1RRBJHB63FZXsIez33Yr268Z4qiJTzxNepG9YB0win
	 oOUIsFmmz32N1KRT2AkXsZoD/AaBUjJk8bkqEQrECfuugYU2ty8P6hCap+mZmvEDUW
	 ZVxW4XTbtJB3//UbEk95B9ZP0Ym19jiDGUUZUzrkPlYYV6z9Hqi0m3qQEKxgwepsrK
	 VtgFGtzPbd86/Dd89vd88PFfOd1/KzAJTVuIGG+tqcTtMeDGEkZWSEs7YkF6XIw+1d
	 CgwuSd7x7lBWPBRGU/etQPslEunWabx7ZQ1qnkof8nlQYAXV5sMHuKojImV1CtfDAI
	 Uh08VLxLry0Bw==
Date: Tue, 30 Dec 2025 16:27:52 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: imx_v6_v7_defconfig: Configure
 CONFIG_SND_SOC_FSL_ASOC_CARD as module
Message-ID: <aVONCCVuPbfqVPN5@dragon>
References: <20251216143522.1064563-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216143522.1064563-1-alexander.stein@ew.tq-group.com>

On Tue, Dec 16, 2025 at 03:35:21PM +0100, Alexander Stein wrote:
> This option explicitly selects other options, e.g. SND_SOC_FSL_SAI.
> These SAI drivers use DMA which in turn is dependent on CONFIG_IMX_SDMA.
> SDMA needs a firmware which is not yet present if the driver is built-in.
> Thus build CONFIG_SND_SOC_FSL_ASOC_CARD to avoid useless driver probe
> deferrals due to missing DMA channels.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!
