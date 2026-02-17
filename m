Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB592D7392
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314493; cv=none; b=cuiStN2iwG1W08JJX8qBvQHLEE9NVRcCEyD7nH6ZHovp4105dD8rJ2eaGB21GF86uFl/f9wy1ZPyYGzVHEWN2JgyfgjNWzIngeNmoYcm4g27akXpcwoRtcLeLxnTJa/ter86cyOoe+jNzo5XWSlKPLlA/4iXxZhC8o+3+Z1ql+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314493; c=relaxed/simple;
	bh=hV2LXUFRvp3gGdAS+sOIikPEF9/2c/sgwXOC2d/azYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQcSJBv3WVT76MFNrJtD+P57VO6fjiNo5gm4tH+EtH8Omk/lm5rik888PBUjn5ktMC2TWql8iAOr7aOslMd6X3GOqrXOo84ksedMaA3Op/2Qvh1zxTH7k2+KhYgMLSypYqRsk/tHrlEmxqzACZ4AzlnhrwKY+BwhksXW3nlCt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X2Zlmpzj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X2Zlmpzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771314483;
	bh=hV2LXUFRvp3gGdAS+sOIikPEF9/2c/sgwXOC2d/azYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X2ZlmpzjoC1o4Lr2vL4mNberYUWTbWNcNWOzF7fPy9rS4rztiPfQWulvVccX/qOwJ
	 rhB3Qgw3tPDe8X9VtMy0Qv1iS9ULe5oRYV7dxT3tLszOuLfpiLWL1CFkqQq+Ps6HrB
	 Nx99Fu68lVfUQmLl81wvvcV0BwC3ZUroShPvloIEN0V/YSzopp2UGiwZdAKpMfySrG
	 7JAxdKkPRGLiBqrAGrnHs3H0L3obTapJTwPMdu3AwB3ZCpQ+ROQOByKoFsCBtUr+jy
	 VWbCVqjaTr1AcCn/4oJYOKlTAJ4ndfeQls3MrmPJiewc8VG4sEC11cKBek9T44hoOl
	 WgYWLHIQnHR7Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4812417E114C;
	Tue, 17 Feb 2026 08:48:03 +0100 (CET)
Message-ID: <2c3f5c57-9ecc-4a99-9f8b-e1b09a98539b@collabora.com>
Date: Tue, 17 Feb 2026 08:48:02 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] media: synopsys: csi2rx: implement
 .get_frame_desc() callback
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
 <20260216-imx93-dw-csi2-v3-3-aabafee10923@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-3-aabafee10923@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for the patch.

On 2/16/26 20:18, Frank Li wrote:
> Implement the .get_frame_desc() callback to fetch information from the
> remote endpoint.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
> change in v3
> - use media_entity_to_v4l2_subdev()
> 
> change in v2
> - add csi2rx in subject
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index f03fe01280013bf9a832433c6b06dab691bf8f4c..bcbf109a0bfd040c568c0652e28752c94a1bc30d 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -429,10 +429,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int
> +dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			      struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +
> +	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> +	if (IS_ERR(remote_pad)) {
> +		dev_err(csi2->dev, "can't get remote source pad\n");
> +		return PTR_ERR(remote_pad);
> +	}
> +
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}
> +
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> +	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,
> 

