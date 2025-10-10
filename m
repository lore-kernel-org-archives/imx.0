Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BD1246BD5
	for <imx@lists.linux.dev>; Fri, 10 Oct 2025 16:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113872; cv=none; b=GITEJkKU6aIsPiAZtCro8CGmwOYZ+8mp1ezgENCq+fQGfcGPQ781GGyM+LQbL8BaS0KDbD3Qh0UlL0yIXqGh67xhpzdR28VTBeKQ/cayJ03Yubzl0c/eAcL4gFVPndEntfPE414ERMPoi8TbSMJnx6gnQZmFkps7VaXNA1LFZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113872; c=relaxed/simple;
	bh=sWau8pOuRYNhtAxbaAcaiNz5CW5zfAxPFLtnnDYBKqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3HuqTHyLDzg50zelNfDVYOAr27NePEkOyIwy1UvZpFa0dt6XB6osF/lsT9r98TTOg9b/JTgd8066MLtebHRtIM71ZB8yEEyEgZ3w9SrvLDdVPsSyMh9YPGst+Stx80Ox98lG2g6hsNbgyNP9IsLcucKOFP8p3EYAICKmTerpgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RSh1X+74; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSh1X+74"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27ee41e0798so36451255ad.1
        for <imx@lists.linux.dev>; Fri, 10 Oct 2025 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113870; x=1760718670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PErgUidAcsRKwUXeMVve1SYZIwtC3TkFLkv19Pikhc=;
        b=RSh1X+74ptet4k757VoNYRDkPud6y5VMwZpCRjvH01UWCdJK6Q3mT1ywo0oXZXAsGi
         NZJ/v8rB7YbbWY+Z6nOL5Pxc3KUdjQ9P5PI+sTLGHj6sbyzm7eg3dPi2hv5HhrJgCpaJ
         At1guuRu+Rs7DpUufTNZgiTNOfEJHGtUTe+S0Ygvyjuk4V7lS1Pv9VZ/nKoWUbcp0Mr0
         6Xm4cbcYrT+ZVWbcwVP0g2STU2677PlFld+TKXbxjhVqmlsUSq2Pom9e+0VTlCGYDv6b
         2eeK5Uwt0JohtMs0jZqxWkWNPdCI9UhrM7gnOrnni5Wpj5ZTdePFh8dkWeWBkSAI1+eA
         nItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113870; x=1760718670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PErgUidAcsRKwUXeMVve1SYZIwtC3TkFLkv19Pikhc=;
        b=du4wZlE9a//It82lyuIgl5W9v+53GzFKkR75aDlbEyFJQY24b1S+gIZRL9ZkmkoeCC
         n2KJHMQiZq5CJoQRR/3zT1AnTeMIFSUCIEMj3OOcZzM+JstBXi0RX00Nrl15dUMdQx9T
         tF6p9YakBpvVgVuI5UUSdZkOyqH/NmmVeOQUS1CLLIy3nIv2DxRHIRcS/YR3OAVQ4Ft7
         36EmYLx8D//Bhieh5JTK7u+1zGzqO8uNjdPm/UdmCUOrXbYIa4xXRZDas24OVvwfaAzX
         eUFeGC5Ffbbz3u2wgETlQ9TDcQcxrSuCLplkDNFFWRK+gLkl3T7Ikadlpf4v1Dnnr/76
         XrMw==
X-Forwarded-Encrypted: i=1; AJvYcCU271hr22B7itEFsQMZWMxUtgxNoNaHyrHWkLO9vJhJU+V2n0rPSGlE4U2bzVuXttbtWwg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Ikimnizri+TpYHX75EBSxUXXrQyL8ql68UStXdHm9q3i+lIz
	Oqo9EJYXdDJ7iYHAJ67NarAb2/Zw28gj4j75crDRfvj+D4pNQ602F/bbce6v4tynoP0=
X-Gm-Gg: ASbGncvKY3l/Bg0tVGiOMskLH3hThMQCXBWlYFv8topbgXHJeiJ13DR7uMWAnWF5HTq
	Qe7JtOPdLXy8F4KeEuR0OnMkQrKuMv7MaQomhQfe9EmJLiW8n2FG5OhRBxDM8BHOaADfvdRfhjM
	OLSBVBtNPdRcjAx6cZlb2gZPMDqTHOXjjXVG45tByKx28udBSgGnr0PorpCM+XORabeVFuds8P+
	QQCxbmKSpfnSzxDyYAdpOWN5OKDt+DMifTaN345aiETo8Cuy8nTqd5o10PC85txRzsgzE6+9A2v
	uBDC2tvmJ1ldOuzD9CkQDZxfoRAfBL0y65PnNvUpcT6ir8VbVMAuh+eXHC/CHuMRDihl5ideOQv
	2TgzL8uYXlmRCqrqyb89Ftjo5kCeFSRSinrMVyWYzQfZLXPQ=
X-Google-Smtp-Source: AGHT+IEy8L6TDg54FExTrOyXceAe8pz/QOf459ho/0ZYB36VftdLiczXdkNEiG5CFEJM6POervy4bQ==
X-Received: by 2002:a17:902:fc46:b0:27e:ef12:6e94 with SMTP id d9443c01a7336-29027418f97mr152883735ad.55.1760113870428;
        Fri, 10 Oct 2025 09:31:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ad30:d3d9:45c5:4a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm61182205ad.121.2025.10.10.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:31:09 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:31:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <aOk0y8xTi9hoGvyX@p14s>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>

On Fri, Oct 10, 2025 at 12:58:38AM +0200, Andrew Lunn wrote:
> On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> > On i.MX SoCs, the system may include two processors:
> > 	- An MCU running an RTOS
> > 	- An MPU running Linux
> > 
> > These processors communicate via the RPMSG protocol.
> > The driver implements the standard GPIO interface, allowing
> > the Linux side to control GPIO controllers which reside in
> > the remote processor via RPMSG protocol.
> 
> I've not seen the discussion on earlier versions of this patchset, so
> i might be asking something already asked and answered. Sorry if i am.
> 
> Is there anything IMX specific in here? This appears to be the first
> RPMSG GPIO driver. Do we have the opportunity here to define a
> protocol for all future RPMSG GPIO drivers, which any/all vendors
> should follow, so we don't have lots of different implementations of
> basically they same thing? So this would become gpio-rpmsg.c and a
> Document somewhere describing the protocol?
>

I haven't looked at this patchset yet but I think Andrew's proposal has merit.
 
> 	Andrew
