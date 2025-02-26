Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85421C9EE
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 02:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537822; cv=none; b=bHcaozf029ZbMJLxoUF06a78kvfD3bu3Wx7Wdee1vX3+grYo9e0SHTnAoIA4pvwdY3lp9SNTxhdMnBRrf73N3wjsZY31+aLhVr9fsjJGSf9y8s07Fpnw8nZFmSUgPGPDOjPk3Kbs8s4MmchCkYMOEny7ApDw3+0i9yD8RY64BA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537822; c=relaxed/simple;
	bh=+QWYbR1IEqUHxYtc6gkd4YrIaQZcWJeKBo2yzavBrTU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBsd5MIFJwZQRSsskGAuunb77eJqCajK+0FIFfjDNC/SuUr1NQC3fRqUrQMoBbjWPygzJI4pS7EDkKs3FiAQfBb0xd46lVsln3BlPtvhg2hYSZvWUgKXRmVPgZQ2G1ES4e9mk9uEOthrjZA2oYs60kJwRc3CFGw5VXb6puo/x8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsD/GvIP; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsD/GvIP"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fe77285e12so1761049a91.1
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 18:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740537820; x=1741142620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09wSZxKgriakTOPJO9UMgX94JkvJeeXEmpJoFk0WInU=;
        b=bsD/GvIPLgQE2JrQIvCAlUrpfj6LR4651JDaci3I8FDd0owF76G/GSCMCEhVh0VbUx
         Dg1AUbfqIu2Yg9NNNJvd6YlnwjPa0tEVkbJgssvErWBbgM4T3SXUxko69wqRzFcFWXTC
         8iVum9UvFQT8Q31rjS3T3LhfPmZgj3BN2HMWwlHglk21O7GEciiVVSezzGJ9vu9YW/eE
         6ZOmf0DiqfI669HrxWWVjHNH3gEsIkVOoDk0rwi5A7014aorEzTwjDF/1lsmJLyuhJp5
         vszLpU5O/GNnYFn7ro9GL2x9G0HBveZpIosyUtbu4odhA0WgeB2JEhw2F/ORNlRKXthP
         BLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740537820; x=1741142620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09wSZxKgriakTOPJO9UMgX94JkvJeeXEmpJoFk0WInU=;
        b=fz1veT7VqKhbYt1ONw+xHnVKIrkKWDOr9+7T5qTZsrYDiEwGBb19dHGK2OOgI6hLwK
         xk0YBtAsv9+A49duL22cQYo7nAabHy6ctzCkAtGUZotBfAXNiEJ0iMXCq3slBlApC9Nd
         Tfoh2F8ekKmlrE5T6A0PYWwHAyPRdMpvpFMsWXG22BT6SAH50hf0GjZm530jQFrNLoeY
         z1G2DhLD2HbFMmpy3MKj1Dukc8sjG/ED6Gg9yrDWjEBzOStOJyDRXXB0ILVeszvT6Y91
         IuGG02w54/IRVuA1dCalbnjQ884BPGAjimQyHitLVFHNDTR+iBtHHpCHsfKBxjVYeZcy
         kiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4jVgGkfqoICqZVVf/cZb8cZUPiCMxPjCaHordUmtepVH2cgCyI5AZKsbzGw5tJGzbPG8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjTi1TaT9/YdDESSAVWVGlDXgUBu2MUTctRdZD3Ma/Edy42Ywr
	/uFk9BD/3k7kCeMh/TA52GgfyocMKL35e4yMMeBgLFSF2hAyxYIA
X-Gm-Gg: ASbGncvGvZY1MDBzRa0rb6e7mMzBvR04LwneOPK5WdqXHYuWQvE1tmHbZK5QOOn6jXj
	wYpRht4kLglUcK9iaAT5TqsdS9Z9HNOHIcH/MIept9Dtv5qWvsPLmD2T8uoEmL5zelXTYkiG5cD
	enfEAyZu23v79TARco4D1P1YORW4dRgoUjRGmlxlJkNTbLsKVsf/Fcv8fBod/2heli2XFFYXNxZ
	U8+KHDFepm1cmYOa+j0gx2lw/mv0eqdZmLiH4SiEwJB6LCDGinwQKex/jklhz8RRmw2qO2gIqvL
	G3o84RhqWcpCxqJNQE9TX/Q=
X-Google-Smtp-Source: AGHT+IHqWiTmKahLoNDEtQkn8Ysj7aO7VlP6FoYVWXaVQHY/r9/BHTTRDx4CPzCNopfHUXBmu0dRbg==
X-Received: by 2002:a17:90b:53c3:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2fe68adedc1mr8899627a91.13.1740537820375;
        Tue, 25 Feb 2025 18:43:40 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2b85sm326939a91.26.2025.02.25.18.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:43:40 -0800 (PST)
Date: Wed, 26 Feb 2025 10:43:26 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Emil
 Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Inochi Amaoto
 <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>,
 netdev@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni
 <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <treding@nvidia.com>, hailong.fan@siengine.com,
 2694439648@qq.com
Subject: Re: net: stmmac: weirdness in stmmac_hw_setup()
Message-ID: <20250226104326.0000766e@gmail.com>
In-Reply-To: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
References: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Feb 2025 16:17:43 +0000, "Russell King (Oracle)" wrote:

> While looking through the stmmac driver, I've come across some
> weirdness in stmmac_hw_setup() which looks completely barmy to me.
> 
> It seems that it follows the initialisation suggested by Synopsys
> (as best I can determine from the iMX8MP documentation), even going
> as far as to *enable* transmit and receive *before* the network
> device has been administratively brought up. stmmac_hw_setup() does
> this:
> 
>         /* Enable the MAC Rx/Tx */
>         stmmac_mac_set(priv, priv->ioaddr, true);
> 
> which sets the TE and RE bits in the MAC configuration register.
> 
> This means that if the network link is active, packets will start
> to be received and will be placed into the receive descriptors.
> 
> We won't transmit anything because we won't be placing packets in
> the transmit descriptors to be transmitted.
> 
> However, this in stmmac_hw_setup() is just wrong. Can it be deleted
> as per the below?
> Tested-by: Thierry Reding <treding@nvidia.com>
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index c2913f003fe6..d6e492f523f5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3493,9 +3493,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  		priv->hw->rx_csum = 0;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Set the HW DMA mode and the COE */
>  	stmmac_dma_operation_mode(priv);
>  

A better fix here:
https://lore.kernel.org/all/tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com/

I can reproduce and confirm that patch works well.
I was going to leave a Tested-by: tag on that patch if everything looks good enough,
but the author (now copied) never come back.
