Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64192257435;
	Tue, 30 Dec 2025 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767093377; cv=none; b=c69zEnJc7i4GWFP9bAohampS96TDUVEr2vjATuIVxSTcSf32Uo8YmYiukf4S0+cs/E6qWgSlcoDoe7CBcM8jgdU7fLtRKp2FQ32uQ+0K/xe/pizBWa/HtPc/toWusruP0XRK/VqXc8iMbFKxP5KbqPNYSYeKDtr+Ssb73VjEzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767093377; c=relaxed/simple;
	bh=uqmUVWYwiYG8qYbJoU6eyoDu1iIymIOMQ/K/g42OgHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOyuX3h33zYfXKipJuJphI9yB835wbTPqemc32U6uOLfFiVxJ6rxCd/GALnl0DVle5/+6HCIbYVJwUlU+KcXNG6W6NaaC+nIahG7LGyQoeVLWhUjdJuMTYS2PYTujPJ8gRQa8DSzcq3afnc1s3SbUUKKJwCPwTlF2QXFTXdhu/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSzI6+jS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSzI6+jS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764D6C4CEFB;
	Tue, 30 Dec 2025 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767093377;
	bh=uqmUVWYwiYG8qYbJoU6eyoDu1iIymIOMQ/K/g42OgHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSzI6+jS+0Ww9sc0VnhdAjjAKKd+S3PPhyjCgeEH1RD0s1QGtWRQds3lfArdQg6Vb
	 f98a9p0WooJ2Dlr/WLYZOck4HR3QWDhA5q9+5NIn0lkfxXmR6anrNQlwntIMMyocRp
	 rJv/zhVZ3SXk4OHG1j6DOheJJ12xbY3tWPojRB+DVOLdOFvNeWWe1gJRkOGhSMOMdd
	 IiN2tMoq+PwJzjcT3n4cf5TRsk1KlJrQ98oe9GSKB6JTcBAO8A09Mk+Q9QnAe18Qc/
	 vlsCg5peF9R0++ETlVktBhMsCPpwbY5cNvu7uHBQRNvWgzOjj2ARdR6SgJCgeSiwus
	 wFYFmGU538QPw==
Date: Tue, 30 Dec 2025 12:16:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Primoz Fiser <primoz.fiser@norik.com>, Markus Niebel <Markus.Niebel@tq-group.com>, 
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95
 Boards
Message-ID: <20251230-cerulean-manatee-from-mars-be5ace@quoll>
References: <20251229213726.79374-1-stefano.r@variscite.com>
 <20251229213726.79374-2-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229213726.79374-2-stefano.r@variscite.com>

On Mon, Dec 29, 2025 at 10:37:15PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add DT compatible strings for Variscite DART-MX95 SoM and Variscite
> development carrier Board.
> 
> Link: https://variscite.com/system-on-module-som/i-mx-9/dart-mx95/
> Link: https://variscite.com/carrier-boards/sonata-board/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

