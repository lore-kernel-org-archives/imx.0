Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BAE64D
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737174206; cv=none; b=e37C+tbOxjwojnI5YPWUExVVXP2N5pAv3XRUKLbT+jqzo13vPxff00O3T/xhHWRZiTm1tf4RQGcZrKy7Or5OzFzQZxMv4ba7VZ233C9g8P35Sdh3zBvCDtafDeo9TmrFlcRLJLzPObUVJS3RDnFbiMmOBsdD1pVu5NDtn0VtbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737174206; c=relaxed/simple;
	bh=NeofN6KhWIT0jxyaSz41wvwHQUJX+A2/SQUfAXGClqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOfXm4nQDXk1JHb8gykYNcfOdUF1kDKlaDi521a7TRr0/RrAJNLsvt0EZst5amH2/3yP4BkBaM5jDbYqYurSO+NRzmNg7FBh5UhyDJWBhuw1a+Y6reV6Qp77Dai3ytbH27rwn6WiwCty6ZkxJeLl1nvTlJfN3c9Pit1TCbzjAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCL/sKE1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCL/sKE1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so4016775a91.2
        for <imx@lists.linux.dev>; Fri, 17 Jan 2025 20:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737174204; x=1737779004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrEgKv/RzSsqg0Cj5XHgdcWXqMQrhaPKLNHBN4Zw3Is=;
        b=hCL/sKE11CYXlbwf2JLQFrtZSEdftJY63kSTlFOkVV2OOPultUiOmSh01lQnURmEZi
         geAeCTQlSI2EW2qsT/3c8HhZ9bRZ4LPWYUJF4sjsSyQXqwbxEtJX50pB2WnjzT0Sz2Dd
         gqAfPpsiXtWM5aNIScd/SnpZCcgnjzlHYwRiD6sjLIdsPnG6dXrNydatwczW1a9DRiNL
         eLLWBu+sDmZJfmwEW1kfqBfKyGMmOpi1mGehQdvhqQQL+ffxLWsL+4YFp3Nt/xnXvUGE
         lGPGWP5pUd0CFLM3j9dkjoBUpiKGlTTEPWDSc7qO1arRka2IjmXkpE6ieL9NofTD4fvA
         90bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737174204; x=1737779004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrEgKv/RzSsqg0Cj5XHgdcWXqMQrhaPKLNHBN4Zw3Is=;
        b=YpKn+SvVtnA+5hI0HvltS7UaV6r0wK+Dr/zzPd0Re6fMeq6zOc3MGuy+rn/Xsp+il9
         pPrcCAbH+NWvFSf5Fz1yGhRgT7aXvjkv/ZVrZgdwaTIUHhe5yIg/u2ugX7BYFSprKbxF
         MM5cNN3sni6qXxiRyu0Dtj+fpdEeu1w4hr5td8BfK1IzCun7aITCrr0A3VdYRvTTwlPP
         rGtumZqiMzhMTd6Nx4GfhXfzRJXOMHqhlaSHQfW5fT9tpOiexOciLcN1pbxz7KA0FrWb
         26OaAwn2DK8XvDON15sZJYl3DiTnOqqeZlGZk5gtt+hJcNhSO/YaPDok7OZIxwwGYhXK
         sDsA==
X-Forwarded-Encrypted: i=1; AJvYcCVaHi6PjiemRGCOK5hdUYhrKKhgOEZKfJxT/3MPEjDaeUwhmfLhkS3iU49nSAx6WMDKe8U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzE/F892tfSrQ2x3CZIqo2clKRjSkM6DmRiCtHAO2mn0pBLOKr
	za9OGW3S2WVLr2oFfrLFHTTyZCCQZZatRDOiAw3gXkwX7ndQl1ga
