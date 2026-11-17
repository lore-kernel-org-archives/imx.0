Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920410;
	b=gefkKZQdyubaP/IY/RgjOEebPdFMVk9LqCrJ/qeTmvsRUxIPe2tP2X/DaDZcLF9mzQ7i
	 nSs7/9sjDaoVxYX+pZHMJFEqeitKCyG0R97pCxMgKss5kGtaOdj8Tk+2tRqkNZgcGB0O0
	 wzHDEwzoDOSef4xARoDbjnd5PSCAGG+28ZzmUZDmXiT82dQw+spE/cra2JAGX3EF+JEnK
	 0Ge9rq+HdOv6YWRGpyhC5+MiM20r/8Rprfe30Rk7e8R6wn+pTeZHBZyosZa6G2HrptFZz
	 hVaZZko30+E/2puHdOtPYeWozkCqkI2hlYFKzlI1SlPWGjK8aDba/xI38CbHWtLWdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
	b=Ha7Ak7+Ohd3SkrpKrfOrBbzTPMn7vuPbzSOkoMa+6zUOHjhLUZ0Q9RtL7qi8jmmpT+Zg
	 zOMDYEKlnfrxnEFoCt7qLTjsGXjCmjnv+EsB/Wotzvyu54PSMj2tQuDIvyzjTVBAXvx7T
	 o1ECehvNDkShTwOGEKsp3ly8APd2reCONm7ue7aH910/7H6ganIMLq92yjCqG3oYSVCWa
	 0QusoYCj90rT7XV8l3aaEeQcJCQZ3IxfGCVY0oGenLf7LZn0EV8R91t0J/UclDVpT6u4/
	 xhoouAe3g8MzI+eakr4NF9onGcOEb45uKz6qUdft1A/MQlh3PjV4mEIXEj58sl8SVBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=b2YFLXbH;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5B606A8BA
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC5B606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=b2YFLXbH
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-94962d80d34so218233885a.2
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 05:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794920409; x=1795525209; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=b2YFLXbHZxblEetdGwqZ5iSDT1YoFcKjYGOKJJy5u7qsJIBbCx0MYywsMpj2imTpMw
         hB+ccsrh32tsGLPP4+qmvZSvgjHVKXuiP2gQeazDwsNFsq/appf1u8J5OMFpYk/XkZxd
         z3x4mPDl1zEz4j2aUMwofcSPp3am92+F+rnQoWwEjGu8Ms6rXu+p+xS/EUcrKbeqeGWJ
         RC9tTzCbyFPBRWUoTc4tR5v1CtXD4X1F5mAlRxaktF7GWeVrkiCykYoJP5KRwoHohffO
         mfBRhIkTNEOYR8tsmFla40vh/B1swzaJXT0u6LallXDgkhg4KC/GXTj17m0CCM1odHDD
         WWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920409; x=1795525209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=ycKmdFrxA7BwavZt+QbxSyPLcuRDY6s9jQoHX0VhkYE3lKMpbv6fyRv7UbCRVHEA6e
         Qk3In/qHCx25QOfW+pkY3/KmwM0dnbkjGy+rAXjFo/nZ7OkotLz4NMYribesbBxBGNrR
         S3GfEhdT2SMeQ4+6MxOxPuoH9G580pk+PaFS+I7iJqadnS2r+0APc/rJ3GiO+Bsghhtf
         A0SYIRTFiXfW3OgIgxr/1nN8OnEPLL/Ayr7fjGSlarxGQ8ijQ1GBxqHXO3jOdHj066ja
         dFVPzP69NPLjqKi+CfaH3beaKBE6Z4HeEaJsFA06BvE/xW/+GONn5gVc2utdM0vmg8QV
         ibVg==
X-Forwarded-Encrypted: i=1; AL+hErE+16E3n9FjIIq7Ak2VquE2+4CxR06d3A1/SiH66+dqRqbLuGoiZi8+eojfFUSFaeg64fs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+iDiy8K4AwXwUvB9Y6+PA7jpMAR9v1x3k8O1kTkHWun0XiYGzn
	Nr6ayrPO43HV1Q+JmHQhvFvw4rcdTt9D7UgsvHyBXSQ2xkhPfo5ndgEtFaTrq/RBhZM=
