Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3121101C6
	for <imx@lists.linux.dev>; Mon, 10 Jul 2023 13:02:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36ABEL7K017773;
	Mon, 10 Jul 2023 06:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688987661;
	bh=lEG4EkiJoyjdNaLGVyxMsl1ogCUgIuEE4QUrYtNYdk0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CkqGTlT3bDjBbrBV/D5MdRgXwxvj0N2B8RB1xeYPX855NIOOr9GvSnTI7AqjPrtwc
	 fgueWR42oPr4DLxe3fle98IGtkztYxsZ3j85gX//dfc/5dmW0vmglCU2VJC25w704e
	 zb5xlGBY5MakSE25Zt3snqOl3nReFPMZrvwVop1Q=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36ABELtW023174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jul 2023 06:14:21 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jul 2023 06:14:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jul 2023 06:14:20 -0500
Received: from [172.24.227.83] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36ABEGYW089298;
	Mon, 10 Jul 2023 06:14:17 -0500
Message-ID: <dc2abecb-c3c6-0265-4352-89737b26de66@ti.com>
Date: Mon, 10 Jul 2023 16:44:16 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] usb: cdns3: fix incorrect calculation of
 ep_buf_size when more than one config
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>
CC: <Thinh.Nguyen@synopsys.com>, <andriy.shevchenko@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <imx@lists.linux.dev>,
        <jgilab@gmail.com>, <jun.li@nxp.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <peter.chen@kernel.org>,
        <quic_eserrao@quicinc.com>, <quic_prashk@quicinc.com>,
        <rogerq@kernel.org>
References: <20230707230015.494999-1-Frank.Li@nxp.com>
 <20230707230015.494999-2-Frank.Li@nxp.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230707230015.494999-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 7/8/23 4:30 AM, Frank Li wrote:
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
>  

Tested-by: Ravi Gunasekaran <r-gunasekaran@ti.com>

-- 
Regards,
Ravi
