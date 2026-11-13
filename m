Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599238;
	b=X3fegcRkF5V6ji5pM8wcF4CWyjEffcDVhGRXUhEYNtSopmVveFGArZNKnjnV6KbKk+Eg
	 paZpMgunuTj1XYr/2eBr6x/f0cX+OIyrhZoGDMpgjzB49FuRvrNsV63PlzQhVEqHzRf22
	 OdgeCL7CfbPIVWy2qZ6OggwU1n/Gq/byCYzMqENagavNjqhNggvsKKlNj6GmKUFWbeNSA
	 PTdZRI0ysWpT3DnxgOQHdt33kZh8JOW4gPybf2JmJ6P4hGnrkNWDf68Ve9jHBjH7Zf5Wk
	 NErYrX3F0LS6e6QJjf3VABbSIRXOm3cYHTv/i7gd3QsAOWy4KPvZdi618J0qPu392zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
	b=D2x6iI4J/46mXDJDlYInHtaUwXh25IEMDlkubd+I+KQ96iOUZsuDc1DwYju85ERSyM4T
	 9M+ag6lMN0YkCDSbpjp+WudA1A+Q94QGnGByuStUb6SqP5ChRkKXUrRP5vAVn/3+HFBA0
	 kZqq4s8qlDx1/i0diNBsnXMZ0iKjQPg4bq/dKrl2tMG9qKqrd5Hp3dcDUi0ytcBGd34EC
	 g/BNCxpT4sUtJOGrCrubt9Nk3hE4FYQQN0WbIDZ4CWJijnWogWf7ShagEwCWo9pz15D1W
	 vaZP9cfvPfYkG/f2Tc4MUizUx9oa93bpglb9+Fvum45YZR2FQool9p5XQtcMb+XK4YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mz9f2jEX;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB7606A32E
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 19:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AACB7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mz9f2jEX
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so2185952eec.1
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 11:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599237; x=1795204037; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=Mz9f2jEXSkI3YTSsonML7eSglOgOIe+eH5acno9vfCBiKP35MqCQp2geCqHMncFS/N
         qfwhnlMS34yZRMCo/6k1Vvg0NzEL1ew0sFZH6ogJ8061VG1ANiBDIk+wPNywTwm1oD7r
         2/5zC5gebaaIgrMSoUYkSFu4NjUZXcm9us8NiOVUIN7P7O05cOLUOSd4K/88sUECs7pb
         29jKY/ep1Gz6BspME/Nfz08Q7syYOO0PZhWBJJEMB/1rQIDeVJZ0nkWTWoXREhtUxOxH
         cldlyfNCkK7S40VortWbXVV1rdgeelQaObFxsC3EzLdHTMpPRRwsPaoRQxVCz54tVl0T
         ywNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599237; x=1795204037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=Bv6XCuffbmu3dozjvhuxIiVhIeie6JtQz/JqKNFRHl8k+AGzmY22XF5xQ/d8sLwsqf
         RMs+dlO+gpd2sjPChjJfp+0Tiil28Kkj48fSj5If2cOghu07vsweca+eBp059FO0nCDx
         vWj72opAOzKRTJW1aRRUK1yNVy4j/gA4JV/uAN+MxIrU6XHif9ua6s9TgOcLDPLhD6yL
         60pLaEJw8VOJM1I30Xyul617CB+OwFbR7N1PvoX196HvfcNBjHayS/yNA9SZywZ/dQvw
         TW9Wbpe/UkncGehJXvs5C2AXGZxdRhM4iJmt8eElVmiY2VP7p6znxfs/ZoGA5BGpxgFh
         Rgmg==
X-Forwarded-Encrypted: i=1; AL+hErHxKeRMyjvVklG3gebDp+U9EPMNr1KRQGXW2RBFGQ9iQ1IeIBCQShHYqagjPQTncMvay7M=@lists.linux.dev
X-Gm-Message-State: APuU4Z9b67NKoAWa9q1iCoXzhV7/u2VZ7zL8D2zrqvTmYwerZodmV3Er
	yZPUZpfcREcQHEUv+fvmKSDAlxP4pIrFWxQOemMSrPRg+PgLYCuKBOWo
X-Gm-Gg: AYBFou3OtP8xDN7TUmi5CqYodWc5SLTm8w2D/0INZ0EwQmdLBy2I1LC2+PmIaaFmsaE
	sPL23F97rDImPWIDykNZyBo4uwI81d8rjiwwZ2wrEcZMAKr9+c53Zu03WG3EBTxmDxDHPlCWfG/
	Dcn70u5IeYoQoE2nrl3xVdqRBuc/8f6ZGBFH49o7stIO712Qf99DuR19DWEZ9bFfJgVqWcwAM6z
	avgDUbVX92FYoLLXMy2SH0bN5wcm/kMbcbyOOdcoh1T1EPKZWMrVM07hDxOQ/DdM2T8DnhiSJLb
	UUwNDUf8JnlMbEI5CkZJwJmcbNkNkIj+sUDxlKZdMWLlktf1dLjoaxpDLZCxAfrOWEEtgMIWysl
	FQKwgLlTRY43D5WOsSyd3mrqXgLOCLFeEz16g7t4mbwYD6D98RTa0Lbg0Zf1ge/4TarJM532MZm
	9yJDrvH1YQ5NOyRsEs3I7fvS3J1qb41YvB+gPC8hA5lyuAKXwxys4bl1TRBnRuGcBxRoJsBhAgY
	OtWDIlONsWypVd0Whk11FhnsmZjL20tgKdrA5gKHWSrBujt9AH/6otos0Zx4Ges9o0CJBZs2RsU
	TnQUmGW/KRp+JZ8WZCnZk7GXz8kCvfulhpaNiEAf1M9JKJQM4WVDGhqteM7c0as/FQ==
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr2832268eec.32.1794599236582;
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Received: from [192.168.35.9] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm10172682eec.14.2026.11.13.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Message-ID: <953597c5-80f6-4ee7-b8db-ec7264d99e40@gmail.com>
Date: Sat, 14 Nov 2026 04:47:09 +0900
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] devfreq: Use %pe to print error pointers
 symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>, rafael@kernel.org,
 krzk@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
 thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org,
 sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net,
 marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org,
 wens@kernel.org, t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Language: ko
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/13/2026 4:11 AM, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
> -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
> gracefully and prints the raw integer value. This makes messages more
> readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/devfreq/imx-bus.c    | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index 49798f542d68..dba76d8b9e5a 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
>  	priv->icc_pdev = platform_device_register_data(
>  			dev, icc_driver_name, -1, NULL, 0);
>  	if (IS_ERR(priv->icc_pdev)) {
> -		dev_err(dev, "failed to register icc provider %s: %ld\n",
> -				icc_driver_name, PTR_ERR(priv->icc_pdev));
> +		dev_err(dev, "failed to register icc provider %s: %pe\n",
> +				icc_driver_name, priv->icc_pdev);
>  		return PTR_ERR(priv->icc_pdev);
>  	}
>  
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index 52beeb5b7d65..28d7c595fa17 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
>  	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
>  		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>  		if (IS_ERR(opp)) {
> -			dev_err(dev, "Failed enumerating OPPs: %ld\n",
> -				PTR_ERR(opp));
> +			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
>  			return PTR_ERR(opp);
>  		}
>  		dev_pm_opp_put(opp);

Hi,

Applied it.

Thanks

