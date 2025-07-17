Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D936F2F7D0B
	for <imx@lists.linux.dev>; Thu, 17 Jul 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752763729; cv=none; b=WPD262h3tPzrLmOCmMnJuKAR87rBR54yI6MiF4Xvb/VE1pbhE/n4Pus4U20i4qfGfPQpR7r4UkFoZb45DxUfCkkubJPY/IgynpiPaYyrthFmKomUnp2PRmJBi20DwoWg/RI5SsuH3pqqHVLtg7wh2RVjHRlCn8W2Mca2BfQWE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752763729; c=relaxed/simple;
	bh=ldkUDsWevUUrBgtiC0hxtuONfzCw4mF+Y3RShzs3xlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxjmxWsnELrOin12cqUcAZkS45WQ1u22ykRuhEg0BjCisYG0ylgij56oPnHosEdkOdXfjcmfS6e/aSz+tRRkaYcomnLUNkKSxiXfMynkyBs0+l74XauX7pqt0rfn/TFOygJOrB5nBKX/IA8awO68CxyXgZrXQBT/gj7ZNzhEVJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xulfE0LR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xulfE0LR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3be5c0eb99so842942a12.1
        for <imx@lists.linux.dev>; Thu, 17 Jul 2025 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752763727; x=1753368527; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ7IJB52s/jxggmQRLZiB7BTzZN6vUYP9vPaGdcZBU4=;
        b=xulfE0LRJz8W4E16/CvKx7C/uQFq7F6xdLE9eChfgVhl2+TZheM41Z0zCHfSqzAw8I
         K+0iqovivnF3sjktBG+ZqxBVTq6ZDSlLb2mWQeAVlPRdeyq7OvaL9Dn/Myy3cK7awOMo
         GRDZUQpK3GpDXiBrOBYyCbygEJkhJtT5Nr8iA/EA2EoVX4t0W1vQW/84HgVoFEqriXAp
         DXkyKDdtFljOGXm2tzD8T7H9mU2LubZTZ+7W8CYW3y9HY3rlLtCpeQhOwfNFzqZ2rGRS
         aK2kSZdl5USmhpZf/8X+0qi5gm+YyrcMJT7lKsrrcfNTRGQtQ1w7frchNRxvphtQTdGL
         3bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763727; x=1753368527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ7IJB52s/jxggmQRLZiB7BTzZN6vUYP9vPaGdcZBU4=;
        b=DjBlE6nic8PPcHFj3ycu4yEjRW6tvlMrgBHEH5efVuBa2jaGj6L4QKGhHo5XLtCclD
         BDp6pGUb/Zvv7Sd3HsKEdvzbtz1KB6Iwxd9dXeCg8WiqZyPkOZXiWPd7mwq/qTQyIyR5
         gUQrtfs6frG4fJoMnFRgrLhkLVtwCmaba2Pvd9kqGW25c/MAjPTXOLQw4vDCdoel3pTa
         +LsLQ313B0qSDljETbfYAAlNfstUVnobnQmrK2ai5Ulv3mQ/J+Yqn43t1pqslWk3wKox
         a65KMO4RNhxTDME7UQp2iV1yVx+oCQXVlYJNemykWppMwBdw4tZnaX34eT44oJz+KF7d
         ehlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlEqk8CJ2iqdKja7ycbMLDiSFal5yDDnYibgqCHBluEAv0Bbxm0U1Oms6OSu3tIDfMf8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcUJ3tjVasjgxktGtYOqLneHAgU/6AoKY3ZV1c1CyzjkJk8XG/
	hLHQ0WFu8ED7lP9DvbHu9UPAAiwxQP+6ojS9BUczvWylQ71zj0dSg/F/UTIrbVasMT0=
X-Gm-Gg: ASbGncvIxNqP05PnsWS8YOQEmlSt8YUxjXNwcX1sk/+94c5vYYeLOc6wfzz74z/uusm
	29aaMbvu2wjyNOGBa6W0MIzwr2SXkCgGSiuxtv8Dvq/l12olyQW7J3nk4r+dK3AKkREDMbXioYK
	ZWsSNkZTtleuTrmpkko/J5qutQMdeKlDJLFfkNROwtvUr7N1sUZez8P0Xk2pim8IvA/FcevLF7j
	qrkKM+6d23px93pPFuC56BgAUhdbo15WZtFg2XJulRFi1VkCVamaVXAvyPEohxygf54uRPTByQV
	UvRkdZJ/QUlfq/s61Jo4R5oAzrDBikOKAOfv9ZnF2c8UFqFxK9vxwBY2HqSeCPyw1E1UqjPjzwd
	Yo2PTODtfhdTWOWjTI9gEk2WC
X-Google-Smtp-Source: AGHT+IHN4pdN+q1y537irHaqdVIJwMrH6auGVoGM+UN248YAGpQVjPDa0P891RmdfAyjRaEDEvnJPg==
X-Received: by 2002:a17:90b:3d05:b0:311:c1ec:7cfd with SMTP id 98e67ed59e1d1-31c9e76bb39mr9637297a91.26.1752763726789;
        Thu, 17 Jul 2025 07:48:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e0c8:a1e8:3882:b37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e684csm3578940a91.12.2025.07.17.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:48:46 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:48:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <aHkNS51jgV5ulsNB@p14s>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
> > 
> [...] 
> > New warnings running 'make CHECK_DTBS=y for
> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> > a7123e857dfb@nxp.com:
> > 
> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> > scmi (arm,scmi): Unevaluated properties are not allowed
> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> > unexpected)
> 
> Same as replied in v3.
> This is because [1] is still not picked, not because of my patchset.

I won't move on this patchset until this is resolved.

> 
> [1]https://lore.kernel.org/imx/20250513-whimsical-almond-quoll-e3ad5b@sudeepholla/
> 
> Thanks,
> Peng.