X-Gm-Gg: ASbGncs9B0aeLWKWSPOtkifNQZav3PwJUdV0+h2H15QgDfzL3s8F5MEFAvUJpUsTgSj
	Pso2jyQH8BZp1x4iOSiU9JMU7xl/Xa4It5Q9Jetxrvpls8tw3KmG5tkj8x6fTXzC/5gtNn+O2ny
	5Kg4ekrEohUcNeNEhBx9nFM9AuZu2Anpm7l0ojWnjenAW7EsVhNm4/LY7NzvaSL5DhhzFt1D38f
	Od/ED1K3urzDvi2GLdj3DK9nb6CwC65qMOQuuequzdWRzOpmJceN+Vf2ma6wL/W0nChS2Z7IA==
X-Google-Smtp-Source: AGHT+IHOd8JRhBB2mq2uKdHt8VHiT9/mXRr/WZQZIB/QzVAj0NfZN7ODodLX8M8LYV+V+vE05p4GBA==
X-Received: by 2002:a05:6a00:189a:b0:727:3ccc:25b0 with SMTP id d2e1a72fcca58-72dafa9b030mr8646672b3a.16.1737174203796;
        Fri, 17 Jan 2025 20:23:23 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba48eb8sm2859720b3a.136.2025.01.17.20.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 20:23:23 -0800 (PST)
Date: Sat, 18 Jan 2025 09:53:20 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: fec: implement TSO descriptor cleanup
Message-ID: <Z4ssuJQc0SClS5uF@HOME-PC>
References: <20250116130920.30984-1-dheeraj.linuxdev@gmail.com>
 <PAXPR04MB8510E1BAD3FDB59268138682881B2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510E1BAD3FDB59268138682881B2@PAXPR04MB8510.eurprd04.prod.outlook.com>

On Fri, Jan 17, 2025 at 02:47:33AM +0000, Wei Fang wrote:
> > Implement the TODO in fec_enet_txq_submit_tso() error path to properly
> > release buffer descriptors that were allocated during a failed TSO
> > operation. This prevents descriptor leaks when TSO operations fail
> > partway through.
> > 
> > The cleanup iterates from the starting descriptor to where the error
> > occurred, resetting the status and buffer address fields of each
> > descriptor.
> > 
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> > ---
> >  drivers/net/ethernet/freescale/fec_main.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/freescale/fec_main.c
> > b/drivers/net/ethernet/freescale/fec_main.c
> > index b2daed55bf6c..eff065010c9e 100644
> > --- a/drivers/net/ethernet/freescale/fec_main.c
> > +++ b/drivers/net/ethernet/freescale/fec_main.c
> > @@ -913,7 +913,18 @@ static int fec_enet_txq_submit_tso(struct
> > fec_enet_priv_tx_q *txq,
> >  	return 0;
> > 
> >  err_release:
> > -	/* TODO: Release all used data descriptors for TSO */
> > +	/* Release all used data descriptors for TSO */
> > +	struct bufdesc *tmp_bdp = txq->bd.cur;
> > +
> > +	while (tmp_bdp != bdp) {
> > +		tmp_bdp->cbd_sc = 0;
> > +		tmp_bdp->cbd_bufaddr = 0;
> > +		tmp_bdp->cbd_datlen = 0;
> > +		tmp_bdp = fec_enet_get_nextdesc(tmp_bdp, &txq->bd);
> > +	}
> 
> There is still some cleanup to do.
> 1. If bufdesc_ex is used, we also need to clear it, such as ebdp->cbd_esc.
> 2. The data buffers have been mapped in fec_enet_txq_put_data_tso(),
> I think we need to unmap them in the error path. But do not unmap
> the TSO header buff, which is a DMA memory. Actually it is not necessary
> for fec_enet_txq_put_hdr_tso() to call dma_map_single(). If you are
> interested, you can add a separate patch to remove dma_map_single()
> in fec_enet_txq_put_hdr_tso().
> 
> > +
> > +	dev_kfree_skb_any(skb);
> > +
> >  	return ret;
> >  }
> > 
> > --
> > 2.34.1
> 
Hello Simon and Fang,

Thank you you valuable feedback. I will incorporate the suggestions and 
send the updated patch.

-Dheeraj
