Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938FE3C7E0C
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420976; cv=none; b=urqnjXzePQ9w6Ut5qpZ+44xayyfbBvUWiHmQw+XYQb7ohKX5496uGL0BTo8uKz6t3NMM5UQDhmD1tWUQPhRozVo3sAFeKAMwBpxBo43ZHMoRMJ5D7QwCpNpXYgDhha12LIqLUXvyXHAbJ5raUeheAl3O+yYg/Y4dHgEYDQEp4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420976; c=relaxed/simple;
	bh=0295XKYorZrcAxdvHj5i3VyYdfW/8rBj5SpSqpyom0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8VLvVUdYEkkg59VQsaQ4tMNYimcaUzM/fP2LHBX6si0s+RI6S5jFdhLyJjX65PZB3bRQ5Al7YO7RoQ0uw7Wzerid0b/GADzBtXIHnWNPCKrdJ7ovlTZ8oifktfJR0DavzR+9dmpxh6xdAJBirEJ/+YWj5pAETKrVYMl26xGEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X266chJ9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X266chJ9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso22251475e9.2
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420973; x=1774025773; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZHP+nmQxYBG9XCuehu/97dhHO1vliPQgGZ+V2Z0h3w=;
        b=X266chJ9X970Duc7vDxX636c3obNviO0fgcovNU/dYtubokuTSzDeKeHMrZRoL2/AY
         pA7pj9mstDyBFkPUUvNMCwWQCxVhTWZRJxmdoblbtLUYkIHJlFQ7KYLFjAsfyOYuiDCk
         c8jAyIW3On9Bu4V41vnby16RfnMYVkwApdJD9lQTs9vF6rXJNqcVerZwmu0MeHUMY9zp
         lm1TlBIfeivpqMWdEq6/hi133fFcKm8Gb1VkEZ/GR6lVmIbv1No7M1L6/MtEjZO3I8Uc
         4UoOoOyldB8KrFPHDeF/WGueaiOsRJEXBZPf+KCqnjVM+Q6yj5vxf7QyrCCflXpgWl1n
         1mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420973; x=1774025773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZHP+nmQxYBG9XCuehu/97dhHO1vliPQgGZ+V2Z0h3w=;
        b=ZEcEjPfDJ37cxTZvpclZX89Z8SHjyga5LfeC6e7XxnHZJJBWa3WY2PvMlKmGfzbYia
         4SD5aST5A+swZJ8+dQ+I7znYUbOW9YuGb/Fdbow0oloYc/arXUVUQaY8jCx3NhnZOiSU
         Fu5GQ+LWWqDs7MtqxMFFOxzlazv2OzMAnyQrBsoW1dp3pN6FifYK0UyoC5MaqZ4tGvJT
         HJaECkWS1xs0vKIVT10pdJzcyX/dqEUxCpEtLrq3Q8Nyy4m/Vm23Yqvl8m+zIG9bgevI
         CegTI2xUIH/scjzAnkw0vFizYGoFw4PCSRpq/9Tu52WWwTVaWVm7t3FbZPqiB+PdF720
         Z/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWMAKvH00oToAbX4+szRlmpP4Us8ZAuZPEE3ferlRNvNE09bD3ebNt9sxAwhnWjX5vtlmk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDhPxwgjXOpoXfoVIgCUwqiTDlt8b4g9Od3MqFXh1cmXLnNhvL
	xTytzHq3RETmT5Bj4o0ln0ZsPaK2b87MszgZixzUVUlyKQekJsKAuSwT
X-Gm-Gg: ATEYQzyW0ZzCncPQ+px9h9ZkYGa+XDU50gjjPf39olELCI8vLRMp+yfugQz9PfDM9aF
	o9dxxjCuHJ4Tw/thD3rtxLCPjPEfIFFIo3MXhG7sG1Jm4aWoBBXZqCHN45ba10MYINRPb7W+VFI
	Ew6DNU2fxeoFRScW8yEumwMkvZHa3j/+32HOHAH8flFU8TqEY7OP64Ga798I6tT4LQajG4+dWML
	PLdR1ldokMRxoeUJwSxxwQL+foUUXP71/G+TSMlfneEuGHJPKcnFlt0pxG5Pxsd7UThiLslFpq0
	VN7lbJx8ucaeALLBXeXd408h74Xew5NeDcfaW4luHlwOZ20MXr5zWg3vd4TlewlU9p3LPy3rGgt
	myHzgHoy2TbvyrBPWAjIHXZSwTvqg8cIFPL8ITU4EIewfdkvVbMEqoanb5iN6uuH18hcAgVyp3I
	NvUwGi3dpH3aWviaBhJaR+zGFdnwz5symH6r6GUzKLPSoiugYeAYP38Mt52qo/Wgc+Tr53jqjPx
	RNy1BbR2cCcwVzl2kpq1z5h869EOlObmlr4J79LaHn7rw==
X-Received: by 2002:a05:600c:3590:b0:485:3b34:2f61 with SMTP id 5b1f17b1804b1-485566c9464mr70256375e9.7.1773420972648;
        Fri, 13 Mar 2026 09:56:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fed7sm202895695e9.11.2026.03.13.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:56:12 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:56:09 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <abRBqaTybiVv7mv2@Lord-Beerus.station>
References: <cover.1772642881.git.stefano.r@variscite.com>
 <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>
 <abQzQnmG0Xh7wXjt@Lord-Beerus.station>
 <abRAaZkks9Jilo-S@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abRAaZkks9Jilo-S@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Mar 13, 2026 at 12:50:49PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 04:54:42PM +0100, Stefano Radaelli wrote:
> > Hi Frank,
> >
> > On Fri, Mar 13, 2026 at 11:13:35AM -0400, Frank Li wrote:
> > >
> > > Can you rebase to my for-next tree
> > > https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next
> > >
> > > And new file, run https://github.com/lznuaa/dt-format to keep node nice
> > > ordered.
> > >
> >
> > Sure, I will rebase the series on top of your for-next branch and send an
> > updated version.
> > If possible, it would be great if the series could be merged as soon as
> > possible, to avoid having to rebase it again on newer changes.
> 
> I try best. I go though as reverse order patchwork order.
> 
> https://patchwork.kernel.org/project/imx/list/?series=&submitter=&state=1&q=&archive=&delegate=
> 
> Small fix go high priority.
> 
> >
> > Regarding dt-format, I can run it, but in my experience it is a bit buggy.
> 
> Put bugg in issue list, I will fix it.
> 
> > It sometimes moves comments to completely unrelated locations and does not
> > always keep a logical ordering of nodes.
> 
> Logical order is hard to follow. Each one have difference opinion about
> logic group. I am trying to normalize and machine script. I use same rule
> for every new dts file.  property order is not so important. The key is
> node orders, which try to avoid add duplicate one in future.
> 
> > For example, I saw cases where usdhc3_wlan was moved before usdhc3_sleep,
> 
> > and pinctrl nodes were not kept
> > at the end of the file.
> 
> About pinctrl nodes at end of the file, we don't stick this rule. There will
> be more than one pinctrl nodes.
> 

Thank you for the clarification and for the work you are putting into
reviewing and maintaining these patches.

Regarding dt-format, I will open issues for the cases where I noticed
incorrect behavior (such as comments being moved to unrelated sections),
so they can be tracked and fixed.

Thanks again for your support and for maintaining the i.MX tree.

Best regards,
Stefano
