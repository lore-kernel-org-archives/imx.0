Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938989;
	b=skZUN6DQc6pK8VRQLG7KOFI4Z7yhgdXrMgeDxXmj/m4x/CcMqLRrB0+pPWIK9ppXGnJ2
	 5B+aA5lkSiUEUTK1r7Z+7J6Cqb6EA3OEptDte65x0M59GFUqaVCC0SnlNWnX04I+9VvPi
	 bxW1NHOaAEdIQudta8R5HoprgQs3posV81ZNoZ+HDG1wcxmXBH5Gyr4nQKJnxrDrBac0f
	 Ko7Sx/3VZSZ8suRR59M7ryWwK97jux5k8kIbukIF1V9p2ZyVTAUHsWasUrgtT2e5FFuNf
	 ihLK3Syq51DATh/cJB1vIhxuvaRIAq7myK3jfNFzLJH2ibYuA4Ed6zLGvGpt3l6XdCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
	b=zdNTxGPV23l4d9TqVOuJFS6maQsmX0TJvbXMdY1LXm0TDpQJhQg+J6wHxQt03P7QbRXt
	 r1thyICUMf2HF3PR0pG52GTxzvhYuH2nrNJOz/ZdBcBLZ5cNWL575944dkMJvBdm36+9T
	 nAZ5DrzN3rPL1TAcFmTtuZL8TS1jPzsZL/0kAlYoIMTocCX2XYban7fFsydhhhVdr+h3+
	 Ckh0OugkZPTB7gda3n++5uHsekZxZbsxKWnkZKrWigIlFiWGKW4eonPdGb/Vh+uHjOCaW
	 3j4/714+DbRwC58GU7WL+SbzNpOX4SzZH9ebawoLQ/qhmc7WgUq8kwcN78pc+hJq/Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HHzLZ4w6;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE3606A331
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 18:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AE3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HHzLZ4w6
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ea3f6a506so54920586d6.0
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794938987; x=1795543787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=HHzLZ4w6FXjJNCehE2NBZHH7RYbz9QRGvZwMu+NuGFpKP/08nWB6dYnpdXBwsngtab
         9cRMEU3DwwlGtXfrAvsm6552eBpSOpZzSYPvG6NwsmzQICBXGVarvZLyHGtMhX0l/Cfp
         Rt8H3FUJVI+ifN27kaEYMVmBJNR+UKWAdkwMiasQm00R3Z/xp+Q7TqgvaD/zudfnkywb
         9gJdZy5HwLCk7hgC/cjU3z1EvM1q4gYWe1hCf0OoKwZQQvpOXpLrrfJvVmgfhwy7Pi8R
         l/cFhCDDB1JYNYUaXHW+W75vrgYW+nFiVMxUo4a6s1jMW+iPfuIJ0U1R3buAac3Ew+g1
         mJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938987; x=1795543787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=bp6/lYmmyKBzhRiUWAuekpgDjq9sltadC2gjX/ALEZhe69dZybmXbEialibyI1p37m
         Q/xvS91fL3M+0AGRL0mIDhkCrgQOKqJlQ7AuDUz2MIhlSRUOUjR77h0p5It7ZQjbqnFK
         zHaZvSnFdvmAHzs/Ljq9anjPgdoaRe4dSPXfiimIGHc4sb9Maf1gYKLeHUjHiZKpZ0Ql
         19wnc3+xt9toDUBa0rgfoFYIiLCVzp4C+wL9u4jTS5ZZuaJDJb/0q1bR8DSmbt0QPro6
         oXtXa4OqvFtTJkV/6lxgibgwM0fOmsQSlNsyFNBUitqzz+ZzyvwmqCDnIeIuPlHhAW42
         yJGQ==
X-Forwarded-Encrypted: i=1; AL+hErH7b1edVkXlsVppTKVuYgaQPFBGYtNWVR+RG3XLPsfATgpiu+ncWtEVYAa6X+Zc3ZMKHpY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/pWNbLlfp3/DH8P8E88/ILQPxxgrJwR876McuSI6yS6NPvsFp2
	2J5kTmk5ZWh6B/5eshUNLk35KY+QaKIMmV1xRBuSymQmUyEbQfZhsW8lkZdxm7Uj5W8=
