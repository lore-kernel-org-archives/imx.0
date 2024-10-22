Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981E6EB7C
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729617390; cv=none; b=p4zdapMCHNMbvZas/PKaob5nCwImpq+asEqOmiMKqc0zu1guCvr4+SE8H2Cenq7A6VuFhRvauuP8Ff7H26aLqP4d66/MD/360mrKddps5MLaxowjd3H8S5w9dLjn+ZMoOUFxiR4+7ZdSJ4UxbvrT5+Q2FvuW5pNcdgfimy8W5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729617390; c=relaxed/simple;
	bh=lMxhVUL8QcioR8QStO8yoHWsojdAWhc6MwdJWkMWZU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZ+ESe3XcK5tWgPO28WX/lH6u9hgY47O61LnO0Wk5g7A3fpQ7z93tpeJ80+5IfdeksmQv+94RGKv0o6SoQnMjBF4jvC7BWz2lvCYLclUb/QZNmO24Br64bP1ZybLrAbr4gJsTuIhnv7cQrvlonmn/iGO5axeFWKOf3KcDB/+jW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=bsfdJYXd; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="bsfdJYXd"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 81B681F9B6;
	Tue, 22 Oct 2024 19:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729617385;
	bh=kpepVEbWAcNZtN//yj3scYliR7FFdifKdw/IM/nj/II=; h=From:To:Subject;
	b=bsfdJYXdq8wQz9TZMQtiTjo5QRA8PeAvsyYHofTwe9c/FHRWiuk2odYGUW/ydg6Xl
	 GhEsHMM2b5zt+jiox3RX8URmBPJQC9IWh77Sgz/HRjdWvtBsXKZRdWog4rqu4JzZrM
	 JbtM6BcucOXt8sC5Dcmmgg4BQxAh4hLF7mU8gYuHJbQXHVer0YWltklPjEPFzkgTGH
	 AcM3bw7VZxhmeZ7lXF41ZeSJnxQL6rlBrkMC9ogrvTVs7ma20jN0j+eZWHTKfjqdLO
	 IVujgfz/Zst1G5Fw96IhZV9nwCR0uBb19fJctxH/0EI8uphP/+T+ZWcFcxovo6S/g5
	 gK2opMKSz1BEw==
Date: Tue, 22 Oct 2024 19:16:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: shawnguo2@yeah.net, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: imx8qxp-mek: enable jpeg encode and
 decode
Message-ID: <20241022171620.GA69574@francesco-nb>
References: <20241021163437.1007507-1-Frank.Li@nxp.com>
 <20241021163437.1007507-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021163437.1007507-3-Frank.Li@nxp.com>

On Mon, Oct 21, 2024 at 12:34:34PM -0400, Frank Li wrote:
> Enable jpeg encode and decode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - fix typo deconde
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index da8ceffdc7212..0d14b0def19d4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -337,6 +337,14 @@ &cm40_intmux {
>  	status = "okay";
>  };
>  
> +&jpegdec {
> +	status = "okay";
> +};
> +
> +&jpegenc {
> +	status = "okay";
> +};
> +

Just wondering, what's the reason to not enable those in the SOC dtsi?

Francesco

