Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350C284898
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484177; cv=none; b=F3hj46McQv19RlHVhAl0doLV29AHAar0AkTOjzU7En5OQVSO/LEzRnJQmCXrzoTFMAElydpdlQ8MYY0qbHwwSXueXzOtqL9pBRcJ2mOdKwZbRgjcT7lmoveEl1DPAiZKxpP7S7vxJe18uXsa+EifmY9LITETj7CQECThW8N0FoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484177; c=relaxed/simple;
	bh=jePVpy6+q0ZwdOkimr3ZdSF7ygrpTpCkiZepBmNE5nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9WobcSr/R5iq8w0dSTHuYnoDoXkBlxjP4EXmOOfSaZYCk+HnyINtKkqJ1Df97T4u2LfubaVlQx7yH4pFsCe6wFEc+TPufcVUdQh2kIqKn7Y+i8eWDYJzRwVgypsU7qhzs+AFnEG+18rzWTqI/6yRw/I0JETYGsHwHHoumrLfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xL6LoHeF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xL6LoHeF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-298144fb9bcso60700025ad.0
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763484176; x=1764088976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajw2E1NL4+ilWTTz+HJjdJlqtmBwlpNjA2J8C3gJWjo=;
        b=xL6LoHeFVV3d/g8tri00WicMa/9X5pBYMeaekAoaxBodiEn1SvsUEOeSFqv/ltAZT2
         v0jOTqirOJHigxfwpF1z6IGYl9V23HJFVYhkJpU6G20HgaL5EEIoLooK3eHcFVs7AGLk
         5xvH2K1+KmhcTpua7g/x/uBUJUWKWH6+DcU4699RElsvwXpm8bMLOF8RZLgc8iRFi2gG
         dV5JYXwXGLZoHqTqvfapcj93PyffOPCgCQVs2qsJL2d5aXDnHiZxcJFebSBZSNLJsQL7
         q4Y8dFjn8+ubvFszF+D5EMjxyxRELGOGNUg59nI+cUANk/JC6fCkUb9Hmk6ZqznlfrVU
         bnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484176; x=1764088976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajw2E1NL4+ilWTTz+HJjdJlqtmBwlpNjA2J8C3gJWjo=;
        b=Wvuh/VP+HSfvf4Hlj5x+GiHX9K699wS8XXV30IFiSeYN8nDpi2/D55gXtjRQe7Jmuq
         PxQWaC/CjU+n4ScdTsqz8YLKWRsERoa+hG7nU6cE8NYWNDrn7Krz7ddZQqeuyI0LDMj+
         9t0WPWVg+arkYgcw3sOviJsR27J6/xmySCjWoHlT+eGiWIjw87gKSPN2NJD1RjrILltF
         LXjTGw0nQiydsfuT4x/si+vbEb7ETWojKrr73ewum9tkxMTEG+nDZDfbmRGwXkbbml/K
         BCO3+msfv11Ty4mE2EfrKP3rbGG1qHZk4wtdB3hSpPsYK3reNaDK2Kp8a9y5vTz8IUI2
         IcRA==
X-Forwarded-Encrypted: i=1; AJvYcCUwHHaWXdilAeDxlr7ldjPr9YDBBGkXhoG4ech3w+9zPbNbpRBOZTNxQ1TFLlMgLK1ZawY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk6pfP65rbLD1dzH68rOVB+nz8Qr01VS4qVX500dAzWvPcO3UV
	bVvpTXBAxGHx6ChKzC0xCQRStRoMBXO+LVBs0kp6TLIoNMbHjkLRuWrIk6jzLGeDCCM=
X-Gm-Gg: ASbGncuZlVLpJ5a2mc7cmcrdh5q6kleUbluRT+QpE4RpxHMdY23t82tVvELsXoJoWTD
	06wo5/Zuo3cqQpyN/JW/YPdeCq9rTXDblvQXFqZ/mUjka5Dq1JXjiCthoJFD50haOxI/K0v1NdA
	sZYO4SUOgYhitvBdTSiNxQR1WqiA9lOjx4t6BpJY3uI3u8Rbmqhfftb40PdoH6UXP+YIO81Iis8
	w2hKdmrrmdviut3L14g9tyc7IbQcpBOnHRqKJfBEKK90Z4AuTTH5RlImCWzghZ9hONjqh0ikRPi
	ieTngqgh6rQt50OrTiSMuM+OES/uZH2YV0ZXiT+APoY7ds7yRSkfebebnlBAVsTYtLiCg4n/I5e
	XgEKI5qy5wiL4b+o23Q5Ens9XVsxYv55vOHagbWHe4Ws4mxWlJcAnrew+O+SK9KnQ2gXymHKAfI
	85HbfPrAz/Smjl1A==
X-Google-Smtp-Source: AGHT+IFHZInbopaXHrcms/mL2ZLWLLFWIrlmSWjRDYQeHFfnq14u/a3jqiLWEErsYjmSVeHRv2ntAw==
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id d9443c01a7336-2986a733395mr195293315ad.39.1763484175459;
        Tue, 18 Nov 2025 08:42:55 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2beb34sm179110845ad.76.2025.11.18.08.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:42:54 -0800 (PST)
Date: Tue, 18 Nov 2025 09:42:51 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 11/11] remoteproc: imx_rproc: Remove enum
 imx_rproc_method
Message-ID: <aRyiC2m5z9M_vPOc@p14s>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
 <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>

On Tue, Nov 11, 2025 at 09:41:22AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is no user of enum imx_rproc_method after moved to ops based
> method. Remove it.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -15,13 +15,6 @@ struct imx_rproc_att {
>  	int flags;
>  };
>  
> -/* Remote core start/stop method */
> -enum imx_rproc_method {
> -	IMX_RPROC_NONE,
> -	/* Through ARM SMCCC */
> -	IMX_RPROC_SMC,
> -};
> -
>  /* dcfg flags */
>  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
>  #define IMX_RPROC_NEED_CLKS		BIT(1)
> @@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
>  	u32				gpr_wait;
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
> -	enum imx_rproc_method		method;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
>  };

After all this cleanup, please remove the goto statements in
imx_dsp_rproc_{start,stop}(), as it was done for imx_rproc_{start,stop}().

This set can get in the next merge window if you send me another revision by
tomorrow.

Thanks,
Mathieu

> 
> -- 
> 2.37.1
> 
