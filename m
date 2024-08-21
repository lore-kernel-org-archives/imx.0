Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253811C7B8D
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724254866; cv=none; b=en3O8kiVdpKu42Pzvu+5FKVcMhZLefiaYvFQ2JDJS5T3dzb9AxdK1VU3KzJZZ9+V/6f4H7Ee4cjSdAnrNYjX0JG2ibLYsPY3Po8hkYUyXmXV8RPxQNJMQAJAsNWXBNdFOt7un+pLo+vKtIqWxkYjADt/f+HvRswGnHYQB9nxlmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724254866; c=relaxed/simple;
	bh=vzRjhS7+octK36jnSe580srSV99gX3ihUMa3REwO3yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiwY0E25Qa6g560yW7fYfyiRNo2okTyFx8q5C4bisTtHmGe2ARKzPx+UNOt9BFK5hgipUGqni5j4JJoJJzs+x7V1rmiA+wAMFh/iIaeK6uBWeoK5kwehe7tWzggXuF1hziKQE9J0hh3hKQWxbfzKDphoFSzGUSK3d3LAqu7+43A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/h7kvUG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/h7kvUG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428163f7635so59899865e9.2
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724254863; x=1724859663; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnCSiun9t/RJbFPil7xi9PoRJLxM8vFSfSVVmmvO+8g=;
        b=W/h7kvUGyk7fN727w9Qy+fNaCLem3CGj644quDo5rwfe3V5C9dskZe8DUZMZ5jFwJ5
         8Y6Ac8Hhg+OaKPPsLjQmBqxOLKXAQdkrUsIO+YQg+LWoWMAZNxDsfS+E5FGesu/xcTWs
         uMKgJAEHOIHkTQruB8FuHLEka1ZOGHNfaz/JdM5vNC44qZLywbg0nME/P5NR2cr8gWbs
         iJwC5J6jV2WFn0hLV5ykk4pedfe8WJNCFuhF111eTFC2BXWv5+QitqgJF7g4FCB3l/nz
         jYRCU/OuoPtSd8C2C4IAwdnr9L+suKq1etRjcRKsG98pVeFD26Jvblni1Bzo4FCkupwR
         tDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724254863; x=1724859663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnCSiun9t/RJbFPil7xi9PoRJLxM8vFSfSVVmmvO+8g=;
        b=QBw8pWJ43KsIW9G9RcunEImbHdEXLwR0GoQPzeV+98+WYx/pqWS5yQXQPxIZsLGuM0
         KYYbibU5dNhvBYOPGsAKEfZKTxPtbVzp9Ox74SV8qejP4nzFpFAeY8w3lnPZVQ6NGVe0
         07DcR3LAac1+weob7Liyy8pZfSfRPG69UtgEa1PiosWY5XR3fOAsfMZVSiIKWlL3G1Tt
         RkzMdoScjzj+Jpl6SQ0GkLUo4iytE2RVg3izq/lj0zwxjsQJTjtKQTI0eco10M1m6JSL
         Me+fb3BTdwvPSpyz9AtLaFSqqHfvpcG2zzhTVrfHwnq7aK9vtYVpq3Pq/CNr0wLEQEdU
         lgOw==
X-Forwarded-Encrypted: i=1; AJvYcCVtPuMRduAhKQboekjUSjwT4zlnP0wMnFJ7rHCPzhVQfS0yNvnEbj9kdkcYVAnXBTfvYR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlljUZuivl6RGRvsrz1MJj248pvJZdLUFwdOMSS2XD3244i3v/
	0WkBRZ4DnV/7/WPo2SjtX7NSt9dNvgsj8FZE6g5G5F+f7qI0ODjD
X-Google-Smtp-Source: AGHT+IEhSjD1LCYAF1BY6Yws5oSCUl4XcCH6YisKu0nEYXjpoTyvoA5zAhxtl6MA01Q3OJCdSh2Z5A==
X-Received: by 2002:a5d:650b:0:b0:371:9362:c286 with SMTP id ffacd0b85a97d-372fd577056mr1685838f8f.4.1724254862883;
        Wed, 21 Aug 2024 08:41:02 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:ce3a:abb4:426f:fe4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371a937a5f4sm11682371f8f.51.2024.08.21.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 08:41:02 -0700 (PDT)
