Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECA1168DA
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 06:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724136769; cv=none; b=eKe1Cw2gNBK7cN1huebgyOkKuyi8+D+oqrzuTCIO1zMa0FQaLZdAHqvBO9AH9u+RRw1aslIZussCLcA/EMo6JndDnweZYk/UJpoJ00G7aMfSC77CFFplkFEMDc1xRuUIaaDcgGeDMJvrqVuu4wmBbdwvCEUNNRGFUy3jBdMFCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724136769; c=relaxed/simple;
	bh=kWsd6UbBrZMTLutzNp0qbaqrK9LVosbs/UMeb/ewGpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUdIc7o/jDotw3mydf1pcO40Kfvk7BxMQtCXwWyaAwxp4GTE5XT/pzLCzjy7BQuxIa/mHfl1Cn49x5PYf6SFWJETgBIjNAxuVoCYX1e8OB3CQ6JbdgCZgB7nDV2jgQOe0afKc45YCMHwyaatALY3TQl6KuHsXc97PVVY6XPQpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcpimYT1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcpimYT1"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efdf02d13so6780560e87.2
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 23:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724136765; x=1724741565; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B0fnzpeczoVILcPKkO8zLBXL0D6BHapuvSYzKwE9Niw=;
        b=ZcpimYT1XjypizrLU9ovcPXevsfrD3Bg89atU2+qLdpsRj26d3aUkyZkx9gqJdGq10
         e7mzTNk9ppzmdk0eoWoGP14UJ4Z9cfDXFmQmsH/dazJDdLk/8vRu7c2dYSoCYtC9Fe3B
         hfH/8Tc5KLhHxMZWbbphN9R5YMjZMieFFfbvui1VF3ROARdrwZ6wP13BzaORcaYHLWYP
         jGDA97C1JZk62Oo92b2wTqjI0QhTLEWI7HKafZTmTwKll5qe1VyS8x30AJu418pnlOO9
         vB7VmmT4XPL/zF3egNQqPhdR5cgCScvsBe/0AGJGXlSirJO19dLMBNA3jgem8QOLwFp0
         2Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724136765; x=1724741565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0fnzpeczoVILcPKkO8zLBXL0D6BHapuvSYzKwE9Niw=;
        b=phKQ9HTf3dduxOOfrGKykumJrQALQjZn59DsW4uDBN9WQoM+guBr7lydYD0Qu9qgWt
         CYCv8Cdluc8jMmJ1yNWkxxREnOGPShZsR2w7sZa5v35fXNpsdE4ZgFXJRXQPNy/34mwS
         wNJ4GxDipH5z8xnwSO27bp2EEcljNlbRx/V12kReZDc1CyYEAsezYIBivvTHpXwoqBI/
         4RsWTs6i8qVTrtpRakt8bqiEo+RcDhbmYGBW2UWb2IHHSgMAUFJuqyZDFXYTUf91bssL
         jbPi9iHFw49bOFr26Pei+KasdUrDAi2lwztvuRjxOzYJHkSMmWZ2Wxo+jd/zppIQT78Q
         jb5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8Jnrq9DGR2htgBye8RSwlUcGzqcqDZ1dGFVw3cYX+RdvIi1oVVfRCwI6HD9+s6YFfsVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/eRIHA0vJoEz/nnr9uPkaWjnXOw/jXO4m4lbHdDxooMxFQthT
	69TTbhmzQReRtTdgHH0yb/rS73XnsL833ys1W32wBLTqUBtpzxep49l/iWIt
X-Google-Smtp-Source: AGHT+IFovNs2nwZnc1lJwCKr78P7Vc8jgqy02le1EmeWWeioP/zLobADP3e48VyNL9RyjxcDN+vlHg==
X-Received: by 2002:a05:6512:3da6:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-5331c6e3b3fmr10786119e87.51.1724136764869;
        Mon, 19 Aug 2024 23:52:44 -0700 (PDT)
Received: from eichest-laptop ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838394645dsm728973666b.144.2024.08.19.23.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 23:52:43 -0700 (PDT)
Date: Tue, 20 Aug 2024 08:52:41 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] PCI: imx6: reset link after suspend/resume
Message-ID: <ZsQ9OWdCS5o96VN2@eichest-laptop>
References: <20240819090428.17349-1-eichest@gmail.com>
 <ZsNXDq/kidZdyhvD@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsNXDq/kidZdyhvD@lizhi-Precision-Tower-5810>

On Mon, Aug 19, 2024 at 10:30:38AM -0400, Frank Li wrote:
> On Mon, Aug 19, 2024 at 11:03:16AM +0200, Stefan Eichenberger wrote:
> > On the i.MX6Quad (not QuadPlus), the PCIe link does not work after a
> > suspend/resume cycle. Worse, the PCIe memory mapped I/O isn't accessible
> > at all, so the system freezes when a PCIe driver tries to access its I/O
> > space. The only way to get resume working again is to reset the PCIe
> > link, similar to what is done on devices that support suspend/resume.
> > Through trial and error, we found that something about the PCIe
> > reference clock does not work as expected after a resume. We could not
> > figure out if it is disabled (even though the registers still say it is
> > enabled), or if it is somehow unstable or has some hiccups. With the
> > workaround introduced in this patch series, we were able to fully resume
> > a Compex WLE900VX (ath10k) miniPCIe Wifi module and an Intel AX200 M.2
> > Wifi module. If there is a better way or other ideas on how to fix this
> > problem, please let us know. We are aware that resetting the link should
> > not be necessary, but we could not find a better solution. More
> > interestingly, even the SoCs that support suspend/resume according to
> > the i.MX erratas seem to reset the link on resume in
> > imx6_pcie_host_init, so we hope this might be a valid workaround.
> >
> > Stefan Eichenberger (3):
> >   PCI: imx6: Add a function to deassert the reset gpio
> >   PCI: imx6: move the wait for clock stabilization to enable ref clk
> >   PCI: imx6: reset link on resume
> 
> Thanks you for your patch, but it may have conflict with
> https://lore.kernel.org/linux-pci/Zr4XG6r+HnbIlu8S@lizhi-Precision-Tower-5810/T/#t
> 

Thanks a lot for the hint. I will have a look at the series and see if I
can adapt my changes including your suggestions.

Regards,
Stefan
