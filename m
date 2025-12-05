Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2923E342
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925463; cv=none; b=bul0U0qC726nk31hd17ALsCy5E1tjesFWiNUJwNIo/3KaS6rvxFVOzR44p23YrW37O9COWr0wJYQ4+rIAfcXSuvcb0AZaWD8JLXON47bB8H3CPE3Uz37ZqgdwNd8JZVHzCKrLdNTKuPKBsB+KWqvIdJzuoDunbt+QEcPh1l+oGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925463; c=relaxed/simple;
	bh=Qqq3+/PFRTXnW823ID0pM8I6DnBIiphNfjmnmXa5d6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6ba2q1B/0xfAOwKEDOzfs6s/dIc6iEdmLgASloQ7DEJw1N6uNBq+PBD3z4WgUNfE5cd9NdTkJU1CQ33Xlzk1J8fpABjQ1KdTQD40VIJ4xJ6kFCC9lfroZETR+VeYUKEfk9SRgKByKI5/rlv+CyYMlv6FBa5y7wQAJ/cgi2mE28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=gmrugcFr; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="gmrugcFr"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3AB291FACE;
	Fri,  5 Dec 2025 10:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1764925452;
	bh=OWVCttJ3N0wzxtgjbf0mm45mtDVeyRhL6tZGZtc79+8=; h=From:To:Subject;
	b=gmrugcFr6zF9vLqczcZo25Vq5XjHo9gZ2tCRVk0g2oXJxDfZudHRt7NCum17i+Rit
	 OuajVABdsLS86g6GBxtTZS0YSC9us2b9MDCJbSsYLPdfgDMcmsJbhxXAx88xy0Xfq3
	 kt9aX+ysptYL0mWQx3Yx+ztZsNp7Wh+8WmhJXUthlI1eqUiCPedxj+J9OxGr0/S7ru
	 GVBQvuLHwkFsXv9q3BcAvxvlZE91Gv2frgPW8lTjTTfcRtCt07yQMpz8cjNMCm10kS
	 JzEs6KrklCzudeK/OtAuknZvbCaeYaPVngIlmb+i1g45wjr1wS0EQEtMqJicKjgGvH
	 YCQxeShMu95/w==
Date: Fri, 5 Dec 2025 10:04:08 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: "Yanan.Yang" <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <20251205090408.GA48399@francesco-nb>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>

On Fri, Dec 05, 2025 at 05:03:59PM +0900, Yanan.Yang wrote:
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)

...

> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &eqos;

Single ethernet port, and 2 ethernet aliases. Please fix

Francesco

