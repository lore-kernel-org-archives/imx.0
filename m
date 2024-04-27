Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1604642D
	for <imx@lists.linux.dev>; Sat, 27 Apr 2024 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714210430; cv=none; b=r2j5AjP8LLrS3I1TDRYFHjSs6li7CIEXjfzF6U6CXvo8xsC7gKPVlX+KoWxvS/b7Da/yLzmR4HlIO1fONn9/8eAYR6u5qxfoZnjaR8G4j9hHIPnf2Lkn/33DA6J+ZhqJK3MBzeFiLLUS8yqCKAJAgx0rq9ioYNP35pIDdpa3PHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714210430; c=relaxed/simple;
	bh=Miw7hc5GB+267q55Huzr5s6mRn9tnVsaVR6HdF6ZL2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swC82qxlDHXl6//4Jy2hbwI8MYU02r67uHlMGXO4LvCcqUD6XtNVgH/xqDt5/ec/AwhnO4HSjC2hjg3rUEBBkll06b1S7zfnVRL+T2ICZj9NCiGUaSQyEdMK1FOf6s7WTvajJroDLsn0G1Rw7a9s8/9FajtE8FQQhLwzwUzixdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iboznVoh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iboznVoh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e3e84a302eso23069905ad.0
        for <imx@lists.linux.dev>; Sat, 27 Apr 2024 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714210428; x=1714815228; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xcGWu0Qd+VKYUbfzlOh1vmNPNKKTWpUhtERS9P99/fA=;
        b=iboznVohOfgjoTkekEOhwBLXiAM9W1YLP5M+sjX8lJDcWqc/jYZeo0cyZQ773pat2d
         xbUs8zlRB32CzvY1JnjFAZRO+SxKSDCouYIPrM+2DUIq0EUXtwcV8D9bXQqllgNK7+yo
         +I02PCFSYz9A+MHR4TzUddymLDdTX/tMway16e3Y/RZ0CDKxryTyASQWBPOKd/PgF/Bj
         O1V2+c9tU/5nM/TPR9FjuX/0tk5uVsmZyUNDvJvA96u4IC31WYKUALVsbDOcabMoLpdp
         sRc40QltoDECy3Rc2l2G7CJM4kbcUBZTAO8v1Yx31ikGGPGQBNTdLZVhrua9RBesFx0c
         7M5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714210428; x=1714815228;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcGWu0Qd+VKYUbfzlOh1vmNPNKKTWpUhtERS9P99/fA=;
        b=igoSmqEWZM0Jiw8zdil1zDbFvphlz1iNPI/GSB6ILyhLW327x/o7oil2MBNjkIv0R0
         8lZyIbRt7/4p3dhHx1uMwPjCcsYfqtz4zoZkRDr7yro5r6HeE5WaOENZVLRsOLLY5860
         gB4zbQ7lmxaVdyzyUvvRyJo87v6k5fqinGJVRYcY9t5nkaSPhu6An1VuhQXzarKoQL7v
         m2iRnF4DQUaM0oj+F4KiVFAstI2dyG/20iyl8U/xd3Y7oWbbSER9VkRYrk6iXmi3Ioy5
         gTcV/GMlUltv2BrXqtTgH7LJDUBvzIcehElkWDvAd22nqlmxejjry8/P9rSQrMgtfTM3
         uvqw==
X-Forwarded-Encrypted: i=1; AJvYcCUEJ6z0jTQLX52kAPz0I4VQqL7Y8w59YcshYOV1R2KJzvTNRxA+jqZVo1NZ0/sDaN/AgWylva/0PmsyHM+HY7eDKc/a
X-Gm-Message-State: AOJu0Yw6f2E60CyTzFwmHbZc2GchfkGj1wPLn0GZBQJiknLpaxIkLhBf
	csyW7OHwpzT2Pks81lwQ6EnvZzNxgns69k7kxzNAwTW3fZT4uF1uBpgFwWLgRg==
X-Google-Smtp-Source: AGHT+IHEgFcFYTWrCb8oOy/T7GvDZXiPS2vYVXc1VHEpHHfPR/Jn0v3TSW+ktgEofQzf5auO4mceIw==
X-Received: by 2002:a17:902:f78d:b0:1eb:527e:a8ad with SMTP id q13-20020a170902f78d00b001eb527ea8admr1948983pln.51.1714210427762;
        Sat, 27 Apr 2024 02:33:47 -0700 (PDT)
Received: from thinkpad ([117.213.97.210])
        by smtp.gmail.com with ESMTPSA id mq8-20020a170902fd4800b001e23fcdebe9sm16790001plb.98.2024.04.27.02.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 02:33:47 -0700 (PDT)
Date: Sat, 27 Apr 2024 15:03:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 05/11] MAINTAINERS: pci: imx: update imx6* to imx*
 since rename driver file
Message-ID: <20240427093336.GJ1981@thinkpad>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
 <20240402-pci2_upstream-v3-5-803414bdb430@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402-pci2_upstream-v3-5-803414bdb430@nxp.com>

On Tue, Apr 02, 2024 at 10:33:41AM -0400, Frank Li wrote:
> Add me to imx pcie driver maintainer.
> Add mail list imx@lists.linux.dev.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

The driver name changing part should be dropped. But adding a co-maintainer,
warrants an ACK from previous maintainers.

- Mani

> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d1052fa6a692..59a409dd604d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16736,14 +16736,16 @@ F:	drivers/pci/controller/pci-host-generic.c
>  
>  PCI DRIVER FOR IMX6
>  M:	Richard Zhu <hongxing.zhu@nxp.com>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Lucas Stach <l.stach@pengutronix.de>
>  L:	linux-pci@vger.kernel.org
> +L:	imx@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
>  F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
>  F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> -F:	drivers/pci/controller/dwc/*imx6*
> +F:	drivers/pci/controller/dwc/*imx*
>  
>  PCI DRIVER FOR INTEL IXP4XX
>  M:	Linus Walleij <linus.walleij@linaro.org>
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
