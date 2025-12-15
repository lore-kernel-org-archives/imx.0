Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B92116F6
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765764671; cv=none; b=MKVDv8hJdwSGWQQmgYGi31fp09QCMOuDkd/xL7YqlWa9tjn7GniqiVeya6anOmnaJA8n09pbqMdUhcQQB2oaOIFvFUMpxfTzyBB0tPfBbM+VFQl88zJfP3zUAB9WwFuzqkwSZLH0Xr/F613MAtNZespEqnkw26mIFsSNGaJH+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765764671; c=relaxed/simple;
	bh=RQpJgAFNddWw7AyF6f5NtI7ueKumtL9CkbkvTEzcXjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRn3qAiT1+o1Gcchg2ON4rbhucv/8AAsBYtqGU2RrVSMZAc9WGgKhHgplp5EFu2XB1zvON+Y6t7IzZGSbqxkEdFu5X3RTN9C/hyN+vU6IC9BCnL7DWwAzsS6Qj4OVIMQNtS96WhTyQhs0opRetk3eAzyOpH1XVAjCoGCN0jSvo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQk1Cd2D; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQk1Cd2D"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so2925010b3a.0
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 18:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765764668; x=1766369468; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgsg75s3qAHMgvIkSidcSt/1Y3c1SrFas1wQzevvAw8=;
        b=cQk1Cd2D5t0J+jqgovaIvCvuPYOmBf+zR8SJsmg4K02k7hvC7Xy2WqZ9+bqCUo6hsq
         P9XeZzjySxpcPeeZTj29jFiAWQ9ZHLk6qsDlMLweJ8SZPNNzb4gSD1CqokudE5W25Zbd
         SI2lyS1MbL42c3pTF3X6OSo66GaRNLGPjaTSojwD/uKuPnchRsgHx3YnhK4qctyk+c1j
         9VZ8orzemTJpd+c/hDi6Y9r+wYFjJ6ddikPXQSZYQPzYMsl2k9wOdUJlhKdGII8Zu/x2
         +aXxSF5JQZEaWKBBlFKufwmbipTIcwgkFda63+Bj4GkOup+0gF7QSsRqr41JdL6HzZQb
         8Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765764668; x=1766369468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgsg75s3qAHMgvIkSidcSt/1Y3c1SrFas1wQzevvAw8=;
        b=lhlh0xpGNcRNwGhN3Ctdm9FuL1V39nPKLccBP9OLcWEjzHgWBPIB43Bi3aHEg3A4/U
         6RH0tWs4WpLg3QUsQIl3PlOedsHAgMoVzsMDM6z335xwAG8ZraSE4HuL8wFwpuHgEIQV
         G1VEhFE/c9WxXipkBSjq2qctKgRmMyKyFJbwqUqzSD03nOI5u3ImiKhIHKGpo8hi50Uc
         kJwU60zoKTZmidytwOOWFyP/HZdDyYm2Gb6veB8/WHqIC3f/NTLVbAK9Icb5hDZqsaLK
         mFPAI8fTAmhCtCwPvUZAu1MJwF2sIojoPJQPX6/bFcZrVOUcCsygxesF4yknsqKt3fJk
         P2nA==
X-Forwarded-Encrypted: i=1; AJvYcCW40W2V+kdd1ucTxEosthnIxaWOsRf9Xsn7ABcYpU3mMIS2qiKxCfV6Z0ykywHWrjWAPew=@lists.linux.dev
X-Gm-Message-State: AOJu0Yygyr3i+az6rNihVZTg1prKbGF6wL0g1ukcvJUfwNNspCNMUBHP
	RcRUqdKQDiUg8jmYWGJymE6lPU5zlAFcZOra6Ri9nxFhaJRD0+2U/VuRwxbFwOMCTXg=
X-Gm-Gg: AY/fxX7NyNByJwIMn/qyF7sCg0uCueGqtRCJijUpf1JOFgD3D3SycQyaRa4TlfhjI43
	MtXQie/Vah4XBQRvexpHfmCCLD2M8BflYxqhJPsk7h1nr8Poqa28BZvD9yKYKGUCZ/kUaRtuj9w
	/awNH1/MDKjayj6+niU9ntHrix+GOdeqpmB+aE07LivycKf8TXM5N4N4Twvv5S9ZUMFhFpg/3JC
	MMfoYTIYeTU34nh9vj6IWve7muROFvV8yfltqJ0SIITVazx+4LANMJ6YQ6HV4qqo/vCbfUDnEmP
	Ll/2GrygwpqCXzPUGrwOtu/x3GOTijGNQivR5uhyeKUbYdZpqvjD3OT5+zAQrL5hH5vkRPkysUR
	9qMW27VnU4WiHrR8zDm+p/W/e/DYgMRvoJDVEqmoatioS/qjxPobP9j0ijypNngXZ9xuI8gOfUA
	HiImI+hrF0qfTIWSIX0ylktBCcHiY5hb8vTVh8xDRMHQ==
X-Google-Smtp-Source: AGHT+IFshcXVNij9zJ81B5WuJafD0T1VgLx62XssDHNaTIpACeotR+RQvJl07N2kvTSSjnWlXbJGOA==
X-Received: by 2002:a05:6a20:e210:b0:366:14ac:e1fc with SMTP id adf61e73a8af0-369b0999301mr9246879637.78.1765764667976;
        Sun, 14 Dec 2025 18:11:07 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1361b76c4bsm3021918a12.35.2025.12.14.18.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 18:11:07 -0800 (PST)
Date: Sun, 14 Dec 2025 19:11:01 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
Message-ID: <aT9uNSboYCGK1DYL@p14s>
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>

On Thu, Dec 04, 2025 at 02:28:23PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Firmwares that do not use mailbox communication (e.g., the hello_world
> sample) leave priv->tx_ch as NULL. The current suspend logic
> unconditionally sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
> 
> Detect the no_mailboxes case early and skip sending the suspend
> message. Instead, proceed directly to the runtime PM suspend path,
> which is the correct behavior for firmwares that cannot respond to
> mailbox requests.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> Changes since v1:
> - Wrapped commit message to 75 characters
> - Changed dev_err to dev_dbg since this case is normal behavior
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

I have applied all 3 patches in this set.  Next time, please consider adding a
cover letter.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..f51deaacc700 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1242,6 +1242,15 @@ static int imx_dsp_suspend(struct device *dev)
>  	if (rproc->state != RPROC_RUNNING)
>  		goto out;
>  
> +	/*
> +	 * No channel available for sending messages;
> +	 * indicates no mailboxes present, so trigger PM runtime suspend
> +	 */
> +	if (!priv->tx_ch) {
> +		dev_dbg(dev, "No initialized mbox tx channel, suspend directly.\n");
> +		goto out;
> +	}
> +
>  	reinit_completion(&priv->pm_comp);
>  
>  	/* Tell DSP that suspend is happening */
> -- 
> 2.25.1
> 
