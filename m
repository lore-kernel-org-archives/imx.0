Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24F17F2
	for <imx@lists.linux.dev>; Mon, 10 Jul 2023 03:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437F3C433C8;
	Mon, 10 Jul 2023 03:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688960326;
	bh=lMGkb6vcjaJLddWMIbgP/aSewHMop7UBQMjE9P34SE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwtONS72051QwGae299V1XoWZ8cIDSJ2ALc8e0b+xRQC7BFtPDQR6GszTIpYdC3wI
	 wwkf/LhTv9su3bw2YXlTc89a2KDsQdlLfia9fahZ63mrCseWPMLdbmYpHVdE1xC/h1
	 WsTYv7NiJrd1dxOUKsdC8jG/q2nLR0SUfghA5vbxHvD4XTsZESvw+KXyugK3cl7Csn
	 MkVxkqPhz7VbQphERMLZ6b4Ns68Sy1mE5nYJgA64TmfB3UN97E2Lr8XT7goN30X9ZD
	 8IzNCs/Mnx86uL7neBTAcnsKpmnlshffLUSYl9cjCs6JPPyN4laJXoU5DyzFRHnehy
	 fRwDsorX8+W0A==
Date: Mon, 10 Jul 2023 11:38:34 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, andriy.shevchenko@linux.intel.com,
	gregkh@linuxfoundation.org, imx@lists.linux.dev, jgilab@gmail.com,
	jun.li@nxp.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, quic_eserrao@quicinc.com,
	quic_prashk@quicinc.com, r-gunasekaran@ti.com, rogerq@kernel.org
Subject: Re: [PATCH v2 2/2] usb: cdns3: fix incorrect calculation of
 ep_buf_size when more than one config
Message-ID: <20230710033834.GG2418446@nchen-desktop>
References: <20230707230015.494999-1-Frank.Li@nxp.com>
 <20230707230015.494999-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707230015.494999-2-Frank.Li@nxp.com>

On 23-07-07 19:00:15, Frank Li wrote:
> Previously, the cdns3_gadget_check_config() function in the cdns3 driver
> mistakenly calculated the ep_buf_size by considering only one
> configuration's endpoint information because "claimed" will be clear after
> call usb_gadget_check_config().
> 
> The fix involves checking the private flags EP_CLAIMED instead of relying
> on the "claimed" flag.
> 
> Fixes: dce49449e04f ("usb: cdns3: allocate TX FIFO size according to composite EP number")
> Reported-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index ccfaebca6faa..3326955f6991 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -2999,12 +2999,14 @@ static int cdns3_gadget_udc_stop(struct usb_gadget *gadget)
>  static int cdns3_gadget_check_config(struct usb_gadget *gadget)
>  {
>  	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> +	struct cdns3_endpoint *priv_ep;
>  	struct usb_ep *ep;
>  	int n_in = 0;
>  	int total;
>  
>  	list_for_each_entry(ep, &gadget->ep_list, ep_list) {
> -		if (ep->claimed && (ep->address & USB_DIR_IN))
> +		priv_ep = ep_to_cdns3_ep(ep);
> +		if ((priv_ep->flags & EP_CLAIMED) && (ep->address & USB_DIR_IN))
>  			n_in++;
>  	}

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen
