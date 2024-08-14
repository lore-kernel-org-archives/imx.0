Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2BA394
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723636123; cv=none; b=eDfKsNrjTp3/4uhHoVARUSL1rleY9p5fSiLh5M7rbDxVioEpi1YKgCtOcb0fot1S/N0bnUmTQE1MoOe2FmknSAAHiatROVHo/fz6uB5fRH8nXHpT50YqFnk77mU/8SHUOmkr1cYbr++yrBBeRJR7VyiL0MRKRtYnkCfzWPrss4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723636123; c=relaxed/simple;
	bh=6FEMLFRfGz73a6svfVUCeWfP48AbYS8/EIZFDx5OC8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKosbyE6X9LBV1O4zq3hPQEmaFSDZHqoQMSgOPb0EVyGW0sB/VgChdPasdf2kFc3GvAaLSVZ2hVM0R1g9+l9cG6rSFimQ2kB8bsA1iWx7VpJa1c37CuGVTKYNtcknXhvLy8nfbrYhbm5Ju7qNhfRGUtwdJKEsj78wjCe5sOejXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YHHaAECK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YHHaAECK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6BFC32786;
	Wed, 14 Aug 2024 11:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723636122;
	bh=6FEMLFRfGz73a6svfVUCeWfP48AbYS8/EIZFDx5OC8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHHaAECKPHu1U3HkLOmFJxe+9TGtTteF29ssivq99KFge0x+nJzt1IuUcLHH2yZpF
	 51C9mTEjX5BSLTmuHk2O0/0zJCSZuTDqpx/+Xe0m77pipPpB0++kPoVnIZ5Ewbx3Dt
	 JqqKeCzZSbdXqSlADEIaFNRIp0w9/pK91UdrRJLM=
Date: Wed, 14 Aug 2024 13:48:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	m.grzeschik@pengutronix.de, jun.li@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: uvc: queue pump work in uvcg_video_enable()
Message-ID: <2024081427-habitat-action-ebf6@gregkh>
References: <20240814112246.2608882-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814112246.2608882-1-xu.yang_2@nxp.com>

On Wed, Aug 14, 2024 at 07:22:46PM +0800, Xu Yang wrote:
> Since commit "6acba0345b68 usb:gadget:uvc Do not use worker thread to pump
> isoc usb requests", pump work could only be queued in uvc_video_complete()
> and uvc_v4l2_qbuf(). If VIDIOC_QBUF is executed before VIDIOC_STREAMON,
> we can only depend on uvc_video_complete() to queue pump work. However,
> this requires some free requests in req_ready list. If req_ready list is
> empty all the time, pump work will never be queued and video datas will
> never be pumped to usb controller. Actually, this situation could happen
> when run uvc-gadget with static image:
> 
> $ ./uvc-gadget -i 1080p.jpg uvc.0
> 
> When capture image from this device, the user app will always block there.
> 
> The issue is uvc driver has queued video buffer before streamon, but the
> req_ready list is empty all the time after streamon. This will queue pump
> work in uvcg_video_enable() to fill some request to req_ready list so the
> uvc device could work properly.
> 
> Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index d41f5f31dadd..a9edd60fbbf7 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -753,6 +753,7 @@ int uvcg_video_enable(struct uvc_video *video)
>  	video->req_int_count = 0;
>  
>  	uvc_video_ep_queue_initial_requests(video);
> +	queue_work(video->async_wq, &video->pump);
>  
>  	return ret;
>  }
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch was sent privately to Greg.  Kernel development is done in
  public, please always cc: a public mailing list with a patch
  submission.  Using the tool, scripts/get_maintainer.pl on the patch
  will tell you what mailing list to cc.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
