Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50A4483AC
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 17:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568971; cv=none; b=NV8rHgTTA6F08Cq+5kT2EPsIriIGcS3LiMxp8qkRrFvX6tekVxCk6Dbk7iXexrWZkA17Nxha53VjCtd0Jd8IcZPA2pI3/oV0m1AOAehmO78eNRwxwRf6cB9vzIOgsFV8tHwglAFKJFTagapx2BdnHcERpb+7lyaRx3K5UN7Lcv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568971; c=relaxed/simple;
	bh=XvqjxVEYFtZM7+F4QxlCcaHs2r/6NKpbeEIcUhrpD3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fs7lnZZ4HbWOAJuY3TJr79hLZs34TwXntYpo4TVTubTssbMOzBEzMSgIgExvT88xxn+nJCEe+DULHL+Oc/2uzkAss3KzuveQS+iSFjB+zQSYvqpoIHhkQijt1ODjWcZZBZGuybAMqXGGcKyhJdmOD5Rlkw5EsQEcNeL1GJS/iNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=NCaYGbVe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="NCaYGbVe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf27856f9cso48571975ad.2
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 10:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784568964; x=1785173764; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgJoRNuplp6eZlFzlFIl9nminZilm44pZn8iwP92+o4=;
        b=NCaYGbVeGzu7i5AS8wXWiNO3c9Tvzs+yCoFde7Rn49b3oAgB6V0gq08S+hQIPwAVgU
         +zVcEEz4QY6gWGszDdC07zagwIJfGl4gZbhgiaSUtuO7qXv+FPZg+fjZfElOAFb2Tj9V
         A6rhwBLzelxRQv8W4hnpCcnRGO8GLcS/tQimRwA2OyNTyH9OrG75c1YKHIvl0sxjyrii
         tU+I3L6myh1ZjUsLFr5/LfRH+caavzqQ1/ozbkOi+eRaQ7n78II/vOY0Qiyh2NYN4Cem
         VdavbXW5MohiM2TRFS52+hCTw+n1ZOs4KG+9qyLuSeyZA/BwCiQYBz1Rp0a1ubMEbUNx
         Q2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568964; x=1785173764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bgJoRNuplp6eZlFzlFIl9nminZilm44pZn8iwP92+o4=;
        b=rkWQlE0ZQVku9FWhEK9wXEbB2a0mtR+BuvHaMPTbnlsRBZ/rcZhk5CBb6lruMfpmaZ
         ltjyBqE/i9CUsgRxF9iSBNOh/4f4yrjDRG+cN30N66WhheJpCZ23RdD1yRC7cSRWFc4G
         lkPCnRYCmLV91P8FWOa+6JL2NnSbzGZYfgC75sEaXbae7xyOXrP5wh4PwqOKL/8zcFLn
         CzSCB1pFXrD2a6LHJRrYFDZ39xxGbBwnJRyBxAca22aHGkFe+Evx0n02MspZBbG2OHY1
         EHXm34Vqevucvg9fL/GE3KCOV1U1i6bI38c1nAFFuJLda6cYSECc3SyNID6jTcaXEbbr
         aJxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoupCuo1m5LI8sUBFhkUq1m3WmoKrQXZzj+ahVeyrHmGZwH+2E4a/dkc2kiFoZlHBNhdNY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpgD1bI2riN1Nz2Kv46CnyWqCYfReQSpq81gkl4QJp3yamJN9R
	r2GccTLK7I7WIRbNsFSXB0bq4GWHzCLAZr4R/4ocSTLMBmU3caVDFdUVXINLJ+cVnpw=
X-Gm-Gg: AR+sD11bi23kxGtCiTRnL0PYaNvouWbp0naAT98Cuk/jJoa30WcMTmM18eFj/e21VdG
	DntwlNe3bQClcnLVXQ3213w/u0CAPXa3RkaNN3UqVka3V9c6OpJ8KJh8MblFqUNsByEY07Xsq0l
	b7rqqsJ92eA8bu/gXIiKrfnkOpPo5TmLXDDDlpMIyOxjfB06PSBXoA1tyubiSTnrhG7TddDYOwv
	zHwAKWX5pEZYDJaIAMUpaF8wpe0918GNDEIaXUPvi9o8OzS5b3p/eItaTp1Ty24kFvDs7Rsisjm
	NBZfD4l47bXETSaq901AYPh9TblOVnDPciWqzqAxmNk190mCqchCD2GzbMu5yFMsFD28aoxzEXr
	PktyRjjsCdS+w+wKuTs1N3TIsk/Tz2kDUhv7ZWHWa4htVEdLwCZu+2/R9jHU=
X-Received: by 2002:a17:903:986:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cf348193e8mr159265115ad.1.1784568964287;
        Mon, 20 Jul 2026 10:36:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3476f70esm60110235ad.77.2026.07.20.10.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:36:03 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:36:02 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 13/14] net: enetc: use
 alloc_etherdev_mqs() to create netdev for VF driver
Message-ID: <al5cgs6CqVKsy/gh@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-14-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-14-wei.fang@oss.nxp.com>

On Mon, Jul 20, 2026 at 09:43:15AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The VF driver uses alloc_etherdev_mq() with ENETC_MAX_NUM_TXQS as the
> queue count, which forces the TX and RX queue counts to be equal and
> uses a compile-time constant rather than the actual hardware capability.
> 
> After enetc_get_si_caps() is called, si->num_tx_rings and
> si->num_rx_rings reflect the actual number of rings assigned to the VF
> by the PF. For the ENETC VF on LS1028A and the upcoming i.MX95/94, their
> SoCs have no more than 6 CPUs, and the number of TX/RX rings allocated
> to the VF is less than 8.
> 
> Therefore, switch to alloc_etherdev_mqs() so that the TX and RX queue
> counts are set independently, each capped at ENETC_MAX_NUM_TXQS, based
> on the actual number of rings assigned to the VF by the PF.
> 
> Note that if future SoCs have more than 6 CPUs and more than 6 RX rings
> allocated to VFs, the size of the int_vector array in struct
> enetc_ndev_priv will need to be modified. Similarly, if more than 8 TX
> rings are allocated to each int_vector, ENETC_MAX_NUM_TXQS will also
> need to be modified.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc_vf.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> index 9cdb0a4d6baf..7dcb4a0246f5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -317,7 +317,14 @@ static int enetc_vf_probe(struct pci_dev *pdev,
>  
>  	enetc_get_si_caps(si);
>  
> -	ndev = alloc_etherdev_mq(sizeof(*priv), ENETC_MAX_NUM_TXQS);
> +	/* Currently, the supported SoCs have a max of 6 CPUs and the VFs
> +	 * have less than 6 RX/TX rings. So no issues for these supported
> +	 * SoCs, but for future SoCs which have more CPUs or more TX/RX
> +	 * rings, all the related logic needs to be improved.
> +	 */
> +	ndev = alloc_etherdev_mqs(sizeof(*priv),
> +				  min(si->num_tx_rings, ENETC_MAX_NUM_TXQS),
> +				  min(si->num_rx_rings, ENETC_MAX_NUM_TXQS));

Code looks right, but looks almost like a typo. I guess it would read nicer if
ENETC_MAX_NUM_RXQS existed?

That said:

Reviewed-by: Joe Damato <joe@dama.to>
