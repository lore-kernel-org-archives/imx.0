Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0435132114
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724833894; cv=none; b=iTuqQhSzE6Shk2dZ90UXVW9sn4QfY1TtIq/iMVXK1V5cOTdLFr58zsph6wH4C/zBttqSQPWDMcFBciTT3k9vmFnnd7zc3hFIUIKniJKlFnUOuEub8+IV48gW2ULkGTSmzMwj2KAgVklq3m4yzSm4F2jRAA70dpO+uRXvpxWk1mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724833894; c=relaxed/simple;
	bh=gjsYJdp7ScKwKcIE4Uu+ggF9Axf9/49wqI34k9cojGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUxCruB6bL4265D4JHOITZT+5dKllv6aEpbxH6vWj3SKf0+NwczN0dqmKHc0Rtn4eL31h7aNsOJnjR4UUsqXV1VmuSlDIhWZuoNoWpfUDYgC1+r8xK6qg8NAuJUEfvHDbdPoYMEedZk1F69o29QWx0UVd+mIJ7ieO9F58wwDarg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmUAxisk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmUAxisk"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a866cea40c4so739108466b.0
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724833889; x=1725438689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3c7NVkKcmxAMyio8/L9pzMWp9IJ9Pqc+LaOhJRGv9yg=;
        b=mmUAxiskWlz8D/IEdKnZmNH/FN1LxdFn9F8kK1yaftG26zyCC/S9Vqb16dqZ81DG2Z
         EQzkvAWXCWxncDUuLDUjAMs2etMAUP9wViJTCoXAUlkacLUBxjbNQRcWcP8KJ5TGsHP3
         E8pxWEqOcmvLWLwwdfDJUAY/8R2PAhCL+zCOmN9nPP6Dt5Mbchz9vPEFM0Ocjz6caGsA
         t4jzPjXdL5aPSV1IW8uOyDBgRiO6tRXWW6I3Z86NnBWzSsM80Ui3GTRdJmjIHVzikZKj
         LCfr870yutu+Mi5jMg8D+Dim+IQ0jmtDNzJIlcQdvOKyKDq4nagDJyo8nOWYTCyp5cD5
         BDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724833889; x=1725438689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c7NVkKcmxAMyio8/L9pzMWp9IJ9Pqc+LaOhJRGv9yg=;
        b=Uuw5imTG+cKVJ+s2t3BSGa7lQSaAI4ApsSuW8CPDIxmgwGpY315qW2dxaP0kpGiog7
         UTSoFcS3VICUFzYFsp4oQlI3QJAfWeYF4Xo0PM1RidUlq6o/VFkHCEE6lVJeLw/f9TcH
         dLoSqmwKvzUmW3UgvmOUXSlBZOigM5SugF0GBqyzKTkiVKNZllOXYnbRlTJ4ijXGy9XJ
         QQLngIMRNQYUZlsrPIucaGKcrlgfjC04i7DHZLqI040LWAFiVBkypClpU2P5ds/l7a15
         bwrVbA/7OvkH+tbjUx4rQVCbBpPI/XUlJsUvnzCv1aMNR78rYcT9ix4voEDwc5HRHlo0
         FmjA==
X-Forwarded-Encrypted: i=1; AJvYcCXfki9x6/aAcCjdrwfiyOT0FoMm/FFpee5WINcLmYdyFIQNoHoi6310EjvmWcP/Sw/4bdw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPUiQQXY6SSBEtIywLWV/yCcxXaTH+d01IFxN0X+sLfv9PIcPv
	zUQRh88mZt1ieLrFnwYLLn1H+Bai5tnOkZqkbQD7XqtK9F56d9LCBpP2rKAbFJg=
X-Google-Smtp-Source: AGHT+IGObeLl3j0bnFYb8shzD2k1t7YBRB0S+K2t7vP1NBHH1oO3NjvEy1RtpFlfZhpgj6jiJ48fgA==
X-Received: by 2002:a17:907:c0f:b0:a86:c111:cc35 with SMTP id a640c23a62f3a-a86c111cfb5mr901917966b.50.1724833888846;
        Wed, 28 Aug 2024 01:31:28 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549d10fsm212595766b.54.2024.08.28.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 01:31:28 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:31:26 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Diogo Manuel Pais Silva <diogo.pais@ttcontrol.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	"abelvesa@kernel.org" <abelvesa@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"EMC: linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: imx8qxp: Defer instead of failing probe
Message-ID: <Zs7gXhohOyQ/abOf@linaro.org>
References: <DU0PR01MB93828B0E6808E33C608BC0E29DD32@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <AM6PR04MB5941651E3920794104B3D24F88D32@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <DU0PR01MB9382F1AC496F22A20C074BDE9DDC2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR01MB9382F1AC496F22A20C074BDE9DDC2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>

On 24-07-02 08:10:44, Diogo Manuel Pais Silva wrote:
> When of_clk_parent_fill is ran without all the parent clocks having been probed then the probe function will return -EINVAL, making it so that the probe isn't attempted again. As fw_devlink is on by default this does not usually happen, but if fw_devlink is disabled then it is very possible that the parent clock will be probed after the lpcg first attempt.
> 
> Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>

This patch doesn't apply cleanly.

Please respin.

Thanks!

> ---
> v2: change from dev_warn to dev_err_probe
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index d0ccaa040225..7bd9b745edbe 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  
>  	ret = of_clk_parent_fill(np, parent_names, count);
>  	if (ret != count) {
> -		dev_err(&pdev->dev, "failed to get clock parent names\n");
> -		return count;
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +				"failed to get all clock parent names\n");
>  	}
>  
>  	ret = of_property_read_string_array(np, "clock-output-names",
> -- 
> 2.34.1
