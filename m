Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85A4446EF
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567158; cv=none; b=Fid6O5uK+ZClV4PtjJnyXqFTuLgbhRvVg70xSLAk8mF/D/HlkK0Nv/jyVeL+ZZRU6PaRE6HGDNc3WJ/bBhBpj+IgPwhgWv7BAHGTPDW098JMUfxn1EJdMr56Cz84POGHtmGWT1l/3YMEmfE7a8Pyn2CU5uZJp+AHqNWcWvvokx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567158; c=relaxed/simple;
	bh=zOd4fmr8g7iB1tL/nkX4lZvsQbt/xhYZxfKsMTFQEBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzS7eIpmSIDjdKC7QjUkoa93nZ3uqXcwalvELWUCezRqX25fbYwYoU6mAc1dhKwh5Ti2eEGiegKzP6zgTDlkHrhDiOxBwMMzPjqf/2uXRXlSqGTOulhNt//ZIL1F9lSdbucb9O7CUZ3UHfk0UrQTmfNqqPXOCPGNfZwxMabnuIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mQOAoK3X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mQOAoK3X"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9725289;
	Mon, 20 Jul 2026 19:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784567091;
	bh=zOd4fmr8g7iB1tL/nkX4lZvsQbt/xhYZxfKsMTFQEBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQOAoK3X3q5Df3CvTO/taog4X044TnOODo1YS5I7eg5giG2TCmtE70JEtYUbfkVkg
	 YJvvvyyFmx8jCRRhE5mnlBs/IZwzhJsjT9JkRDMN+xti6Mqj58o30iX/zJuzmv3U0l
	 qgcN7CQGIj/e/kKnE9JOMte5YgKespXizEG8vBNU=
Date: Mon, 20 Jul 2026 20:05:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 2/2] media: nxp: imx8-isi: Add virtual channel support
Message-ID: <20260720170548.GC42426@killaraus.ideasonboard.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <20260521-isi_vc-v5-2-a38eb4fcd58e@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-isi_vc-v5-2-a38eb4fcd58e@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Thu, May 21, 2026 at 05:10:05PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI supports different numbers of virtual channels depending on the
> platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
> virtual channels. They are used in multiple camera use cases, such as
> surround view. Other platforms (such as i.MX8/MN/MP/ULP/91/93) don't
> support virtual channels, and the VC_ID bits are marked as read-only.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v5:
> - Return -EPIPE instead of -EINVAL for stream configuration errors
> - Clear VC_ID_1 after generic mask to follow generic-then-conditional order
> - Pass vc as function parameter instead of storing in pipe structure.
> - Drop get_frame_desc fallback as crossbar now implements the operation
> - Remove redundant num_entries check in mxc_isi_get_vc().
> - Set vc to 0 for M2M as it doesn't support virtual channels.
> 
> Changes in v4:
> - Fix VC boundary check: use num_vc (virtual channels count) instead of
>   num_channels (ISI pipelines count)
> - Set VC to 0 when frame descriptor has no entries
> - Move platform-specific comments to block style to fix line length warnings
> 
> Changes in v3:
> - Add num_vc field to platform data to indicate VC support
> - Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
> - Set VC_ID_1 only on platforms with num_vc > 4
> - Improve mxc_isi_get_vc() error handling
> - Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 ++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 17 +++++++-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 50 +++++++++++++++++++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 12 ++++--
>  6 files changed, 79 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 4bf8570e1b9e..837ac7046cf2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -318,6 +318,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.model			= MXC_ISI_IMX95,
>  	.num_ports		= 4,
>  	.num_channels		= 8,
> +	.num_vc			= 8,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> @@ -329,6 +330,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
>  	.num_channels		= 8,
> +	.num_vc			= 4,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_qm,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> @@ -340,6 +342,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  	.model			= MXC_ISI_IMX8QXP,
>  	.num_ports		= 5,
>  	.num_channels		= 6,
> +	.num_vc			= 4,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 14d63ec36416..2957119c81f2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -169,6 +169,7 @@ struct mxc_isi_plat_data {
>  	enum model model;
>  	unsigned int num_ports;
>  	unsigned int num_channels;
> +	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */
>  	unsigned int reg_offset;
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
> @@ -377,6 +378,7 @@ void mxc_isi_channel_unchain(struct mxc_isi_pipe *pipe);
>  
>  void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
>  			    enum mxc_isi_input_id input,
> +			    unsigned int vc,
>  			    const struct v4l2_area *in_size,
>  			    const struct v4l2_area *scale,
>  			    const struct v4l2_rect *crop,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 0187d4ab97e8..a98d7bec731d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -301,6 +301,7 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
>  
>  static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  					enum mxc_isi_input_id input,
> +					unsigned int vc,
>  					bool bypass)
>  {
>  	u32 val;
> @@ -312,6 +313,10 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
>  		 CHNL_CTRL_SRC_INPUT_MASK);
>  
> +	/* Clear the VC_ID_1 bit on platforms supporting more than 4 VCs. */
> +	if (pipe->isi->pdata->num_vc > 4)
> +		val &= ~CHNL_CTRL_VC_ID_1_MASK;
> +
>  	/*
>  	 * If no scaling or color space conversion is needed, bypass the
>  	 * channel.
> @@ -338,7 +343,14 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	} else {
>  		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
>  		val |= CHNL_CTRL_SRC_INPUT(input);
> -		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
> +		val |= CHNL_CTRL_MIPI_VC_ID(vc); /* FIXME: For CSI-2 only */
> +
> +		/*
> +		 * On platforms with more than 4 VCs (i.MX95), the VC ID is
> +		 * split across VC_ID_0 (bits 7:6) and VC_ID_1 (bit 16).
> +		 */
> +		if (pipe->isi->pdata->num_vc > 4)
> +			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
>  	}
>  
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
> @@ -348,6 +360,7 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  
>  void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
>  			    enum mxc_isi_input_id input,
> +			    unsigned int vc,
>  			    const struct v4l2_area *in_size,
>  			    const struct v4l2_area *scale,
>  			    const struct v4l2_rect *crop,
> @@ -374,7 +387,7 @@ void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
>  	mxc_isi_channel_set_panic_threshold(pipe);
>  
>  	/* Channel control */
> -	mxc_isi_channel_set_control(pipe, input, csc_bypass && scaler_bypass);
> +	mxc_isi_channel_set_control(pipe, input, vc, csc_bypass && scaler_bypass);
>  }
>  
>  void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index a39ad7a1ab18..291907ef44cb 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -144,7 +144,7 @@ static void mxc_isi_m2m_device_run(void *priv)
>  			.height = ctx->queues.cap.format.height,
>  		};
>  
> -		mxc_isi_channel_config(m2m->pipe, MXC_ISI_INPUT_MEM,
> +		mxc_isi_channel_config(m2m->pipe, MXC_ISI_INPUT_MEM, 0,
>  				       &in_size, &scale, &crop,
>  				       ctx->queues.out.info->encoding,
>  				       ctx->queues.cap.info->encoding);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..03e0115b5b5a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -232,6 +232,47 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mxc_isi_pipe, sd);
>  }
>  
> +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> +	struct device *dev = pipe->isi->dev;
> +	struct v4l2_mbus_frame_desc fd = { };
> +	unsigned int source_pad = xbar->num_sinks + pipe->id;
> +	unsigned int max_vc;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> +			       source_pad, &fd);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> +			source_pad);
> +		return ret;
> +	}
> +
> +	/* Find stream 0 in the frame descriptor */

	/* Find stream 0 in the frame descriptor. */

