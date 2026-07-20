Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3D6426D00
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555342; cv=none; b=U5YHBOF2JcfzYlsctFdtu/TuhANqsEoknymbBGpnEtS4AS9sNijvHTomFG7BXqFGrHclSv39moIS5mGqw8Ow/aMggALBldRcgbJcQVtBaHbOiJkOKq+OdqO1olyHh5f3qHY04+33cKox5NuinhS1JKdQfsF7DlZPew0UJGlu7GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555342; c=relaxed/simple;
	bh=sHKsOvktHornLe+ZeU8u/20dX6bNatlr37qX8toUr58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgZpa4//K2WhXhPS8/SULhI6seYJNAD8xcF0TtLS2o92+vF5ZNLbN1E0DEjnWWMXns69wrhXVbQUhR10EA5fhOO3FyEzhBX9Iq/mI1CffLyCDaPQDw2ud92WVMPn3t3plZ6NzW7hq8eK+hq0aV46JeeMEGOpRXR93hQY9PQywIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=z3JctSVi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="z3JctSVi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848882fdb18so7329033b3a.0
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 06:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784555334; x=1785160134; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=exgSZUy4mQ+gBayEGCoSCzUgfoiRVrcGM1wITQ8aelo=;
        b=z3JctSViEoIOxjg/w8VyLNHSAaJJ1Y2/Y6NShaOqxdButhqUCi6/dp2vE3QqUeuEB0
         po/0WgjjcY+wJJeM+u0mkJgcQ7Pv2DTVXdkEl/AVhLfEgg/J0jz/t7XtzQ4DJJAt0eBT
         Ho0APkFR2+WhQHbVxFQnJJXhA+m5NAbVdbLDWIkytAixjcKcGO1je9mshoz4Zg+hW+pF
         MUWHr7lJsNGeHUcOFbFqskvW0mvkf4WaE7A7KP7mqy0XL8gj8ULgauFYEM1z3fjDMWZ4
         a85OEy1diJm96ngs6KBSmzN7ryglOjac05MWqisW3jOXX0H5AfaE/Zu+eYCQqjAhX5N1
         cmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784555334; x=1785160134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=exgSZUy4mQ+gBayEGCoSCzUgfoiRVrcGM1wITQ8aelo=;
        b=lFnJ5fVC4GnmZzObpAB8radQBnQ9SWhcGtlMOaNWHkVNbIpveAqWM17T+M24BFKJbq
         PYbLfVbEnf4HfpiAZ2CLdHLK8hDuMV1bTlpLDsriUBFy2s6/y7d0klCEQL0KBNa7xa23
         JiOE+dFa0DToOWK9zHHEdwslOShj+wjHQaDnDbmIRdP5k+xTxGCJo6yZKJtWY3L2kXOs
         9hou4rq68ihVMhPU/lqQdbsbOvOMos3nSa2cDqEey68ljefS3seuZFlLLEDlYHbnDKHD
         YuvjjZunrTuYh/aofAoYEMqgiztsSEUg1QC28ifjdnIgQhpNNnjyZBMi/CPlnh89kVoX
         d7WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2ww1G8SOqMyXO3lkl3UuuWVBrK8f0MqkgP85KxqORLl50+pEzLzvqTBz8DX+nBqoCpAQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCjnMEK/9k3MSWZWXV9wDB0DwZg2SwlJ/LIofX7wWHfj1QnzCf
	4ncCynfwus9+uU2iPtTEisxf0lhi5i0tX7w+HaMEeun1XT/I3QqKfPg9MK3IbpGXEqo=
X-Gm-Gg: AfdE7cldRW4xivoza+sxRTKkCi2ZsHKlebzqCM8cXlhk428d32E0sHoJWCUnaP/qV2b
	UZuh4B4mnkQ+91YQe/eNq7h/rOpbz4E+lda+bkZ2BSdWy+LbGmY3Lxm3Fc0YdJvW1zGkqJfVZy3
	edfk8AKDVPQbtSV2t+jJoX2FSLqlPhSwa4lw+pGPmd4gBQa0M8kQF5lIiYCdeB0xNsSLqLRd6/f
	ID896ygUiCnO5/RM/Uv7xS8n73I0ooJpY1upaE3GYrqD9Wb1Bqhx3o0Gr+mq+vyXs2HjbSiH5tF
	NnjbnO+K9Qwv8XGzjheD7I1bNU5/IFWmHJWLjcvbq8vUnQjzKIpy7OYHofC4wfQbvWzbBAQ49UB
	dPv9Q76Hm+uiNq30Ox9xx1ypL7VeJJjdxtYLD1NFVAk9qS5AYKMYuyCc=
X-Received: by 2002:a05:6a00:998:b0:845:eb73:411c with SMTP id d2e1a72fcca58-84c2946f027mr14586475b3a.45.1784555334640;
        Mon, 20 Jul 2026 06:48:54 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm5844378b3a.15.2026.07.20.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:48:53 -0700 (PDT)
Date: Mon, 20 Jul 2026 06:48:53 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 14/14] net: enetc: use kzalloc_flex()
 for enetc_psfp_gate allocation
Message-ID: <al4nRS6hB8siUx3f@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-15-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-15-wei.fang@oss.nxp.com>

On Mon, Jul 20, 2026 at 09:43:16AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> Replace the open-coded struct_size() + kzalloc() pattern with the
> kzalloc_flex() helper when allocating struct enetc_psfp_gate. This
> removes the intermediate entries_size local variable and makes the
> allocation site more concise.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc_qos.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> index 7b17bca24f26..2aa0fcaafcd2 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> @@ -1135,7 +1135,6 @@ static int enetc_psfp_parse_clsflower(struct enetc_ndev_priv *priv,
>  	struct flow_action_entry *entry;
>  	struct action_gate_entry *e;
>  	u8 sfi_overwrite = 0;
> -	int entries_size;
>  	int i, err;
>  
>  	if (f->common.chain_index >= priv->psfp_cap.max_streamid) {
> @@ -1242,8 +1241,7 @@ static int enetc_psfp_parse_clsflower(struct enetc_ndev_priv *priv,
>  		goto free_filter;
>  	}
>  
> -	entries_size = struct_size(sgi, entries, entryg->gate.num_entries);
> -	sgi = kzalloc(entries_size, GFP_KERNEL);
> +	sgi = kzalloc_flex(*sgi, entries, entryg->gate.num_entries);
>  	if (!sgi) {
>  		err = -ENOMEM;
>  		goto free_filter;

Reviewed-by: Joe Damato <joe@dama.to>
