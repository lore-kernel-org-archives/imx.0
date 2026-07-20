Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A432B99E
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566284; cv=none; b=hqepbR6PQjegPWXDlTFqJQnO8iArlrGrp9HDiBVUJaEiYtX/vMiP9kBxUsbkVUHLeOKBmE3as4g23kK1lOdM97TddQKLgmvBj62pb1liVX3WSUEyxNohh9MBWD5r/cHO+Dql2/JdtSMO61ctQqSoa84CYahW7Hfv2fDl3gquC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566284; c=relaxed/simple;
	bh=48xzokJJGunmLrBLv47blN7DL2NI8uGuGfFPzvlNX1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNqlF6voviHGs/dtcS/BI23xiP4QAfrtkfOGi4YljrN83z5f656pDZflRtGF8QMC+9fSs48HuIjHBgqNThlC1Nmi7wooIwE3/Zi9JN9ujD/xXE6ei0bdR+KJAUbWXHhHpemJbuDkS6WRkl1hsLb3IXAIuwPGYcFmWiDerk8Bglg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gtvC+Tjy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gtvC+Tjy"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44AE2270;
	Mon, 20 Jul 2026 18:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784566221;
	bh=48xzokJJGunmLrBLv47blN7DL2NI8uGuGfFPzvlNX1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtvC+Tjyg+IRDW+9R3MGxXe7KYwLjQLKe6Pw0cyTfAip1Dogo9d5obuoITP7/yJ+m
	 xM5U7Ro1UQ3/rQYp/vmL+3fHL41hvO7vRhc+aHzH0RnfuQRWOrtxWSoxMM7Z3K/V0r
	 dAW1E7tFtqUvpY6mtrqMfSye/Rwq5kchcsOyA1+A=
Date: Mon, 20 Jul 2026 19:51:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: mchehab@kernel.org, kernel@pengutronix.de, estevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: media: nxp: imx8-isi: Add Frank Li as
 reviewer and i.MX mailing list
Message-ID: <20260720165118.GA42426@killaraus.ideasonboard.com>
References: <20260630163456.3317624-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630163456.3317624-1-Frank.Li@oss.nxp.com>

Hi Frank,

On Tue, Jun 30, 2026 at 12:34:56PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add Frank Li as a reviewer and the i.MX mailing list for the i.MX8 ISI
> driver. This helps ensure patches receive review by the NXP i.MX
> maintainers.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thank you for volunteering.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 361a4f447277c..62ed60238b1cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19470,7 +19470,9 @@ F:	drivers/iio/adc/vf610_adc.c
>  
>  NXP i.MX 8M ISI DRIVER
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +R:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-media@vger.kernel.org
> +L:	imx@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml

-- 
Regards,

Laurent Pinchart