X-Gm-Gg: AYBFou1Lx/Cdb3gYhZg3l/a8QZPHYRZ/2Y37NQMrf3RqCZmlnmNEe54PxZuH4iPtzKf
	UgrM+v/TWu+Ms0Lb12w4OFmarG/LnHHSwUQWfBCsfiJr0F0E0Ma86q0XGjK/Bre5D5iqFRxXQNg
	ifcpjTK9klN7gNlngpJnbY3xwuNX1chOsqtIF35OJfwRYzhGfGx6OkMGbCZrs4MDUALpTZlK2Ca
	HyAacxIr1CtWgoeOIMUbEz73Pb+TvFoHIbMejElvodmw29op0aDe4M+qp6gvwOSvRPQMB5BtIDw
	IaI8EpYVQOj5WMPcitYnsH0nOnduSMooX6xj67wQlh5Bkf0uF1U0htORIoRBkQLTgQeI+ERBp9T
	M45kJ3/3kWPNQmA95ZIidCUPyUBzq3xqaWHolkkyUSwqmHR9J/TdINArFml9N5W4MB9Ciz9ifUT
	ciITbiGvWAVVUeWZZs0NKxN7naPbs0j/za61fbqM0Q3LWN21RyIuz/0X7CIxvSJYmGFl8hF81qD
	s46X2LYAoZdq2wU2upPflbyntRTnsuqkTtm6U4BVcp4vVjK7RytR4e8y0LUTzhab/3xUe5QDoWD
	JF0vzqQ=
X-Received: by 2002:a05:620a:46a0:b0:949:6ec7:68e2 with SMTP id af79cd13be357-94999650610mr89698785a.79.1794938987121;
        Tue, 17 Nov 2026 10:09:47 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b5c1dsm1155175385a.33.2026.11.17.10.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:09:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNcn-0000000D06D-1Abm;
	Tue, 17 Nov 2026 14:09:45 -0400
Date: Tue, 17 Nov 2026 14:09:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peng Fan <peng.fan@linux.dev>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261117180945.GE2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avyGI6QmuZ3DUqc9@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avyGI6QmuZ3DUqc9@SMW015318>

On Tue, Nov 17, 2026 at 10:51:47AM -0600, Frank Li wrote:
> > > In dmaengine each channel is already modeled as a channel device (see
> > > dmaengine_chan_dev()), and this series puts those devices on a real bus
> > > (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> > > describes that existing device, so its reg/interrupts/power-domains/iommus
> > > are attached per channel instead of as index-matched flat lists on the
> > > controller.
> >
> > If they are real devices then why can't they come out as platform
> > devices?
> 
> It cause complex when consumer to bindle channel dynmatically.
> 
> for example:
> 
> consumer_A
> {
> 	dmas = <&dma_provider ID>;
> }
> 
> if each channel is platform devices,
> 
> consumer_A
> {
>         dmas = <&dma_provider_chan0 ID>;
> }
> 
> Consumer_A will have to bindle to chan0. Actually, dma engine support bind
> to any free channel. It will be problem when there are not enough channels
> for all peripheral.

That seems like something you should be able to fix in a better way,
like by having the DT know which DMA devices are usable by a consumer
so it can be pooled.

> > I think you are overstating how independent they are. Many single
> > devices have per "channel" resources like MMIO and IRQs. That's
> > totally normal. It doesn't make the sub resources independent devices.
> >
> > AFAICT what you have here is some HW designer used SID where they
> > should have used SSID and you are trying to hack DT to make that
> > usable because Linux does not support a SID as SSID model today.
> >
> > Again, since this is the 3rd - 4th case like this, it seems like a
> > popular hardware choice and we should try to do better to make Linux
> > support if we can.
> 
> What's your prefer?

If a PCI device implemented something like this it would use PASID.

I have one device with many DMA streams is what PASID is for.

Recasting your multi-SID as PASID somehow seems like an interesting direction.

Jason
