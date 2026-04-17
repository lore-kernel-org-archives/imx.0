Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB9F1A9F8D
	for <imx@lists.linux.dev>; Fri, 17 Apr 2026 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410161; cv=none; b=MYNv0HjnO3gr73K/GGXLXXqp5dO1xspOjHfT8XBqZApT0rKwlRRnzqRRNVfPCexCEcZvH213LPSM8Gr2RxEsy0TmLklnVduixW7KY/9dNFKJp6BAs+LUI66vH4fxjbLHPcbU9h+yl4DUDpFYvKLYHoKkIFYWioi8e3n92SRiPLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410161; c=relaxed/simple;
	bh=4S2CWU6/SMrhpf9GUfOJN6Snxr66DLowPKAGkEZOrbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMEUxrlzO9x+Zl0KY4HBMZxMafwt/sWpdiHR6XvpVkaKB7O1DEBG8gzMN8c+AogVMC5ES67vlI2cKzg4Z2gCxJYvDmKrJVozq6Lwu3sTdXwiTreA1hd283Wr7OvC1UoTvAYoNlBUHtRebCWFYE8ymxMBlYpjZzC3NBNvQT3Tucw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cOWLAO1S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cOWLAO1S"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFD9949F;
	Fri, 17 Apr 2026 09:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776410060;
	bh=4S2CWU6/SMrhpf9GUfOJN6Snxr66DLowPKAGkEZOrbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOWLAO1SnCkXbGrKMX8E6ClI6lCJluEf2bHzz4Xzjbh/sa5MTALFNaScwYsGVsXlE
	 EF973k+flVph55ugr0YBBn7uK/bM4csvatCnCxGFK0n8CO88zGHrO8Xp2ZGXoSAHo1
	 DeRsGoe7XV2+3dVR7Bv+xfdq1R5F2vLqPhQEDywY=
Date: Fri, 17 Apr 2026 09:15:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michael.riesch@collabora.com, anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	jai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH v1 03/11] media: v4l2-isp: Add helper function to compute
 extended stats size
Message-ID: <aeHd0G_JDaROMWDd@zed>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-4-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413160331.2611829-4-antoine.bouyer@nxp.com>

Hi Antoine

On Mon, Apr 13, 2026 at 06:03:23PM +0200, Antoine Bouyer wrote:
> v4l2-isp framework only supports extended buffer for generic ISP
> configuration. This patch adds simple helper function to compute the
> extended statistics buffer size, exactly the same as for extended
> parameters, except that it uses the `v4l2_isp_stats_block_header`
> structure definition to prevent conflict with the
> `v4l2_isp_params_block_header` one.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/media/v4l2-isp.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> index f3a6d0edcb24..9a93a534e7b0 100644
> --- a/include/media/v4l2-isp.h
> +++ b/include/media/v4l2-isp.h
> @@ -27,6 +27,19 @@ struct vb2_buffer;
>  #define v4l2_isp_params_buffer_size(max_params_size) \
>  	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
>
> +/**
> + * v4l2_isp_stats_buffer_size - Calculate size of v4l2_isp_stats_buffer
> + * @max_stats_size: The total size of the ISP statistic blocks
> + *
> + * Users of the v4l2 extensible statistics buffers will have differing sized data
> + * arrays depending on their specific ISP blocks. Drivers and userspace will need
> + * to be able to calculate the appropriate size of the struct to accommodate all
> + * ISP statistics blocks provided by the platform.
> + * This macro provides a convenient tool for the calculation.
> + */
> +#define v4l2_isp_stats_buffer_size(max_stats_size) \
> +	(offsetof(struct v4l2_isp_stats_buffer, data) + (max_stats_size))
> +

Should we do this or simply:

--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -15,17 +15,21 @@ struct device;
 struct vb2_buffer;

 /**
- * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
- * @max_params_size: The total size of the ISP configuration blocks
+ * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
+ * @max_size: The total size of the ISP configuration or statistics blocks
+ *
+ * Users of v4l2-isp will have differing sized data arrays for parameters and
+ * statistics, depending on their specific blocks. Drivers need to be able to
+ * calculate the appropriate size of the buffer to accommodate all ISP blocks
+ * supported by the platform. This macro provides a convenient tool for the
+ * calculation.
+ *
+ * The intended users of this function are drivers initializing the size
+ * of their metadata (parameters and statistics) buffers.
  *
- * Users of the v4l2 extensible parameters will have differing sized data arrays
- * depending on their specific parameter buffers. Drivers and userspace will
- * need to be able to calculate the appropriate size of the struct to
- * accommodate all ISP configuration blocks provided by the platform.
- * This macro provides a convenient tool for the calculation.
  */
-#define v4l2_isp_params_buffer_size(max_params_size) \
-       (offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
+#define v4l2_isp_buffer_size(max_size)                 \
+       (offsetof(struct v4l2_isp_buffer, data) + (max_size))

(I wrote this before noticing your patch :)

>  /**
>   * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
>   * @dev: the driver's device pointer
> --
> 2.51.0
>
