Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF351DE8BE
	for <imx@lists.linux.dev>; Fri, 22 Nov 2024 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295452; cv=none; b=lGCLrUrcdRRM+a5xr0z2FtjKwCf74XysWKgDYWxgAovf51HIQLLy7FdO4fiNEaaeMJrDOJGel5hbECXta40KcTxgSMAa38l47wzmtov2uHCy1HFNci5KWhvF4M/ADV44piUIs7EjBAowPzMRnAUsLc99dAuPqDPgi7FhV4KTl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295452; c=relaxed/simple;
	bh=JSfJBNYEbA8FDDOxY/qXqSPsOBH8pc0lxdl5eHk3OHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtxO1Yq7xw8Ja+ztjIpqlKWCwp9XkWQHtK1XSyiW23N76ujud1lbn4y30549iKvrUga3vx2CqoYn43k2Znnq782wEMi3BF9r5Z2oPCL7+KswTfPuuiUbTFTIeK8fHU6QqFndCa570fEVervzsEdgT5DmPs4CYL92lqcgkox7fKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wO+6P+qX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wO+6P+qX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7f4325168c8so1560212a12.1
        for <imx@lists.linux.dev>; Fri, 22 Nov 2024 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295450; x=1732900250; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m9Rzu/atJszaZiZQ8bphSysVEtM05e/rUjckRGXXQa8=;
        b=wO+6P+qXDVmo8WWe0EfrPdhqevveJBVKZn9phi+hCDjtevF0emijjT65Exyv//+X4A
         AsFjfenAvIp/+pXHLxSDh/GFH+EOBhTeWv5KLFBguuZhqWMkAEmPagk/XWWpwbes9CXO
         JpfpAivqwQgV9wflWWChM136Dweah3S2QzVQkabcDy/kOc+cT5tZRZFS9UZKfAxv5nAE
         8t/1Dj443u1X1iwoH6QGr0i8engv4ruiMaNPjouZteoyQqBlxzGD6pMlgIYK2tqcdFXd
         YGobRC81T3X6EBSOO5y2DnkLuYhrNV92M+LklM4DZyGg6HJu0EJ/c348KtoJoA+wTfsD
         N4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295450; x=1732900250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9Rzu/atJszaZiZQ8bphSysVEtM05e/rUjckRGXXQa8=;
        b=n2vVYMRWPgtBvL6UGsGROpZ0jpyBHyt0SVhAjLrspeADEx3TVB+7C5bumTt+fCVZJ7
         bSNLnQVCqVlJJPg8ixeVNLNC5Xt0TciSQ6/XfsAQvbUrYpGkTT5dvO6u/CDW71EA8iT4
         TQIIYutzvlXJXbMwsO0XddAKLtU4nk3yPcjqQ9bk7NQW7h2iw2uQ4l8xwhLv0VRi6ioq
         74bZoVGfL0+g3OQFlRmfnYGrAO7Z1RUqyGTUqmHXoEaEIM2+/B+VrvVfRI5qNmCigmHZ
         gwulgNEdmTtOXqUfPJopM3jucgTCAOy0G8dK05f7NPj3BZ8s5sHBoWLepQsY0JYB/3sS
         3daQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo0yzEq3tG2S0XbM05oXo0HvlfBpXte3PzSgshskQN1sGwomlamiLvEuet22W1cN7k4Bo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ6YdS8H4yVracLBnw/tt02mi50eof7sGNn7o2zX4AeWjTvXhu
	b7dN7CjgI2v6x4Gtl9ZWGP/pLoJ6Fpz4kF3Bu5RybpcwHSBWOO+7xgJb8kyDUw==
X-Gm-Gg: ASbGncuDpXnASAY1Ek2m/4/akZHwu4LV7HM6Ct20f+I1WnTrpW33ZPGQNtB2/4sfkV2
	wuIeKqLSkLR7MGwDE30Gug1JkoLSI7iPjtVGfueDH95SgdNZDFS0SQBWg51SwN5BI+q5VqoaXVV
	KFeaTj+T/Z9glEOUA/O+qA6NPE6GJRWJA4RKUWXDmrD3lK1uhjSkcD1wG+cXikFolJ2ro25qvVG
	BmFh5/299St5e498+kfyZZgSt8xNgo+PykDcx5kiI9WLmJdM1+/1QTmReWx
X-Google-Smtp-Source: AGHT+IFIhc1R40hXLVSot1qpNb47cXTxZcrRwISXx0lJGKYTEDxVxH0DwKBYDolmma7+CJxTTAgLkQ==
X-Received: by 2002:a05:6a20:d503:b0:1c6:fb66:cfe with SMTP id adf61e73a8af0-1e09e45ff0emr4838841637.21.1732295449974;
        Fri, 22 Nov 2024 09:10:49 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de57a562sm1847026b3a.195.2024.11.22.09.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:10:49 -0800 (PST)
Date: Fri, 22 Nov 2024 22:40:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 04/10] PCI: imx6: Correct controller_id generation
 logic for i.MX7D
Message-ID: <20241122171043.j2xh4fvdo6goq7o2@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-5-hongxing.zhu@nxp.com>
 <20241115064321.3cuqng7bzmphiomw@thinkpad>
 <AS8PR04MB8676989276C723C26DADFB5D8C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676989276C723C26DADFB5D8C272@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Mon, Nov 18, 2024 at 02:59:48AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2024年11月15日 14:43
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 04/10] PCI: imx6: Correct controller_id generation
> > logic for i.MX7D
> > 
> > On Fri, Nov 01, 2024 at 03:06:04PM +0800, Richard Zhu wrote:
> > > i.MX7D only has one PCIe controller, so controller_id should always be 0.
> > > The previous code is incorrect although yielding the correct result.
> > > Fix by removing IMX7D from the switch case branch.
> > >
> > 
> > Worth adding a fixes tag?
> > 
> It's originated from commit 2d8ed461dbc9 ("PCI: imx6: Add support for i.MX8MQ")
> 
> How about to add one Fixes tag like this?
> Fixes: commit 2d8ed461dbc9 ("PCI: imx6: Add support for i.MX8MQ")
> 

Okay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
