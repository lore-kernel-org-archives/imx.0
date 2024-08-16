Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5477115
	for <imx@lists.linux.dev>; Fri, 16 Aug 2024 05:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723786958; cv=none; b=nAE8qxklRCKo3Q/I/NeuUhf1w95h8gTiGouw+nLzKvmRZd/XpkHx6b4vyeRIXnEvk4uPOwq2o6opH30/hjUmJ8a0NytS/gQMW4DBPnuwtpLFqRsL5BOqglE+uh3iIrEIAgfN9oDWgQ1wlcOqlL6Q1DBf98RbJgNy6XWaI6Xmgg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723786958; c=relaxed/simple;
	bh=wohqTZf8t1Jk+MndcRSLVbpLyYPLFHLPjLBZp8g4Nck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPD5bU9OX6SEA8DknYX0qfpRlCvZJ4Svw6ugnpoWqzvX4ZDHtdkMbyUExZiREdcuHQXWRQxWtIeFBi/UmNGe/rbwpIif6uS5aBrnWl+rTy71e5tIVXqWY89nz4S0N69MX5H0se6BJAZc0NiLdH/PoAtwZVCWJ+/FpwFVXiGlT6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e7BIRrhX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e7BIRrhX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc5296e214so17496225ad.0
        for <imx@lists.linux.dev>; Thu, 15 Aug 2024 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723786957; x=1724391757; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1zci/IGVklrrERd0voR2gAN0eGC9GDr/hC8qN9xtn5Q=;
        b=e7BIRrhXTHo1/c9k2JANAx1VpSQHEuRTJakGVPKlWttrk8pxrSupnNEAy811pEPZC/
         DV3Zt8c0ONWZZ5OGAl4UmBsnz0G/RjWjrx9+1a0EKlGQO7VZk7CUSOExsxnAsGe8Kq3Z
         0xuNxLmYD1IhyiDc0Zybz2ro6kB/fmLV47h36NAFsp1WQVh4FOPzBeEJotsU45S7XUdF
         /LSLujJSPVhieHrzLAc6B8uRweyLWqJ2X/FIS+yUD3gP/i7XRU/4MntJ+76d72+ckFdK
         wYHhzoPWFXcCPkAPxJnOha/YRt3fKy20xD/C5GzT93CXM1YwFgpxdcfdLJNeHzeYuB+0
         hmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723786957; x=1724391757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zci/IGVklrrERd0voR2gAN0eGC9GDr/hC8qN9xtn5Q=;
        b=L1GTjVdBd1bRr5mO0UO35kV8OxbUqJ5fGELDgF//xgSyw8Nx1CJxc8d7mnhIiJJIc0
         rrdj97ZSkBSYWHOKta/oRTDgYAGPhGpm00Hdm37dHaaeJaInhvI2U0F/7ykgfjwrE1IT
         gdDAfQrWJpu1VgwIQQpaE9TRsGSIOEepo//6Bl0icuDPPpgBFS2Kjcat0y5dsf5ViRs7
         eKRKernoRaHIBYXJDCGJvmMajed2S9GmWY136h7LsvWPtbQiiR0PRLgo0Rjt4W9KiB9V
         CNO8datXFtbTaeIREfYfKYUP6qemliNWH1+SyH7RhROSzvzew15g3SQMokaYW3EFag9b
         iSrw==
X-Forwarded-Encrypted: i=1; AJvYcCXlxKvyYSmtQxRC0HOMROv66nC8yxTphlj/AmPFudDOzbi/KTNaV3PzTVGs2/JtOhEvZfeGOL7ncy+E5FekIUpjV09+
X-Gm-Message-State: AOJu0YyycH9pf37tjPTtcL15XJ3WkEk1pHv93+hfROWr6ZOaFujY3EHe
	Vb6Wmr8go8uBLLasRIr9uxKX7B9Ewkcy7z/RuQ19b+E8Pz4yG9eC7bPZt3SjLg==
X-Google-Smtp-Source: AGHT+IHIZHrP5ZboVbh1QQZED8rf6LC/BeZ6VJ6E4Bv0Xpt5BhFb5YGqBfgkTjypqHMC3h9KdBKjEA==
X-Received: by 2002:a17:902:d4cd:b0:1fb:1497:c304 with SMTP id d9443c01a7336-20203c08736mr20189095ad.0.1723786956641;
        Thu, 15 Aug 2024 22:42:36 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02fa4a7sm18548605ad.38.2024.08.15.22.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:42:36 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:12:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Zhiqiang.Hou@nxp.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/4] MAINTAINERS: drop NXP LAYERSCAPE GEN4 CONTROLLER
Message-ID: <20240816054231.GG2331@thinkpad>
References: <20240808-mobivel_cleanup-v1-0-f4f6ea5b16de@nxp.com>
 <20240808-mobivel_cleanup-v1-4-f4f6ea5b16de@nxp.com>
 <20240815155343.GC2562@thinkpad>
 <CAL_Jsq+rnUB2pDjf6qFF7ThtSD-C8MMZUrhJmTYKfts34Zhr-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+rnUB2pDjf6qFF7ThtSD-C8MMZUrhJmTYKfts34Zhr-A@mail.gmail.com>

On Thu, Aug 15, 2024 at 03:15:52PM -0600, Rob Herring wrote:
> On Thu, Aug 15, 2024 at 9:53 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Thu, Aug 08, 2024 at 12:02:17PM -0400, Frank Li wrote:
> > > LX2160 Rev1 use mobivel PCIe controller, but Rev2 switch to designware
> > > PCIe controller. Rev2 is mass production chip. Rev1 will not be maintained
> > > so drop maintainer information for that.
> > >
> >
> > Instead of suddenly removing the code and breaking users, you can just mark the
> > driver as 'Obsolete' in MAINTAINERS. Then after some point of time, we could
> > hopefully remove.
> 
> Is anyone really going to pay attention to that? It doesn't sound like
> there's anyone to really care, and it is the company that made the h/w
> asking to remove it. The only thing people use pre-production h/w for
> once there's production h/w is as a dust collector.
> 
> If anyone complains, it's simple enough to revert these patches.
> 

My comment was based on the fact that Bjorn was not comfortable in removing the
driver [1] unless no Rev1 boards are not in use and Frank said that he was not
sure about that [2].

But I think if Frank can atleast guarantee that the chip never made into mass
production or shared with customers, then we can remove the driver IMO. But that
is up to the discretion of Bjorn.

- Mani

[1] https://lore.kernel.org/linux-pci/20240808172644.GA151261@bhelgaas/
[2] https://lore.kernel.org/linux-pci/ZrUJngABI8v3pN6o@lizhi-Precision-Tower-5810/

- Mani

-- 
மணிவண்ணன் சதாசிவம்
