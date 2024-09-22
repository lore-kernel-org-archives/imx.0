Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EA2C1AC
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727043477; cv=none; b=pWAFqZltccTwm3jU8S2m+Kre0UOoOOjp69jzYNU1e8Emylz4lqRcURSAt+4Boh5M9TzIqmQnXdg4vWmclITcAy8fdFccWciJzTkACyKUot/NTQVAvLbSCcHW7EtzX72/vSgG7mLjqrIYPAXlUyZLoSEQBXU3Zihk5Ca1++X6Mv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727043477; c=relaxed/simple;
	bh=+VWjUNRxUp+RfG26z07hsVE/vm58zscjICTwSUp5dFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsZVyux8d/u24p44sBUdRdh/DgJpM9+l6LwpuqUfNLERmY+XZ87NmI0Od6T8WHnYqXgLrifxmcM+qlJgaQbDL7uAa/2rh17UuY4n0K+VKVu/f7A++uYPdO4kSIbyR/ghs9hhLBq9jFC6Pu5KhxLcscBGUreXE2n1SybNChIC0hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cszr3rds; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cszr3rds"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-536562739baso3467129e87.1
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727043473; x=1727648273; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T+z+sTMVisDVFfvjkFFbu8DDWbPGrFSf17/aPoR5w2s=;
        b=Cszr3rdsFiEirCSGCAxwFS0CuFqUC6ArOtldRjE5dDSlx+JHhbgxnkbQzgUIrV2ZGR
         xjoLXGgxEzv/9xPSMhon80gSGF7+l16QXM1NI7jWQQGZHt0huFmVpaBW13r2k3M2HuQZ
         W72dSkddtjQZz5KSo2M5F4RCLRYREsfpfessqVuDCvLOCTpLPAwM0/etPBmxJfq8zzwp
         qfAuH9Sbhs+dEV1iz4B0AstFhDJ1UcXR1JNIudoGAUWtTMrYxYWjYbs9iRQZ891/uxf3
         xPzclV2WKttdpToMA3cv+Vw63v2gQdo3bZhVH+cVoJ72wqm1mnXVsKnZV164Yni6Mdrb
         rkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727043473; x=1727648273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T+z+sTMVisDVFfvjkFFbu8DDWbPGrFSf17/aPoR5w2s=;
        b=DiVFneow3xabniH5sZTqjuYLxeNfV9f1Jb2gjkR8EZcqFY1gQsUbcEmAFNfhh5061C
         Eh5aub4zHFuw1nt0wOjb66YxZujm1864QfYsWid3lvYLd3SUc/3D0g4beynPd/AB35UD
         r/jcX6/nYjxW1uIm/znIhZTaT9X0PBoILP5ixUul8456x2hNPcujzgvwRK8CCLkIIjTU
         48XdOb3+fohFA9shAFqhhid/qFDLXpAd96zO1pSx5OsiKl4dyClMasDLaHrLdxXb2WqX
         AY9+keXtmTqqQuBwKN/O6E3g3DU1V7gqkW+AuNM0tDbw/uGyKmAJgqILPDl39BAz+Xp7
         UoUA==
X-Forwarded-Encrypted: i=1; AJvYcCVp0M+iry5Snznq6zdpS7qv1s6j63Xb2Yb8J9uDl1VUpDEoys9kzOHaoc5BDg/L1n3P62s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOjB0opS+nslnsm+YZYbnzsOgqTH+mbDeDVaYpevYx/WlFOI/7
	vJBOIvFL53k9JVjWKxvLqPpuilMmQqhJ38DrpEgixjtbV0WIOcDM
X-Google-Smtp-Source: AGHT+IHxU+MGElA+QsRzR7T/maHHhNlCIFzzXDBhrpK7Lmg8bAMOit3g7+vHOKt093dToxEIMGOyfQ==
X-Received: by 2002:a05:6512:158c:b0:534:36bf:b622 with SMTP id 2adb3069b0e04-536ac34649dmr4068777e87.61.1727043472449;
        Sun, 22 Sep 2024 15:17:52 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870966f6sm3081871e87.151.2024.09.22.15.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 15:17:51 -0700 (PDT)
Date: Mon, 23 Sep 2024 01:17:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, horms@kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>, 
	Chuah Kim Tatt <kim.tatt.chuah@intel.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v2 net] net: stmmac: dwmac4: extend timeout for VLAN Tag
 register busy bit check
Message-ID: <yzyezokrtcj5pnby4ak5lzrrnqu3y3k45kaibtklwrjn4ivzel@hwf6bgssykna>
References: <20240918193452.417115-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918193452.417115-1-shenwei.wang@nxp.com>

On Wed, Sep 18, 2024 at 02:34:52PM -0500, Shenwei Wang wrote:
> Increase the timeout for checking the busy bit of the VLAN Tag register
> from 10µs to 500ms. This change is necessary to accommodate scenarios
> where Energy Efficient Ethernet (EEE) is enabled.
> 
> Overnight testing revealed that when EEE is active, the busy bit can
> remain set for up to approximately 300ms. The new 500ms timeout provides
> a safety margin.
> 
> Fixes: ed64639bc1e0 ("net: stmmac: Add support for VLAN Rx filtering")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
> Changes in v2:
>  - replace the udelay with readl_poll_timeout per Simon's review.
> 
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index a1858f083eef..a0cfa2eaebb4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/ethtool.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
>  #include "dwmac4.h"
> @@ -471,7 +472,7 @@ static int dwmac4_write_vlan_filter(struct net_device *dev,
>  				    u8 index, u32 data)
>  {
>  	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> -	int i, timeout = 10;
> +	int ret, timeout = 500000; //500ms
>  	u32 val;
> 
>  	if (index >= hw->num_vlan)
> @@ -487,12 +488,11 @@ static int dwmac4_write_vlan_filter(struct net_device *dev,
> 
>  	writel(val, ioaddr + GMAC_VLAN_TAG);
> 
> -	for (i = 0; i < timeout; i++) {
> -		val = readl(ioaddr + GMAC_VLAN_TAG);
> -		if (!(val & GMAC_VLAN_TAG_CTRL_OB))
> -			return 0;
> -		udelay(1);
> -	}

> +	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> +				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> +				 1000, timeout);
> +	if (!ret)
> +		return 0;
> 
>  	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");

1. Just drop the timeout local variable and use the 500000 literal
directly. There is no point in such parametrization especially you
have already added the delay as is.

2. A more traditional, readable and maintainable pattern is the
error-check statement after the call. So seeing you are changing this
part of the method anyway, let's convert it to:

+	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
+				 !(val & GMAC_VLAN_TAG_CTRL_OB),
+				 1000, timeout);
+	if (ret) {
+		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
+		return ret;
+	}
+
+	return 0;

-Serge(y)

> 
> --
> 2.34.1
> 
> 
