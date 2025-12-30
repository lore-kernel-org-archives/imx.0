Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD1824BD;
	Tue, 30 Dec 2025 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100602; cv=none; b=pCnwN/8v82ffZ6bbVlZFo2nC2fFG2WwtMtxo+Qg3xV70TuXsmFcj4qjrvydFKDiosP2qNvJxm6DSxnNo+PbCh9Y5QAGas83tamg+bDDMTTcfmklyJl7EMLxD0hIE9aIBprP8LIGIaPTBf6NR5y/ixB20QewgbdBHr7Zb6zhBwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100602; c=relaxed/simple;
	bh=oOocE+3FAjl8ilqNiFKWU7yGNQPLFNxslL7pnT2aNng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WidG27Bq6Rl0vhVZbv6kMM/rRe1jjAzdHupQOpTSQzd4UrrVa0Yd96aLAzCNdI1PZBUAlE5T4THogyXyxa4bn8ciI3vlHRztiLsqBlZa/rONtZQNe/laRlwTpohjGRTXZtS20x4McGafBzQGA/wMYBu44c4QZucb18xRqGqNCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZNdw6/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZNdw6/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3037EC4CEFB;
	Tue, 30 Dec 2025 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100602;
	bh=oOocE+3FAjl8ilqNiFKWU7yGNQPLFNxslL7pnT2aNng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZNdw6/hZV8x1aWhMmi4iDj8wW3dASSjIrdFjeEcJ+hGfmGiq6WJOaEVED2OQ2eUo
	 MSWy2acAghE7LUI90FccDE3oK0NokFgEAvJw/Cfo3Dm1/n9tutbXqt4EFikQuj+Yd2
	 L91DoYq8T30fEbsCflv9Xqip5MH0/tvkri3aupWXboCQzs1rzSqXukj6HFCC01a9mB
	 qUE4Nd4ZRL8JHjEfzSUPWQY1IUaf72m4vU7GS8uzh6jsZr3RsYgDneOGiNviBLQi+j
	 U2xByMYqH7RN65uSQc78efi6skStfQXavo0lkOnW9d07TAZKGXyw9yZIFCYNBPmI8J
	 ypP4QEPOH5TkQ==
Date: Tue, 30 Dec 2025 21:16:32 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] arm64: dts: freescale: Add Apalis iMX8QP
Message-ID: <aVPQsKS5iERmmKG9@dragon>
References: <20251223162833.138286-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>

On Tue, Dec 23, 2025 at 05:28:26PM +0100, Francesco Dolcini wrote:
> Francesco Dolcini (4):
>   dt-bindings: arm: fsl: Add Apalis iMX8QP
>   arm64: dts: imx8qm: Add CPU cluster labels
>   arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
>   arm64: dts: freescale: Add Apalis iMX8QP

Applied all, thanks!
