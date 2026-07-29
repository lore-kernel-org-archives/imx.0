Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA0476CE6
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325137; cv=none; b=rJS0pIGBspu5cBHFjGRhN5cx6C5soNg82QdEQtmBirIElW08gW68tJrQ2zaKdnbKeTpQsXfr5aGw5AoOqvlS70hyI+v/mrpDd/2zfJ1hhTVMyRQGhwhBmYCvwSJWkW6FWAwRFOb5d/y2qVlh53lbXVwZ+rWJRlKsOqafgmxYkv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325137; c=relaxed/simple;
	bh=+bl7W/DghJ2lNo8ihHQByUSlt3smL+/7HO/f5BD68Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu3QIEHzYAVVX02H5EgrfC3aQBe380rBWg54JQ2Yd+8AI7HQIRkBwxpyI7ds4EoLfbXP+GSPrLIXibm7PApDgXmA1Rz+y4UQr+64cEpvuyHO9dNSSseE4gcyyePBiAX3o8hRBTHvenPBR5Fd3io1+dH/HCMvpI9ZDRZvN2OrjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hl8nOEUk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hl8nOEUk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1309469f8f.1
        for <imx@lists.linux.dev>; Wed, 29 Jul 2026 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785325133; x=1785929933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=Hl8nOEUkd25VFh0f2IJNR29l4ZfX301FkAABlRvfNcYxlrgbd6oU4SG5kBszmGp+YN
         n1LMPC+BZ9kraIzzzRYp/Hebb374i8qDCww/OzdNqQRwBYwg4gqwOooTW0uc1u2JpDAu
         wOqvMN1kyBlqWbb6DNuiEuMz80tz/CPmICK3jYKHfeReKuRSlo+o63BBTd4x62FqSqMn
         5rUCIyTwD1ySFjI0rbnkD/McsUTshpRdqrPOHvDhDdDJ2fCnWIPZSCwjwM3IBWH3s2Tw
         cHWGirfviprW+HbiyJnDRU1mwSc8HUpuJu9ViHRR9OFnKcQ0Iy4UX28iJJaKDldYdhvZ
         3w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325133; x=1785929933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=jjEsyVGkrh0ekoqe3tTjmKHX4+dVzLkXMop2TlAT4mlyVO+u7NPmeDzlB0nImx4mw/
         GSXbffUtbXrvLpZLXr4X3fJursXoCJFwWBa4A0pLJLkid9bieXpyTAxI79AVLotbKGNV
         uujeL6Xps44YbG5VN14BgMp2fozm2o5JLk88W6rmC+UxjJmClhI4HsErZ60FGhzaw8ey
         R0iMMye0gn/Ywdgwamz66fp51Y1SsHKsB+bsenh97pRZ/pRy+Vj0DC+bEf/ZtFa4qp3z
         NSOb2KH398oOjwq9sHro1yMiTEA0LHbUQVY03fpm/8foF4qXQ9pGAxQAcyXNp8EhCFAw
         ZbIA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf2f+N/z3bgiqL4ku7H9OrszJhtsA/H7vhujbsJqA4pADt+cS0fIPlyLow85LhDvHSwyU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw93tg4GBVldVInAvDq35dUWhnYCs2Rx9awi6Rtnl1bXLBkRs+3
	KPXxF/z7RWj/C1k0lr1llme9kq4USOUZD68aL5ulNuTkUl2BaPcWR7oO+XASxqy4TAc=
X-Gm-Gg: AR+sD10VCPtgGYjetxBeSE5KgCcnPJmYfnFOJgZl8RqiBwhdlQUeibSbC4Hhsch/LAi
	BFFDXDjyV7XZROCUF6lIm4aQWNTnTCVRwcG4QOEryZDfoesM2L7KpQO+n0oac2Mc+4QnHuoryM6
	SX2nSuZnPMQxz07oyosh5u/HY6vsMbmxyazFRD+OXCxLxBOMghupF+KG1gPvfjjDtX8nNfWjPst
	dSdNNYTLzaqNlcakwHUB44jNvL7baEhpQmOZXbf5PCdRNhsB2DhJY93QUIsodUDkRLK5TL7gfqa
	EuzpSwXAQOU2vcqHzbK6XBO0kiSC6cwMRe1scH8ioZ7jHlx1YLjHN+jir5tUn5kbpDK1CZ/Q32P
	XSrtfdQiT6kdKrWoOasYhZN6LOwxCNHSc9TEPcgKh68oaSEDpUGmkd0N7dYAxIrr4coI9l5pE1T
	qbBjP7Qe3jt4dITI8yJEqqd9Nw8vUPSVUs2rSOPaF823ph7oJiauN9ON3ZbKI3PDHyL/U/NqM=
X-Received: by 2002:a05:6000:2c05:b0:47f:9763:9864 with SMTP id ffacd0b85a97d-47fbabee850mr2432854f8f.19.1785325133163;
        Wed, 29 Jul 2026 04:38:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm7702125f8f.18.2026.07.29.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:38:52 -0700 (PDT)
Message-ID: <f77aab11-0e1b-4962-9d53-0bb2fcd6486a@linaro.org>
Date: Wed, 29 Jul 2026 12:38:50 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
To: Frank.Li@oss.nxp.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
 <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2026 15:17, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.
> 
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix typo simplify
> - collect andy, gouniou and loic's review tags
> ---
>   drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
>   static int camss_parse_ports(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> -	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>   	int ret;
>   
> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>   		struct camss_async_subdev *csd;
>   
>   		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
>   						      typeof(*csd));
> -		if (IS_ERR(csd)) {
> -			ret = PTR_ERR(csd);
> -			goto err_cleanup;
> -		}
> +		if (IS_ERR(csd))
> +			return PTR_ERR(csd);
>   
>   		ret = camss_parse_endpoint_node(dev, ep, csd);
>   		if (ret < 0)
> -			goto err_cleanup;
> +			return ret;
>   	}
>   
>   	return 0;
> -
> -err_cleanup:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>   }
>   
>   /*
> 
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
