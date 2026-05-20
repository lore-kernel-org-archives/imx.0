Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5522433DEDF
	for <imx@lists.linux.dev>; Wed, 20 May 2026 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305877; cv=none; b=aIdAiBxhax2wCaCD/HQBvAnA1Ml8JoWBPJcDypSLyUw/orllLEms97cfvHTlt3zXeQRlR8ZW3z6vVb37hF7BbfTz/tYrGbwNVnorSIaQaZP4/JhmiyB2PnLcWZOHDUh0QVc188BbxZ96GNVu6baQZ++Z/95aom7iCEXMV0eN0bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305877; c=relaxed/simple;
	bh=xfHpI83heRSimp+xUd5auoVVzUnuFuzgp2nyUTguwbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJumeVBtmZAIr5UmaQzfM49LI7wNwbKE1A7oQNm/5j8TxO3Dn/IMfcwilP6yddDUWU/GvsHGY4mEPScbnOFmA26HctzO9Hu6bghIzOuQFcC4QAxE/siTfRL8FmFVmpHRnWhSZzGXVPw+gE03QS9nrrbnnzPy17QKugPtELwrqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rh+ddrz6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rh+ddrz6"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B85E742B;
	Wed, 20 May 2026 21:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779305859;
	bh=xfHpI83heRSimp+xUd5auoVVzUnuFuzgp2nyUTguwbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rh+ddrz6vluW7eOSX3w0csL8BG1ZMGUTeEA1D5i3pT/cqe2X2/RPBp1NRODlaP/Ul
	 gWF25FXOIscJJzOk5C0GrhzarSETL4daclHPKw/ir0BZpk4t0CD9MAeuIb+JEKThdG
	 FicaYwyS52kR3g61vaFsz+r3/MyhirnsBsCgfXzo=
Date: Wed, 20 May 2026 21:37:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Frank Li <frank.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: nxp: imx8-isi: Fix scale factor
 calculation for hardware rounding
Message-ID: <20260520193752.GA12152@killaraus.ideasonboard.com>
References: <20260323-isi-v3-0-8df53b24e622@oss.nxp.com>
 <20260323-isi-v3-2-8df53b24e622@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-isi-v3-2-8df53b24e622@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Mon, Mar 23, 2026 at 04:33:31PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI hardware rounds the actual output size up to an integer, as
> described in i.MX93 Reference Manual section 57.7.8 (Channel 0 Scale
> Factor). The scale factor must be calculated to ensure the theoretical
> output value rounds up to exactly the desired size.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 37e59d687ed7..a2edac8292a7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -112,7 +112,16 @@ static u32 mxc_isi_channel_scaling_ratio(unsigned int from, unsigned int to,
>  	else
>  		*dec = 8;
>  
> -	return min_t(u32, from * 0x1000 / (to * *dec), ISI_DOWNSCALE_THRESHOLD);
> +	/*
> +	 * The ISI rounds output dimensions up to the next integer (i.MX93 RM
> +	 * section 57.7.8). Calculate the scale factor such that the theoretical
> +	 * output (input / scale_factor) rounds up to exactly the desired output.

I assume you have verified this applies to the ISI in the i.MX8 family.

> +	 *
> +	 * Example from the reference manual: Scaling 800 to 720 lines
> +	 *   - scale = 0x11C8: 800/0x1C8 = 719.859375 -> 720 (correct)
> +	 *   - scale = 0x11C7: 800/0x1C7 = 720.017578 -> 721 (one extra line)

I think the first paragraph is clear enough, the example is not
required.

> +	 */
> +	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec), ISI_DOWNSCALE_THRESHOLD);

Line wrap please.

	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec),
		     ISI_DOWNSCALE_THRESHOLD);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

No need to send a new version, I'll handle those changes.

>  }
>  
>  static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,

-- 
Regards,

Laurent Pinchart
