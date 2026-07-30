Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEEA8472
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438124; cv=none; b=bH3anEoHW+kbIZAuQorZvDXt0LGr+ixEB69lnmrsQi9P5EaYvdCXmZMoSu8roYS0JzsMNutCWgXy99wjl8ShXsK42AIcrltzNj1NmMg9YXSdFgIYNV7skdFygfSGmy/OoU6PDpueIWO5x4SKUc+CHMGhWaa7fZVQ5BnVUh3WHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438124; c=relaxed/simple;
	bh=43NPLZJiAE+Fl7YyMBj57DN6qkuoJzSniTaG+gQAb/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bjqe6XNWdvbwv6GftptE6D45V8zOhCoShyeViXHh9vMf1tORi/s5sl5FIml0BfoVK1q5CAOyPGXGOF6imz4ACClPsHQ77NDYBrbe0Bf2Kbtg07Ty4yqjPWV0ePtFiBR3ZbPFYkVG6mxJff3BBlygMv3BRBP7svMr6DMgQ0o0dlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i5mfsll2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i5mfsll2"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F1EBBB;
	Thu, 30 Jul 2026 21:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785438054;
	bh=43NPLZJiAE+Fl7YyMBj57DN6qkuoJzSniTaG+gQAb/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5mfsll2qS/FoYWsSYYLA/GY95unoUAeROYwvfNn2xX28A1kTEVyItW/5S+eY4NIA
	 kjLkBbJUp65kBhkk43VVrXoMyKfcK0TmEysH5TD7H6SiL2ALhhi8S24i/UjI3Wnkmn
	 H/lUXYnhoxmYx3E8NkWQn8lEtvwN70fMTmr+k00c=
Date: Thu, 30 Jul 2026 22:01:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Message-ID: <20260730190158.GC1600813@killaraus.ideasonboard.com>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
 <20260728-isi-v5-2-1d22ab91602a@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-isi-v5-2-1d22ab91602a@oss.nxp.com>

Hi Guoniu,

