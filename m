Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF671D1E9C
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730801261; cv=none; b=iGSbGSn3bBXNuwuSPHda/1SHjEbZveRUSHcP2BMPufrHu3ZVGSYXm1pwMgo6Q+t4GFtsqvOGcuONaGYqGhxC8iEYQ39VzcGdLJK+C5OeCEF2issSQFqgRE3cBfnw20QMfItrSmwUBiEBrwM1k6rayDZMcYoIg8/x2mZt0CQSyBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730801261; c=relaxed/simple;
	bh=fMtVEswXzC5h0ht8PJ6ORa6R3Il+UFZzE6yMyxF4uK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDP/5HOAGxg78ZmmRIA+njIncL7Zz7aB25+LsFGBy2x1jXmiJLR4jD7jmdPFCKLkBZD5OzViV6UsawgjtyHv/oZjNlW9el8ivJ/d6BpGJ3srWaWO3c/WxY8YT5rbH0NRdypSTlgd7RCStn+TUXpFLR4y/TfgXeAR5V8VQxymKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwTd7kcA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwTd7kcA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so3385123f8f.0
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 02:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730801258; x=1731406058; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7TL1aMhlVG35XuLTulpAPfQcuFiOt/1WGf0Exilyv8=;
        b=mwTd7kcAHlh5s67zhpiE/sLDq1Ds2K30hWdRF+oTxAa4ku0ykrSiAX5cA2mKvTYboE
         C9DIc4KaY5G6/NAjy+IxM43dtHpkHXNbavxyJKZQSW7/3U6PCTTxABJCu/QaPvcc/x9Y
         flT882UMpND5Rqel7vzL+O5xNH92gOi9Zw0X7WEPMxqA+65iE0uXsfbeyrz3bHfwX2z/
         g04A09VgI5xZDxHvvCQlYBstaJnd6vnF3Gqb+AIwtG8WPQqP+4UQqxFiC5X3oNjMLikX
         ZExIy8+0h8TehFlbcNLGHymSrYoY3yGL7IP1Bta0SyE/H+4Sj3DTRmkWdIfpP/fXuL2j
         O8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730801258; x=1731406058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7TL1aMhlVG35XuLTulpAPfQcuFiOt/1WGf0Exilyv8=;
        b=c6BcJMNLHK76izXRgXXLsil0YxlopGFcbMcec9+4+uC9dElvgIBmce9wd/Qslfn/cg
         1L6N4N6uCHtUeAByQwiEdpkIH74yF6M4DMDnm8S4TTkjvVsTQVAPLnvbAKrHmVcpTeM6
         slyH5BNkZQStxfuWgy6ElCSb8QPJjG39Fmr/MFDWVVMu0Br4CjAaeelG7LrcMMj6Nbjz
         vE2y2GzUvvlbvr2AnLI26WWQED/ojQm5xD8q1iBkKGA0sBIFKfmSw30nSbceNOs86mgX
         1Kuxhg5wdKBdRVWnwVhM49CnaDp9bk0TcMtJRUER3DACVQzeGFLs0sl4O3bN7lklVvUm
         52kw==
X-Forwarded-Encrypted: i=1; AJvYcCVjShbxcThyS80ol4BtkyMxfGkAtEinTe8uEJ+79DBt1agx/wnrlgv8KV11KxFKnCb0gQA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyufHY06emVhSPKqP0mBw/KxW2C45fPiuehCqwPXlkiqtcS1Cyr
	n7jU7xwNldGtEFGr44Bb1T6dU8UONPufzMr+ECRBF/JM11KKPacFL8AK+2JQbmY=
X-Google-Smtp-Source: AGHT+IFp08JA0sHI8ryKAEOQoPYhek9FFboXi5bXBWo6t1LSCZO8zzE+XPeA0LtcLtKu29uatyq4ng==
X-Received: by 2002:a05:6000:383:b0:37c:c80e:d030 with SMTP id ffacd0b85a97d-381c7ac81dfmr14041359f8f.53.1730801258179;
        Tue, 05 Nov 2024 02:07:38 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7365sm15483147f8f.54.2024.11.05.02.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:07:37 -0800 (PST)
Date: Tue, 5 Nov 2024 12:07:36 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	yangyingliang@huawei.com, bobo.shaobowang@huawei.com
Subject: Re: [PATCH] clk: imx: imx8-acm: Fix return value check in
 clk_imx_acm_attach_pm_domains()
Message-ID: <ZynuaPjwYHSWAeAY@linaro.org>
References: <20241026112452.1523-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026112452.1523-1-yangyingliang@huaweicloud.com>

On 24-10-26 19:24:52, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> If device_link_add() fails, it returns NULL pointer not ERR_PTR(),
> replace IS_ERR() with NULL pointer check, and return -EINVAL.
> 
> Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx8-acm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
> index 6c351050b82a..c169fe53a35f 100644
> --- a/drivers/clk/imx/clk-imx8-acm.c
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -294,9 +294,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
>  							 DL_FLAG_STATELESS |
>  							 DL_FLAG_PM_RUNTIME |
>  							 DL_FLAG_RPM_ACTIVE);
> -		if (IS_ERR(dev_pm->pd_dev_link[i])) {
> +		if (!dev_pm->pd_dev_link[i]) {
>  			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> -			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
> +			ret = -EINVAL;
>  			goto detach_pm;
>  		}
>  	}
> -- 
> 2.33.0
> 
