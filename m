Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197F187C
	for <imx@lists.linux.dev>; Thu, 29 Jun 2023 03:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51F4C433C0;
	Thu, 29 Jun 2023 03:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688009001;
	bh=jPUDoa5cZUOVLW9fXcJjrHQ4e1B4ZzR+5PdHRs1Dzio=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VfRidV3ovcBlqprFPTQzhiyN6hq8PWpDbgXhFNU58toQVUOLqNeKHB40Vv+xw58Fd
	 a+J2LRnQRj/3ES1P0xPw7VpB810jbOXajlgRxlDRw5Gy+QoO6dZi+spC7fBWJgliXM
	 dW1YYR86KQgOPooV+VSkUU6NjdQJlDatxPYotyFrBZUrI6Em++lU9T8PjSL4QmKGk7
	 WuuUWm5yq8+Zdtt8N/SqpChNEc1aZ47Q0IRpFnp751NmE0/hNxHv8QGk5lm3xuNWCK
	 o+H10V2l51UJjUtHiL2Xwd/HcQX7IBEkoEn8MG3ARygL/kC14ketAVNxfTOo5kY1qv
	 9FrtNRY1nUpQg==
Message-ID: <42940cae-ce4f-577a-474b-f06b3b481e4e@kernel.org>
Date: Thu, 29 Jun 2023 08:53:14 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/1] usb: gadget: call usb_gadget_check_config() to verify
 UDC capability
To: Frank Li <Frank.Li@nxp.com>, r-gunasekaran@ti.com, imx@lists.linux.dev,
 jun.li@nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Elson Roy Serrao <quic_eserrao@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?B?SsOzIMOBZ2lsYSBCaXRzY2g=?= <jgilab@gmail.com>,
 Prashanth K <quic_prashk@quicinc.com>, Peter Chen <peter.chen@kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230628222437.3188441-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230628222437.3188441-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/06/2023 03:54, Frank Li wrote:
> The legacy gadget driver omitted calling usb_gadget_check_config()
> to ensure that the USB device controller (UDC) has adequate resources,
> including sufficient endpoint numbers and types, to support the given
> configuration.
> 
> Previously, usb_add_config() was solely invoked by the legacy gadget
> driver. Adds the necessary usb_gadget_check_config() after the bind()
> operation to fix the issue.

You have only fixed composite.c. Not all gadget drivers use composite.c
so it will be still broken for them.

Please also add default sane configuration in CDNS3 so it works even
if usb_gadget_check_config() is not invoked.

> 
> Fixes: dce49449e04f ("usb: cdns3: allocate TX FIFO size according to composite EP number")
> Reported-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/usb/gadget/composite.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 1b3489149e5e..dd9b90481b4c 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -1125,6 +1125,10 @@ int usb_add_config(struct usb_composite_dev *cdev,
>  		goto done;
>  
>  	status = bind(config);
> +
> +	if (status == 0)
> +		status = usb_gadget_check_config(cdev->gadget);
> +
>  	if (status < 0) {
>  		while (!list_empty(&config->functions)) {
>  			struct usb_function		*f;

-- 
cheers,
-roger
