Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49732DAFA8;
	Mon, 29 Dec 2025 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014049; cv=none; b=Ygpz6pRpWhi4hrD+yLCxoCS6yf5I6TDpA5FF+f0LQ5dG0jaNtIls0VieKe7Vi2rhVeX98v78TrjizZVHQWjfLydNr8RFaLb88oeibQpv/z7SVxotytxwSQyMBQZrE0COMSfyMVrVfUhYIwXG4BARnkeRMWSxgUHm+dEW/y127dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014049; c=relaxed/simple;
	bh=O44SR+2KGRGZGizPtObgsC457xqX4X2YLhEMs42dTf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0uN+aYPN2DTVfOjgafWOhvDnbR2jp3V8Fi8E8xyRY108hMnK+Q6TxpQq47wGp5NpFNxUBy6NshSiZAondnB4myqjB5S8wNb36xFa8jcsh7WB9l4fq0GOIxbtY+Tvu1siQFtrIHnAFhhqjCh5fqkG/ghKhEBhSA8tApD5GGa7Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3JwbpEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3JwbpEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B74BC4CEF7;
	Mon, 29 Dec 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767014048;
	bh=O44SR+2KGRGZGizPtObgsC457xqX4X2YLhEMs42dTf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3JwbpEXQ8ZmjCxv+TntOpc8Fg6NNH0GD4yC+/RzQVupEo9a1uqABH4OwLb7SBjjY
	 QNp2fIsNDcEcA756iBWKUOfgJgA338pBq3v+ei9Lzuf+irrfHYEeYX5Lt4X2LkZaiN
	 GkYG1kEWVM+Zygfi95Y9806oqCH1vc9E9eio4SCY8Qpo69eJBb/Mc1TDUcL+z4su3a
	 c7tSxatNMlhjO8iQbnLYy0HidC5Wf3BxGfWOUh9Xti2ARyIbqcfanMRH8dADtlHzj5
	 ye1hFZ2c28DNWbQzrhL6XwvD0tfjPbvDZHakY4ofVqJkYN+sn+rufEJRqhWHXfSWVX
	 BnQBXtfVE49dg==
Date: Mon, 29 Dec 2025 21:14:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: imx95-toradex-smarc: Fix ethphy1
 interrupt and GPIO labels
Message-ID: <aVJ-mpr3bHw2Dmv8@dragon>
References: <20251128150030.35931-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128150030.35931-1-ivitro@gmail.com>

On Fri, Nov 28, 2025 at 03:00:26PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series fixes the ethphy1 interrupt configuration and corrects GPIO
> expander line names for the i.MX95 Toradex SMARC.
> 
> The first patch changes the interrupt trigger type from level-triggered
> to edge-triggered to match the PCA9745 GPIO expander hardware
> capabilities.
> 
> The second patch fixes the SMARC_SDIO_WP gpio-line-name position to
> line 15.
> 
> Vitor Soares (2):
>   arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for
>     ethphy1 interrupt
>   arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label
>     position

Applied both, thanks!
