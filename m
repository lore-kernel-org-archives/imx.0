Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2422248A4
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 23:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499892; cv=none; b=j8BRxF9ZDEbBhNLn8mknr1jFHItS0VrdV9DwrEoOkxN26rJi3CZJWpcs2JFF4E3hq5ARXD25coQHxFTl/YBb099jdryqRvoWZklwEnDDu3ekbTPsW0qrijCmM4tv87QW33qnVYnrl/GL+tnPDvLh6uFaEby9ty/zUcfR0WflXnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499892; c=relaxed/simple;
	bh=a2SRtuVRS/HLPzU8Ge04SiDKs+8BwbnIB5UtLtui59k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgxmHAMIA7v3Q0ZkxOlvehEk3DaWU2u73Fs58jhv9kdjZddiELyGGjEGKjEulK3KZnvqZEvCeRXDinJMTL3AeBLw4uuixxzHfJoRVAfhN8Lel/YBIQp/w+UwnTqx4wTKF2pyeASLy9HPfX1DpYsqz7YIkU3aUizA9tcSCaACEWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PhrWh6/v; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PhrWh6/v"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234b9dfb842so47352375ad.1
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751499891; x=1752104691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vanWsN1emZdC7WvHI8auaA9LR0vVsRUHovcfBS3pZr0=;
        b=PhrWh6/v+/5oyV7VHqVcAspjXdYqEm6e4l6Nk+di1a9aIpmy+ei1umHctSH4ZYrF4S
         PuXO4pvp52X29foOKBjk+Y/p7RyCU3iZWZV5a2Tqmm6lTj7tb9cubDkpp5Zlz+IkfLth
         wGUSSAg59AvMUsIwby6w/2AodNp/e/6eWrw7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751499891; x=1752104691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vanWsN1emZdC7WvHI8auaA9LR0vVsRUHovcfBS3pZr0=;
        b=dUfscRIpM8n1hYn7eNIlwBCtw0AoSjjoGX5ZHyL9BJtK4e4amDmdYBJejDxtbv1Ibp
         PNXPFI5yNRZEc7NeEg2o08vMcth9fvfDAFRbWiXKUN/LJMl8Wc/A75kgdGaSdzCZC+EN
         QCdK3LZmPV0QJr3h53ouCjTwQUxwvRuT1S0mHzDAIKNcnO6jTwPTolrhOwl5HFAgXJqv
         Kjt81tc28cNcwIzIRA3m8m4aikZ4l+VeugwWq18zz56Sd9BUEk6m8HYTMnJuJLiIeTv+
         6mZHp5JP1oYxFyLuLxTIVd+ar8+pW62fnVb/4Zl8kTdIQOAhhfW2aaGMOpKY2HaRP/eK
         +DDw==
X-Forwarded-Encrypted: i=1; AJvYcCXPaTkklrc1Ao1bZFhHDt+jQhW6Q84qfxpWIn98WxmADh4fYiRALM0/i3kZDySlGQ/zwjU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnypdeDGnbHD0qHzpNz7YvRR8CVjvluqAxdTFe24P3ZMqG0s6/
	CY9YQKb9Ace3CDFJjczbnRncOuGqIw7u+ydC4Hb/lgH9QgKy2Xa+6ZU+BzEog665pUNLvVY5MQK
	wo/Q=
X-Gm-Gg: ASbGncvTwJAEcHey9tkj4hu1mZcFv09N9WEuBuj1rbMTYaBzQAQiA5ts4XvBhEZnB3N
	52qg2fHKfaSJ7jwTePgj5H3PIweDsyA+51onY0SnqYG5HXST2btwI8SnTOmdya8/S3JBV72ClyV
	lwXLfQhFbaSsKrrcP3EacbtUs+aVWxmx/iIQMttUw8OhqZtU8NeNUGcNg819EDAmqcIrv9qGBQx
	uAbmd+5xCFg4qQXSyjT2/76o7kvcGNiTkk/S6p0cLOXFAJusK5p6TRJ00HKpXmG9ik82Dxv6i7E
	yVVzvLBqBq7E6PF9i9PzrX2sgjyYwFt3eJEUHOb+PL5H6bdkHgUKCHH6f1IGMcv8kBLV9F7H/Mw
	HXcmEA8fIZFFwibMonhoCBEs=
X-Google-Smtp-Source: AGHT+IHAbh7yfBcGE4yDekozSUVOzD8QebMbZWphEoS8ksZ7G3iEiRoD5zJ4t1CNF4QF5162Eg9V3Q==
X-Received: by 2002:a17:903:8c6:b0:236:6f43:7047 with SMTP id d9443c01a7336-23c6e4d316bmr63201095ad.9.1751499890733;
        Wed, 02 Jul 2025 16:44:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:a88f:fae1:55b0:d25])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2f3541sm146949875ad.88.2025.07.02.16.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 16:44:49 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:44:48 -0700
From: Brian Norris <briannorris@chromium.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Rob Herring <robh+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: Re: Does dwc/pci-layerscape.c support AER?
Message-ID: <aGXEcHTfT2k2ayAj@google.com>
References: <20250702223841.GA1905230@bhelgaas>
 <aGW8NnHUlfv1NO3g@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGW8NnHUlfv1NO3g@lizhi-Precision-Tower-5810>

Hi Frank,

On Wed, Jul 02, 2025 at 07:09:42PM -0400, Frank Li wrote:
> > Does the AER driver actually work on these platforms?
...
> There are several attempts to upstream customer Aer irq support in past years.
> 
> For example:
>   https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1161848.html
> 
> some change port drivers.
> 
> If you think it is valuable to support customer AER IRQ support, I can restart
> this work.

Interesting thread. I read through it, but I'm still not convinced about
one detail:

Are you sure that AER can't possibly work over MSI? Even today, the
Synopsys manuals say that their integrated MSI receiver "terminate[s]
inbound MSI requests (received on the RX wire)" and after terminating,
"an interrupt is signaled locally through the msi_ctrl_int output."

That means that their msi_ctrl_int signal only handles MSI requests from
downstream functions, and it implies that the default
drivers/pci/controller/dwc/pcie-designware-host.c
dw_pcie_msi_domain_info implementation will not actually see MSIs from
the root port (such as PME and AER). So yes, it *appears* that AER does
not work over MSI.

But crucially, it does *not* mean that the port will not generate valid
MSI requests, if you have some kind of logic that will receive it. So
for instance, I pointed out in another reply that some SoCs choose to
hook up GIC ITS:

 commit 9c4cd0aef259 ("arm64: dts: qcom: x1e80100: enable GICv3 ITS for
 PCIe")

"""
    Note that using the GIC ITS on x1e80100 will cause Advanced Error
    Reporting (AER) interrupts to be received on errors unlike when using
    the internal MSI controller. Consequently, notifications about
    (correctable) errors may now be logged for errors that previously went
    unnoticed.
"""

And in fact, your arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi seems
to be doing the same. I'd be surprised if these port MSIs still don't
work after that.

OTOH, I do also believe there are SoCs where DWC PCIe is available, but
there is no external MSI controller, and so that same problem still may
exist. I may even have such SoCs available...

Brian
