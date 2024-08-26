Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD8D19306C
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686317; cv=none; b=QqfXYsiKUt9+cKS1rMqpBvnCqY8OQfJiGlPo4mKek1/Dbkn2kbhxnOPls27DQ3Pp9WyLxAx4MUce2HLgXLsdI+kGD9yImAVvHtzJ5xjqfYPIIPPIqXhuh0Jt2mzP8gDzU6VswAro7BTzLA6Abg09zeQoGQwIThTnVm1mXlJztlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686317; c=relaxed/simple;
	bh=MOKUuEvekK5rwgwZYlRZvsdCZfLN6nGaulZIK0yONvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLMD7cqtFf4fZ6TNDNMDEBEu0KaOPm/s7+Ml/M1w7zM2m4tc1IcskNtfyjI+o/DLn8Nf1WPRCQPdpxX+IV47Oq5eHtSyB9Ste4KMnK1ckx2ye7f+3BTFPqMi9cNN+HqKKVxQuKnb8pxCOE4sCf2HqzgmDXe7y+MObV99b0qjsqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUyoRS5d; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUyoRS5d"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7cda2695893so1394577a12.1
        for <imx@lists.linux.dev>; Mon, 26 Aug 2024 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724686315; x=1725291115; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5++6viK3zYZWJbNYQZb73hz3jjchrb/vDCmq+vJ2U4=;
        b=sUyoRS5dOaiYOrwPCuu3ufSPurPSCl881XN3ZnSb9L8hxmYj5OLC6iENVIwz/WVw+F
         sjNj7OlTEJnGlsLQRpfLZYYiwaNVqEJkJiZ9LvoREPczOrVFEqDldDuAbZjGvPG6zMHV
         mCne+y1Lyb0HvCIVseWDRP4erbeZ/Gb0gPmhEHnajWoA3QXLVz1XtEZQvqQp6JAgTTeG
         ERQ4oGYBM6UCpILUjU2IYMV2qgO/UbJcultZwNtyIKclj1H9/dWH2QtUcAZvBlWugmpt
         s5+PiCeLuN+r28fRHiMqO9YYB5DVwUrYhYQw76Fjbp5C9EYVgAZXM5ZY2sOXBT6myaBB
         xDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686315; x=1725291115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5++6viK3zYZWJbNYQZb73hz3jjchrb/vDCmq+vJ2U4=;
        b=OtcqP5LKE4CyNan+Yc/n+06686l1uahG/BGtCrT7Fd6FdBUxHv2ZoZcIo9nog2iBT3
         r2QNizJ10LlW30LHPU5uoJjp++J7zF5gSygsd+q8aaivM2c2cTEDz7oG/GpUVUcmY4Mh
         dzJErkSMoSU+iYQufPN7nwof0KO1o+MnXfw7j5bF3cEjiH7V7YU3Lsi1Iog/pXLcCJE7
         /balfDyuxeC3QdCMF/3S2b3SJ6E+kXr2Tzz3XNQap/V+JoRwV1Rudpb6keLBr4/w/Zj3
         cqnjBr+1RYriZcVRGT6kvI3KoCv3I36PT5PyIoehQKtPwa1jt2rtRrJT3fcjVQjvfMyw
         4WwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn72opVdqeYWKesPuQf4QESTlrUuP1uUj3vPM4ita7u1KPo5eTDkL/E97dBCAY3le5mZo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy01F1lub+mfB/M/+0dUVgL71rrvWlZ5wVY4G+T44SlsQe+lvHT
	jFn+hflUAEBj/j2gpPyaWUXTjo3EnEaD1HCxWdfXmarYWmR2xOqPy65LpRWCfes=
X-Google-Smtp-Source: AGHT+IFat5E7ycTJSdkRmb690GFUDdXL/SJqFXqM0lbjqbfMedPx08c7A4wYVc/U8aWkzS3LORhuZg==
X-Received: by 2002:a17:90a:1f88:b0:2d6:1981:bbf7 with SMTP id 98e67ed59e1d1-2d646d2bbd3mr9746593a91.32.1724686315109;
        Mon, 26 Aug 2024 08:31:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:841:3fb0:c1d:cf23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61968ecc7sm9674318a91.54.2024.08.26.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:31:54 -0700 (PDT)
Date: Mon, 26 Aug 2024 09:31:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/2] remoteproc: imx_rproc: support non-blocking tx
 for i.MX7ULP
Message-ID: <Zsyf6BEXV/R5EBwt@p14s>
References: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com>

On Thu, Aug 22, 2024 at 09:48:48PM +0800, Peng Fan (OSS) wrote:
> The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
> poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
> firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
> configure the i.MX7ULP power controller properly.
> 
> However the reboot and restart kernel common code use atomic notifier,
> see kernel/reboot.c: do_kernel_power_off, do_kernel_restart.
> Linux 'poweroff' cmd will trigger kernel 'do_kernel_power_off'
> Linux 'reboot' cmd will trigger kernel 'do_kernel_restart'.
> 
> Power off and restart are totally different operations and are not
> complementary. So need to make sure the mailbox be changed to non-blocking
> mode in SYS_OFF_MODE_POWER_OFF_PREPARE and SYS_OFF_MODE_RESTART_PREPARE
> stage. Otherwise with blocking tx mailbox, there will be kernel dump,
> because of blocking mailbox will use wait_for_completion_timeout. In the
> poweroff or restart case, there is no need to wait, because after M4 got
> the message, M4 will put A7 to reboot or poweroff.
> 
> patch 1 is to support non-blocking tx mailbox channel
> patch 2 is to switch to non-blocking tx for system poweroff or restart.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - patch 2: Introduce an flags entry for dcfg and set IMX_RPROC_NEED_SYSTEM_OFF
>   for i.MX7ULP, drop used "struct sys_off_data data" and add comment(per Frank).
>   Drop R-b of patch 2 because of this change.
> - Patch 1: commit log rewritten and R-b dropped.
>   (Thanks to Daniel).
> - Update patch 2 commit log and cover-letter to clarify reboot and
>   poweroff are different operations and not complementary 
>   (Thanks to Daniel).
> - Link to v2: https://lore.kernel.org/r/20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com
> 
> Changes in v2:
> - Separated patch 5,6 from v1
> - Update commit patch 1 with adding "No functional changes"
> - Link to v1: https://lore.kernel.org/r/20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com
> 
> ---
> Peng Fan (2):
>       remoteproc: imx_rproc: Allow setting of the mailbox transmit mode
>       remoteproc: imx_rproc: Add support for poweroff and reboot
> 
>  drivers/remoteproc/imx_rproc.c | 54 +++++++++++++++++++++++++++++++++++++-----
>  drivers/remoteproc/imx_rproc.h |  4 ++++
>  2 files changed, 52 insertions(+), 6 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 33a32de2d79c051f27ed57c4ac90cdb406f91928
> change-id: 20240712-imx_rproc-25f3ab753c58
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
