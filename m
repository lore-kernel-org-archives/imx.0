Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81624328B42
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395397; cv=none; b=RhQjf6XNWe4P1H94YfFehZxt3Wl10JiuNXLTOsPutVPCZwWBQmePdcFqu6FEm3mI7nkj+Wi9Pw3EtR132GqBkQqtFyspT0oEj8KEkzssB6wD+AhE6TpOHiX7cqyvE3VQ78shb/DpxFZ6SXW1K3GcQs+k6z+Qiin6yvAQSYdkXOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395397; c=relaxed/simple;
	bh=6jpZjKarYEJycrttZRXjR637/qtxgdxfXkrX2Ex1vPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQlxmETvu5Tfm/hn4FFPZv/2JDslEJagEWOR59e7+SyCVFzGwkvkWfJXTKG7Ksp4LWik4UiMvvGb6VsRxmgeEZ8IALxVrDNiCWn4gaoziNIEGv2l+ts5EbzvSmFauS22SXiF0UhAckpyeNpTrH93PAkV0eAZ/FWvLtm4C77Ju2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2/EZ5is; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2/EZ5is"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-823f9f81da5so1268314b3a.1
        for <imx@lists.linux.dev>; Fri, 06 Feb 2026 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770395397; x=1771000197; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7fQkwk+wPXieg0NkOTWjKgPZp/IlTl5T8xOo7PjnBw=;
        b=g2/EZ5isT8Ig6JBX07j5FWn0+4YhB8AllLZqWzW2bHsfjmUUqwEw7VeI6btYXUBSsn
         LM9jmdgWBa9l9uGFLYxkHtCIyOYrJjpagS00GpXQ9HPzcQZzgM0h6SZL/w1p7F4PWeTh
         OKTS7hl9CmdqyDlnDbgybd41FSy5S0ahh9uu4LdAuAdwBewfuyMT+d2j0Y5AGk0at3hP
         KCUiIoHp/YMVQX/glRjCACzss4jqBR6LQCS2cHV1oIe25m8f6Wp4qMHyydUFzoPzDV4i
         CvaOOt4Ry79/rIeir5gk6/sFlARBpWoF5siAWpQvREW0BUQPqHakX9whsHSMLlrYn6lA
         jmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395397; x=1771000197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7fQkwk+wPXieg0NkOTWjKgPZp/IlTl5T8xOo7PjnBw=;
        b=Y4NKkOVsR3JY0bOQ94zWcSYedJd8U6E9mI2XzUkHP4mhYs4ffVjHj2AJ1q7tFJ/8r/
         MSGV9Q62dgiNcIpsWnaFM/y4Aj62pVmGklhuem9wOt1XL2doIggSRlLfV1LZJNc2J61b
         c7CyVq9zJpO+0N3YVZrBQTjry0CK6eJHr6HJlwUYcGJD78tsSmvBUp+jHLKsOt/hz606
         TXQg9kDy140Z7zShTCQ93lLAawXJYmu6Fr6YVExRauZHqdRBnvOrhzVFq30gjUBG+GBb
         lvKbMRn1UPdhk3S550f3C1cqbsgk2Hdxf3DnrZM5zDJKY5bWeTu14U3xQE4ZdeNo2OYs
         DpIA==
X-Forwarded-Encrypted: i=1; AJvYcCWaurhHk2i75GU5CK49H/VVZGNYc5xfc2MHR99pNJh4c4pa9WgKFf3RjvaCImauq1cgpVU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTrlyABVUm+X96ufqU9PPq0n0IkzjtWKpaXbK9a4XmzbxXIgXo
	btA+s7sYsnQU/KcngT4RB+Z9cgtQaXp+YQA0cdNLkiU2ZskzVV93SAvbBOJR7DGyQ+8=
