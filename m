Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3D2EA174
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175719; cv=none; b=jpUivptTVRoFyasg91Y4Dob4YwXgjSZ9oCDOLvU4F8JdF9HlfewCj0xCHArITNeBA5OkmOStYtW297nHuNg8G2X4/2UbeDiAVs/bs/gnAggfTeHIXXy83aU7HDZCoaAWwt0kwZDjTbsSAQsQs6s2AZ2JKiZKoH2b5AEiHFBuGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175719; c=relaxed/simple;
	bh=55IiHynz00pYy+b7hGuuDjrL2Y//CLig++XAkelZNU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoAsQ7B0XL7OFQV11UHNzBFxJFTbhfUycbB10FKf6rByaEzkvCKDbQ5XZsvDB+qtlcOIXdneCYEOsaGPAicpVvXGTigc1fWWp5naM7y3kiicBwXlq7LJPhGUivsjGEw3n+Qg3fBV19BpmJUU2KfKdHnxXZlcH3k8GpBUZhVM4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CDuDVdhB; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CDuDVdhB"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6facc3b9559so85607276d6.0
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750175715; x=1750780515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wx304DZ0NE2g+OOJjBg61lF2TCxnm7rjurAO1hRurAk=;
        b=CDuDVdhBPrg77wkAGH67hrRI7GUITy8ivrCBKiYd9/c/K5Ge1bU7g3wVecGCTSzwFr
         ztFPMm2xh6wbdcnWiKijx2xpzfLM5B9cSJvyZZ6LsO0Q8Ye0yk7MPCqLMcGN8YL423ij
         sKe2Jh8XNLkQ5UPG9pjg5GAh2Nc/f+if7bpFWv5AzlwnB56twlD5+dVx2SC3CqbBUMyQ
         IT28wlmLbZM75+0kZt8tFLGMqHHvnOXaqmWQ2TL0ZkDxeUJk82wFbELoWNyHZ2O1m/0Q
         0J+KhsUXB8mYKzEulNxdWNB1H0Gp2RDs+eqP4F0zSr5R+SjGfX5bI6LQBzYIZSJCQ88q
         EZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175715; x=1750780515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx304DZ0NE2g+OOJjBg61lF2TCxnm7rjurAO1hRurAk=;
        b=TBOEkl/CXeIZk8Nf8wX+UnWh/h1ggNRs5bmjJpiOlxbquTWZbdbt5X/TVNanSEIlvR
         IFI28/vvc7WknWKfyq5yD/5O+/VSRhu+NVB8BBz3+HcBUigj0ul6/w58O6L2JVfTfs0B
         1eA5pJAn4mUN0Gp6icW8LcmQljMJVsWAh+c2nDRGib32b/tV+PtoLUwC2OYWU6EfdZhs
         zd5Xju0vGEiUMoR7Kp7zbt5f2qJRoHhCSn3ws50JPWxWof/kkgvLWPW4fpl15BEADAFB
         csPqjGo+GasYM4NyPNs+FXyTcfloypsfSz6uXXkLnZxQCKxmXnM68BHekAfM7BC0pLoU
         6L5A==
X-Forwarded-Encrypted: i=1; AJvYcCVVrNlbaGQmsgvgQFMP5j3AbOpyikDcaEW183ggYRBZoHvvnEEGWW2S8ZIA97HEIRds+d0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYI1dq8fE9npE+QXxBO55m/Tt37FuZLz7HP2Ubn31Y3QZwwLU5
	J0UZlvevTHXHykb0wwMPAfE3lCcQ/Ynl5Qpf5DPWD5i0ABqY7FmFGhxy4QUyLZiH7AY=
X-Gm-Gg: ASbGncs2ma1gUm5VO+vpEqedwfucosOBJCJTcnqvL3QOhjpXN13N8MqRFtS1rB6QzwK
	pDulNWA9e3YU0QNYNDjsUVjUi4Psj15/PFTIeSqi30zFQr1TGClHTcJ3yZDRFlEgFdB0GGrrOHv
	VcdAbJAxv6eD0u1lTgczT8IIbL03kaTns9lWOd+g11n9EEwrv1pX+NCmU2aoLGPm86/0P+mK+Ou
	Po4I4LaOBMFWLqVZWYKYKiRuj1qQZ1B9SqKh1DNHsBYunvClTkJb9RXqHF6TzdbDbYkBVDTAVRj
	BnApi94Ne/CJBqBp58gx/3pUCMZT2ZTANfBWL+xfFzWpZbx9U9bzDai7bniVkbd+49Jd8pMsUUm
	RZHhGX3fS5GpbpG7XIsMoPc+9Vzfa6RAIxlQtXg==
X-Google-Smtp-Source: AGHT+IFXnZTcKPgzMT86nxmrlf7kz4ru5nOzoSNqyGX+eUmWwxWkQ7vtqqAzKrLwaYYroH6Qyc+UTQ==
X-Received: by 2002:a05:6214:2682:b0:6fa:c634:dc01 with SMTP id 6a1803df08f44-6fb47786d90mr220187206d6.16.1750175715483;
        Tue, 17 Jun 2025 08:55:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20abasm63746496d6.1.2025.06.17.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:55:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRYeY-00000006WS6-1OTF;
	Tue, 17 Jun 2025 12:55:14 -0300
Date: Tue, 17 Jun 2025 12:55:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, James Clark <james.clark@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, oe-kbuild-all@lists.linux.dev,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
Message-ID: <20250617155514.GC1376515@ziepe.ca>
References: <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
 <20250616131346.GB29838@lst.de>
 <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
 <d16bdc40-20d6-49db-bf41-18bb9b8e01fd@linaro.org>
 <20250616131944.GA30260@lst.de>
 <f723d490-c228-42d5-9f9f-158df54a092d@linaro.org>
 <9788991a-ac37-4fde-81db-c55035d00f27@app.fastmail.com>
 <20250617044833.GE1824@lst.de>
 <5de445aa-048b-4f60-9045-df5d45341436@app.fastmail.com>
 <76a8c896-d7ea-4471-99a2-34b3a7ac9804@app.fastmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76a8c896-d7ea-4471-99a2-34b3a7ac9804@app.fastmail.com>

On Tue, Jun 17, 2025 at 10:26:51AM +0200, Arnd Bergmann wrote:
> On Tue, Jun 17, 2025, at 09:53, Arnd Bergmann wrote:
> 
> > Between SH72xx/SH76xx, SUN3 and M68328, I believe the
> > supported machines are all limited to between 1MB and 32MB in
> > the maximum configuration, which is obviously extremely
> > tight.
> 
> I checked the exact numbers we're talking about here: enabling
> CONFIG_HAS_DMA on rsk7269_defconfig adds 10KB of extra vmlinux
> size, which doesn't seem too bad:
> 
>    text	   data	    bss	    dec	    hex	filename
> 3295084	1111396	 112264	4518744	 44f358	vmlinux-before
> 3302836	1113652	 112264	4528752	 451a70	vmlinux-after

Long ago I ran some numbers for an ancient PPC system:

https://lore.kernel.org/all/20121119214922.GA5636@obsidianresearch.com/

The base smallest kernel was growing .text and a stripped down initrd
at a rate of 1MB evey 6 years.

Somehow I doubt that system (with 16MB ram I think it was) would even
fit a v6.x kernel. v3.6 was already challenging.

Even back then Greg was incredulous that an embedded system would run
a 6 year newer kernel. Here we are contemplating a 20 year newer
kernel?

I think you have the right direction, we just removed !SMP support,
removing !DMA also seems logical to me.

Jason
