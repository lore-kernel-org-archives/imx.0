Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC09111B4
	for <imx@lists.linux.dev>; Wed, 17 May 2023 19:13:42 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso2011554a12.2
        for <imx@lists.linux.dev>; Wed, 17 May 2023 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684350821; x=1686942821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hBGOV+xb4ZcHxZg3IZGkJoN8ch8qmLgPuPV4NwuVrk=;
        b=AaNz5JsSY2tAKxSTmaZ6peJI+KpA/5X43slM/NJ6WvgT92PNVxReQuHLHsXDfl3nFX
         CRgVPY2jWoZ2z6TrEHkq+/xtkXTlTx+pud4HxQ29xtS7ks6SDKP78igmaK319xkHskDf
         1a68odDEz0u/2QyfDbd2vqajobqCVHjMfThnIhaUQmpUo879mrA7SI/8pHb5hW3yB0K7
         noCQB2h/m9RCcb3oUfKdC48B6tIbTKwe/ufMRPY/EvyM4Fvc+J1XdpXckB/2BPv6IPE4
         ScY9mcgLsB6L76zaF4W7d9VJrJsvFL3EusYvEkefazHxpv7Xl/IwVMN2kUNYVjg2DcX0
         BrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350821; x=1686942821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hBGOV+xb4ZcHxZg3IZGkJoN8ch8qmLgPuPV4NwuVrk=;
        b=UiK5TNEHuxsYCOqoov7XzAmVPJNwVfBCQ7MMtQOYUvFAQO9MK7cyj0FvGEn9Q1AFWD
         BJ06Fm+Kwn2R0rJsPsGswZH4vvQlmwp97NHiLVigkBdEivGX+IvcKeskFQTS0W9epJIu
         iqa3SB19xfgV2EP2dtf+Hu6YitxdRh65lCeQ/1paXjnlalgCC6FAmp2DdyxbF3yJFszG
         59YNsqFxpUBQ4Fy4g1TQ7t0aaX9BDQHH4h9dvgFILMWlhP8jK2oGrs7h1U8wNk2h8yY8
         sxL9U5T6AS/BBYdlVGAF/02U0wnloQmWQ5356Ure8ZLT4h4hquOuwZEQLUZmLdZePFCc
         RgYQ==
X-Gm-Message-State: AC+VfDzSx6483+CEL4bWZ7OUDtS2RmZe4+X4Y+nRWsEcc/2W3wjwJa6u
	k0IZc/xwB5vVatFgGyuBepo=
X-Google-Smtp-Source: ACHHUZ7oq/lcGcDHzJgiw84VEM0aXNbVqUIh1rFKDqm3dVWX9hG4CBdwEwyHqnZkELF8bi2wQEaqBw==
X-Received: by 2002:a17:906:58cd:b0:966:350f:f42d with SMTP id e13-20020a17090658cd00b00966350ff42dmr39886628ejs.23.1684350820922;
        Wed, 17 May 2023 12:13:40 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9170:3300:a570:a3fb:632c:5702? (dynamic-2a02-3100-9170-3300-a570-a3fb-632c-5702.310.pool.telefonica.de. [2a02:3100:9170:3300:a570:a3fb:632c:5702])
        by smtp.googlemail.com with ESMTPSA id gv15-20020a1709072bcf00b0095337c5da35sm12929385ejc.15.2023.05.17.12.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:13:40 -0700 (PDT)
Message-ID: <8b06972b-026a-155a-1473-ab72f72828d5@gmail.com>
Date: Wed, 17 May 2023 21:13:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 net] net: fec: add wmb to ensure correct descriptor
 values
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 netdev@vger.kernel.org, imx@lists.linux.dev
References: <20230517161502.1862260-1-shenwei.wang@nxp.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230517161502.1862260-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2023 18:15, Shenwei Wang wrote:
> Two wmb() are added in the XDP TX path to ensure proper ordering of
> descriptor and buffer updates:
> 1. A wmb() is added after updating the last BD to make sure
>    the updates to rest of the descriptor are visible before
>    transferring ownership to FEC.
> 2. A wmb() is also added after updating the tx_skbuff and bdp
>    to ensure these updates are visible before updating txq->bd.cur.
> 3. Start the xmit of the frame immediately right after configuring the
>    tx descriptor.
> 
> Fixes: 6d6b39f180b8 ("net: fec: add initial XDP support")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  v2:
>   - update the inline comments for 2nd wmb per Wei Fang's review.
> 
>  drivers/net/ethernet/freescale/fec_main.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index 6d0b46c76924..d210e67a188b 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -3834,6 +3834,11 @@ static int fec_enet_txq_xmit_frame(struct fec_enet_private *fep,
>  	index = fec_enet_get_bd_index(last_bdp, &txq->bd);
>  	txq->tx_skbuff[index] = NULL;
> 
> +	/* Make sure the updates to rest of the descriptor are performed before
> +	 * transferring ownership.
> +	 */
> +	wmb();
> +
>  	/* Send it on its way.  Tell FEC it's ready, interrupt when done,
>  	 * it's the last BD of the frame, and to put the CRC on the end.
>  	 */
> @@ -3843,8 +3848,14 @@ static int fec_enet_txq_xmit_frame(struct fec_enet_private *fep,
>  	/* If this was the last BD in the ring, start at the beginning again. */
>  	bdp = fec_enet_get_nextdesc(last_bdp, &txq->bd);
> 
> +	/* Make sure the update to bdp are performed before txq->bd.cur. */
> +	wmb();
> +

Do you really need wmb() here or would a more light-weight smp_wmb() or
dma_wmb() be sufficient?

>  	txq->bd.cur = bdp;
> 
> +	/* Trigger transmission start */
> +	writel(0, txq->bd.reg_desc_active);
> +
>  	return 0;
>  }
> 
> @@ -3873,12 +3884,6 @@ static int fec_enet_xdp_xmit(struct net_device *dev,
>  		sent_frames++;
>  	}
> 
> -	/* Make sure the update to bdp and tx_skbuff are performed. */
> -	wmb();
> -
> -	/* Trigger transmission start */
> -	writel(0, txq->bd.reg_desc_active);
> -
>  	__netif_tx_unlock(nq);
> 
>  	return sent_frames;
> --
> 2.34.1
> 
> 

