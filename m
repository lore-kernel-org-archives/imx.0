Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C818A6BD
	for <imx@lists.linux.dev>; Fri, 14 Mar 2025 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741983505; cv=none; b=F5HbCVokV6r9sCN2k8Q6E15drKABhCCMnQ+uImFKrFsiZmcfrLxlzrpufONWOxrAnOtErACkL5hLefCltjm8I/p6dbrVHRJRHbIXwIsdmHPjUtpqycwFKnrAUEpWztoSLbK6z4vVkSNcR0VRwl8yI424aj9b9lxIqUjuAkH/Rc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741983505; c=relaxed/simple;
	bh=4ESTlD1VAk2LRhm46kGze9fKTdLnaNIw02AlFjlKnqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1dL8Cs+Q+fZJSXOQ5eehzLNia6gR9kylnlHczdkvMEYMeO8FYfvvgIdjjFaM9OivT2Y0DoG1lBCuQNUkm6pRsZU4ec0hCiRL1eRWx9BUSqYddMv168/gprLIa1Y69wPJoaRAwmPkDmQaue3mNxaS/gllvBZMjOE7yGh6EkNgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CqvVWJ4x; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CqvVWJ4x"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2241053582dso60232075ad.1
        for <imx@lists.linux.dev>; Fri, 14 Mar 2025 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741983503; x=1742588303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kVE/X+1dvBgKywWxxHtjJI1otue6/+H9v0hJ6Relc5w=;
        b=CqvVWJ4xiAqhPJzL9nE4JugXAJPd27D/1a7aTRBNyqgdYO0dznpA4BDcpNYzpLGPYj
         hk/pU09xTRrh7C0nBQBaQ67jbSxPec2Jvc32LhV2qThBM2ZaA+bpm5p7K789Mje/B86x
         F4r5GHgBiM/1u35b5iczgo0eufVjRVTm0k69kmvLXgJbvzS8Mrt9bnXzyYBiF82P3Jgg
         5unzwyYDIQGDseWzI9xoerrSo3VPeLApakm+cs5/MHZr/PXJJvMuR+PLxof9Hxn6nGmp
         BStllldiYCyRO227vuwdBBFIgyQk7giUCHwWo2FtEJX/9MpIebCQa18iNNJ72bXSm6PF
         vf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741983503; x=1742588303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVE/X+1dvBgKywWxxHtjJI1otue6/+H9v0hJ6Relc5w=;
        b=BhQNLLqA8oHKeE9lk9sWY0+u3CjerM+w6fu5g5MuSZPzgOTCIQUhAmbykS9eUfac+D
         g2lJmdrGQJAM6czx06KBwLJWILwE1D+oFWdD7v/ER/Fl+7JbUmWpJ2reS+qHfm2B0avQ
         51Iy//7OUC8oWzKyHVEiD5qoO3rtty8U4BPa0IH3lq5V+D79sxzuP4Rf793rMbSGi1Cw
         c9bgdBVTWdbsDmyyzMgSVYW0oOWgGCr3zTxtkVg3vO++MiGaur9LjLf3wvtB82TgPqfz
         6TpDveSgff+rR1kqrtb88p4aEE0Q6HuBWmK1r70PlYB0PzdOto5QapjTASuMr68kNi6b
         gjGA==
X-Forwarded-Encrypted: i=1; AJvYcCVsoIfBOyTclJfXuJERnf9yEHxsz/p/shSZN4YhiJ3n5+kF/v97Q8ArAM8067akUF+ziMo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXtFUE9FVQPalucwMPjS/RfP1QrtuXppIeLDWs7z0KdUgSvBDp
	6EWKG0+9q/VloNQSfBjo7zd44D7Bok1Zjnib0glJq9iodoTlDynXeReD3ue8uqM=
X-Gm-Gg: ASbGnctVduqV1cGEpQv0GTmKMsQ7CbgZFbGtOQbfHPysaA3D9fih3noQmk4CkgAlNDs
	lnZkdrJanZ15DO1YRTh24u95yUFE/JT995YJBtiGd/IBFXIHZeI73Qh3GfX3a7Idulc5SGLAF3p
	D4VtoGn7EHvAK6QMIK73pT0Dnbw5B/7s3FV5LnQlwxgNFyNFETPZ8K6m8Zt+vgu6GirfJw6qPO6
	7DvmGkAHWn2AIcbHyu0l1u+5sf02yceOqkUowgylWOyHun95s1y5rgsQaa0oM8q++Ssh9YgLf9Q
	qyPNDujGyNRzT1Ki6H7N/khAmtZ0qn7+jXrM66o5+BuspIA=
X-Google-Smtp-Source: AGHT+IHXBdYKz+0nlSrPK7TcM2iKiILeG/wu7hs+o6yF94fn14To6hkfN4AHSD2DhQ5uyimEFEKDcQ==
X-Received: by 2002:a17:902:e843:b0:224:1acc:14db with SMTP id d9443c01a7336-225e0ac3830mr51638205ad.29.1741983502703;
        Fri, 14 Mar 2025 13:18:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:edf2:f43:33df:904c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5a7dsm32535845ad.251.2025.03.14.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 13:18:22 -0700 (PDT)
Date: Fri, 14 Mar 2025 14:18:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, peng.fan@nxp.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: Document run_stall struct
 member
Message-ID: <Z9SPC1Rl28NKjFTV@p14s>
References: <20250314151720.1793719-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314151720.1793719-1-daniel.baluta@nxp.com>

On Fri, Mar 14, 2025 at 05:17:19PM +0200, Daniel Baluta wrote:
> Add documentation for 'run_stall' imx_dsp_rproc struct member.
> This also fixes the following warning:
> 
> warning: Function parameter or struct member 'run_stall'
> not described in 'imx_dsp_rproc'
> 
> Fixes: 0184b4fdbad1 ("imx_dsp_rproc: Use reset controller API to control the DSP")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503142125.IE33sCto-lkp@intel.com/
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
>

Applied.

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index bc60edcdd661..90cb1fc13e71 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -96,6 +96,7 @@ enum imx_dsp_rp_mbox_messages {
>  /**
>   * struct imx_dsp_rproc - DSP remote processor state
>   * @regmap: regmap handler
> + * @run_stall: reset control handle used for Run/Stall operation
>   * @rproc: rproc handler
>   * @dsp_dcfg: device configuration pointer
>   * @clks: clocks needed by this device
> -- 
> 2.43.0
> 
