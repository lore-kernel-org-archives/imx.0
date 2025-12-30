Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699513957E;
	Tue, 30 Dec 2025 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767078168; cv=none; b=tkrc8495r4Y38j4GHB5wS4KAMOyyKFM6i9aPQdHCRMmv3Fo9JxTjEBp16AjpYMRpP1IUPinyajJO6AZv5Mc9Lr5UUyRAtl7AuKcP6baDwQOrjXHmzafBuh7smhtr7VSjuRy9BQwq8+uoV7Z+0zQ2o32Bs9WvfFvKnHbFwc+nMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767078168; c=relaxed/simple;
	bh=CfJ8F8iU9Q/hIIflH6ucf/8jx2EhqfUbm9hLwUy6qnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7r0Fa/FBkI9BJnsE/Oz6D76Hs5QbsRmtdgqcIf67jDALS8mQzogUwvNgXAWtKDQAIFgpBhGwTFnV8spTE+uz1D/PWYp4xtIAXtGZDmipG/fNNRyjlJTLpvvOXS0is8w4oNu6VSpmie3RXMVajliE6M5s1CnZ9NKOFGRDC+izn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOf189r8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOf189r8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A22C4CEFB;
	Tue, 30 Dec 2025 07:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767078166;
	bh=CfJ8F8iU9Q/hIIflH6ucf/8jx2EhqfUbm9hLwUy6qnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOf189r85cTs9Ba+Xw3eIq23Br0d1tzM7BC45gdWbxaHKzC/Ix1OWX5muJsK7T8V2
	 fF0YWU3L431zpEntxEXFLr1DMXS3x12bVpIZkC2QsMENfxt13fwmV9AQ7PeB3MYC4F
	 2JfseOBasOg5cqx3ugjfk5DrFUKvWZt7Aq6o9DIyf+WcuQ7x0CKBuBCOnKc3UAHocf
	 Ye0DjnK9CL7hPDjVMUpjSem2EUoZQlzjW2FS1iqnNqD+G1g/wTBYuNos3EX1PfZUcE
	 /+p2z2ZBamV/2sY0eU5L4X6LNqwsCVWo62GMjc5gW8e2fqHnZ7ptgk9lHEZRkx00h3
	 S03jQjWOWxpQg==
Date: Tue, 30 Dec 2025 15:02:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH 0/3] arm64: dts: freescale: Use phys to replace
 xceiver-supply
Message-ID: <aVN5D6PqZVLumY89@dragon>
References: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>

On Fri, Dec 12, 2025 at 05:57:18PM +0800, Peng Fan (OSS) wrote:
> This is a pick up of patch 6-8 from [1].
> 
> The drivers changes have been picked in 6.18, just resend the dts changes.
> 
> [1]https://lore.kernel.org/linux-phy/20251001-can-v7-0-fad29efc3884@nxp.com/
> 
> There are still some other device trees not converted to use phys,
> those will be converted later.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>       arm64: dts: imx95-15x15-evk: Use phys to replace xceiver-supply
>       arm64: dts: imx8mp-evk: Use phys to replace xceiver-supply
>       arm64: dts: imx93-11x11-evk: Use phys to replace xceiver-supply

Applied all, thanks!
