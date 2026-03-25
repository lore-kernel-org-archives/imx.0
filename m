Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184353CEBBC
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452359; cv=none; b=AGKGqNFinxV4XIqNNoIoi+mrQnWru9wYnPF77JoMHxSeYgbAbFvN5bvdxslpNlcuANiNvo2uzrG7zjGtfDvQs0JGB0NWS5mtymEJ53HNH09zdKSatjkKeozgthS6HTI4yXUcg5t+4/UY3qjJ2zQR+DtBKgCnPB6t1LibmGOdrtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452359; c=relaxed/simple;
	bh=VbLhyE1Q2CYyoKsAlVpn+HNFFx8CDjWS5a1z4tWdP/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUDUy+nzrb5Vl78P5X0KYOKAssSs2327njaNLv7BmolqasHQeakpmHgADEoRp5NHOuz+8fX/McC3b51I6dIrpOpfpDygUsTrXImCah2e7mOcYfnI/Z1XzaUOMJsqCpwAetmFHbDninrN6jl6YN0jOOfockQgp6oTamZVbIn4pfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3iOAdZF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3iOAdZF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so45679055e9.2
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774452356; x=1775057156; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsqamBp8hVq8vMV9I7W5DvdI+pm9r55STzQZW1yMNLQ=;
        b=i3iOAdZF3KvGnOF9M/KQ6jwL3FFFZGNHPYKk3rvoojWzn79gF4yQZ40uzh4gcH+uqZ
         rA6krXNYuerX1dzr5xl+stz7DiH4NzIDSOvdrqlnUugP6h41kNWYv4sDtrNBPSkbMWe1
         Kwsugzneklw6SOxxh4bsoG894XoGlMzcRcO9Q7Ogo0b1myqu+Wzalw1OYssS3//tTrzH
         un9+DUc8EEGFhatszPDokVjGzctjMQWjJ2+TWaUngEgm/PoV1ox71m6mbUp4vqj59U+N
         /k+a0BJSAYRXzS1wVypCnynpqFBy2RTIoOhXVJ59NArSpJ8qVtKxg0FmIK0lonMnqElf
         i80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452356; x=1775057156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsqamBp8hVq8vMV9I7W5DvdI+pm9r55STzQZW1yMNLQ=;
        b=NWb0mRDH0H8p5mBdWvVFP0vtvvdsKaxXcUC8DAxdLIaDiXsc6bgUzuIhWRXLod3FWP
         rIKOntl1la91mTlsEsmdjBWhO07c/tseW7MlnXSOSizGigb+Ovk/fmSglhXoZmLPecDI
         vZiyrMEH72A59UTENkXaf59aiqxxsBlYckd8LxGzHKDmAE6vQajV8Xh1EGBKYu+MwMvn
         OYtZ4zT4M4RKISKv9gG+LVmQfAvODya+O3cTPF7KcvilnEZdzt46qJfO6IJB1QW0jcFm
         RDZtrpKzZJUWSuwSc4byu7Qb/NUAgHYwvU8D6Yn0mzSQYpFVcKEIZr+eRabu8eVcebt9
         CuJw==
X-Forwarded-Encrypted: i=1; AJvYcCWUOC9LQrAaIuuWVv1PRQ2OHe84NcgmsbAOoIUsX0qHvyIF5qmlhj3A/mUdJu2AvywR3zI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyO0zFDl+EbZC0SnS+/HycT0kZSDvdKA3M6c28wieYsP1hrMCK9
	zyma7/HA3g6MgshPLr91uimpnavuJGLxc62MVjSX8/Zs6beanquhRFqE
X-Gm-Gg: ATEYQzz7j+ZhZusFi9EEDvHykjuaMn8hejiQ3+/HRolCtHmgunSvyUMYwigX9Kl5+61
	jc7K54r0dk0asHvxjW7m11UQmmrcHGkkrjApRrbDvFYFsxBvRxud9ZX7QBkZkUEsbnY9+LY3NgH
	DYTaScIqRoimar0x25kesO/PhSvlbQQ8Qm3XG2bziCTp950ITVl/hLngS0Tjz3r35ViCDyM/Y1h
	iC2fj6P/b/O8g8BLnYCACWsVQnOFGwfHc2AWCtrCiszK+bytPDfUQtFnkw22PDPNkZWTRMPVeyp
	2o6stuUPkvGA7+hhHzbCXnRrGkBwAuXemvzIhEK1Gi2gq7AiB+pfIiESa3ADZvAkSdiYOjbRarv
	eTlVq3EgeBuP1RLjANKeW7UEVm2CIXXSbEvsW/gIJh6Z63Ua5VQr+23LRpqIhelsNt7YgtYvyFj
	bTbH0kOdoldROjHFNE9i3zz2dIfJLlBHqxbJfhGwzmgYpUjm/J2K+7WxJX+gV/tcnbJbe6v2JIQ
	SBNLG7iALWo77h4sKZkmCrMWjCrYLtBlRvn35//JYyTn/XrvOLemCU=
X-Received: by 2002:a05:600c:1d0e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48715febda2mr57676625e9.15.1774452356292;
        Wed, 25 Mar 2026 08:25:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487172a72b6sm39684025e9.3.2026.03.25.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:25:55 -0700 (PDT)
Date: Wed, 25 Mar 2026 16:25:53 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <acP-gZii2WrU6eL-@Lord-Beerus.station>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
 <20260325122104.GA19112@francesco-nb>
 <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>

On Wed, Mar 25, 2026 at 10:50:57AM -0400, Frank Li wrote:
> >
> > How do you know that the correct copyright year is 2026?
> > The copyright years does not change to today just because it is the year
> > it was submitted.
> 
> At least it should include 2026 because it is new files in kernel tree.
> 
> >
> > I think that you should refrain yourself for doing these kind of changes
> > to the code when you apply patches.
> 
> If original owner have concern, I can update it in my tree.
> 

Hi Francesco, hi Frank,

thanks for the clarification.

In this specific case, I'm fine with keeping 2026 for these new files
introduced in the kernel tree.

Thank you all for taking care of this!

Best regards,
Stefano
