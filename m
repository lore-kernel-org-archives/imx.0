Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317733C0
	for <imx@lists.linux.dev>; Tue,  2 May 2023 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683059554; x=1714595554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sUTAVcZcBbhnLtROQFfVTP0OU46Nf/1sMr7JZtnbx38=;
  b=EJD4knm9pyor+ad5rW49p/SDAJz4xbE51IndRWzbtfmkh/5+sguk6Q5d
   o93qUNGbSXQLiTJiPWPTAUC7TgOsW1gVI6mboiQg+QNpU/XZcmYCKY6Ic
   YFRHxg1dV3lhqOFTsVRVIqhjIUvQA0vGQGnkdBiBxwJHwkApdoNG9H8AW
   1pw8X5Xlgb2owrs6h9tM1IfQRhCr101qVhebMwWxxcyvVGFXSIATHvlLu
   EyZjXvf9cIxizXnApQqkQmV4N+Lp4iBmhxIVGrC8odmhAeU5Q5F+iwfrG
   MUs4bTtjN05RniJdN2wKJOZhO/iOtO324wRGH8Zj0Rx1Qa4IQ7cVo/VMY
   w==;
X-IronPort-AV: E=Sophos;i="5.99,245,1677567600"; 
   d="scan'208";a="213347705"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 May 2023 13:31:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 2 May 2023 13:31:18 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 2 May 2023 13:31:18 -0700
Date: Tue, 2 May 2023 22:31:17 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
CC: Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
	<linux-imx@nxp.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Alexander Lobakin
	<alexandr.lobakin@intel.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>, Gagandeep Singh
	<g.singh@nxp.com>
Subject: Re: [PATCH 1/1] net: fec: enable the XDP_TX support
Message-ID: <20230502203117.2hwozz2azlvu6h4d@soft-dev3-1>
References: <20230502193219.673637-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230502193219.673637-1-shenwei.wang@nxp.com>

The 05/02/2023 14:32, Shenwei Wang wrote:

Hi Shenwei,

> 
> Enable the XDP_TX path and correct the return value of the xmit function.

I think this patch should be split in 2. One that adds support for
XDP_TX which needs to go in net-next, and one where you fix the
return value of the function 'fec_enect_xdp_xmit' which needs to
go in net.
Other than that it looks fine, just a small comment bellow.

> 
> If any individual frame cannot transmit due to lack of BD entries, the
> function would still return success for sending all frames. This results
> in prematurely indicating frames were sent when they were actually dropped.
> 
> The patch resolves the issue by ensureing the return value properly
> indicates the actual number of frames successfully transmitted, rather than
> potentially reporting success for all frames when some could not transmit.
> 
> Fixes: 6d6b39f180b8 ("net: fec: add initial XDP support")
> Signed-off-by: Gagandeep Singh <g.singh@nxp.com>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/fec_main.c | 27 ++++++++++++++++-------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index 160c1b3525f5..dfc1bcc9a8db 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -75,6 +75,10 @@
> 
>  static void set_multicast_list(struct net_device *ndev);
>  static void fec_enet_itr_coal_set(struct net_device *ndev);
> +static int fec_enet_xdp_xmit(struct net_device *dev,
> +                            int num_frames,
> +                            struct xdp_frame **frames,
> +                            u32 flags);

Sometimes, I received comments at my patches not to have forward
declaration of the functions.

> 
>  #define DRIVER_NAME    "fec"
> 
> @@ -1517,6 +1521,7 @@ fec_enet_run_xdp(struct fec_enet_private *fep, struct bpf_prog *prog,
>  {
>         unsigned int sync, len = xdp->data_end - xdp->data;
>         u32 ret = FEC_ENET_XDP_PASS;
> +       struct xdp_frame *xdp_frame;
>         struct page *page;
>         int err;
>         u32 act;
> @@ -1545,11 +1550,12 @@ fec_enet_run_xdp(struct fec_enet_private *fep, struct bpf_prog *prog,
>                 }
>                 break;
> 
> -       default:
> -               bpf_warn_invalid_xdp_action(fep->netdev, prog, act);
> -               fallthrough;
> -
>         case XDP_TX:
> +               xdp_frame = xdp_convert_buff_to_frame(xdp);
> +               ret = fec_enet_xdp_xmit(fep->netdev, 1, &xdp_frame, 0);
> +               break;
> +
> +       default:
>                 bpf_warn_invalid_xdp_action(fep->netdev, prog, act);
>                 fallthrough;
> 
> @@ -3798,7 +3804,8 @@ static int fec_enet_txq_xmit_frame(struct fec_enet_private *fep,
>         entries_free = fec_enet_get_free_txdesc_num(txq);
>         if (entries_free < MAX_SKB_FRAGS + 1) {
>                 netdev_err(fep->netdev, "NOT enough BD for SG!\n");
> -               return NETDEV_TX_OK;
> +               xdp_return_frame(frame);
> 
>         struct fec_enet_private *fep = netdev_priv(dev);
>         struct fec_enet_priv_tx_q *txq;
>         int cpu = smp_processor_id();
> +       unsigned int sent_frames = 0;
>         struct netdev_queue *nq;
>         unsigned int queue;
>         int i;
> @@ -3866,8 +3874,11 @@ static int fec_enet_xdp_xmit(struct net_device *dev,
> 
>         __netif_tx_lock(nq, cpu);
> 
> -       for (i = 0; i < num_frames; i++)
> -               fec_enet_txq_xmit_frame(fep, txq, frames[i]);
> +       for (i = 0; i < num_frames; i++) {
> +               if (fec_enet_txq_xmit_frame(fep, txq, frames[i]) != 0)
> +                       break;
> +               sent_frames++;
> +       }
> 
>         /* Make sure the update to bdp and tx_skbuff are performed. */
>         wmb();
> @@ -3877,7 +3888,7 @@ static int fec_enet_xdp_xmit(struct net_device *dev,
> 
>         __netif_tx_unlock(nq);
> 
> -       return num_frames;
> +       return sent_frames;
>  }
> 
>  static const struct net_device_ops fec_netdev_ops = {
> --
> 2.34.1
> 

-- 
/Horatiu