X-Gm-Gg: AZuq6aKydnaAFBXDkkq7IPcT9zK0xW+MFyVHeczm3Xs0JbJKKl9GTrRcuetW2IqrPPI
	MQ/lZuT8l8FMqeUJ4QXQFQnpLZMi/YHGJmX4bz/zGeZPcUyrOUXxp6+f1s5OzOIANNQCQxJMc7f
	zGNcBlKO0BSEpzccGyY/craxFaZWi+oYAjb43LSguSheL2ME/VFwsGJAwuVbDNVvPFJzaLbHY1Q
	w4VOX9MrbX1yunEDnuA10A/92BaPfzseqLSlMkI1MCyuIkvd/xn8/ZDSJ98RCjuEbLEOrkMF4Vn
	wjV+o6QsLdlXj+OVd+bPJ/XpuIF6cYsGfYzuiXfwSkhnCg/2y+1NeYRPVoCzhuUz5c3lvJmlFbG
	u8A4NJZaMoccuCmZBWnAFM1Ds0+tHAE+j4s893nZkhTC3ukwzlYpLVtJBlNTMs721djuZWYeDa4
	PgAjceXziAf/vb
X-Received: by 2002:a05:6a00:37c4:b0:821:70e7:74ca with SMTP id d2e1a72fcca58-824417df29fmr2464858b3a.70.1770395396788;
        Fri, 06 Feb 2026 08:29:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fa3:e3b4:3597:587a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884959sm2603694b3a.32.2026.02.06.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:29:56 -0800 (PST)
Date: Fri, 6 Feb 2026 09:29:53 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Message-ID: <aYYXAa2Fj36XG4yQ@p14s>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXveV_Y1gT73JoK@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYXveV_Y1gT73JoK@stanley.mountain>

On Fri, Feb 06, 2026 at 04:41:13PM +0300, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> Hello Peng Fan,
> 
> Commit edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops
> for imx_rproc_dcfg") from Jan 9, 2026 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/remoteproc/imx_rproc.c:648 imx_rproc_prepare()
> 	warn: ignoring unreachable code.
> 
> drivers/remoteproc/imx_rproc.c
>     605 static int imx_rproc_prepare(struct rproc *rproc)
>     606 {
>     607         struct imx_rproc *priv = rproc->priv;
>     608         struct device_node *np = priv->dev->of_node;
>     609         struct rproc_mem_entry *mem;
>     610         int i = 0;
>     611         u32 da;
>     612 
>     613         /* Register associated reserved memory regions */
>     614         while (1) {
>     615                 int err;
>     616                 struct resource res;
>     617 
>     618                 err = of_reserved_mem_region_to_resource(np, i++, &res);
>     619                 if (err)
>     620                         return 0;
>     621 
>     622                 /*
>     623                  * Ignore the first memory region which will be used vdev buffer.
>     624                  * No need to do extra handlings, rproc_add_virtio_dev will handle it.
>     625                  */
>     626                 if (strstarts(res.name, "vdev0buffer"))
>     627                         continue;
>     628 
>     629                 if (strstarts(res.name, "rsc-table"))
>     630                         continue;
>     631 
>     632                 /* No need to translate pa to da, i.MX use same map */
>     633                 da = res.start;
>     634 
>     635                 /* Register memory region */
>     636                 mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>     637                                            resource_size(&res), da,
>     638                                            imx_rproc_mem_alloc, imx_rproc_mem_release,
>     639                                            "%.*s", strchrnul(res.name, '@') - res.name,
>     640                                            res.name);
>     641                 if (!mem)
>     642                         return -ENOMEM;
>     643 
>     644                 rproc_coredump_add_segment(rproc, da, resource_size(&res));
>     645                 rproc_add_carveout(rproc, mem);
>     646         }
>     647 
> --> 648         if (priv->ops && priv->ops->prepare)
>     649                 return priv->ops->prepare(rproc);
> 
> This is unreachable code.

It looks like Dan (and Smatch) has a point.

> 
>     650 
>     651         return 0;
>     652 }
> 
> regards,
> dan carpenter
> 
