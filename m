Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2B149E00
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727611265; cv=none; b=PPxj/o0sAl2QER75H34siY4sEQ3dAJQAiLeZyou3tTeXxg6eJionBqLx4VKTRaR1XO/wAUc5+2I7UE6sOLGkRtCEA522tim8KAxgzB9lXJp4wEznJ+zSEM7CxQnd1/sntnnsPL/fW4m3iQwXo/cZ6V3eLICLIeNreVydm0N/x1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727611265; c=relaxed/simple;
	bh=MsTHzjFDvxiqe1Ec7mi+ML/OntdXgzvky9K468iFJQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyxGu7mFGCszEhKO62LaLg1TWU+LsLpYs1CGOL23x3KYtrZHL1CSdeB5B3zppuS7v8RDRfna6l/2uARA2oCXyZ+QxbSFv0LDUKwkJRH+5cWRB63ByllSLX88jYXzaSSCpthTw0dsU4VeINazJ4Bl318QqrDIt1Jp8CdltJACwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=anMzCCct; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="anMzCCct"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 048A6B3;
	Sun, 29 Sep 2024 13:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727611164;
	bh=MsTHzjFDvxiqe1Ec7mi+ML/OntdXgzvky9K468iFJQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anMzCCcts+ntXdOz4yXV/F0S66T6WcaLDAYILV5Bn57HZ7/9O+7mjT0lxmKL/rgbC
	 82Q0/KfckAmfrBh5FbKDFnnh+5XiEi9AkpU6rd5nCBY+ffwAWC4IBKmt0YNdMYrkL4
	 QG88ovXoa7+e7Icc+d5q8Zam1ZLjIFqhuGZz4eAU=
Date: Sun, 29 Sep 2024 15:00:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8mq-mipi-csi2: Fix CSI clocks always
 enabled issue
Message-ID: <20240929120051.GA31662@pendragon.ideasonboard.com>
References: <20240929101635.1648234-1-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240929101635.1648234-1-guoniu.zhou@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Sun, Sep 29, 2024 at 06:16:35PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Fix CSI clocks always enabled issue after run system suspend/resume.
> 
> The clocks for CSI will be enabled in imx8mq_mipi_csi_pm_resume()
> when system resume and the state of CSI will be set to ST_POWERED.
> It not only cause clock always enabled issue but also system hang
> issue on iMX8ULP platform since imx8mq_mipi_csi_pm_suspend() will
> access CSI registers if run system suspend/resume again, but the
> CSI power domain is not active.
> 
> In order to fix this issue, using pm_runtime_force_suspend/resume
> instead of calling imx8mq_mipi_csi_pm_suspend/resume directly.

I think you can simplify suspend/resume handling in the driver by
dropping the system suspend/resume handlers. At system suspend time the
device should already be stopped, because the top-level driver (the CSI
bridge in the i.MX8MQ) should have stopped the pipeline. Similarly, at
system resume time, there should be no need to restart streaming, as the
top-level driver will control that.

I'll send a patch and CC you, could you give it a try ?

> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index d4a6c5532969..15029bb81b35 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -697,8 +697,11 @@ static int imx8mq_mipi_csi_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret;
>  
> -	imx8mq_mipi_csi_pm_suspend(dev);
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret < 0)
> +		return ret;
>  
>  	state->state |= ST_SUSPENDED;
>  
> @@ -713,7 +716,7 @@ static int imx8mq_mipi_csi_resume(struct device *dev)
>  	if (!(state->state & ST_SUSPENDED))
>  		return 0;
>  
> -	return imx8mq_mipi_csi_pm_resume(dev);
> +	return pm_runtime_force_resume(dev);
>  }
>  
>  static int imx8mq_mipi_csi_runtime_suspend(struct device *dev)

-- 
Regards,

Laurent Pinchart
