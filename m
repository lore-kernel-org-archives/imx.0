Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B87917F4
	for <imx@lists.linux.dev>; Sun,  4 Jun 2023 23:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D04C433D2;
	Sun,  4 Jun 2023 23:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685919790;
	bh=iPbuGYe8rpzHL1YGKa3u/A/CPeFx4uDskOZDGmB00Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMKzoP9HKCJrWXqSieDewUGBFwLeoLtdNTh5m2T9sYcS1Z6rI+RPQJgIW4ilsFdzA
	 PRzZVaj4znfzUZ80rLjuqY4tPaqB4bnTNfzaRt0x5UuT0Dil6zHR6diQ9GA2iurid5
	 Oa/K6JEjWQ6WXqI0iCQ8/MCvFdkjjO8bNut1NX0pOY8+mwZJDj7VwFrAgcjzG6enVy
	 wr5XREyCSBJUMy65Q4H/GxCOzN2bBbeQ0BNiWRkJx5m8BUM3YXRQwESA2n/kqozO8d
	 syJdMx1IRpxERzJoHVgjnbLmOrMu3/um9EcDjX4nNSKiXAIniS67jt+9TTyL44JeAh
	 UHY9gTRyQPmiw==
Date: Mon, 5 Jun 2023 07:03:01 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:CADENCE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] usb: cdns3: optimize OUT transfer by copying only
 actual received data
Message-ID: <20230604230301.GB258497@nchen-desktop>
References: <20230518204947.3770236-1-Frank.Li@nxp.com>
 <20230518204947.3770236-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518204947.3770236-2-Frank.Li@nxp.com>

On 23-05-18 16:49:46, Frank Li wrote:
> Previously, the entire length of the request, which is equal to or greater
> than the actual data, was dma synced and memcpy when using the bounce
> buffer. Actually only the actual data indicated by request->actual need be
> synced and copied.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index 09a0882a4e97..ea19253fd2d0 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -809,10 +809,10 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
>  		/* Make DMA buffer CPU accessible */
>  		dma_sync_single_for_cpu(priv_dev->sysdev,
>  			priv_req->aligned_buf->dma,
> -			priv_req->aligned_buf->size,
> +			request->actual,
>  			priv_req->aligned_buf->dir);
>  		memcpy(request->buf, priv_req->aligned_buf->buf,
> -		       request->length);
> +		       request->actual);
>  	}

Acked-by: Peter Chen <peter.chen@kernel.org>

>  
>  	priv_req->flags &= ~(REQUEST_PENDING | REQUEST_UNALIGNED);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