Date: Wed, 21 Aug 2024 17:41:00 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] PCI: imx6: reset link after suspend/resume
Message-ID: <ZsYKjFXHDVr8tz9K@eichest-laptop>
References: <20240819090428.17349-1-eichest@gmail.com>
 <ZsNXDq/kidZdyhvD@lizhi-Precision-Tower-5810>
 <ZsQ9OWdCS5o96VN2@eichest-laptop>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsQ9OWdCS5o96VN2@eichest-laptop>

Hi Frank,

On Tue, Aug 20, 2024 at 08:52:41AM +0200, Stefan Eichenberger wrote:
> On Mon, Aug 19, 2024 at 10:30:38AM -0400, Frank Li wrote:
> > On Mon, Aug 19, 2024 at 11:03:16AM +0200, Stefan Eichenberger wrote:
> > > On the i.MX6Quad (not QuadPlus), the PCIe link does not work after a
> > > suspend/resume cycle. Worse, the PCIe memory mapped I/O isn't accessible
> > > at all, so the system freezes when a PCIe driver tries to access its I/O
> > > space. The only way to get resume working again is to reset the PCIe
> > > link, similar to what is done on devices that support suspend/resume.
> > > Through trial and error, we found that something about the PCIe
> > > reference clock does not work as expected after a resume. We could not
> > > figure out if it is disabled (even though the registers still say it is
> > > enabled), or if it is somehow unstable or has some hiccups. With the
> > > workaround introduced in this patch series, we were able to fully resume
> > > a Compex WLE900VX (ath10k) miniPCIe Wifi module and an Intel AX200 M.2
> > > Wifi module. If there is a better way or other ideas on how to fix this
> > > problem, please let us know. We are aware that resetting the link should
> > > not be necessary, but we could not find a better solution. More
> > > interestingly, even the SoCs that support suspend/resume according to
> > > the i.MX erratas seem to reset the link on resume in
> > > imx6_pcie_host_init, so we hope this might be a valid workaround.
> > >
> > > Stefan Eichenberger (3):
> > >   PCI: imx6: Add a function to deassert the reset gpio
> > >   PCI: imx6: move the wait for clock stabilization to enable ref clk
> > >   PCI: imx6: reset link on resume
> > 
> > Thanks you for your patch, but it may have conflict with
> > https://lore.kernel.org/linux-pci/Zr4XG6r+HnbIlu8S@lizhi-Precision-Tower-5810/T/#t
> > 
> 
> Thanks a lot for the hint. I will have a look at the series and see if I
> can adapt my changes including your suggestions.

I did some more tests with your series applied. Everything works as
expected on an i.MX8M Plus. However, the i.MX6Quad PCIe link still does
not work after a resume. I could trace the issues back to the following
functions, besides that we could use the same suspend/resume function as
for the other i.MX SoCs.

In suspend the follwoing function is causing issues:
imx_pcie_stop_link(imx_pcie->pci);

In resume the following functions are causing issues:
imx_pcie->drvdata->init_phy(imx_pcie); // in imx_pcie_host_init
imx_pcie_start_link(imx_pcie->pci);

I think the second one makes sense because I could not stop the link I
should not start it again. But why is also the init_phy function
failing? Are they required to setup the link? 

The messages I get when the system resumes are:
[   50.176212] Enabling non-boot CPUs ...
[   50.194446] CPU1 is up
[   50.198087] CPU2 is up
[   50.201746] CPU3 is up
[   50.563710] imx6q-pcie 1ffc000.pcie: Read DBI address failed

After the last message the system hangs. It seems this happens because
the PCIe I/O mem is not accessible anymore.

Do you have an idea what could cause imx_pcie_stop_link to break the
link on resume? Without calling them the link is working fine after
resuming and the drivers can access the PCIe I/O mem.

Thanks,
Stefan
