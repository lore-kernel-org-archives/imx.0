Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1001EBFE8
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940843; cv=none; b=TATOcnj25iSxgke5HYuy/jTjSUW42WCCTP83tLYuBJVHxK0gp6Z84YCw3LlEHFcG5pRZZ90hij0n16peR8DqMdOJbDgB1PxF8LXs11QToNB+sWzFHAXZ0gCG+/YNisbe22uMm4RSVi7vunXaf1W1JHE40Yf7MuSb78tWxCecV9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940843; c=relaxed/simple;
	bh=lAiEBNayTGDW4da0WgLzFvA6vCvneaRqJoVHV9L2uSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQ02iTQwIzVLhzFk63NfUT8TZ1DNYUowa3k3hPEsRYBoG06qQNEqUaxEo9XGuwvlV+3n8n1cVifhLr/1ZBhBQuMa766NvpQjGePH3PlXFwqAo6JySIDirJ2i7ZOyBvCv8ajGMdVDPB8fmHizxcBRFgGU5K/XY7VSXOSUz1Y+Dxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so8294458a91.1
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 03:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940841; x=1737545641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT/v7v/ZhP1Oe1gXNKmpWEOBnV3Q/4yYH1W0mn6Z4Ew=;
        b=QIDMSuU00q2QLS3jR75lzbxJpQ51GdDt3I3+U0SAz4+6wVMIuLiGR/Ker/IkuvvIWF
         NtkfV60ptXitTrBpXg7F/LO9l3/dXEVHt7JprdefIMr50HGh1DhjGPdU5RSVLjhcJWdF
         M+/OE4oVUTwVfkBcZfMRnuGIgtGMVqLFGBUOejC9bT5sWvmvAZ1WEbfKN7lUvTagdakS
         bi9BdSyju0Vsr+y9ma7ZGw9XLxstvONNawZ5WWYGnFwAWDwRr56AIB1+s3C8bbhulUtj
         u065yoHTuayLGXQXHnA/NAz9sSRXFcLkABBO0WteFSFOq8sRc6ouuEXfDc+CHYPDwsd8
         /EgA==
X-Forwarded-Encrypted: i=1; AJvYcCWU6ce56r1LZ2W5OJMZVngVH/8R011tnjwSMH9cWc4tEaj07u6XHVnZhKkOizGJFd7zxcE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLP4k7RUGg5MOmPpAN2RnKujACrvVIKKkDbhFm3bTO7RR9LRtP
	1LlehsUEdZ/ziUI9Je3nSjW8IVTuSTERpPt9XLWbkisipzzxCWZX
X-Gm-Gg: ASbGnctZOCzR9xl3iZqFmL9q1VXXBl2x5hWix3fjdfap2lFkKLo9tbZAIMbxEHtRkeM
	wy3cBptjgVEhta+mVZ2mF/XHIDz5RvcqbSbdDhiBe0AOlU6jcQg69NxNAu9uI/DIshqjOisa8ty
	UpHrNY7xgO5jEeu190DbqVVYU/xVh7lnrivit72M6uu8qQINS4YvYtVsxSET2hQbBk4b3rZgY+P
	5IbJyvKm8G/uNP5G0Bjs8i2fa9aBp2Igvyxcoq2m3OsHeuLM6dgMywLoOJpVwgDS5ixnoSLZri1
	FWvKMKNGv4r82i0=
X-Google-Smtp-Source: AGHT+IF3ncfyJJ4wHbo8dW61YM7Q6SfSbohDD2GtZKlbQZPatS+OS4uMy9se+AnwGY6nzxZyX7BPPg==
X-Received: by 2002:a17:90a:fc48:b0:2ee:c918:cd60 with SMTP id 98e67ed59e1d1-2f548ee4bb4mr41256309a91.20.1736940841043;
        Wed, 15 Jan 2025 03:34:01 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c20cfe5sm1160921a91.39.2025.01.15.03.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:34:00 -0800 (PST)
Date: Wed, 15 Jan 2025 20:33:59 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: dlemoal@kernel.org, jingoohan1@gmail.com, bhelgaas@google.com,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, frank.li@nxp.com, quic_krichai@quicinc.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Bug fixes when dwc generic suspend/resume
 callbacks are used
Message-ID: <20250115113359.GL4176564@rocinante>
References: <20241210081557.163555-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210081557.163555-1-hongxing.zhu@nxp.com>

Hello,

> Some bug fixes when DWC generic suspend/resume callbacks are used.
> Drop the first patch of v3 patch-set, since the use case of this patch had been
> covered by #3 commit "PCI: dwc: Clean up some unnecessary codes in dw_pcie_suspend_noirq()".
> To be simple, re-format the codes, drop the first patch of v3 patch-set, and
> only keep last two patches of v3 in v4 or later
> 
> Here is the discussion [1] and final solution [2] of the codes clean up commit.
> [1] https://patchwork.kernel.org/project/linux-pci/patch/1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com/
> [2] https://patchwork.kernel.org/project/linux-pci/patch/20241126073909.4058733-1-hongxing.zhu@nxp.com/
> 
> v4 changes:
> Drop the first patch("PCI: dwc: Fix resume failure if no EP is connected on some platforms")
> in v3, since it's use-case had been covered by #3 patch of v3.
> Add one Fixes tag into "PCI: dwc: Clean up some unnecessary codes in dw_pcie_suspend_noirq()".
> Refer to Damien's comments, let ret test go inside the "else" and remove the
> initialization of ret to 0 declaration. Thanks.

Applied to controller/dwc for v6.14, thank you!

	Krzysztof
