Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611DB1C290
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712299019; cv=none; b=rdeU6+FHOR9EVXtzp2KVq7YLOL7M07vRObL/XDCEUoR0hm5prCCuIvhex+ov32rNxwh1S3Dfiih0L8sj1YX+dmVQCzmd1hmmo45Pou7//R0h3wJQwkciq3ze7ncmwagk7nOrNIyJJ/ssaR8tZFak2VOXhUiWWay9Td4l+zFbl/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712299019; c=relaxed/simple;
	bh=MF9x0u+ja/f5NG5xBWtjLFDFjBEi4bSDETo9bvduU0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFiie2rpPuG547WO7AYD4U2fR9n1T1d+TpD3QRYdBH5u6pT2C3JgInLvz1N8iSguCZO7yWizqMP3MvfjkvvU0dGF9dROo7xr/9kt439Ri6exrAM/GExxcMfjA/9mdak9jRz6jamU9ekt+prBQn4y2a88VJAOSiC6SeLTJZLJ+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=BlHXSaqW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="BlHXSaqW"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 941101F930;
	Fri,  5 Apr 2024 08:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1712299013;
	bh=UC3T4Qz0UwYKpOOwA7clFwRt2M9KxDI2AekTfv3g9ns=; h=From:To:Subject;
	b=BlHXSaqWBfs60fQTTc+F47Eq2cXsItS6heieelM4AyiV1KlXwpzlS83Sk5Snl/rDZ
	 8QC2D93r4m01aixdZKcjUoR3mDHhMJtuBdwvt9mhkk2D0UCUZzAlVkkZkrqWGxQhOq
	 uRhupWPIOjE5SUoDFPK+hg3MZaWPfYV709gjmGojrfjPrkDZRj4AvXofOHQ6/HgMjd
	 f1v/2RiUHzoBQB24KudG4hmUNOM3+HS9AxaGwQKOYP7IGESXzuVK3+GwRh7klpnvmL
	 DYmhv00V17Atlh2LNAjgvEuU68j8RMOHfNhYcFCuodm7DpVk8lKjiKtzWF4dmC1uK1
	 G6M47heIyNU4Q==
Date: Fri, 5 Apr 2024 08:36:48 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qxp-mek: add cm40_i2c, wm8960/wm8962
 and sai[0,1,4,5]
Message-ID: <20240405063648.GA4562@francesco-nb>
References: <20240404161914.1655305-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404161914.1655305-1-Frank.Li@nxp.com>

Hello Frank,

On Thu, Apr 04, 2024 at 12:19:13PM -0400, Frank Li wrote:
> imx8qxp-mek use two kind audio codec, wm8960 and wm8962. Using dummy gpio
> i2c bus mux to connect both i2c devices. One will probe failure and other
> will probe success when devices driver check whoami. So one dtb can cover
> both board configuration.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 210 ++++++++++++++++++
>  1 file changed, 210 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index 8360bb851ac03..adff87c7cf305 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -44,6 +51,105 @@ usb3_data_ss: endpoint {

[...]

> +	/*
> +	 * This dummy i2c mux. GPIO actually will not impact selection. At actual boards, only 1
> +	 * device connectted. I2C client driver will check ID when probe. Only matched ID's driver
> +	 * probe successfully.
> +	 */
> +	i2cvmux: i2cmux {
> +		compatible = "i2c-mux-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		mux-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_HIGH>; /* use an unused gpio */

There is for sure people that have more experience and competency that
me and it would be interesting to hear their feedback, but this
looks like a bad hack, and you are just playing with the driver
behavior to ensure that you get what you need.

Francesco


