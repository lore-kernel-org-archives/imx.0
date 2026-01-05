Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2626F28A
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 21:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767647364; cv=none; b=Atc1/ZQt7TjodutJT/NkcdwbWGd3ESRk9JDPU34yjnAtmQcb/Ir+SI5Dth28UONzEa6Mkc2vjAgzUOGR5JwSn69XBgbZUN1qxl3nKHmSxpbQdL4cJ3bjbrjK9yPLP/YwF7PJYFiKTfPScG+iAUNv6CKwVZJLiVyp6elhvQO2xN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767647364; c=relaxed/simple;
	bh=jwLkcTvlIBQUkhCwf3AoG2rQ1UjqOwQNEsd9gNEIZw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUbUDNxe4m2LC9uPBq3ssD33MWKdTolgc0WfegEQ1+FaA/cp6dc/1aofBjb25vvCM3xHekCdg4Si1ujcU5UsPDWFAWvC6CMlaLNYic2pqv5zQVG3S2yClffQ+GdgPf4MVVqflhs/3MwQnNEy1TZ6I2z/0riUWxGn1XFx/eOQpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f1BXyjyh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f1BXyjyh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a2ea96930cso3657415ad.2
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767647362; x=1768252162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tSkxCKwZXCfTTNee+KHC5cdt2q9BOYUvx4EdY3LV9o=;
        b=f1BXyjyhW+rOCBPwLDFl9Qlmk896cysaYuKUwzbDP2lWA3zEMeIEUbjG9vtA6bGMp8
         tz073eNvnI8tu3AZTmamybJCqam4ejlt90tVRCfyyP0z/gZdkYg0k7cg9T4yHMoUOuWF
         A/rmH6FL9KniAIRoHwclCDrtk9Xb1HcEdqb7nBJqqbqU7iMEYE3mZkP4GjOMJk3UujAZ
         g3eC8EYv9XAwiYBskH0akG1UL5CRnVN3eGE60saDHW9EImdUF3zLi8tWOlM0+QMYkXEE
         VIIW90gG3zBPCIYakzWN2tOGguR926Zkbe6zaJVMBo/Hztg2U0GLQKb3c9whH0aYGIBZ
         qOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767647362; x=1768252162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tSkxCKwZXCfTTNee+KHC5cdt2q9BOYUvx4EdY3LV9o=;
        b=rUZ03AH1uGZ6wkVULXcg6a48YOkuEwtWQ55mV4fzDO0Nbw2dVOweQQATf3lnJsejDv
         PTmFhbI8LWdua+l8YgUu3//Ez+zvx/SxqS6bslgfDu9iQfzV0FK/YNQQtR2JD/Bnlswg
         zA8AYDswGXSj84H4diND1FVXWMbVmsdl8Tp4lqdN6c0T+wP8bnbya3MS3ym4fm1WNRbz
         vsoyYc0GgGwCjgnqI3h2gZnpKUewDav1OrLDYsVCNOx+vfeCLrgnMFPYXmSDTWXD8SNk
         DKWLDiaB93D7lBOAm62yGrWg+xsNcbdoQzTxieE3vdBccMYfNI+LkpghlzPgasIjyAOE
         UWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX60/5YhnjqOEGxgx4D0QpLYfQZg8b3Bi+yyE0huN3DzTOnsvtqZG+hJbcZNM1XsCWjLuA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVipejLqyI9Yd5mJrcb8zOHg085aFxwjH4NSaiVItL9j4cuare
	nKeUoUv2sgQP0WovT4G9tdiSJHXp+LdBlS7YKqFHv6iAki3edIMiEfBVCqAatJyWbpM=
X-Gm-Gg: AY/fxX5vqdP2eVbd9vBsiTwxPSRd2yX1Zbs8FSXN7F5pQ59Z156eL1/ICSucuMXGfya
	8vwEaUt3eiHDylMYnisXI2P6YynO++S0OiUaHzXvE/404p0cD+Wn6pW0YTAk/95sywjSu6Vodzm
	xKsmmauyl+xZL75WAGZv4UIsSdSS9sZ64Xe3+rcLJAbmRVuHZaX+Mz1Qy7puo/MmmDRaUMzyKeD
	T11rFJ8s4m/dKK93O8bMniCDHkVkzrLKPPMoWjPtzhkYcIsEba+eTDTEl33+aWBlZOIU/oeR3dQ
	Sg8mBfJejIW/2Lu4MenO7/WVyQfqcZrfc+RQRnvFMc7Mcb2bCxeCt62LIMokwPhydNSk5yBziSY
	JhejYkz4gifu2mSpYJReCibUPV11UjIeFOiZhBTdfYlM2MjPIeqUgxs8buusKs0zfZ1rJQJjkFe
	cHXjii1uFsW6xdNw==
X-Google-Smtp-Source: AGHT+IHXo6DMFCW0WpfI4RbwmQ0/+SMw7AIolM0jI+6hLOC2qL1pTqhGB59TCu4aAjBQnNj3aCaTnQ==
X-Received: by 2002:a17:903:2f46:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a3e2d7896dmr8294395ad.4.1767647361918;
        Mon, 05 Jan 2026 13:09:21 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3ba03f9sm1721825ad.0.2026.01.05.13.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:09:21 -0800 (PST)
Date: Mon, 5 Jan 2026 14:09:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, daniel.baluta@nxp.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: only reset carveout memory
 at RPROC_OFFLINE state
Message-ID: <aVwof_w31EMxi5st@p14s>
References: <20251218071750.2692132-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218071750.2692132-1-shengjiu.wang@nxp.com>

On Thu, Dec 18, 2025 at 03:17:50PM +0800, Shengjiu Wang wrote:
> Do not reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.
> 
> Fixes: c4c432dfb00f ("remoteproc: imx_dsp_rproc: Add support of recovery and coredump process")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> changes in v2:
> - refine commit message.
>

Applied.

Thanks,
Mathieu
 
>  drivers/remoteproc/imx_dsp_rproc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index d03017d6b214..ac8aa71aa56c 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -984,9 +984,11 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	 * Clear buffers after pm rumtime for internal ocram is not
>  	 * accessible if power and clock are not enabled.
>  	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> +	if (rproc->state == RPROC_OFFLINE) {
> +		list_for_each_entry(carveout, &rproc->carveouts, node) {
> +			if (carveout->va)
> +				memset(carveout->va, 0, carveout->len);
> +		}
>  	}
>  
>  	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
> -- 
> 2.34.1
> 
