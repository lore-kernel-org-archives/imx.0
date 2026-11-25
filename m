Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620331;
	b=a4mo/BX8x1sMLu+ydAeYWLqfSSp/tGOTZ14tCCgNAV2M+VTm6eozuO+ypLk+8LQV8igV
	 VBRLtAG99i3QKb9ESyeJvLh1f3d3NojoRIzQQsFYCsWQXN5j99+POuj85wTdwhel7jFF8
	 1sSSEgMKwTVf68qUAJjF1WwU9a8kjrP15SoJw4Y7OWPxphzOqXrQY07rtZDx3SGBXWZ/E
	 y7G6k+Czk5OG3toVUZCfXAyaJOO/JK6cVz5+Ni4mHj2UCrwa/33gdRzVcDvhnMTwoFqg9
	 7Uhk7RMlXGBdrHAnXpsZ8DgNCejeyvolGTlNXpyiQzA1z2oFdu78fUqeK/00LFjL4BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
	b=bt90qHx2F0CEr9SL29Fx8ZG22ehhGrS61mJmBRNF7PPkwVMbnGShKRoK3hMyAfp1Imcr
	 Od1j48MECiKkya3WQXZA6MFyGZStBcur2whsOge/fA5NF0+CNZ6vk8yYqQ98zurUrCoAi
	 uYDkD9iGQ79okq4EWjou4WDahOFgi65isD2cSn1uwKynOdOux8RxBV14TUJhzXSvvYMFs
	 52DwuhrWV8pjF0mkIl4BWc8pbzb9DXPrz1UOWkEHTQ1yf5FhDVXTCvTevs0cFkh+97s1S
	 oOQBn8/tViy6RPO/J5BicYDr6+0kZzjQmorMkrE2ojKbfGjegcTsP9hzpkEO/p7QOUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oXvAMhEh;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BFF606A32A
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 15:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80BFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oXvAMhEh
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d6a6776719so3599855137.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795620330; x=1796225130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=oXvAMhEhR0UY/Om/QDZHoOQuwHzJ0pn16rqKr9IxHq/PDpsgO0tNv3bwqORRpL/PJT
         E/WHPq0LQH3t4qF0OSYDOMBrrmy5wQkHbuNmBmVbTffZ1SAAOI6NW8G2PkKhXgeT2Ijm
         dv/RxafjEqePqSneFyq2TqkP511F/s2zvrtdG/l/nRNfWeDK5T9SiVHZ1nCxlvaFItlf
         D6tq1ztVHxmCcNGywdpeAT7kowl+LCio/qaQa4DwH8tTBWMnug39qDLy225bukVz3M0O
         TwMI+k2/iRs4LY/Agr16wVFW2r1x9EYswMqgsCiRm2iK0DS9JINt2tmoucqEXZtvkzC2
         yiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620330; x=1796225130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=nL3g0nk2CEvkkkUMHscriy6GzfAeZt9LOJ+cm7V9imb60HB00FOebwX4IzOJlyWp6f
         avgYVv8dfRSE2Gbc1QOS3bhfxwur7YZqpxE1KF6I0UXWNZnqUhyahZvc4WLmPNeBctWT
         YMv4UUHpRcvtx+Gz+uzYPFxdTL2Tv/BhuDDW6/kh9PWIE5BRJgFsXPHz1GBURl4dSD/C
         k8gRyl4DjL8X0V2WKXKsWL/WX3fVKf9ZQGnu5yiVBAMMRkyi7aOwScwfHLopWFA/jC6R
         OI5OEWIg5uDvOvR8TrV8WshZDl0i2N/K/W3e+tGOq/bZuPYcVU6XCI/mHlKrgLF2R3Za
         NuHA==
X-Forwarded-Encrypted: i=1; AL+hErEiCINN3Zv8MZZt6doHyAvhAyVaiJ46TwnCRyTJ+k7grjtc8ydHsW5NJ5KkwjpdmyVa+rc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hkK/BCkZ7NxmmGL2ODxK7qWSN00y+8PBdWFFunZ260e5d8zec
	VSZtMr2281FXbktl1tBmbFl1X2Djtn2MtVQ9umNl8B/YN2xsrM5OmS0Kg92riWR4p9U=
X-Gm-Gg: AZFdTZdHZQfEG9LwLHlC4nQIdP4jqonbCM6AN1qnYLlM2lkdZpn8w58IHQ/LC6DZcdb
	LpII86FAjbMjsJN4Ob1wIxfLyubZkq2E5VdEsFqNuc5dqZt3E7DqurxTbDwaDDsHjl2mabeFFv+
	bHyCnZ2IZ7r5thydXvcyDxUriA6vERb1cVeoE2iHb+njmsSxKw0kOxv4uWyfQcSf8wiJDBWnxaW
	X3KRr6G8n6mq01BRKKjOYO2WeWGsYWTfYoAOsXO3tp8LxnRlFAKz97QKPVdJr4wiGdB0KZyG8Ud
	gQ7k1EdEky/pHlvZFKM54ADEdSt54zJcz8m8PmgotoXI+VLysffm6ScNGd15iosUKOh4Re/z00j
	QJd8fi2r8ELQzhyVA18SEddt+FNLHXSg0BYojm2z579AJAKXMEC9L0vdiSwfLGMFAqpuKVp8iVJ
	sNcdbjxGUCe0N42rP4gwQ4NyR7bdPPVeCZvpXG0DzhT7V4MZEzMLiwKXHCyFkl5l5vvnL3jVt6u
	CerFx3A9E+hxMh3VqHlBtGbREPOpy9MwKWTEiuYG1XoTcrHLlC7X0KHK2oqdFgwTs3wlM3zTBX8
	GNOXAekwDx2Ere2fj4VKakexmE0=
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id ada2fe7eead31-7d739572406mr10710273137.20.1795620330327;
        Wed, 25 Nov 2026 07:25:30 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm165007476d6.4.2026.11.25.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:25:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEsD-00000001rUc-0W0U;
	Wed, 25 Nov 2026 11:25:29 -0400
Date: Wed, 25 Nov 2026 11:25:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
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
Message-ID: <20261125152529.GK246011@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <awGWcq_nKWShC81B@fedora>
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
In-Reply-To: <awGWcq_nKWShC81B@fedora>

On Sat, Nov 21, 2026 at 09:02:42PM +0800, Peng Fan wrote:

> Do you think it is reasonable to have chan device(not platform device) do dma
> allocation? 

?

Any struct device that works with the DMA API should be able to do
memory allocation consistent with its DMA parameters. That's an
integral part of having a working DMA API.

If you are asking if a struct device that can't do DMA should be able
to do DMA allocation, then no, obviously it should not be able to do
that.

AFAIK the main issue in most of these cases is the need to get a DMA
capable struct device for a particular SID because of a confluence of
decisions the HW designer has made and the Linux limitation of struct
device baaed DMA.

> I ask because if we allow chan device to do dma allocation, we need
> to provide a dma channel bus for iommu_buses to fix tegre186(TBH, I
> am not familar with this platform, it even has iommu-map for the dma node).

If your question is 'should I be able to have a "board file" that
creates DMA capable struct devices from C code" then I think that is a
pretty "smells bad" solution. Especially if you have to then create
fake busses and add them to iommu discovery.

The DT should create the iommu devices as platform devices.

There was yet another thread about this, so we are at like 5 drivers
now with this kind of need? This was my suggestion on what an API
could look like to solve this general problem:

https://lore.kernel.org/r/20261119143151.GH3115493@ziepe.ca

I recognize it would not be so easy to make, but it would be easier
and safer to use.

Jason