X-Gm-Gg: AYBFou0k2xVgTFgZN8w8eE6Qoy0kq5gMxIE+zhoWYZdexykC1m/ymcuOMFo6N+KMF00
	pw1t7pkunYxUSVNMtzGXdPrGPH9NmNm5cIuqpgkXJrCVvIqkvEgRmBioc2B6cT63vUITkVOi+Il
	nbZf5dHVl0AU2Sduv+8OEKMyINSeWuiyIxY3TSJjJxMGjjX76ImCqi/uyE9w8n2dBV1wO+2y5E/
	0nNu3KpMX8+crvIcgTX+IRgtdr962dGXkk3E9y6uJKQQQj90/mTH38/PDqIonjxKdU1mdBZjmjh
	8RSuUHWHRdGn5aOym4HnlOTNft+16aAE6IHTXpJ6sHqBk7eAEmdb3p2ragGLMmebWQL/ciobWIX
	U1nHdIfR0i1s7ri63O1v8/JobKiXCJ3fiXeo8QfX/MXrNxi773bBNv/U6fFhxkTEhu7I7/SIdDO
	4WbjkyB7O3c7+GZAM9BK2tvBRbkFrx4zNJ8uyMMNFxTtO6zrx3J3iqjzkIEtv8diCnSNIcIOPQD
	SYjhwDLUHZAZtqSi+yLvM+TzLGE8/ZONJ282ihii+gDN76xATBi7XOB+lq++cmEswMpRjPuyQ6k
	AFmzcF/cKtH6n0FKG1wLXBj7HEg=
X-Received: by 2002:a05:620a:a208:b0:949:5c62:e775 with SMTP id af79cd13be357-9495c62ea7emr1501690585a.15.1794920408653;
        Tue, 17 Nov 2026 05:00:08 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803abbsm1067907885a.7.2026.11.17.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTIn7-0000000CJGS-3fNi;
	Tue, 17 Nov 2026 09:00:05 -0400
Date: Tue, 17 Nov 2026 09:00:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261117130005.GC2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
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
In-Reply-To: <avwQl18smAW4R6ec@fedora>

On Tue, Nov 17, 2026 at 04:30:15PM +0800, Peng Fan wrote:
> On Mon, Nov 16, 2026 at 03:30:21PM -0400, Jason Gunthorpe wrote:
> >On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> >> I used iommu-map for eDMA, but iommu experts rejected it:
> >> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> >> kernel creates is the same kind of DT abuse from over here:"
> >> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> >> 
> >> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> >> "Thanks Jason for context and detailed arguments. Robin did not chime in
> >> yet, but from what I understood the DT-child-node approach will be the
> >> way we should go here.
> >> 
> >> I accept above point of view and I am fine with this, thus Vishnu and
> >> Vikash - please go ahead with DT-child-node solution we had some time ago."
> >> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> >> 
> >> This series adds per-channel DT child node support to fsl-edma and, as a
> >> prerequisite, introduces a proper bus for DMA channel devices.
> >
> >To be fair this is discouraged too, now that I've seen 3-4 people
> >trying to do exactly the same thing I'm not as positive about the
> >DT-child-node hack.
> 
> I may not describe it clear in cover-letter.
> 
> I understand the concern. Let me explain why I believe it is justified here
> rather than a hack.
> 
> On i.MX eDMA each channel has its own interrupt, its own register region,
> and on i.MX8QM even its own power domain. Each channel may also have its
> own Stream ID, or share one when SIDs are scarce. These are genuine
> per-channel hardware resources, not software fiction.
> 
> In dmaengine each channel is already modeled as a channel device (see
> dmaengine_chan_dev()), and this series puts those devices on a real bus
> (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> describes that existing device, so its reg/interrupts/power-domains/iommus
> are attached per channel instead of as index-matched flat lists on the
> controller.

If they are real devices then why can't they come out as platform
devices?

I think you are overstating how independent they are. Many single
devices have per "channel" resources like MMIO and IRQs. That's
totally normal. It doesn't make the sub resources independent devices.

AFAICT what you have here is some HW designer used SID where they
should have used SSID and you are trying to hack DT to make that
usable because Linux does not support a SID as SSID model today.

Again, since this is the 3rd - 4th case like this, it seems like a
popular hardware choice and we should try to do better to make Linux
support if we can.

Jason
