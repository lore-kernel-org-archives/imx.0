Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747D93093C1
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561213; cv=none; b=DfsnhMil6yNzoY5SgDjwKV8aQrsk+jMgVXQP1bmluXrpqmC+lQ8XX78C5LhGYrhGVqtdLp9Wxcz1uEJvCkW/WsCZx5E3v8L4KwobUYKANXJOqONFtlNxawaFdxb398j/oVbsZdniRA/sWRkEL/IVz+GlVD3lEC9kZX73ad5pqRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561213; c=relaxed/simple;
	bh=T+vUabHb8ThQm3gxYr+D+KCExN9uc73ymsd40v5RhWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ji/wCnGmdzDK94tjZEtryJOwkut+t5ZdVv+/Y9ynQ7kOA+bqAAcP14/WfzOcM8ZNp6/3xRPbw/a+sfhmN1vO6qfBoGbAzVJTrvBtqCa3Fux1u3vWoJfvTeFDsMe0ixppQmgNwxqmItlUadVMQTau7/L5HNe2iBYLIMu8AYBI3b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=ycKUYNnt; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="ycKUYNnt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so9593186a91.3
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784561210; x=1785166010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VTZ9zHl9OoQneFVX7eJwf/WovVc3pD60nK1eidpzDA=;
        b=ycKUYNntVDFIA2ehIYn/KPLBw6pinmolWNSrqsuA+V0X6jkRS6snpuP742Kt8Tm2Zr
         leFgQcewhZnQT26ovvG82yDVy7SDroUZTHLeZBDfBT4jmXQCQtIwWqffSuSOEDVqh8fO
         3xIKmB0xVTJvb9lb5Ml2J4/P91HP2KIhWvL+7x/jvjMm590o8/u5v5pV1VP4uWqCuekT
         Ncy4NsujyGqd1LQt2aaeuJxlDc9xKvPKBxHcLRHbPQstu70fcikaeP1NlMfIcU3RAgtc
         K4WHr3UykdoGMjguHGNccjoR2li2OE4QZkcq3j1vMoVvioVnhDD1hvZE6NNq21615lK/
         VZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561210; x=1785166010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3VTZ9zHl9OoQneFVX7eJwf/WovVc3pD60nK1eidpzDA=;
        b=S56tJSfI3LAHDySGJA/DAseC4YCvHeIbcz3wZnXTOzVOZCPeM5yocbm1KMEdSYRrSH
         1OWCS/DuuLgSKHwxdpm9nAr9DSvQnFIazoN4nnM54A4FKKCheod5x4/D+o49lgW73pof
         /hGdNZyu7yle5QDNF1A+PwYhBgogedb7hZmXOVWCP5REQJqEZk4M9UK1CqHKr+k2Vq1p
         jKQEBmfOYRXkeOFqrWUdgvLlpAOJd4sJ686XUqiqHO+b/7GDuOKY7YKpBCV2HAIe8wYH
         RNruTTfeHEkcQziBdkM6aU2lkf1zhhGnfLFPsUCqz5iwMWSQHOdh4hc1gDnUsoRrALfd
         l1eQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3i9qrkM+vxFltPCLDrFJLASdVRtaZf0OTw0aTps3s62n7lA9ttHwwDxHRahRQ03b3Kys=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi7y9LqWd/VYcVlxqieawdpzPJmuwNc6sbU/YhddPUDicihx+X
	odWDMxMW9ckY3nrd5WZpdyYgnDB9JHkiUQmzQgyAadDrxRq4Lez7CayBOhzxoswpIpk=
X-Gm-Gg: AR+sD137aSEbdF0VFWX9C0glptfuc8m+kjANuxaO8yRRA2x71UgzJFqofcghLqp1QOD
	rEuf27Er5A2csBuvNf6b5nF2PUMqLfLmNUXn2hJpXOAKC0O8hqeh656O3d0CjsqwD4VUQeVgawu
	19GWcsSprqzVCA0Yh/YXwrBljqwHTSU0ZhXEAQ+lX8Hf8w3ZGXvtfzqlts/79F4pfu6ha0nyQAg
	jBTkm/+OeAqThGe1Z1dnAWqDKpGTncItO7HCiY+JIuSRMWCRMZ3nl0xVPmCRW3dKar2XqWyGe5v
	lvftNElWLuhjOG1B1oz4jJ+g57xfQbKuStRTMr+pbraiD/Oyl0qM+WeLQbg3vhf4Vn1nu8/6vM1
	pLDAaWj+CDS50UDKkF0Z+/LjsUMZOuiHkJyvpi6n5Zfk6RQN0xLGb5w0Q0y8=
X-Received: by 2002:a17:90b:58b0:b0:38e:7239:b945 with SMTP id 98e67ed59e1d1-38e7239ba36mr4798636a91.21.1784561210391;
        Mon, 20 Jul 2026 08:26:50 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:55::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcd3fesm6080875a91.2.2026.07.20.08.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:26:49 -0700 (PDT)
Date: Mon, 20 Jul 2026 08:26:49 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 09/14] net: enetc: open-code
 enetc4_set_default_si_vlan_promisc()
Message-ID: <al4+OXBo7rVJiLb0@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-10-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-10-wei.fang@oss.nxp.com>

On Mon, Jul 20, 2026 at 09:43:11AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The function enetc4_set_default_si_vlan_promisc() is only called once,
> from enetc4_configure_port_si(). Open-code the loop at the call site
> and remove the single-use wrapper.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc4_pf.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> index 859b02f5170a..505e4abf6c37 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -307,17 +307,6 @@ static void enetc4_pf_set_si_vlan_promisc(struct enetc_hw *hw, int si, bool en)
>  	enetc_port_wr(hw, ENETC4_PSIPVMR, val);
>  }
>  
> -static void enetc4_set_default_si_vlan_promisc(struct enetc_pf *pf)
> -{
> -	struct enetc_hw *hw = &pf->si->hw;
> -	int num_si = pf->caps.num_vsi + 1;
> -	int i;
> -
> -	/* enforce VLAN promiscuous mode for all SIs */
> -	for (i = 0; i < num_si; i++)
> -		enetc4_pf_set_si_vlan_promisc(hw, i, true);
> -}
> -
>  /* Allocate the number of MSI-X vectors for per SI. */
>  static void enetc4_set_si_msix_num(struct enetc_pf *pf)
>  {
> @@ -361,7 +350,9 @@ static void enetc4_configure_port_si(struct enetc_pf *pf)
>  	/* Outer VLAN tag will be used for VLAN filtering */
>  	enetc_port_wr(hw, ENETC4_PSIVLANFMR, PSIVLANFMR_VS);
>  
> -	enetc4_set_default_si_vlan_promisc(pf);
> +	/* Enforce VLAN promiscuous mode for all SIs */
> +	for (int i = 0; i < pf->caps.num_vsi + 1; i++)
> +		enetc4_pf_set_si_vlan_promisc(hw, i, true);
>  
>  	/* Disable SI MAC multicast & unicast promiscuous */
>  	enetc_port_wr(hw, ENETC4_PSIPMMR, 0);

Reviewed-by: Joe Damato <joe@dama.to>
