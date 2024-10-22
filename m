Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A61BD000
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729616157; cv=none; b=dEtymO99tO+9eWxUwh0YdQjtsUOnbDccmtdVyBUZdZGSj1RpIpi7vJrD+iyC+XGyIDvHGu9r4fexCx9RAqT0XNTfhyPnA1oNSEG/3dhgwl6rdqFplTjSS3ipuxvB0hxJ7sC5GU5WaXOrCWlRr0lC9GCmWktIWuu4RgU7bd7wagA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729616157; c=relaxed/simple;
	bh=8PsFgcVh66Lr0J3dPKY3GShM1TAUBn3LVhw/87ZVtJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+VYUbZ7Ep29VMKhczAs/YzAM01bsAc96InlSArfgMw3tT5HBL2eqSDB5u/jXXvumKAGD/msekXgkYX5hqqMu9lZ0Lfw20ZJm77Q8gyAev3W5+X3FkOWKXssteQydIOIIG4eB4+Ta610j0tYQ7Ydzx59xOc+T7LHQxOiOaQBslE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uaqCd4MW; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uaqCd4MW"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-28854674160so2546517fac.2
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729616154; x=1730220954; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zskhD/XRFsF8+SNavxZpLN+TdPJ3gjMLO/S0bb2gB5s=;
        b=uaqCd4MWtnbDzdLaIHmQUoHyOeK3gm7/hpMZQxwI6ywiuJvKx8dsQU6MVpk3X0Ltx8
         EQLReglos7U6lcpvqkR5v+3Ek4fdxeDhUUHPTvmYLydl3Yog8bs/afcBsaeiQBvVY1tA
         yRCVOuErjbHLppRh/HEgGa5v8NL6tzKICww9FZv2o/tVZsL39x6+JE4ucn4l8WuA87+F
         ONR/SAs4h9KKhbLWg0eVoWBMT2szz09znvZCb71kAqOqb9/FYBojgF+sS/K2fL6NPjJ1
         54VWTQ58+L1bPzh+jCCrF9Zm/pv4vH38iLgnBEQqGOrO3NZkfER9KZZhwhqKu70BEDpn
         6+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616154; x=1730220954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zskhD/XRFsF8+SNavxZpLN+TdPJ3gjMLO/S0bb2gB5s=;
        b=SzoYKWK0gUAx5Dr2fzRHCEgg+/IQ1pE/T5E8svGx7rAgxSFrB76delxLCfUtqa9Hxm
         Fn6sWR9TXxqF1GEqOSSn3gkWflM/6HiD3tJQh7kTiItN7JI+MXHhav0bBwFX2JJkg+mu
         InKwqj9bJek80W6MpTki4sRBYmPsDVwTXOnPFSHsuwgtP1leNlW6yXWMWRLLDo2sO42F
         jIUy9/r2z8zojNMsG4ZEZNRBz8dc84TAOACWbPpU4alF2vXpliTGSQvQOT3MPctmxrOd
         gdjE2+qyL3cFCHf7CunExORTqqCD8SM5JOHJFUWjOMqa6nh3FdGbELtBeOCcz/OAlJi3
         CYpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbzgAKPnqLqSV9vC8NWWEiuB1mKho3LlJdfwTd6Ab6r4wnf6EqS+1Wzrh8eOyuVQLIFa0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlZZ9l4or31yItMUstIL2yfCAqaMdnJyXNfRHc6Fda7quFQRkJ
	k8M8vh0Wff8qFAduNX+w/cD3EemJVnL/div9loXg3PgWsPMsaHKfhamzIGtTkQ==
X-Google-Smtp-Source: AGHT+IFKRfaJmVMFGvKwHBrjJenW7+/BJEzp7GEOtf7Mc+QC+1nScED+0joTknXDkn7LCJudmbfjfg==
X-Received: by 2002:a05:6871:b11:b0:270:1fc6:18 with SMTP id 586e51a60fabf-28cafeb6995mr3491513fac.3.1729616154369;
        Tue, 22 Oct 2024 09:55:54 -0700 (PDT)
Received: from thinkpad ([36.255.17.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ed9957ba9csm424994a12.82.2024.10.22.09.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:55:53 -0700 (PDT)
Date: Tue, 22 Oct 2024 22:25:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kw@linux.com, bhelgaas@google.com, lpieralisi@kernel.org,
	frank.li@nxp.com, l.stach@pengutronix.de, robh+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
	s.hauer@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 4/9] PCI: imx6: Correct controller_id generation logic
 for i.MX7D
Message-ID: <20241022165548.6qhxt7dsd7m7i2tv@thinkpad>
References: <1728981213-8771-1-git-send-email-hongxing.zhu@nxp.com>
 <1728981213-8771-5-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1728981213-8771-5-git-send-email-hongxing.zhu@nxp.com>

On Tue, Oct 15, 2024 at 04:33:28PM +0800, Richard Zhu wrote:
> i.MX7D only has one PCIe controller, so controller_id should always be 0.
> The previous code is incorrect although yielding the correct result. Fix by
> removing IMX7D from the switch case branch.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 2ae6fa4b5d32..ca8714c625fe 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1338,7 +1338,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	switch (imx_pcie->drvdata->variant) {
>  	case IMX8MQ:
>  	case IMX8MQ_EP:
> -	case IMX7D:
>  		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)

This is just *wrong*. You cannot hardcode the MMIO address in the driver. Even
though this code is old, you should fix it instead of building on top of it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