> +	for (i = 0; i < fd.num_entries; i++) {
> +		if (fd.entry[i].stream == 0)
> +			break;
> +	}
> +
> +	if (i == fd.num_entries) {
> +		dev_err(dev, "Failed to find stream from source frame desc\n");
> +		return -EPIPE;
> +	}
> +
> +	max_vc = pipe->isi->pdata->num_vc ? : 1;

Let's name this num_vc, as it's the number of supported virtual
channels, not the maximum VC identifier.

> +
> +	/* Check virtual channel range */

	/* Check virtual channel range. */

> +	if (fd.entry[i].bus.csi2.vc >= max_vc) {
> +		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
> +			fd.entry[i].bus.csi2.vc, max_vc - 1);
> +		return -EPIPE;
> +	}
> +
> +	return fd.entry[i].bus.csi2.vc;
> +}
> +
>  int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> @@ -244,6 +285,7 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  	struct v4l2_subdev *sd = &pipe->sd;
>  	struct v4l2_area in_size, scale;
>  	struct v4l2_rect crop;
> +	unsigned int vc;
>  	u32 input;
>  	int ret;
>  
> @@ -280,8 +322,14 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  
>  	v4l2_subdev_unlock_state(state);
>  
> +	ret = mxc_isi_get_vc(pipe);
> +	if (ret < 0)
> +		return ret;
> +
> +	vc = ret;
> +

As vc values are small, you make the variable an int, and write

	vc = mxc_isi_get_vc(pipe);
	if (vc < 0)
		return vc;

There's no need to send a new version for this, I can handle it when
applying your patches.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	/* Configure the ISI channel. */
> -	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
> +	mxc_isi_channel_config(pipe, input, vc, &in_size, &scale, &crop,
>  			       sink_info->encoding, src_info->encoding);
>  
>  	mxc_isi_channel_enable(pipe);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 1b65eccdf0da..e795f4daf3ff 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -6,6 +6,7 @@
>  #ifndef __IMX8_ISI_REGS_H__
>  #define __IMX8_ISI_REGS_H__
>  
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  
>  /* ISI Registers Define  */
> @@ -19,9 +20,14 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> -#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
> -#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
> -#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
> +/*
> + * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> + * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
> + */
> +#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
> +#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
> +#define CHNL_CTRL_VC_ID_1_MASK					BIT(16)
> +#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
>  #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
>  #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
>  #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

-- 
Regards,

Laurent Pinchart
