Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321203AE1B0
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339370; cv=pass; b=oXyDaIqpDcatKZzGfDlnXOfGLWNBTJq3F1g2jgRY2mHl9TqtTcXufmVUhcvFra4lJf0dqjxtUtnv8sW67b/sxKVP5ga1dNHF+cgo6EZouItvgxh/PCFMKKM5/R15UimxerqS/cp2OArcF2dLYHTsXxUrPFNbIpoe71NQB7zSY94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339370; c=relaxed/simple;
	bh=Vj3tXuYnJ1Dut3E9ewdloemxBluTlViycN8iH1EaOB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUVgtGvWvXjWW/ilm/7CD7dRSmN92PvLQwKId1ahnN2JPnWEsOgz+D1fKq9dkuCWLHeJtPjPy82jTDUYQVnNPiDuPePi3ikK3tH7WvhDRrFZl0IJKHhfjERUmY/54GKd710pgATttzXlzZgGtd7PnFMDSd8okSsEr6J4xG05aVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=MWSifNUl; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="MWSifNUl"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fg2ZW0pv3zyVM;
	Tue, 24 Mar 2026 10:02:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774339349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHWbw7oyNKZz8F9g3T7f5cxwL5OoWi6tUY7Ok/t8ws=;
	b=MWSifNUlPaaqMOq4PuTJ5MqOaeiGZA+wlBmVOvAJuXT0uqK2iwK3AbdKBBSJPebPQH+cAk
	srwWvrkyOCT47rCmaM/OLZu4Z4ASaTJXpYzo2RbSeToioBL0ksxV3ttibDMOzYKFeZ+Kk0
	HzJzr9W4BsiqIjBTXktK9FmO8I4AgN8=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774339349;
	b=oW98lXMVIazFB6zLz7XJvsrrlvRFfsVvpjFymnNTO4uPy8Uf9aRTc6KWWcDlXv9ZwDVdlu
	/bHalqM1L7lIl5piDLmK5SejL1ejle5bRnDYT0E1V87XmErzP1K6MlfBHRAzT2hODljSil
	0QL6dzTpfEJdUN0lwlMu7GzasW5KLos=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774339349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHWbw7oyNKZz8F9g3T7f5cxwL5OoWi6tUY7Ok/t8ws=;
	b=t//NLF34xv9Yrs/la/jT9186cicr6b4RNHPTFTBSwkXWdccrS/E+nVb8ChfqqjVaRhmIJN
	+n3YGX26QzP484y1XJzmwwzmbNCpOQKYmIDpmHq5WdepT4jrCn6gViv+ib9YhBlpwxm1VR
	bSac0l4xpMN9aXcoKfSab23Nms/7Ffo=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1160B634C4E;
	Tue, 24 Mar 2026 10:02:26 +0200 (EET)
Date: Tue, 24 Mar 2026 10:02:25 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/6] media: synopsys: implement .get_frame_desc() callback
Message-ID: <acJFEcGm0Sgw5nyW@valkosipuli.retiisi.eu>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-3-69667bb86bfa@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-imx93-dw-csi2-v1-3-69667bb86bfa@nxp.com>

Hi Frank,

On Tue, Feb 10, 2026 at 12:11:10PM -0500, Frank Li wrote:
> Implement the .get_frame_desc() callback to fetch information from the
> remote endpoint.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 61cd7f491b3d5b8a37707b23ca03ce709b40a79f..4ad4e3b23448affeeaa932a706653818ba4019ba 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -70,6 +70,8 @@ struct dw_mipi_csi2rx_device {
>  	struct v4l2_async_notifier notifier;
>  	struct v4l2_subdev sd;
>  
> +	struct v4l2_subdev *remote_source;
> +
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
>  };
> @@ -431,10 +433,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int
> +dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			      struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct media_pad *remote_pad;
> +
> +	if (!csi2->remote_source)
> +		return -ENODEV;
> +
> +	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> +	if (IS_ERR(remote_pad)) {
> +		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
> +			csi2->remote_source->name, remote_pad);
> +		return PTR_ERR(remote_pad);
> +	}
> +	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}

Can you use v4l2_subdev_get_frame_desc_passthrough()?

> +
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> +	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,
> @@ -487,6 +510,8 @@ static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	csi2->remote_source = sd;
> +
>  	return 0;
>  }
>  
> 

-- 
Regards,

Sakari Ailus
