Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56F340DB3B;
	Fri, 14 Aug 2026 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692150; cv=none; b=tDZDaw557HRelrA31MlydzVog48oMpNiZnhZ+SMCUqM6d1pPhCG4fCSGzTqXUQqnpM/CHVSmyllRXctxCBq5oRz5L2NFwwUXN8lvJp3HNcMLY2bSEZC6S4AHKXDHFfnYJBRW1jBV5eXacoIEHxHEYr9KaUqu1dl13rprOzhtLZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692150; c=relaxed/simple;
	bh=C+EZyDg1jWFCfEx5DdnQmScAcg0PiopojSisQix/HSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILCaVm2p0ul30oZIZ+UDlfLwJOa5lOhn9I6XvEqSh0JKca0wJh4sPHmYBJrv1O1XWocPB/2Nkcs/siVOq/41awV7IVpeFfW8Xn1esCiGzmLFu1Fbr45jkRd3XMEO+XLETIOGuUp1TIT3y8Y+pIj9+CfQuQ5ukdXR5Qxpk1H9lCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZdJsjtL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZdJsjtL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D2D1F000E9;
	Fri, 14 Aug 2026 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692148;
	bh=5nsasYsVpqPL+PS1T0O/OPdX2crYTy9APW+0J4EPsqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PZdJsjtLrZaFxUGs51rCB2U5saAMMm258m1HgOetllheuxIWBY1CFZe021AXh+TXE
	 GxF6usQ77ZAsfcgTlgOUWii2nkiEZbuOkDM1y/W6RfnHoTDDTevU/cHYtBStaLKC+N
	 UUow+nBQMBTvdgudOMX8RBOfNqm0qGJPdoWfz2T3Ymj7wvsh4YVyU/xeHz1X2wVDUB
	 K4cipgmFGR3OlyHHYcIYgljLPI3xS3golURmvxFY7+R1LgXzXAPVyMpMHmeDrOxAIv
	 TBetY3QtoOeqrSb024QBNWulX6lBiizlkBANiqfD47MXe7BZCs0k8hUEECvWbRatjT
	 +gRohztSaNwQg==
Date: Fri, 14 Aug 2026 09:22:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 2/5] ASoC: dt-bindings: fsl,easrc: add ports binding
 for multiple conversion paths
Message-ID: <20260814-pegasus-of-phenomenal-charisma-c1b3ea@quoll>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-3-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813070020.719810-3-shengjiu.wang@oss.nxp.com>

On Thu, Aug 13, 2026 at 03:00:17PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX EASRC hardware supports up to four conversion contexts
> (A, B, C, D). Add a ports container property to the binding to allow
> each independent conversion path to be represented as an individual
> audio-graph port:
> 
>   port@0 -- conversion path 0
>   port@1 -- conversion path 1
>   port@2 -- conversion path 2
>   port@3 -- conversion path 3
> 
> Each sub-port references audio-graph-port.yaml and follows the standard
> audio-graph binding conventions. Contexts are allocated dynamically at
> stream open time; each active stream direction (playback or capture) on
> a port consumes one hardware context.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.yaml  | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

