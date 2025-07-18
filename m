Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8A2E62B8
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752858369; cv=none; b=d+am8xMw4yXfp0juxz/3a7C3xAKQhB65G7nkZRcPTk6os6vx8GvONGDoOy6HEMwjrz+Kymno+Jn+I1wbz92TBr/k82hZ/BDrSxtG7edE826uSVI97sxAi+zwBO54R73jB6VG91nLzhBBiNf0Se124QYK3202Ct/YJ+A2fWxRX8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752858369; c=relaxed/simple;
	bh=Z/CQGPwaBrdNdHSZhJcrgxbK3pbQdpjyWovr+/jbCCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2FrsY9Nakp6erhlACjMfl4wbpKduwLNsl5c29+Dm9n6L+qTUJeEGhUT8FCJXEdKryZC1rRL9hOFs7VCyASXlXhFbv9I2IRUcHQgSxLZa06CCOlIqe6sJ4eft+ohPJJPywwvGwWGMSoKrQT7qxQlhKFoFYvUu0RlipMdhmF1cFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYDBPULg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYDBPULg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-75001b1bd76so1580146b3a.2
        for <imx@lists.linux.dev>; Fri, 18 Jul 2025 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752858367; x=1753463167; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhurBa5mwUKpezcbMzv1+OspD1kqhRvpFJ2L8Bz2kqU=;
        b=fYDBPULgcb2oLe1uMelcR+XoDYCtfjXXUEJ9sQceqUX4J1ePxRNd4PU8WAWlwWVH1C
         7koyaZrefZzNiu5aFfomwYnzHjeIYnZ5KBn6I6262IT3zdpiy5ZEunLj1An8auhPjCYo
         ktL1KPbOim7bCl4smc4u/O3mh468YUT/+9UaSWExS7okInVP0qgcTANaAI3SjFwxJeut
         ACSqDX6H5T7ql/XPynKEvVHKQi/Ol+UtWNq6256R7AjInWSCVF9BQcyVi4sZirnoUBqz
         npWwITtioNB1QAw4I/fPHRuom8dW5CwZCD4LXT5X0/qJDOulM8WJvp1wQ90eaB/++T50
         SeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858367; x=1753463167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhurBa5mwUKpezcbMzv1+OspD1kqhRvpFJ2L8Bz2kqU=;
        b=ruS3ZRXkkDTfqmOFDa50/2PJ0vZYPzaKj2nYq2LoEhVRFWAT8hWYoAB0UTKIXgJRRq
         tKFa9g6PuWZURoVvHDhlfYaAXmoCYV741ZxD6YKJ8wFb1b7/rckhr7iADd/tEwmBt6zJ
         Owz8ZruLOAlIw6Vs4yQE7c3KcB+5fXKTUu7O6fWbsQbnipSihCwK1Jn6Npukjo9yZInl
         ywpcQyHTdTzQhNRMO6+EnRdeqqUgwN8c+FZh80atuMnPe/kKTn22X6eAKzlhpnn4omD2
         Ancf+R/zf9h7JIMs3EDEhvSFAuB3Wjkldqy3KVuWpztV857Qo1tZjlPN6NQ1ozBoeSEy
         WZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtPITSh8Y/77o/S9ViMFdDsvQfe3lwH/J5KdF5tyA1ua4jwsufFAVfXPZmqOOwUtRntIw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxT6+/d+8hNhDUoL2VTyZBBoTo/Judo8VrX10rwlsxgGrr5jiTj
	iyXpIaJuFJC0dh9JW7962nicWi+vAA9pXO3cNjFs4ZSDST/mZZ+jbKF2HjpvQP0OX5s=
X-Gm-Gg: ASbGncsozEOQMrmgJzfw9B5DGVD/izFJr9shiSsSyph+Al/ILYn/2PyT/bASJ23gs9o
	l5F8Ayge+NxOEk1uJ6zY6sgRbTbphzUeK6PPVFC9xYEDHIupQK9Chs/Wpqzvwx6cy7tQSEYZ2Rh
	PFbtnysex+pxcXwzcheq4u5qWB+Ptr2vKUIa+2NjVwHzP+AlK/8weQROZT9let88mj6/OQEkHGR
	ELzEtlfi4+PcVFFlRtSjqthDi8xJ98DnCOSrzGPMObp4F4uyesCUB/GUBk/QLGXUjwmdGzYBU/y
	mUONAkgLySKyZRZxxMzLXN9JtGaWKIvubAn8rp8SpCV56308rycsSwG0vO6QShFsPUQssToy82J
	fMXW01DHOp8HC58nV6tAZHDeNLUV5R7+Gh5qf
X-Google-Smtp-Source: AGHT+IEx6ySB6V3hyKXChSRvGBgPCHaeNn+2Yrx9kNMJebeK99RUGW1gvTuZy2CawEeN7hsJkrecLw==
X-Received: by 2002:a17:90b:55c4:b0:311:9c9a:58c5 with SMTP id 98e67ed59e1d1-31c9f44b9c3mr16334749a91.12.1752858367484;
        Fri, 18 Jul 2025 10:06:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2122:eb88:47da:7caf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f2c708sm1623990a91.30.2025.07.18.10.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:06:07 -0700 (PDT)
Date: Fri, 18 Jul 2025 11:06:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>,
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
Message-ID: <aHp-_BRk7Iz81OFp@p14s>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s>
 <20250718082033.GA25126@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718082033.GA25126@nxa18884-linux>

On Fri, Jul 18, 2025 at 04:20:34PM +0800, Peng Fan wrote:
> On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
> >On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
> >> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
> >> > 
> >> [...] 
> >> > New warnings running 'make CHECK_DTBS=y for
> >> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> >> > a7123e857dfb@nxp.com:
> >> > 
> >> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> >> > scmi (arm,scmi): Unevaluated properties are not allowed
> >> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> >> > unexpected)
> >> 
> >> Same as replied in v3.
> >> This is because [1] is still not picked, not because of my patchset.
> >
> >I won't move on this patchset until this is resolved.
> >
> 
> Not understand why hold on this patchset. I suppose you may not
> understand what the error means. The warning is totally irrelevant
> to this patchset, there is no dependency.
> 
> Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
> &scmi_bbm {
>         linux,code = <KEY_POWER>;
> };
> But this "linux,code" property not landed(missed to be picked up) to DT binding.
> 
> This patchset does not touch scmi_bbm. I could help address the warning
> in the other patch, but I do not see why "linux,code" under scmi_bbm node
> could block this patchset.
> 
> Please help clarify if you still think to hold on this patchset.
> 
> BTW: with [1] "remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU"
> merged in Ulf's tree, there is a minor conflict with patch 2. Please suggest
> what I should do with this patchset.
>

I was afraid of that.  The best way forward with this work is to wait for the
"linux,code" property to be picked up by Sudeep.  I suggest you make sure that
he, or anyone else, picks it up for the next merge window.  If that happens
everything should be set for you to resend this patchset when 6.17-rc1 comes
out.
 
> [1]https://lore.kernel.org/linux-remoteproc/20250629172512.14857-3-hiagofranco@gmail.com/T/#u
> 
> Thanks,
> Peng
