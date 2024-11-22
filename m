Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A67082F
	for <imx@lists.linux.dev>; Fri, 22 Nov 2024 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732294641; cv=none; b=n6XvlzqgU3d5wfzfHkAoG9TB/4fyP0G5AFHmhyUDke2dt0dLXs+St+tlmgXndZay0hkt4fDryKmriJaIlBrdjybvWRe5jgTbZKtknaban+PWy8soYPt5ldPma1PtQTdcvw8BZHtvmmj7I4DdQ6x4E+TQ/lwX7/7t8lGZRT/7ivo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732294641; c=relaxed/simple;
	bh=ZNhJ0AnnhsP1xQ5LpsDqA3efNo9VGhUGzrAteBE+23s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKk1FNXz+lcP9EHVKjdaC1uVcVMS8h8Nb85lG8HJGjqn7v+SFhDP/oriF9WCJTt3UZt6uM8S7qN6wCRe1VsbtiSrw2AEBz2lZ8gUkOqurxRoMPl0QeC/QBHGMZBiM6Al/4w9aGassJNpB49svoEE5ZOsEfhS+uqn+T4E/T7fU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytUyACfp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytUyACfp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2120f9ec28eso18915505ad.1
        for <imx@lists.linux.dev>; Fri, 22 Nov 2024 08:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732294639; x=1732899439; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZwDSMvFnipM0RD36mLVFKH4L1T4MEAtnhkfsYAv+8A=;
        b=ytUyACfpVUZH+Wgce66R1h9zfMWGs8SlmeabJn8qJ9t2wQ3WKH+U/iyCF6vOMSeOzc
         zRFXJkOMZFkRGYXsmTLPJEg8+usSXkFOywdetu4MqQh6HAOePTBXmAyEb4alkjMS9+dl
         9G1cTKPyE685TwNj1L+XBJ3sra9ZLrOCW5xFrehJovHWYOWNQIw3p+zW8AK+qlAnTBPG
         Hg/4ogiN1Gfb+5wWdidkdF3/MhWeIMxXmvFn2Sj43QR2XF8lpJjB45JEpR03XcC4MDlt
         0mOBv2SDAaaJLiHKKhWOZXstUJXxpTjm6n4kmXfOaEL09/gh+kMfxX8Ia8yo7GKDWv3u
         4IIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294639; x=1732899439;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZwDSMvFnipM0RD36mLVFKH4L1T4MEAtnhkfsYAv+8A=;
        b=RNDfS4v2JhpDfhyARL2f515Uc27jDgwpeKbaUqklJYaywVhmHFe5Hdb41Xsf2U8aNc
         9os8ssoWZjPLprA4Hs3SHELb70+oQcui6pqWkbCjRy3VGNBZqBacpcAcg6pQgFbYWcbZ
         dTSCBwpMDn6QoVJJt+OGNqyE1kxunRzBh9k75Yh3DWqvGa93uBUygcwk03HaX4/cGDKf
         cEq9M4MulikivyTed6Y5Eh83UvlDfFM4+DdnTSFxprYsFkTYv1GGLaFiyXUIPRJG5FVV
         LmjNwPHTz0rFVHiAQsQswF8fVbz2+19ajwSFZcXv8GV1aUd/Ndgp3YeNCzCt/ymq9FFi
         J+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbkqHJF9S4c3fWLk1JVAHcMiys5bRsFcINi0OsdbGFG9JAmVYE61WT8JKUL0S3/4Jqckw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbttOeDz6sx7MN4mDs0561At+ONQpqXSVD4rW9Gob5mJveumFn
	GNXlO/W9szOzPOkVEwTj5Tg088ks31QTpCQfEXWbdXNiZleIsZ5SA5Y0ByCnzw==
X-Gm-Gg: ASbGncvCO7U6Rp5ii08dJTAcYo1Plw7Yb4jm8JmTf8yC4yZWqvhzKbis5m6E5kAhcKK
	5k/uwkWXLQ6WMkNG3T/ijIGqSzuXixlErkEUsadwsORC902rxe0RNBZKVxAQYQk8rrUmmbTxT5M
	pIiTJLQ1DGm0fh2I1LK1JRI5ITEUZ9VkNg/SKFZ0EU11On09d7brzM0P46Pvt8NF2HgfuepCOm3
	3olPU6haVEo6klkZnuJzV5cIeVPF8Cco2JYRVWGLxC8yZUJ4Hm7ZeTMACAN
X-Google-Smtp-Source: AGHT+IEBQTm+mdF5/l17srn1QQIlJ8cpbCtyU3PjuFrTHKPmmM8RGnmeO63H3UfI8TU8tQ6zNeMktQ==
X-Received: by 2002:a17:902:d2c3:b0:20c:6bff:fcb1 with SMTP id d9443c01a7336-2129fe0903emr55796195ad.1.1732294639012;
        Fri, 22 Nov 2024 08:57:19 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc21a1asm18338035ad.222.2024.11.22.08.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:57:18 -0800 (PST)
Date: Fri, 22 Nov 2024 22:27:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de,
	bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 08/10] PCI: imx6: Use dwc common suspend resume method
Message-ID: <20241122165712.5m7xuycxzjzatf35@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-9-hongxing.zhu@nxp.com>
 <20241115070932.vt4cqshyjtks2hq4@thinkpad>
 <ZzeHGd/vfNFgsID2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzeHGd/vfNFgsID2@lizhi-Precision-Tower-5810>

On Fri, Nov 15, 2024 at 12:38:33PM -0500, Frank Li wrote:
> On Fri, Nov 15, 2024 at 12:39:32PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Nov 01, 2024 at 03:06:08PM +0800, Richard Zhu wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Call common dwc suspend/resume function. Use dwc common iATU method to
> > > send out PME_TURN_OFF message. In Old DWC implementations,
> > > PCIE_ATU_INHIBIT_PAYLOAD bit in iATU Ctrl2 register is reserved. So the
> > > generic DWC implementation of sending the PME_Turn_Off message using a
> > > dummy MMIO write cannot be used. Use previouse method to kick off
> > > PME_TURN_OFF MSG for these platforms.
> > >
> > > Replace the imx_pcie_stop_link() and imx_pcie_host_exit() by
> > > dw_pcie_suspend_noirq() in imx_pcie_suspend_noirq().
> > >
> > > Since dw_pcie_suspend_noirq() already does these, see below call stack:
> > > dw_pcie_suspend_noirq()
> > >   dw_pcie_stop_link();
> > >     imx_pcie_stop_link();
> > >   pci->pp.ops->deinit();
> > >     imx_pcie_host_exit();
> > >
> > > Replace the imx_pcie_host_init(), dw_pcie_setup_rc() and
> > > imx_pcie_start_link() by dw_pcie_resume_noirq() in
> > > imx_pcie_resume_noirq().
> > >
> > > Since dw_pcie_resume_noirq() already does these, see below call stack:
> > > dw_pcie_resume_noirq()
> > >   pci->pp.ops->init();
> > >     imx_pcie_host_init();
> > >   dw_pcie_setup_rc();
> > >   dw_pcie_start_link();
> > >     imx_pcie_start_link();
> > >
> >
> > Are these two changes (dw_pcie_suspend_noirq(), dw_pcie_resume_noirq()) related
> > to this patch? If not, these should be in a separate patch.
> 
> 
> Sorry, this patch have not touch dw_pcie_suspend_noirq() and
> dw_pcie_resume_noirq()'s implement, just call it. I have not understood
> what's your means.
> 

Sorry, I got confused. Please ignore above comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
