Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5893A346E43
	for <imx@lists.linux.dev>; Wed,  6 May 2026 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066413; cv=none; b=uhHKMPoXGBvxOpfes3+JlCMBIPKLKES86fxvosVun02a+7hJ0t/7PkVOY4XADmkJRWeSuLya1VBCfVtg5D34dA9OaAVzx2iHeMw9xPUpXphheoCRErEgjMVr5wWgQz3GFZZQcoZz0vxMj5Atubp0+YYMBLIoDT9PPAREPgTKnfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066413; c=relaxed/simple;
	bh=+nUdTQL/+FvfuWAAGXkRsJ122b/1Kj58MJeHDQn6nlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhvaG0wODLv1xhQsaS7H0MtoSbTX7BVTSu3s0AF86ndhLovunemS+xXWelL0BqIo0Zq5KTUHlku3vqDhB9ySK6AzV4wMLE/bVHiiji3LWrigK+DsVRvVKPxSQBmv2GBN1BDxmWFX8r3+kbifAmQbj1bmj9RDZLPVAPJIIscRoS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aGVkRYjy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aGVkRYjy"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D970DC21;
	Wed,  6 May 2026 13:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778066408;
	bh=+nUdTQL/+FvfuWAAGXkRsJ122b/1Kj58MJeHDQn6nlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGVkRYjyvzx1Epvvka4sDCYZKNzllTUbRdMRtNAQbie70SiIeQSnHPKyabi5fMyE5
	 rHaIAWnZFjYt10UMzE/5omQOi2nzv0Wy245NqdR4pU9ECaghw+QubNYbh3/J0ssb0z
	 DBMWmq9Xo87aj94QmlfUe+gQvshQPrNzsCKV5VXw=
Date: Wed, 6 May 2026 14:20:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robby Cai <robby.cai@nxp.com>
Cc: Frank.Li@nxp.com, martink@posteo.de, rmfrfs@gmail.com, kernel@puri.sm,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, martin.kepplinger@puri.sm, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
Message-ID: <20260506112009.GM1598374@killaraus.ideasonboard.com>
References: <20260506090124.2960477-1-robby.cai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506090124.2960477-1-robby.cai@nxp.com>

Hi Robby,

Thank you for the patch.

On Wed, May 06, 2026 at 05:01:24PM +0800, Robby Cai wrote:
> The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
> labels, which is confusing for an i.MX8MQ binding. Rename the labels to
> imx8mq_mipi_csi_{in,out} for consistency.
> 
> Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
> Signed-off-by: Robby Cai <robby.cai@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 4fcfc4fd3565..71f79651dd96 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -220,7 +220,7 @@ examples:
>              port@0 {
>                  reg = <0>;
>  
> -                imx8mm_mipi_csi_in: endpoint {
> +                imx8mq_mipi_csi_in: endpoint {
>                      remote-endpoint = <&imx477_out>;
>                      data-lanes = <1 2 3 4>;
>                  };
> @@ -229,7 +229,7 @@ examples:
>              port@1 {
>                  reg = <1>;
>  
> -                imx8mm_mipi_csi_out: endpoint {
> +                imx8mq_mipi_csi_out: endpoint {
>                      remote-endpoint = <&csi_in>;
>                  };
>              };

-- 
Regards,

Laurent Pinchart
