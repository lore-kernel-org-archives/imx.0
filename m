Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9C3F076F
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385279; cv=none; b=Fznk8v+RlTXuK0cpwemXxacDMzaEmaRDXyWmawlfuCkCTA8NZ6j4xixOuVkrocVfsWZYSHpgWC6HJqUqiMkxkpgIWTHqHaSgBpu80NtFR2DDch7P779o0anNhtV7Uh/7NzU0VJT2AY5E4qsNSjYGUCvfiK54o2lEA0b9XMjXZ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385279; c=relaxed/simple;
	bh=cgQMbDqYfT71b9lkPLaFsRUiAtSX9sd1HsEdDuF2BwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TnT+vwSC3OOK+MfGPszyP/GJ/HoOPSI3hJm9NnaZwUxtUlL+70J/ems/TYAhKhGrHrusm1tOaA+esR0KQspCud6shKuNHBAHkK3iyXIXRbaOOYJ+eHvgeJoYo+DGd5xanwoQy0nQwtKB2Xxl09sh/sKwaWPHvwxnHqcwp5j5yTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fBVHIbgv; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fBVHIbgv"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43591b55727so633136f8f.3
        for <imx@lists.linux.dev>; Fri, 06 Feb 2026 05:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385277; x=1770990077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QC0qEoIgNdVzf+DU7HTFpZWfSSy5BNhr3750S1v0f68=;
        b=fBVHIbgvMQGcaBwUOdSZSNxPt4Ie2vEgWlYouNkjpS4f6GuirPr+63n99FCkkogYSL
         R+NRqlvVZTJKI0tgqfu8cTKxl5AuKwarOrDdT5QlXKqVxGJpxKTy7B4/rGzW5dhdDexM
         dTfMqnSRrYXJxBAO3ySTWOZv84z94B4sRns+xnaFwJCGAZ8Tfy17IrJGzhp8JyE97bUa
         kip5m3W1/4ZZugTF7M/P66lmJ2s6fX+Ijy3zia3mSOZlYFEaycE3vQ2X84CtiVKJfwKr
         eLPFpj9zywI0EmP0n0VqZ8BH/fhyq7T4rlZqHBlGDS03qO95xc56roZbQrWAzvWakbgz
         xVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385277; x=1770990077;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC0qEoIgNdVzf+DU7HTFpZWfSSy5BNhr3750S1v0f68=;
        b=XkBEKAD57ZkMrLE7hNzR1erBs95Aovjoncwgcbhxk2OsQakQ/gnHG241wUmkgIyxjS
         v/PKj42q4WyIfxIh2eQJT0k4Sksmfzqu4cJtPthLslPO3v/OY9rdVPpAlIJaoVIWGxkq
         vRogPOuz+xPiS4YvhC5StHkkxkrHjmpsYWWbMS8dHE0mTTWPUGUvBTVLhtGb0WE6pm4/
         pfWxA9Kkgw7V18tNjhQlzSysMTPSui8UjqHNI4NSoWW2BUboi55g+iVUadHQ1aw78QN3
         MBn6CAiPVOQa3PqYUd+DQkWJoSA1pIgcsyf5EdOqHva10ZSYCqg4UOyQPvU1GWDBvw2B
         n/rg==
X-Forwarded-Encrypted: i=1; AJvYcCXL+88SKfccVXuYapnWlB3UulmZprXgEKtrCmAr74QjTfyFHP2IFlVDXfn36Odkr6fwWFc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNrYS6+BnRnesO8pDgVdzYxKLU8n4EibXgmAcOCDnOtb6oWMQ2
	MSTK7y1IjauBpkPMeCl2M2HAtGnd48WSMgtdRZCzCC8UqcgFsc1OARZcMX+9XdcGCKsztRd3FM5
	nFcns
X-Gm-Gg: AZuq6aJBaUt1OILJBGENlux3p+Z8oiiuVyxNpdFHPsnhBx7y/Q0FknL2xZmNOpykLiF
	1AZxJzllKY8AzE2q2PebdtpyMYnuBHysdp65TuRd8Mc2AShiOyYge4iG4L/xLGpsvtcYx8HQGna
	bxbJ5kexrxL+Den/bsyOb4fR5fWcmDO/YYK8PfYLEPJyrFw7nOfJpOm+M27XiNYTbcVB807oQ0W
	ZjdS+bHz96U/JVgOoE37msvQGcyiG4NcJt6og7bmu8X19iMjWGOq/SCRWm1feAVV2k500EMVcyL
	yISc1KoP5z5ZStyovRSjFsjBVFPF2FjylVnbu5tNZJ1HqaJb+7NNxbVe5wtNTeune2vLJ+RA2GZ
	wt5OOxSBrscAIu8hwreVELaal03xftQMgbtqy8z4LxeoF1I4X0uIprPWqZGd9cgWN8kkCe57jag
	UMm5GSboVVUs1z7In5
X-Received: by 2002:a05:6000:616:b0:431:369:e7b with SMTP id ffacd0b85a97d-43629341e83mr4341944f8f.18.1770385277209;
        Fri, 06 Feb 2026 05:41:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm6297355f8f.4.2026.02.06.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:16 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Message-ID: <aYXveV_Y1gT73JoK@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Peng Fan,

Commit edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops
for imx_rproc_dcfg") from Jan 9, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/remoteproc/imx_rproc.c:648 imx_rproc_prepare()
	warn: ignoring unreachable code.

drivers/remoteproc/imx_rproc.c
    605 static int imx_rproc_prepare(struct rproc *rproc)
    606 {
    607         struct imx_rproc *priv = rproc->priv;
    608         struct device_node *np = priv->dev->of_node;
    609         struct rproc_mem_entry *mem;
    610         int i = 0;
    611         u32 da;
    612 
    613         /* Register associated reserved memory regions */
    614         while (1) {
    615                 int err;
    616                 struct resource res;
    617 
    618                 err = of_reserved_mem_region_to_resource(np, i++, &res);
    619                 if (err)
    620                         return 0;
    621 
    622                 /*
    623                  * Ignore the first memory region which will be used vdev buffer.
    624                  * No need to do extra handlings, rproc_add_virtio_dev will handle it.
    625                  */
    626                 if (strstarts(res.name, "vdev0buffer"))
    627                         continue;
    628 
    629                 if (strstarts(res.name, "rsc-table"))
    630                         continue;
    631 
    632                 /* No need to translate pa to da, i.MX use same map */
    633                 da = res.start;
    634 
    635                 /* Register memory region */
    636                 mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
    637                                            resource_size(&res), da,
    638                                            imx_rproc_mem_alloc, imx_rproc_mem_release,
    639                                            "%.*s", strchrnul(res.name, '@') - res.name,
    640                                            res.name);
    641                 if (!mem)
    642                         return -ENOMEM;
    643 
    644                 rproc_coredump_add_segment(rproc, da, resource_size(&res));
    645                 rproc_add_carveout(rproc, mem);
    646         }
    647 
--> 648         if (priv->ops && priv->ops->prepare)
    649                 return priv->ops->prepare(rproc);

This is unreachable code.

    650 
    651         return 0;
    652 }

regards,
dan carpenter
