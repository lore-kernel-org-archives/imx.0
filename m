Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA16188CCA
	for <imx@lists.linux.dev>; Sun, 24 Nov 2024 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732454236; cv=none; b=KE8vrHLkhkA8Uog9tYFnbae11UosvE0DYedMkOu3cw4aRUxZgAsd7jeksAUbZoZf+jMMO5J2Lr9djEMbzUCMyYeQgWG6v4fRwJXU7RX+SM7oEb5nXN2ijGPfi8CteJnTAdOmt6VGib7+I/wM75kk3vl1Lh/jKBOJFqjwwvm0264=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732454236; c=relaxed/simple;
	bh=IlLv58cNCyEoanSXpkpsRvNx5ayjQp+gFk1gE15T0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYQkzbIU4AASppJ/DmRZ6WLgekxcyZdDw7jddHPI7PWLZS4vIsWLszhZq3Zkt6INnaKpVrJh9h0AjkEHN4LPRlCSau3CnWJ7lTmrHbnpQCAT9vDuxni5SE8Bwiyxe2sv0U3G7XHPlCZ4TgATuu+dcXi7n9Ijqo8iYB8DDSkIS+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gbwy5AQn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gbwy5AQn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7250844b0ecso165193b3a.1
        for <imx@lists.linux.dev>; Sun, 24 Nov 2024 05:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732454234; x=1733059034; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3x2SMWVaYfpqUnnbF6mOMPwbeMyaHbo8dfeGfWcWU+k=;
        b=Gbwy5AQnzfe5uEXI5n8F1Yz0b8PIu9l/iohgMeHS1HWr+99zOIKC+O7kQiTo1YuRZ3
         SKzTvbZCS0ONM8Vyr8GYc2Vc9dsFRAXcoTxaOijOc1YqJbY+dHxKnY2NuiROKcLnjWeS
         G9TrMD4Qq2PTS7JOEIyJOtwVXQj7tx9GcLbpJvXgoUUUUm4Z1G7CksMa0MWj26c4vpfO
         6Vz6UpAePdBSju6SGP8o4c1y23d/U5rn2tGuCoEtx56LVts6CznPiOiSWGbdeh/iB+YF
         48ebMoOueW5Qp0LQyFFfjscRPnUnFFS8O+s0hdZPtJhpK1HKOuu4KkcVodXCFtdQ8EcC
         e5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732454234; x=1733059034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3x2SMWVaYfpqUnnbF6mOMPwbeMyaHbo8dfeGfWcWU+k=;
        b=gFV0oIlDse2z3zwGEC0EJPExDpXxxtJwpHay5wIDY3CV21FEpV8nXCDeOGouy7FFO7
         fLlcMqeM0U4W00qmrOKZi48s9Tw0MXQLMu7U2Dz52ExmeTHJnNODQFUKLCgufVFIZcD4
         TzbapK6HFoueyEp96+y8QaFnAdcb3e28DiPkSQYnNKQc2yLp7jhilrnj01gruH1a+wF2
         tvt0mIwPZh1pmmNlzv47ul/2ous5H25oSY1AehOc02YkOMboZmYwDL+vG49/zhQHjiG8
         UknTk0A1JN0BvBEYMxL7DgJzSMVV8jz6cEL2SREiw3L1+z7BDmCj5BdVB/+QdFA+hrPL
         hK0w==
X-Forwarded-Encrypted: i=1; AJvYcCUQWcXF5vcKrL0P+Q72gQHgOhyyJ/jWAB63hGOjTt9kGB1SnhrLGLLjwwO2jVBLiJpLhq0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7u0pOLSlz7q24CZ3rIxB9zwfvivSD5NeabKXqtSd5xH8pu3ds
	JIfFnrSBnO7MAA911u02AkCTODF6YVZHfJv/9s8o5/Or+2WZt29yaYm+nFYi6w==
X-Gm-Gg: ASbGnctLPgBtXIhXCS7SlBjDIJV7CPD+S51iWY1/ogp3WaI0HCyYbZYPzeJtL7J4aHX
	xg8b+C77/jPKd9qaVPC+MBqoHtzbpY6B+Mg5aYMIuotYxvg6fjyM4x4xeex5mQhc/tuGwrRqHlE
	n2XixUbU8mu/z2uWoURusZBWc7rnQWNm1Ffj+Ho455klZFp5sqqd5aZfMctf9akBSjXq9UdyI9t
	k9k7Eii+K0R8KmwiyEmtz/PwM/PaECtb/CJ7Ph1OLa4tEbYSpSDskFiUCfz
X-Google-Smtp-Source: AGHT+IEtFLA66MFjNRjbQgvd5A29dDLWgZl+Mi7ZlRgR1PZjK50HEIwS0D8UPsDBN8IXVDgJz+1Pcg==
X-Received: by 2002:a17:903:32c1:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-2129f28f81amr143096695ad.52.1732454233985;
        Sun, 24 Nov 2024 05:17:13 -0800 (PST)
Received: from thinkpad ([36.255.17.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba357bsm46433795ad.88.2024.11.24.05.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 05:17:13 -0800 (PST)
Date: Sun, 24 Nov 2024 18:47:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, dlemoal@kernel.org, maz@kernel.org,
	tglx@linutronix.de, jdmason@kudzu.us
Subject: Re: [PATCH v8 2/6] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
Message-ID: <20241124131701.yrb4bkhwigcux6b4@thinkpad>
References: <20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com>
 <20241116-ep-msi-v8-2-6f1f68ffd1bb@nxp.com>
 <20241124071100.ts34jbnosiipnx2x@thinkpad>
 <113B93C0-8384-431A-BE4D-AA98B67C342A@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <113B93C0-8384-431A-BE4D-AA98B67C342A@kernel.org>

On Sun, Nov 24, 2024 at 10:56:38AM +0100, Niklas Cassel wrote:
> 
> 
> On 24 November 2024 08:11:00 CET, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >On Sat, Nov 16, 2024 at 09:40:42AM -0500, Frank Li wrote:
> >> +static int pci_epc_alloc_doorbell(struct pci_epc *epc, struct pci_epf *epf)
> >> +{
> >> +	struct device *dev = epc->dev.parent;
> >> +	u16 num_db = epf->num_db;
> >> +	int i = 0;
> >> +	int ret;
> >> +
> >> +	guard(mutex)(&epc->lock);
> >> +
> >> +	ret = platform_device_msi_init_and_alloc_irqs(dev, num_db, pci_epc_write_msi_msg);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to allocate MSI, may miss 'msi-parent' at your DTS\n");
> >
> >No need to mention 'msi-parent'. Just 'Failed to allocate MSI' is enough.
> 
> If you look at the existing pcie_ep device tree nodes for all SoCs, you will see that it is very rare to see an EP node which specifies msi-parent.
> 
> I guess that makes sense, since before this series, AFAICT, msi-parent was completely unused, so there was no need for an EP node to specify it.
> 
> I'm okay to change the error print as you suggested, but in that case I really think that we should add a comment above the check, something suggestive like:
> 
> /*
>  * The pcie_ep DT node has to specify
>  * 'msi-parent' for EP doorbell support to work.
>  * Right now only GIC ITS is supported.
>  * If you have GIC ITS and reached this print,
>  * perhaps you are missing 'msi-parent' in DT?
>  */

Looks good to me (except that the comment needs to fit 80 columns) :)

- Mani

> if (ret) {
>         dev_err(dev, "Failed to allocate MSI\n");
>         return -ENODEV;
> }
> 
> 
> Kind regards,
> Niklas

-- 
மணிவண்ணன் சதாசிவம்
