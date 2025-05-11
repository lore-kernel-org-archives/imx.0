Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D551AAE17
	for <imx@lists.linux.dev>; Sun, 11 May 2025 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746951907; cv=none; b=MJZM6xYDZaKZH5VDmEo6a/1z0jwm3DgH8MWEvrq0/54EbQaJaNu5FdHSEhJvOLIkrjvwofQhlQJ1b6CMe5MbjxLsgzsEJXP5Ur5Cf+XOG7/+Fp4Y7lI/1lkkT/0yTsRk8gloMdXP7yQknB8tKTTsFlZ8eKQ2L5yfQ2YQgR/Qg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746951907; c=relaxed/simple;
	bh=axlzh8wdBSnRAj1XihJUWHBLhaR7tOyyavylk1fO3Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqvlZulV7W1LRS9Dgg3HZ00jShS0Ojjgp5wfbxRr9CRxMcv0yxxUwIX+n0CPH0nQCXAuwRuckefhuZ183yl0Qgjwiv46gSrQZ/b+ZUeEUOJO4UxnPv4Eqrf9qdHlTVRfsAdmJGIy5dthlkUcWZatXMfjqMu7DtZZrCIStJjvPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpjI3kgX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpjI3kgX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so25267465e9.2
        for <imx@lists.linux.dev>; Sun, 11 May 2025 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746951903; x=1747556703; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JGDVeACw/jp0C4k4Wd6moCgif1Pfm842wvA1qG0yCD4=;
        b=KpjI3kgXLiBhG0KePdwGFKhAqJHLBO7DkqhtGPw/jPIZM+7Rf9y7I0LiSQvuw+giCX
         3dukpoVtjYVAuE2rSXH1J9KWN6PJG1QTFwvsDqk98r32RyVry/MCuvlw2rEJ3+5Ghj+U
         5GrOBLnFCrr4of2y0jBUvrnurAwJltgJf4gP/haGDFBCxyL2AnMu7n8kS3YUqUZuQwY4
         7bR9AnInkJh69FVcmsaLqkO/IEvQXosvH+CLfZY1QMHaA2n++cAxtNS7oHsyIrmOL3pr
         y9EnoKy6151ZGLE43U4aD6m9ItVeUg0ZpZxNydutuo0BHU0T23wbRWEBROH2Jr8mDb2z
         SSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746951903; x=1747556703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGDVeACw/jp0C4k4Wd6moCgif1Pfm842wvA1qG0yCD4=;
        b=oAhBCzHf2XiQiOQJ5sxGK7hx6f3C9bPtw+mxzEOKt8Z986zV54JCqBaGO6bB15AYoI
         wqXjlfSsAeMZf98OI+3R+eEZKJoeG+DDAFGA6dUYhzicvxJXUz+ZFAp6oj4izNLKXd5o
         N96P6DtkGzGbXjSV5Zam0+q9k7WiTBT1KnUZFsZVyBImpiygg1bcLiddFNPMJ65VKTI1
         Lpiov8Q0Y9moVBoBMtU3z1jInVoCAFd8BzsA5DkQWTAiFXdrPyJcGcTPbKFgxTcTMRYp
         6IiATUbScOeIktgQnd+vUMMM+JOXloFATbujkyIArrg0KciPS0flidW+YQqz5jCGBJmp
         S8jg==
X-Forwarded-Encrypted: i=1; AJvYcCUwgE76iFGWoHzCjNSQs6nm2bXl7pGjWPCTAVtnBlpiicMu3KxASvIfn3NqDxbAFOEyjjw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoYtBpDDx2sUXAkKs5WAsmRquxt0xPfOJBl/9wHyqesOjCqOMP
	Wfn/RkJ7fav565xEqAy2/sRSlo6i/JDFC4/DIW0too4JbKsXf6+FfU+5GGWJ6Q==
X-Gm-Gg: ASbGnculwk/pSV8wDjCfMlV17KV/KPt6+F6JmrIv6y9imRfPMoLhVbNhSDr6WwqT3D2
	huOnPAJwWltsE224Wl1cIihOHBUA3d3OTNnzBOpDB8RI+8WsWnhWLMRSTuCPjcz2NbL6kVnCkFG
	8Ma6kXinf7BYa1tt7JPxv1lOYfZcg1P2FZ1ALcuoKC5fYacZRH0+m4FxHEw9RfDOUv+gwIfx6Ja
	OQMXK0IJNZfLK2gajkSSVPXClsIzSJGFPBLg/ld+jVwqlWpX6qMScP34w3AyF1glHt0iDCu6wEk
	YkKd6PFczp7D44wj6XH10JkQWDZNnvkDrGp9IZmRJAjYaE5GX6Z7ehKR6BPw/Ug=
X-Google-Smtp-Source: AGHT+IGIgwTqFwghplknMmhn0PhrkMbkYatLkYI+iiXeqPEmbShj2REeefkdrAzhOMUJoVnfgrJgUQ==
X-Received: by 2002:a05:6000:2902:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-3a1f6444a44mr7489435f8f.24.1746951903183;
        Sun, 11 May 2025 01:25:03 -0700 (PDT)
Received: from thinkpad ([130.93.163.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec912sm8487327f8f.23.2025.05.11.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 01:25:01 -0700 (PDT)
Date: Sun, 11 May 2025 13:54:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, 
	jdmason@kudzu.us, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v18 00/15] PCI: EP: Add RC-to-EP doorbell with platform
 MSI controller
Message-ID: <4oyhjtoedh66sdyhebltwskskksy5ask4avvuekoxbckibdxmb@bqwe72b5q4en>
References: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
 <87y0v7ko8o.ffs@tglx>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0v7ko8o.ffs@tglx>

On Thu, May 08, 2025 at 07:26:31PM +0200, Thomas Gleixner wrote:
> On Mon, Apr 14 2025 at 14:30, Frank Li wrote:
> > This patches add new API to pci-epf-core, so any EP driver can use it.
> >       platform-msi: Add msi_remove_device_irq_domain() in platform_device_msi_free_irqs_all()
> >       irqdomain: Add IRQ_DOMAIN_FLAG_MSI_IMMUTABLE and irq_domain_is_msi_immutable()
> >       irqchip/gic-v3-its: Set IRQ_DOMAIN_FLAG_MSI_IMMUTABLE for ITS
> >       dt-bindings: PCI: pci-ep: Add support for iommu-map and msi-map
> >       irqchip/gic-v3-its: Add support for device tree msi-map and msi-mask
> 
> I applied the interrupt related changes in the tip tree. They are on a
> seperate rc1 based branch and contain no other changes so that they can
> be pulled into the PCI tree as prerequisite for the actual endpoint
> changes. This can be pulled from the following tag:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-platform-msi-05-08-25
> 

Thanks! I'd like to have a closer look at the endpoint patches and want to try
them out on some hardware before merging. Unfortunately, this cannot happen for
the next two weeks as I'll be on vacation.

So please take the interrupt changes for the upcoming cycle and we will deal
with endpoint patches after 6.16-rc1. The major blocker for this series has been
the interrupt related changes. I'm so glad that it got resolved finally.

Frank, thanks for your persistence!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
