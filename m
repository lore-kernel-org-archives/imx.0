Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE34917721
	for <imx@lists.linux.dev>; Tue, 11 Jun 2024 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718124333; cv=none; b=sNB03Vhr583lig0szAAJZU4ceiGto3sHzVHyD6MmaPwY7EDquv3/THcBb7F5cPeF/sLzLcn8Itwg+ezz3tttowk6dbsb1DEDZYbC1QTBiqHbsCMHV7zYTQ/Hydp5ZrlY27cXSjKDPbDvSYppfoSoPT/LUGp6WWOtHKHwY2kiE50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718124333; c=relaxed/simple;
	bh=2Bh/7FdcoRKuZHm/1cMaXHw/SlFeSlV4+dQAjyZVxpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfTv2n/Xedw05qcwdx+/FpAjOLPgdLH7/pu4EYucGbJ7uTcjHEV+Xpa6KjaUGhfgGW3YX0FaCyPZEJ9y3b+myoFUs1DUBYgG3x0ZCS0Ytm4jVdWaMnF+KesfwgTfwK8l4IxUcisKAEGJOtB7XAgOSxnSOKqlaaFgJjDJBX8wlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XV1u5c3y; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XV1u5c3y"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6e54287a719so1008524a12.1
        for <imx@lists.linux.dev>; Tue, 11 Jun 2024 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718124331; x=1718729131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gxh4vIrmKNIXaNnO4GUj7kMvMIp/Jmb4kSQsyNNbs0M=;
        b=XV1u5c3y/2q2i3cZ494pw2QdJ+FI3jRzRqenbW6qZsppdcJ1F3Gz2gZV/pNuwmdWBk
         rN59GXom9WmwlD5LwKthsDtpXbzMlDxOp8Pf7cBLON9gQSP843XjXXGyNqdjZ8fdUqm9
         6TvVX17zLH+hXdcN0PYY8PSP354tSwOxGvn5Aee9KiYI2PotHVZfWAJlw+TaAqguB5+R
         jyPNQyZDoFMT8y0bpnFtVVMDNiEyVw0JR3CJjNvEdEb6ohLMCalJbliPelcW9fAqUho9
         mrd21lvnfQJYtQl48lyZQxfA4U6r/KlUvHO5qJ8Qbd/Ketg6TqpuuGKmmPGq604RwPWC
         ySJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718124331; x=1718729131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gxh4vIrmKNIXaNnO4GUj7kMvMIp/Jmb4kSQsyNNbs0M=;
        b=W4mKZVPmbj6t0t/WHVpfGUWUjlQNTgQWhX/5nC77QBhnqTzKa1+mcm3TmJEq8iMPo+
         ffTSC1D9x4VfTh54jw6Cd2nX3wKeKf4rxuLC84pdo55lN+1tdGYN+W1lVqKpztSJtVtR
         gDsLDsjGBMeMXq5wfRaBSy7dLI4DTLhQPgtBMsBvicZPfxGCW3ThAy1Jr54R03fVrekI
         d2KyaQxVddQ4uLC4MQmU/dAT3dtmSAaG1dlp8QfZFhBJ/8PnYaSw8XowcYs68G8gVjKA
         gr3QJQ9JZRn8mXF2A0/Cieq3acPCQSn0VBgMmj4UdzibVX9r/QseJjFN2/k8ARJSQ7Ga
         okIA==
X-Forwarded-Encrypted: i=1; AJvYcCWD84L7ASx5eL6aRn80yYv58+rZvq9pTHCzrycvabUGElOTkrBC0zgkjSjsHIHCQoVV1cPTcnd3XhPMkYYOEMu6YkNX
X-Gm-Message-State: AOJu0YzqwunuyTFaPvNQvY+6Y7nJKCBbRydLeWMtVvFkIrEiZxotxELQ
	OwlBHNDslFRtu1/4y/hfq4xDTHhoB+b38su2cmY1fg7f55G+kgzgUdznJwcsz8A=
X-Google-Smtp-Source: AGHT+IH+FSYIcHzGX5O1UrgkGqxESmaE4sfiuSdN7cxUsK+Rn4rESv7cVAMHJ/TaGzdgKg0Ddd7uUA==
X-Received: by 2002:a17:90a:d588:b0:2c1:ea2e:20b2 with SMTP id 98e67ed59e1d1-2c2bcc6c9ddmr11095209a91.30.1718124331202;
        Tue, 11 Jun 2024 09:45:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:74af:2f2d:5f50:e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c32ba3d59fsm2219845a91.25.2024.06.11.09.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 09:45:30 -0700 (PDT)
Date: Tue, 11 Jun 2024 10:45:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Aleksandr Mishin <amishin@t-argos.ru>, imx@lists.linux.dev,
	lvc-project@linuxtesting.org, Shawn Guo <shawnguo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [lvc-project] [PATCH] remoteproc: imx_rproc: Adjust phandle
 parsing issue while remapping optional addresses in imx_rproc_addr_init()
Message-ID: <Zmh/J0hvTT1Jwvjc@p14s>
References: <20240606075204.12354-1-amishin@t-argos.ru>
 <ZmcuFRfjKRQG9OXI@p14s>
 <20240610-4fb504648421659114538a50-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610-4fb504648421659114538a50-pchelkin@ispras.ru>

On Mon, Jun 10, 2024 at 08:36:19PM +0300, Fedor Pchelkin wrote:
> On Mon, 10. Jun 10:47, Mathieu Poirier wrote:
> > On Thu, Jun 06, 2024 at 10:52:04AM +0300, Aleksandr Mishin wrote:
> > > In imx_rproc_addr_init() "nph = of_count_phandle_with_args()" just counts
> > > number of phandles. But phandles may be empty. So of_parse_phandle() in
> > > the parsing loop (0 < a < nph) may return NULL which is later dereferenced.
> > > Adjust this issue by adding NULL-return check.
> > > 
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > > 
> > > Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> > > Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 5a3fb902acc9..39eacd90af14 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -726,6 +726,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
> > >  		struct resource res;
> > >  
> > >  		node = of_parse_phandle(np, "memory-region", a);
> > > +		if (!node)
> > 
> > You're missing an "of_node_put()" before continuing.
> > 
> 
> The node is NULL in this case so of_node_put() is not needed..?

Oh yeah, doing a of_node_put() with a NULL value is are really good idea...

I will pickup this patch.

> 
> Btw, there is a "rsc-table" node->name check in the the end of the loop
> body. It was added recently with commit 5e4c1243071d ("remoteproc:
> imx_rproc: support remote cores booted before Linux Kernel"). Seems to me
> it forgot that of_node_put() is called way before that.
> 

I agree.

> Also commit 61afafe8b938 ("remoteproc: imx_rproc: Fix refcount leak in
> imx_rproc_addr_init") was dealing with the last of_node_put() call here
> but it's still not in the right place I'd say.
>

You mean becaue of node->name being used after the last of_node_put() or is
there something else?

Aleksandr - Can you send another patch for the above?

Thanks,
Mathieu

> > > +			continue;
> > >  		/* Not map vdevbuffer, vdevring region */
> > >  		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
> > >  			of_node_put(node);
> > > -- 
> > > 2.30.2
> > > 
> > > 
