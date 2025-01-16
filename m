Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C136AF5
	for <imx@lists.linux.dev>; Thu, 16 Jan 2025 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736992576; cv=none; b=VEcJ8H2Ff+chWlBgRR4SZBFWQdVcts9WBZPRjzCjeXCbEBksrGWCUExGfSfwrGcg1+YdsL4NIpH4kfUdAAIrMFc4q/ZrySOUrEiTk2WCQ7cDcPskKMsqC+Fu9YOz8if+9LYH4/iw+8vIngnH1PCWuBb8yZ/WyfY07B12rDihFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736992576; c=relaxed/simple;
	bh=M8KRNKIeCxlHpSnunFXinVKwJ6BlKLwYSggX+T00lq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCEXsN1VEm9UC/o6NrwZ+/Z805qXUHx0LhVEw2RLswsqhJIUGt2bDsR3rdI5uPhCA+KGNicclOKjNuVRvaVtp2OZEhOhGFHzRJ5Jdc5edA5IocZe4+FcpBgL5Wlxuy371N4GMWMKe49vbaEG7glpSh7hrhPBOtKzjCqLr6d9Ucg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so793225a91.2
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 17:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736992575; x=1737597375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPT7HO0uKhENdBsBoDbMFzCNa+LMh6a1srxsA8S0Gko=;
        b=qOot+pePMhYscEZwTW5Kg2fPoQYRfhjf5H03YsOpru0IuZb7F2T0S5gsHAAPI80SS3
         k/GhPHgKEs4MNyeEj2OkQen+RT2Ioj0k3nt135ub52rEhG0FYxmBJ8NemDdeeyISQ65a
         fO7ZpjNrlRBu67c9MVTUVrioNsnbqjhwu5x+OuS9h/9z50yeO1vbgfc5yzuUb0XWBGgK
         mZ048XNf0Mb8CYTKiDzS260iJzIP+bjq43wm0VK6KYUuB0Y/ygwTWGAsneMR6JItR6Bt
         aOhwlCTd7fwIpRb4pQHFzNoiK1qVK5DKwePxWfLLaABuvWC5l5nRlBmLwi9v6TRe4wYU
         WIDA==
X-Forwarded-Encrypted: i=1; AJvYcCXj/cobmdySj69u1bjd1AbPn/RktgzJ+Wpa5Q7I1FbyI9GUl90/4fU/fKi5h/cDWD7BRmw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyylLjwdI+pcukLgurvgiT6i/zYwJaasKBb2EMKKjVwiscdom4l
	IAGF9pItsLl+ZVrAWjFNQS+k7PU0792jGINx0WfINABQ1l479leY
X-Gm-Gg: ASbGncu7NNiipqsIgXLSqrCt6G3+UW57+GgDGb5bNnepnJDFgfjCFdBizpO13cxLbBu
	lUz8tYfXwfOiEv3wRWTS/G/0rzXLe4R7SY6o3j2D6N67RWLzp73MogOLWQESmUk8IbaQjR1ZnLI
	wKnmO/uII65jKMBT0Zw7SpzSlIvElxvECrfmj+hpnOUdBnVXifyYIVGIUAUo0dAaVjroTqvkjC3
	xMWnB3Q5p9P5DjatAOTaz7TJqM6qd7+aA8JSMHPnxphPd6pj/j9sTkj9yhDgEWnn4FfBb1c5mYo
	YjuoP4Oq3aG35Tk=
X-Google-Smtp-Source: AGHT+IFLaJYooeBDIow3d6P4KJcawUwpbKu9ceRFklBWxLItU2fkeooWGqXZ3z89KdMiKUuR60q/Sg==
X-Received: by 2002:a17:90b:6c6:b0:2ea:8d1e:a85f with SMTP id 98e67ed59e1d1-2f548f44771mr51223268a91.17.1736992574668;
        Wed, 15 Jan 2025 17:56:14 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c1cec9dsm2087075a91.29.2025.01.15.17.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:56:14 -0800 (PST)
Date: Thu, 16 Jan 2025 10:56:12 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <20250116015612.GC2111792@rocinante>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
 <20241124143839.hg2yj462h22rftqa@thinkpad>
 <Z1i9uEGvsVACsF2r@lizhi-Precision-Tower-5810>
 <Z2R6HET6FZEO+uwi@lizhi-Precision-Tower-5810>
 <Z3wPX1F4VrQZhICG@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3wPX1F4VrQZhICG@lizhi-Precision-Tower-5810>

Hello,

> > > > Series looks good to me. Thanks a lot for your persistence! But it missed 6.13
> > > > cycle. So let's get it merged early once 6.13-rc1 is out.
> > >
> > > Krzysztof Wilczyński:
> > >
> > > 	Could you please pick these? all reviewed by mani? It pave the
> > > road to clean up ugle cpu_fixup_addr().
> >
> > Krzysztof Wilczyński and Bjorn Helgaas
> >
> > 	Any update for this? All already reviewed by mani.
> 
> Krzysztof Wilczyński and Bjorn Helgaas:
> 
> 	Happy new year!, could you please take care this patches?

Happy New Year 2025 to you, too!

I apologise for the delay, especially given you chasing few times.
  
However, we should be good to get the series out for the v6.14 release.
 
Again, sorry for the delay. 

	Krzysztof
