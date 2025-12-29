Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C1B22A7F1;
	Mon, 29 Dec 2025 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766998410; cv=none; b=WSp4hWJoQYwwPe0k7A+5TrgCuyEv0xnX9xWxPTu7hcY1nUdPpzcB4s/u0wHXy1U12tlHHA8D3ryY7eV3mhuSlssXCemwXx30WjpP1tYJEoZEviTLUgi+swcD67tErCgP4JgEbTI0aedkanrjJcfWCP66NRc2ocDaiFU2HdIe/RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766998410; c=relaxed/simple;
	bh=uXL+n/Tl66FQbVUK2N0Y4zfxWQucSzI8EgEacDJ7HDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJXeXNYyM3QXTbcSs1JHpl2F63LmuqFxrXOYcvhuqU02hwKK0EWkQF8o7HS4MRGK6wyBG9tVVFSajTZqMZaeNXBs/o/+VMRLRdGe0e+rmKfbIzs5lOlhYhftn3nkQLGLO5hXoR4+8wv5wUQuxAZocIS3SuWmNDLzl27BARuIACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRRdMgu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRRdMgu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A4CC116B1;
	Mon, 29 Dec 2025 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766998409;
	bh=uXL+n/Tl66FQbVUK2N0Y4zfxWQucSzI8EgEacDJ7HDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRRdMgu3GOSK6fw9/oB7bikiDoA25Jx0PtgaN4hjZu0edajeALtUkvfsDmg7pBFq+
	 7cWA8mTOy8N6iyC3cbDjbY7twYC5RQpwv/c9v2Ptu9VRCtuHznsh2SvcCo0v344cV4
	 oCrRP5qJRx9kb4NAs1tf/yJYRwlHOWo3/q3+w1MKFzDY7gIS5z8yp0VtKADUt/NRtn
	 sVBrMV8jugRGWsE2Xp26EN0SW5gSdHy0l3J0Bm3svrZhfLB49Ktv1yy1tLVD8SFtXV
	 fNMO+M0X53SgzeFntBDCN3n2w6Mm+FMtlPdXzJLpEghH03HyzoWouBWQarLPflb5LS
	 G2ZwBdtCybiOw==
Date: Mon, 29 Dec 2025 16:53:24 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] two small fixes for imx8qm-mek board
Message-ID: <aVJBhP5lIZWaGUqi@dragon>
References: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>

On Wed, Nov 19, 2025 at 11:22:38AM +0800, Haibo Chen wrote:
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
> Changes in v2:
> - PATCH 1: add fix tag
> - PATCH 2: add Frank's ack.
> - Link to v1: https://lore.kernel.org/r/20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com
> 
> ---
> Haibo Chen (2):
>       arm64: dts: imx8qm-mek: correct the light sensor interrupt type to low level
>       arm64: dts: add off-on-delay-us for usdhc2 regulator

Applied both, thanks!
