Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF27329395;
	Tue, 17 Feb 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340331; cv=none; b=rOWZM6wQpU2IVczJPfb5NxT7D0fLOCM4EiyssYBSHA0LUShzYeo9z31IuFUK1vTNgVVSqGmFpkj+RbVukdUAhl92yqjtunfL8LWAM0tNL8VBUbXUBXnDQcaYtepn8IZMdiwC9fdYqqZM0FWyNGo0V04Hi6OoFtKho3frf4OuOJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340331; c=relaxed/simple;
	bh=2ofuTKKEQLpK8QNYF9SDuill/+IokH97rgFuVahJFbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrMGzFm68haHvfQEPsqXpEY/dQrAgS8I7GQLD88WXn5iHNYx4kHtd1jcqBGr3O6N3ikddkYSBWDLKYO3hc7huskNRsE20MUywW2kaqP/pLmV64h7REW2tDKcPvaL/jUuZ8J9oajNCmB2zWYSWqjllme3qNeGqfDLCBouNxLtduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=OEN1E4TO; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OEN1E4TO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TgrYGzki/8CDchUbygE9S9HTRcJ+spBEW5xPJhmGL2M=; b=OEN1E4TOBXzDVAmqkxj1FpwVUx
	FszW/y92aT5KnFHR4qT6qgA0GxHMbPOmr5yQsBDGK01GPzWgRn4zWfBArExyhrV7KQcF9B2qN+MaY
	xkOFffE0LxZvBujfuI6hw5ZFnGL4hjR4Io9ViKOuh14RiFYV6957jiAB0PjQr7Hmc/Pw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsMXC-007eik-1q; Tue, 17 Feb 2026 15:58:42 +0100
Date: Tue, 17 Feb 2026 15:58:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Message-ID: <fa3805bd-d242-4399-8175-4b8dcd0f84b6@lunn.ch>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-3-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217125952.53997-3-ian.ray@gehealthcare.com>

On Tue, Feb 17, 2026 at 02:59:49PM +0200, Ian Ray wrote:
> Set `phy-mode' on network switch CPU ports to eliminate a warning.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts | 1 +
>  arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts | 1 +
>  arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> index d994b32ad825..7326b8ad08cb 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> @@ -140,6 +140,7 @@ port@3 {
>  	port@4 {
>  		reg = <4>;
>  		label = "cpu";
> +		phy-mode = "gmii";

Are the PHYs external to the switch?

>  	port@4 {
>  		reg = <4>;
>  		label = "cpu";
> +		phy-mode = "gmii";
>  		ethernet = <&switch_nic>;
>  		phy-handle = <&switchphy4>;

You have back to back PHYs on the CPU port? This is not wrong, but
unusual.

	Andrew
