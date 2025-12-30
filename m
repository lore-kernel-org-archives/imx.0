Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280B222599;
	Tue, 30 Dec 2025 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062541; cv=none; b=ZeoS3B+UocYzfrJRP/OOXSmyTXQ896kYYWX6j+1FniqWjA2nF31L/bUkfQ648lG6SoHYQlFMWAnPY8fqTtpG9G1ec8bjcLKhla8muq/CDOPlc8JUdG5TWK6DwyukTpImgwC4U6iZgIKf3d2TCPr+TYokPJ3XeYdGDjOacXl9pnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062541; c=relaxed/simple;
	bh=ex91xnF6MkNj7hiFlM7l/hy/nOh8ImjY8BhkJIjbKtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3IIeYrs5RDVE7LMULlnv4XIu0NUIbSqtMTodzormQ/m80I2KAzA62flMzlaeW81+wsAANOMNHfIkBXg56cF0sbSLCcwaP8dfT8pChfKRIPdsHL3q2fNHbwUR2gQiJmEVTHRqPNICndN2PuD2FzQLojekALiQVY3FeoWegcKoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFqlen2Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFqlen2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE8BC4CEF7;
	Tue, 30 Dec 2025 02:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767062540;
	bh=ex91xnF6MkNj7hiFlM7l/hy/nOh8ImjY8BhkJIjbKtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFqlen2QR6aChTne53MHAx91TnowKZLIlOlNnsjTxmoHllG26h/2ZCr8aafvipojx
	 q5I5cUBDSmHm9wtRx4kQwQCGTysMxIPbBJjAk5a2sHRn1E7LMKHumemKcmylnJkMtS
	 mfuldetu8tElRCdQqEndNX/eQwj0m16QqH8BJf6/E6uaGaWCUCIzc6VS9RX+rDMRqB
	 VtmwDDCKGYe4a1VY7tIA0+bgM6oOuNmZs0EucEpgQXW3FnhzuzSXDWRKiokVLtjURh
	 a2A6jcZP21dofp/0uzef+YJLdcy6lymNAls30E9f7djJUsO996HPVYjNTfRfVrmem2
	 Ds9Og6lLevZ3Q==
Date: Tue, 30 Dec 2025 10:42:14 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: imx91-11x11-evk: Refine label and node
 name of WM8962
Message-ID: <aVM8Btd9CYEfg9zz@dragon>
References: <20251203070605.1868821-1-chancel.liu@nxp.com>
 <20251203070605.1868821-2-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203070605.1868821-2-chancel.liu@nxp.com>

On Wed, Dec 03, 2025 at 04:06:01PM +0900, Chancel Liu wrote:
> Refine label with "wm8962" and node name with "codec" to follow
> devicetree specification.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> index aca78768dbd4..313ebc7e8a9c 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> @@ -132,7 +132,7 @@ &lpi2c1 {
>  	pinctrl-names = "default";
>  	status = "okay";
>  
> -	audio_codec: wm8962@1a {
> +	wm8962: codec@1a {

The node name could be better named as audio-codec.

I fixed it up and applied the series.

Shawn

>  		compatible = "wlf,wm8962";
>  		reg = <0x1a>;
>  		clocks = <&clk IMX93_CLK_SAI3_GATE>;
> -- 
> 2.50.1
> 
