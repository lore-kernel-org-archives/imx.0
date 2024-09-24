Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B2986250
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163012; cv=none; b=AfUaaQVQjTsF/ZSXCE8t4KdEilijlwaSXYRz6hcIMMLzJDpzgsR48EStw/JEEauEaadJPV681RCjl06mZ68VSaURFh1CHcJ+0E4kIttlwS6ijvBVMp8Z0xiE5I9JBW+IZgf+fmkWyB14CQpzYHkQXv0Ch2T419twQp8oaLf/5NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163012; c=relaxed/simple;
	bh=+Jnrcxm70XtnYxuo7Zg2dly3Q5LywYfWNjpqdnAaQ6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGU+n5RXhPyz1brarFL7WOTdQmAx5FQT7iY/Gb/OWj9Y57VZ4NcK3eXMzevYGBrGaNU+PU1WQjLUBtgLt4QaORS9Y2we47e8K3lXiD9o+aZJgfRvNr6J9Vzl9mPeH76qqBhALGAYXlMPLvcxzj1vy7uUe2vj+esriwixDJFDBW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sxyx9XXn; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sxyx9XXn"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so54110401fa.0
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727163009; x=1727767809; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nJQRM8OcQBfhzuEe8sQ5z7UNmwmAz6ULuryZyUF/+cE=;
        b=Sxyx9XXnEZwCyomgFVvgeT5LY+Li5AyaxIl4DZ+VWfR+kcyLQVDJ1RXWqqBkotQLWE
         CHyTWhTKIepV0QywiLysSPI+tIkWbM6wwkjl5G98BgG7n2ltQZVYBYqQ0y0uH5k7K5l5
         9e6mrmcAoVqr8jrPqXiUp4kgIXjP+OP3PGOuVv0jbjPG5Xzmq8ZBCHZ5WXo++Ro4AIxY
         mYi1Xk4MwfAEqyhJDjsRmFekXgAoBMjU7vwg/0cSaiSA1xDGOJOvJNYowQX1gZeUpjeg
         jHH+owb76BgkDfEBlf4WcdOxD4deOAkNbn56GLNveVV5rP7EuhzKQGJUAXlBSThEv/b1
         BOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163009; x=1727767809;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJQRM8OcQBfhzuEe8sQ5z7UNmwmAz6ULuryZyUF/+cE=;
        b=BGer2MsrN96FIdWUPDITbf9p52QMnwFgxv3QEk5f7gnZ25QIPqK66kZBVFZ8mAYIJ7
         lmpY/7Qw/mZyNMsl4CC738B4ke+iRE2WkW5ilxbR+0bs+CP+j5Ue2x6DXUsRGzne6pLp
         M42pAzzTJjygFTasxhotfTDyr+K71ofw3RhKbiDiHFp524CCC24cFQtmRaDK6CQyfQTK
         LDyeI5G3wST5iQ5QcobD04yK2zOVV5PmwrOsDZ8uzMmDWZua9EaLxa1aLOB/CwJit2ol
         ocCWHm63bouqL/jVe5/0GHVF4BymIRfiqHSfarRj0frNYsF/X71HaozBHTObppCPDgu7
         qodg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Fp0QgobqBHDDRCXt2K8uvTAzP+FtJd1Hj0G7Gun33mXVWtUbaJru3mwAbt58jdZTrco=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoMh+P6SYxS6xSrdfUyWEF2O2QOJ+iFrw/dzuNBGVpdYss8mn/
	pxBPX5522pB+8Egk9BN1j34d9du3CS7Nn/XGvGkAziFxZPQx0//D
X-Google-Smtp-Source: AGHT+IHiSe0OiPhFl7VaoeCUi1YflblepVekNSVUxtXk0ofVtVw4xElfai2k8GkrbEMVv8ANZMNY4g==
X-Received: by 2002:a05:651c:1989:b0:2f7:5239:5d9b with SMTP id 38308e7fff4ca-2f7cb2cfe22mr79571811fa.4.1727163008678;
        Tue, 24 Sep 2024 00:30:08 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d282fc44sm1323081fa.26.2024.09.24.00.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 00:30:08 -0700 (PDT)
Date: Tue, 24 Sep 2024 10:30:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, horms@kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>, 
	Chuah Kim Tatt <kim.tatt.chuah@intel.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-imx@nxp.com, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 net] net: stmmac: dwmac4: extend timeout for VLAN Tag
 register busy bit check
Message-ID: <fcu77iilcqssvcondsiwww3e2hlyfwq4ngodb4nomtqglptfwj@mphfr7hpcjsx>
References: <20240923202602.506066-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923202602.506066-1-shenwei.wang@nxp.com>

Hi Shenwei

On Mon, Sep 23, 2024 at 03:26:02PM -0500, Shenwei Wang wrote:
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
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Please note, you can't add the R-b tag without explicitly getting one
from the reviewer/maintainer/etc. Please read the chapter
"When to use Acked-by:, Cc:, and Co-developed-by:" in
Documentation/process/submitting-patches.rst

> ---
> Changes in V3:
>  - re-org the error-check flow per Serge's review.
> 
> Changes in v2:
>  - replace the udelay with readl_poll_timeout per Simon's review.
> 
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c  | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index a1858f083eef..0d27dd71b43e 100644
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
> +	int ret;
>  	u32 val;
> 
>  	if (index >= hw->num_vlan)
> @@ -487,16 +488,15 @@ static int dwmac4_write_vlan_filter(struct net_device *dev,
> 
>  	writel(val, ioaddr + GMAC_VLAN_TAG);
> 
> -	for (i = 0; i < timeout; i++) {
> -		val = readl(ioaddr + GMAC_VLAN_TAG);
> -		if (!(val & GMAC_VLAN_TAG_CTRL_OB))
> -			return 0;
> -		udelay(1);

> +	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> +				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> +				 1000, 500000); //Timeout 500ms

Please drop the comment at the end of the statement. First of all the
C++-style comments are discouraged to be used in the kernel code except
when in the block of the SPDX licence identifier, or when documenting
structs in headers. Secondly the tail-comments are discouraged either
(see Documentation/process/maintainer-tip.rst - yes, it's for
tip-tree, but the rule see informally applicable for the entire
kernel). Thirdly the comment is pointless here since the literal
500000 means exactly that.

-Serge(y)

> +	if (ret) {
> +		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +		return -EBUSY;
>  	}
> 
> -	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> -
> -	return -EBUSY;
> +	return 0;
>  }
> 
>  static int dwmac4_add_hw_vlan_rx_fltr(struct net_device *dev,
> --
> 2.34.1
> 
