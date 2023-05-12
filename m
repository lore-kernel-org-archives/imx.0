Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DA31EA61
	for <imx@lists.linux.dev>; Fri, 12 May 2023 13:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683899843; x=1715435843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QwWE/tJlAPiCpmRXJUsvyc0KqZbQ5lpruaSv6RHumwg=;
  b=H4YUxyfk/id8hbZgWZrtpWbSwgoXLT/FkQgr3EEmHjCjFLTZ2dJ6cMyc
   rfKmlrFzTZsbdUYUBndxUI2u0PCtjbu88iQ7uS+KuDvCVSqgYRAKEsYVZ
   hKjrMAfprVZ9RW+3+SxLwehCByCwFTdT/4zWnfdgQvugxHYLwnCv7vcKJ
   u1yMs/4iiATJe7/RiXEyKadfr7Ius0sfn9k7UqXVJSJZbY+PAniuuzNHn
   IDLy8xgomK5rIlaHmYA441eOHXatKd8lnNYkWcax4OHeyUsAbc86UJtP0
   aK5AdnpGGu/6RvO7OzbROjcK4Hsu0qYKWbP0FGPVNisu6LU8x5PUL2ggc
   w==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="scan'208";a="210976329"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 06:57:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 06:57:14 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 06:57:14 -0700
Date: Fri, 12 May 2023 15:57:13 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
CC: Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
	<linux-imx@nxp.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Alexander Lobakin
	<alexandr.lobakin@intel.com>, Simon Horman <horms@kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>
Subject: Re: [PATCH net] net: fec: remove the xdp_return_frame when lack of
 tx BDs
Message-ID: <20230512135713.lwfpw4lzreece4rb@soft-dev3-1>
References: <20230512133843.1358661-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230512133843.1358661-1-shenwei.wang@nxp.com>

The 05/12/2023 08:38, Shenwei Wang wrote:
> 
> In the implementation, the sent_frame count does not increment when
> transmit errors occur. Therefore, bq_xmit_all() will take care of
> returning the XDP frames.

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> 
> Fixes: 26312c685ae0 ("net: fec: correct the counting of XDP sent frames")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/fec_main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index 42ec6ca3bf03..2a3e8b69b70a 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -3798,7 +3798,6 @@ static int fec_enet_txq_xmit_frame(struct fec_enet_private *fep,
>         entries_free = fec_enet_get_free_txdesc_num(txq);
>         if (entries_free < MAX_SKB_FRAGS + 1) {
>                 netdev_err(fep->netdev, "NOT enough BD for SG!\n");
> -               xdp_return_frame(frame);
>                 return NETDEV_TX_BUSY;
>         }
> 
> --
> 2.34.1
> 
> 

-- 
/Horatiu