On Tue, Jul 28, 2026 at 02:58:57PM +0800, Guoniu Zhou wrote:
> The ISI crossbar needs to properly enable multiple streams from different
> virtual channels on the same input pad. Currently only the first stream
> gets enabled in hardware, subsequent streams are silently ignored.
> 
> The driver uses a single enable_count per input to track the input state.
> When enable_count is non-zero, the code assumes the input is already active
> and skips calling v4l2_subdev_enable_streams() for additional streams:
> 
>   Call 1: enable_streams(stream 0)
>     -> enable_count == 0, enable gasket and stream 0 in hardware
>     -> enable_count = 1
> 
>   Call 2: enable_streams(stream 1)
>     -> enable_count == 1, skip hardware enable
>     -> enable_count = 2
>     -> stream 1 never gets enabled
> 
> Similarly on disable, when enable_count reaches zero, ALL streams are
> disabled regardless of which streams are actually still active.
> 
> Implement per-stream state tracking by storing the input index and stream
> mask in the mxc_isi_pipe structure. On enable, record which input and
> stream the pipe is receiving. On disable, clear the pipe's record and
> check if any other pipe is still using the same input stream before
> actually disabling it.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v4:
> - Make enable/disable symmetric by checking stream_in_use
> - Add mxc_isi_crossbar_stream_in_use() helper for both paths
> 
> Changes in v3:
> - Change from "Fix" to "Implement" as multi-stream support is for newer
>   SoCs not present when the driver was merged (Laurent)
> - Remove Fixes and Cc: stable tags (Laurent)
> - Store input/input_stream in mxc_isi_pipe instead of using per-stream
>   counters array, avoiding arbitrary 64-entry limit (Laurent)
> - Use UINT_MAX to mark pipe as inactive to distinguish from valid pad 0
> 
> Changes in v2:
> - Use fixed-size array for enabled_count instead of dynamic allocation
> - Use BIT_ULL() macro for u64 bitmask operations
> - Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
> - Remove mxc_isi_stream_counters_alloc/free functions
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  5 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 84 ++++++++++++++++------
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 +
>  3 files changed, 67 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 9bb4d430d15e..c07abdd6a1f0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -186,7 +186,7 @@ struct mxc_isi_dma_buffer {
>  };
>  
>  struct mxc_isi_input {
> -	unsigned int			enable_count;
> +	u64				enabled_streams;
>  };
>  
>  struct mxc_isi_crossbar {
> @@ -259,6 +259,9 @@ struct mxc_isi_pipe {
>  	u8				acquired_res;
>  	u8				chained_res;
>  	bool				chained;
> +
> +	unsigned int			input;

Let's document what this is.

	/*
	 * Stream on the connected crossbar input, expressed as a bitmask. Zero
	 * when the pipeline is disabled, only one bit set when the pipeline is
	 * enabled (as each pipeline processes a single stream).
	 */
> +	u64				input_stream;
>  };
>  
>  struct mxc_isi_m2m {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 9db9c6e55c2c..eacc3bb28f9c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -330,11 +330,26 @@ static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  	return __mxc_isi_crossbar_set_routing(sd, state, routing);
>  }
>  

Let's record a bit of context here, to avoid forgetting while we can
compare the sink_streams bitmask argument to pipe->input_stream with the
equality operator.

/*
 * Check if a stream on a sink pad is in used by any of the ISI pipelines. The
 * sink_streams argument is a bitmask that must have a single bit set (enforced
 * by mxc_isi_crossbar_xlate_streams() translating the single stream mask of the
 * pipeline to a single stream on the crossbar input side).
 */

> +static bool mxc_isi_crossbar_stream_in_use(struct mxc_isi_crossbar *xbar,
> +					   unsigned int sink_pad, u64 sink_streams)
> +{
> +	for (unsigned int i = 0; i < xbar->isi->pdata->num_channels; ++i) {
> +		struct mxc_isi_pipe *pipe = &xbar->isi->pipes[i];

You can make this const, and the xbar argument to the function too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll make those changes when applying, so there's no need to resubmit.

> +
> +		if (pipe->input == sink_pad &&
> +		    pipe->input_stream == sink_streams)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  					   struct v4l2_subdev_state *state,
>  					   u32 pad, u64 streams_mask)
>  {
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
>  	u64 sink_streams;
> @@ -351,29 +366,44 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  	input = &xbar->inputs[sink_pad];
>  
>  	/*
> -	 * TODO: Track per-stream enable counts to support multiplexed
> -	 * streams.
> +	 * Check if any other pipe already receives the same input stream.
> +	 * If so, just record this pipe's usage and return.
>  	 */
> -	if (!input->enable_count) {
> +	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams)) {
> +		pipe->input = sink_pad;
> +		pipe->input_stream = sink_streams;
> +		return 0;
> +	}
> +
> +	/* Enable the gasket when the first stream is enabled for this input. */
> +	if (!input->enabled_streams) {
>  		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
>  						     remote_pad, sink_pad);
>  		if (ret)
>  			return ret;
> +	}
>  
> -		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
> -						 sink_streams);
> -		if (ret) {
> -			dev_err(xbar->isi->dev,
> -				"failed to enable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> -			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> -			return ret;
> -		}
> +	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad, sink_streams);
> +	if (ret) {
> +		dev_err(xbar->isi->dev,
> +			"failed to enable streams 0x%llx on '%s':%u: %d\n",
> +			sink_streams, remote_sd->name, remote_pad, ret);
> +		goto err_gasket_disable;
>  	}
>  
> -	input->enable_count++;
> +	input->enabled_streams |= sink_streams;
> +
> +	/* Record the input and stream for this pipe. */
> +	pipe->input = sink_pad;
> +	pipe->input_stream = sink_streams;
>  
>  	return 0;
> +
> +err_gasket_disable:
> +	if (!input->enabled_streams)
> +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +
> +	return ret;
>  }
>  
>  static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
> @@ -381,6 +411,7 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>  					    u32 pad, u64 streams_mask)
>  {
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
>  	u64 sink_streams;
> @@ -396,18 +427,27 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>  
>  	input = &xbar->inputs[sink_pad];
>  
> -	input->enable_count--;
> +	/* Clear the input and stream for this pipe. */
> +	pipe->input = UINT_MAX;
> +	pipe->input_stream = 0;
>  
> -	if (!input->enable_count) {
> -		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
> -						  sink_streams);
> -		if (ret)
> -			dev_err(xbar->isi->dev,
> -				"failed to disable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> +	/*
> +	 * Check if any other pipe receives the same input stream. If so we
> +	 * can't disable it yet, so return immediately.
> +	 */
> +	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams))
> +		return 0;
> +
> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad, sink_streams);
> +	if (ret)
> +		dev_err(xbar->isi->dev,
> +			"failed to disable streams 0x%llx on '%s':%u: %d\n",
> +			sink_streams, remote_sd->name, remote_pad, ret);
> +
> +	input->enabled_streams &= ~sink_streams;
>  
> +	if (!input->enabled_streams)
>  		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> -	}
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index 16085f23bc0b..c0ec59856374 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -816,6 +816,7 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
>  	pipe->acquired_res = 0;
>  	pipe->chained_res = 0;
>  	pipe->chained = false;
> +	pipe->input = UINT_MAX;
>  
>  	sd = &pipe->sd;
>  	v4l2_subdev_init(sd, &mxc_isi_pipe_subdev_ops);

-- 
Regards,

Laurent Pinchart
