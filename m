Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12082E175C
	for <imx@lists.linux.dev>; Thu,  4 Sep 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756992079; cv=none; b=JOX2R8uvVETk1cX+ncMxxUhPpVZuUqLz2J9mz7AKh1/+025GyhtsGPYKtNf6OCVCCHVkVqhGdjuGEBHN7yhv0TPDXJMKjSiCTaLqV8ku79b1J+04KloyyiycU0cj5zEgt22BgomLIapqtkxza6Wmh3wXgM5looOG59V/yyAk3Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756992079; c=relaxed/simple;
	bh=/0B3jovSesp/hxR08tvuxjzy1mvl0Jv+lkX17ZO+zUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxT5D1Z6RPxxp1cmx2N51EdyuGB13fvH2/eC5A0rY416kQx4Fz7fDyjtFNfZ1vQs4jyr61OHjbx5RH7qzmHW5nHWrwGkjJD/3PjSCungxPsA+8ASSQYb8LxIpvQ49NK+wt5Uxe9s7BjZezfsTDUPuBwc4roYSr1kOgP0y7r+VDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAwwruh0; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAwwruh0"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d60110772so11171987b3.0
        for <imx@lists.linux.dev>; Thu, 04 Sep 2025 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756992077; x=1757596877; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UW3lWz1gWateAvfJ4OmLaSxYKXnyj9z9mVCRV3AJ32A=;
        b=SAwwruh0Vyjft5YRWMpsvGcuXfLT1gu8z3ZFPwwM+mocnlzSDEGTjbXd1errxiRzFu
         maH1X3jWQK/f+i2RICaDh25lQLJBFh5ZIZTH4yhzHv91/AK25WWiYXX8pzbYoWKjmiIQ
         pUgtmqxGr3dRep96NKurRpSKP3FOYr9ojXpfiBqaJUxMd7UjmfrTrhmOI2C0gq3fv3Dm
         Tfc69t5F4qAbfp0TgmmlAKnlGxN1eSn1naS+ERlaoDndVd3cpZbeg0J8zLcP+Fld6BPY
         N678xmvl8kTUJaGqT33vv5mgv+4ELUH0Vfp1z5c7Lda4XGTlUs3eCJJA8/zM2c4B52ru
         cccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992077; x=1757596877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UW3lWz1gWateAvfJ4OmLaSxYKXnyj9z9mVCRV3AJ32A=;
        b=pICoURn5O95y2gmpblUtHUOLRdHWjuOzi5qaO/EoNh7ni+n1ggNo/PwAXdGkonfMIk
         SEtItEegBrDsSmWAZZ0hzEjXR0aVy+WeO68jK7W7GJ5bzDpUF+aXLxpfIwgQrg84bXl9
         PQnu2tDb/nTlei1Gq/1dc0l6oM59k1rK0D9bUeZ4FJH7AlXzD/J0jNKeRoPK8RAGBsx0
         WuqVVqRPloTKSc9BT8foK4h1cz72UPrOtwZHH6KIvrWY4h61cMkTC3QL5NpPc6FGx3qV
         DHc1GFldjnsRJfCI+O+cIru/4GfSLTdNJsiR/goWo4/NqNTZUxeADrBFjW+xgATKyxDC
         D/8w==
X-Forwarded-Encrypted: i=1; AJvYcCXTBFg3sRqRYomb4gx9f1Y5QB3tbzVgwd4/Qi++JQld9eobuECVOlJwuUWV49/DAoBrn7M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXlb+WD7cdplSBiAMzTWXe3Ar9kcaMiXpvGA2BiZlvXS4Ye8am
	TtdmMtEgXHE/u4g42SDLkuONGe4Y66ZAURZLK72mgVG5AzZuN+afuDqE
X-Gm-Gg: ASbGncsidIoSYkTp/oYHt1wk4TqGT490czNbZe9mezCwZKCsIHmaRjtQlwfP3i3qSVv
	DjvoSeQ1GJHjj2rwTPSIoQ9gClObe6z9PH3zNZ7VrIWd0u2BJ1oLP0ZqZhpr2eNPMkP6uHyazSr
	Rw0BHANJ32VCuC5MMAldkoRaRzH7cWss2z/GbfQZuATSxIIJ8Xu/0FwU12t26nGZnbr+E8y64Oh
	JxjQGIeD4Wkd1u51cgdAZhmKC9CRgTyLpD5iynNkmNGhj92EI15907+Lp13jlJBC16MSRhwlE87
	anDgDsCZ/MYVsdpwGJthQjt4fK4Jl+qPk4ydHrUrvONnr0O2AXLrXhfoo8Uk8ypDT1awLVZFAj6
	/xC1Q1ITdYDSzBwDZcslrFcHEr0+1L6Ac/l3RpHxSTYjzqTq+dtLA
X-Google-Smtp-Source: AGHT+IF9+DoFzLHOQRcPIJ7cBivUYyoDwWq+J13ybXKomD3r4/KZ33bHYn/W4QL4kQIHtZodp5+7Tg==
X-Received: by 2002:a05:690c:4c11:b0:719:4cff:16db with SMTP id 00721157ae682-722764f3cd0mr60887077b3.25.1756992076451;
        Thu, 04 Sep 2025 06:21:16 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8503a46sm21340297b3.46.2025.09.04.06.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:21:15 -0700 (PDT)
Date: Thu, 4 Sep 2025 06:21:12 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	vadim.fedorenko@linux.dev, Frank.Li@nxp.com, shawnguo@kernel.org,
	fushi.peng@nxp.com, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 net-next 03/17] ptp: add helpers to get the phc_index
 by of_node or dev
Message-ID: <aLmSSC90dWDfhGkL@hoboy.vegasvil.org>
References: <20250827063332.1217664-1-wei.fang@nxp.com>
 <20250827063332.1217664-4-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827063332.1217664-4-wei.fang@nxp.com>

On Wed, Aug 27, 2025 at 02:33:18PM +0800, Wei Fang wrote:
> Some Ethernet controllers do not have an integrated PTP timer function.
> Instead, the PTP timer is a separated device and provides PTP hardware
> clock to the Ethernet controller to use. Therefore, the Ethernet
> controller driver needs to obtain the PTP clock's phc_index in its
> ethtool_ops::get_ts_info(). Currently, most drivers implement this in
> the following ways.
> 
> 1. The PTP device driver adds a custom API and exports it to the Ethernet
> controller driver.
> 2. The PTP device driver adds private data to its device structure. So
> the private data structure needs to be exposed to the Ethernet controller
> driver.
> 
> When registering the ptp clock, ptp_clock_register() always saves the
> ptp_clock pointer to the private data of ptp_clock::dev. Therefore, as
> long as ptp_clock::dev is obtained, the phc_index can be obtained. So
> the following generic APIs can be added to the ptp driver to obtain the
> phc_index.
> 
> 1. ptp_clock_index_by_dev(): Obtain the phc_index by the device pointer
> of the PTP device.
> 2.ptp_clock_index_by_of_node(): Obtain the phc_index by the of_node
> pointer of the PTP device.
> 
> Also, we can add another API like ptp_clock_index_by_fwnode() to get the
> phc_index by fwnode of PTP device. However, this API is not used in this
> patch set, so it is better to add it when needed.
> 
> Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Richard Cochran <richardcochran@gmail.com>
