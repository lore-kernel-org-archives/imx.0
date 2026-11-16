Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857424;
	b=Lfv1l8uD6xu19cKegKKAoKSUjuM4WcwEuDr8g2uN6iifdJcn7kpCGmWWSZ8/DiRjGia2
	 Qu3DAC/pf066AUsYCmXfVxQTTDGMVpCeK1EVT3nfOWHDiWr5mFgAZVLD+OyKaZJIhNMR3
	 Ju+0PHTu+7rVXwnj3KEQ18M4h5AzYQ+APemAQk1dAq4nQ3LZueHckNJOxeurb8GxF3oOM
	 wHirKb+v66a7Wo/czCdqM12O7DK0/B1TLIFgBbrYF5XCIR3F9UBzj+b0MAiAocbQRzHMP
	 g9HVXT3lRn2bsRC77rzHUkP2qCmaQP5jC5OtKrCcGNC8duXqH1s6xKrGxam7rEC5bFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
	b=BD0cvEDcHx5Ekz00Po1jV4ZD45k586L5eKKX7dwszRAbq0n+Hp5MijZ2jhSv0vD6IuS3
	 T4+V4474P4WE4ZgUHYgPOPZbt6lHto6CJbqDlFLJV8x4iXrCdLi3bJe0RcXqvbzb+KBtt
	 m2gn2neAy3QL2BFqqA5PwIKlgrEy/5Xg8DQbFxGfISt9iBb4i1c2ruToZ1D1YMxoaBcYD
	 WJfuD11vyW6d1C8iZ7tdyxTWQfq5f3tvAAYaB0gd6GcV7GXDylTAlaIG8P9VG11HeJGYL
	 O1Fas4CQNRPRxRUoVz1sOm2qdsC+f/INC7iTzlmaaCEIeOcWpvVm1GE32UrAxJMP4Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="RQD/txRi";
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB3606A322
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 19:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33CB3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RQD/txRi
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9496473b511so23633985a.0
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 11:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857423; x=1795462223; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=RQD/txRiRUFi7AwX7Om/2sU0m9cWKtXi9W/mBpWJEquZMKjsTyj43jBIQvgRESRcPR
         FkLkGztJitS7hqDPkWHUi4gGlrTV007ocbJp3Crqq+ri9PNUrlVAbE05xhE68q4UhDa6
         nhkLtw2GHI/18Yl1NFZZKabzvLXV73gH5HKtpVfGpzs0IWc9i4GE5G7sxCbu6eRCWVS3
         keYL7bVg8Uu9/MN3v1N6OAi/Xb6r45m2AYXOh1BtukOtTvCJJx6RQzeasHVSpbesVr/y
         3VvcvawUZ4bBY6r5+Mf2d0QZpqSipN7Y0wAjIV91VLx/uep+QB+3v1LwleSAz0m3FAze
         PFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857423; x=1795462223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=mOhvwYFGOOFOkUEH12EDg18/hpfu9kx3EWR9rlqmoovvw2WPGh2lhSsdW47fnYS37q
         vhKB0ccKMhZGxgHez8IOHzbyZP1wFiKDCa5DSym3Sh3h1slGsNW9WfnhkzZA8HjwXfZE
         IUfcUsRN7S0/0ImBZC+MFFXFqJV/MHV5lsFLaYKNlFqnzR9Z7o7+BsIp5exqhJD7CST/
         xoyhIfP2IFr4IjMovg3uxCEHAxPBPRk+GoF0u8HWWIJBwoE9HgYPBExqcMH0blgTAHhK
         qYnB7hAoGwPsQ0VbKjC9x217nWp5e8JM0+rpL7N/xUOzNa5VRRrZHeFuXL8kizSWaMOy
         iCQQ==
X-Forwarded-Encrypted: i=1; AL+hErF3tDgaWa/T1eHCwP22S0+ZUbwYNN/6m1R1BuaZFLWltBM/FLfTa6E7NxUudCNkuUhCDsY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ncl4z5YCwuIXyKZOr+rQ1v1ft981/sJNzFck4jrlGfLJ/RAwR
	R+KzZKnXQOsczztQ98hpuD5fiv8eLbBaOHA5pshq37kbKrJgSNRTsS3j7n8a2NwkQJ0=
X-Gm-Gg: AYBFou0aCaiBvpE7ynW22wk2Llgg/raXqFk08z7EgD0x7k4Cqu+iK3L5o1KDXZSuBBV
	qlixNiYhO3Ie1IC8qsJqp48XVampQux9wVENVFUrjsdc/6cmSeBd8cYTSvi8XoFAx4mXEBlFCIC
	A+lJOylNlXzy2fVoXfFVcsSkteVcuGfLXLu1HIN3Yinsrshz5ZpHbTrXIYjDyXPatend7TgDjHE
	kyTRwYYFqWrdCJz3YjGrGyr5Cxe4aVUkDmqS4c6XNIDNktzvgnMTw9gLoVIO0sej4xPQlvU1fhJ
	kxTpGW/61NCoMCyZBJ/qQBOjNY7VM57bluV5iFkTZALKe8Kdo8ct28cskGYAAwL/0OWD3FbxQHM
	OWsECprpy2YMqZST1LNJCSAKFYMDYqGkS1zSGMBt4AuTCt/620hIJ0rbZ5jf8hfk7x7Gi7i9m+D
	0DBomx8NNKnGKL276yN5+Fz4dMFWZflojohlOeMrtVF06i+AVZpnT/WfQQPMmtyFEpX+AJif5S8
	T7ZmAvxE0unGbXyduHZAz4RFW8O0NSL2e/gHdJLRjRb1vV2C7b84IXa7IcKhLvnNQTJOfVLyOx4
	nHTBxQ==
X-Received: by 2002:a05:620a:4406:b0:949:7058:dbcb with SMTP id af79cd13be357-9498b875510mr84935385a.14.1794857422999;
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94978ae5483sm390417085a.12.2026.11.16.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2PF-0000000AJAU-3HLU;
	Mon, 16 Nov 2026 15:30:21 -0400
Date: Mon, 16 Nov 2026 15:30:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261116193021.GB2452510@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
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
In-Reply-To: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>

On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> I used iommu-map for eDMA, but iommu experts rejected it:
> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> kernel creates is the same kind of DT abuse from over here:"
> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> 
> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> "Thanks Jason for context and detailed arguments. Robin did not chime in
> yet, but from what I understood the DT-child-node approach will be the
> way we should go here.
> 
> I accept above point of view and I am fine with this, thus Vishnu and
> Vikash - please go ahead with DT-child-node solution we had some time ago."
> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> This series adds per-channel DT child node support to fsl-edma and, as a
> prerequisite, introduces a proper bus for DMA channel devices.

To be fair this is discouraged too, now that I've seen 3-4 people
trying to do exactly the same thing I'm not as positive about the
DT-child-node hack.

Can all of you come up with a proposal that doesn't involve hacking up
DT just to unbundle the SIDs?

Jason
