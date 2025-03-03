Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F35AD27
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994257; cv=none; b=aKMHEGUPHUQYL+e8tbhIvmjWKAWykQIJcXvc8UvCPxF1xUc3DdfgQDuatDYsF//ygXV4lYU8e0td0ZQO1gWJ5GVIKdEixGyYawVhlSnLBiArP96NUPRojz4OzhnCKELKZJTlqBM0SjgUcdKOuFWK3nP0wVBFlsUaQVwuR5W0fJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994257; c=relaxed/simple;
	bh=jLJKFq3DzDFZlX1XSnSbaeOdYYwfb/ehBF5/SPp1ssQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrhfmr6XmaYQMgFP1n/ZfIsy0vlX1+XBzGtCIF4EsThC9E5/W9yMXC/v+0Kc/psGFC91EzbJ0IA6CfxaIJoRQtrz3vAYyHKzu57zHzXDU6j3jnFTK4MdJwOSKgpGrOQXp0vM/6kL7NeTAs/xfFTk222HqwDxJ2I5MCZf8h2jhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coeO4nll; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coeO4nll"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so39658215e9.3
        for <imx@lists.linux.dev>; Mon, 03 Mar 2025 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740994254; x=1741599054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=40IljttzQ4D51zd6+tKieDE6wTjSWdKsG254DqLzf6A=;
        b=coeO4nllsPxjxk+ZtbGkmjQDoZZUKWih/l9Svk8JUPpKykE6H/wATmxi5vdGTPiUQI
         mctvCwcRDkWufBebmRqOmUaDEt6nVyyEAK1XhKTE0nEQoRA/Aw0zSaBs6jYU2eXM8lkY
         rVS6JnL3Rnxvabx19Pa33c9q+GMYL9lHlvS1U5zpXmtz33O+aIbfQFKI9cbonxA9r1tp
         TJRwvY3j0QcinS3BUJSxJXwhlSR8sSbHUL2+uundl+R0mw5UKe73S8OQivtQstl7VXvL
         PFaq4t0+6222VO7tvCG2A5vXXfXPHQ7MQZMqMtAVkB9ia7TMu+TrTu0P3lyuhhKj3JBH
         HkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994254; x=1741599054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40IljttzQ4D51zd6+tKieDE6wTjSWdKsG254DqLzf6A=;
        b=cigOSSEffDjxN7RNOtuF6Ao3R875GlrHn6gKdgJmMBECQHuoDM3Q0GCO/8SSZcbdO3
         zPo3Zvi3g4GZMG2ygDh0rHg6LXL7URJWACviPCgKAyfHde48sa8ECD9Z0aMni8XueshG
         OxdvKyRPxdPHUGRMXYBdFeMAGtqToNH/JAMRJR8uaZRRZmyFQzelog/2JUGDCdxqkm4H
         P2gAPz8KZAkPDzHHGGCelB33t6zcsJG7S76f/OWl87rO3O2Na1J562lVyQ27cru8PUQc
         EidkgcMSh35slhNwx9M2pVlvJszr0vxgjbqK2FuZX7HmAB3oR80ZAZOp8YQL5SAEbmM/
         Xckw==
X-Forwarded-Encrypted: i=1; AJvYcCX9k/fvdbdn2KxflQEYRCsRyNhhNcpWfp/Amrd6RlwHrK1Y90QpDlMqIsoQi8VSLqIIiX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTyIsyRTKLbgwZmQIiJjZ3CgZDkhYRbdFf2cWAGdGXCTbTknwi
	jI5gTAHcbP9suljywb0HXodTtLvxDfXu6c9Pvt+eXQIZkwQ6EskR
X-Gm-Gg: ASbGnctsS/t4XLb2Ept06mNd+ecYjIGKQIEYhKowEaBlyG7BmkIiRtKpeEgj/R+zYdf
	vcsLkgMy9Y0BLKBPhi8i58q85lN5U+BHd/s0UXPLUvz5eh/gpVBW8Q7wJhfzQGGLBaZDl3kiFpZ
	en+cDuTZqIsahtzyj6rPadzincrhTG6zuHQHcBfOpfFQ28fydV5OLCOapLJsLi9nuKK7YO+/4iE
	nNl1wEg4fi/NJHU2426RZpgLRlSg/Y9dzUK4Gkv+uDFmfnYhlZgS643txuTtnAh64L/kDL/Wc19
	KKpgjfUdTpuY2dv7DLk4eKjPmGVYm3fb0ZPP3+pXjL3v
X-Google-Smtp-Source: AGHT+IE593cTzA3Ll5VUo6n9spv8sl0rB5EmPJ7Oo0urGlRI3JU+kEeG6M0t/EplWSVuxhmvW3R3dg==
X-Received: by 2002:a05:600c:4444:b0:439:92ca:f01b with SMTP id 5b1f17b1804b1-43ba6708bd2mr103876125e9.13.1740994253402;
        Mon, 03 Mar 2025 01:30:53 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:4dab:10cc:7f02:7565])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710c2sm179671575e9.32.2025.03.03.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:30:52 -0800 (PST)
Date: Mon, 3 Mar 2025 10:30:51 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: vkoul@kernel.org, kishon@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	tharvey@gateworks.com, hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Message-ID: <Z8V2yzfYGirBFi1u@eichest-laptop>
References: <20250228103959.47419-1-eichest@gmail.com>
 <20250228103959.47419-2-eichest@gmail.com>
 <c965906ea8797385399534e974cabdba5564ae0f.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c965906ea8797385399534e974cabdba5564ae0f.camel@pengutronix.de>

Hi Philipp,

On Fri, Feb 28, 2025 at 01:38:11PM +0100, Philipp Zabel wrote:
> On Fr, 2025-02-28 at 11:38 +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Remove the switch statement and base perst release on whether it is
> > found in the device tree. The probe function fails without the reset
> > property, making it mandatory. Therefore, always release reset
> > independent of the variant.
> > 
> > This does not change the behavior of the driver but reduces driver
> > complexity and allows for easier future modifications.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > index e98361dcdeadf..00f957a42d9dc 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > @@ -141,15 +141,11 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
> >  			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
> >  	usleep_range(100, 200);
> >  
> > -	switch (imx8_phy->drvdata->variant) {
> > -	case IMX8MP:
> > +	if (imx8_phy->perst)
> 
> This check is not necessary, reset_control_deassert(NULL) is a no-op:
> 

Thanks for the feedback, I will remove the check in the next version.

Regards,
Stefan
