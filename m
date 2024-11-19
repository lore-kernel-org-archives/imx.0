Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF1C155A21
	for <imx@lists.linux.dev>; Tue, 19 Nov 2024 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732007833; cv=none; b=YSuyH0mslu9XHRVDqPu5qDHOI7QDyNQKfCaIoIJgf0XEdIwrW+j8py2Ro41ucwAP1abbI/x0GzPd27jTMTn/TYODcbsXgyZ6VayPqpKCrGPw6p0ZFcg3taOnf9rW+vz6NytTeonmW8liTC3h1dvKlkKBkVuy8HdCLlxwZfia14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732007833; c=relaxed/simple;
	bh=g810kb0XgvzxYZQtrMTm+l/lpKzxxUTGIDTHgLMIkq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmgdQanX2cRZn1d4dexr+OPfkB5+kiRHPqXVRSKE/RxVWwENb3YsqHknP4GIbCdgGanjjaggiuzAp8dcZU347/Pum3Wi87vrzWFo6WqEFUxfP2gibwG+lAjn5YuC/AHUM7fH9CGd4argXrgXBrHHAcWf5sahJxqn/zPr6uyUOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtInBM5I; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtInBM5I"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71a5ab612ceso294776a34.0
        for <imx@lists.linux.dev>; Tue, 19 Nov 2024 01:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732007831; x=1732612631; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mh9tKfQZDVb7Srbzricoyx+VzVp7BjyJVZmRNXjCsTY=;
        b=VtInBM5IP4qrhdMPUmHo++CPLqo64fPvoeWUtxw+LT7f8tjgtFqwnlLwio0wO9Ftd4
         KYID/YReJQruT2iYz3gK9sv0LIrxRh/8Stm9+IsDO8/efQKA3zd3uVi8h0q8J5dKrmH4
         uWRXN+Ukuc3spGqmxDTA5NB7kqXj9oVJOK94GQ6BEty3Zu+hDTcxHDoJDKgPq+Pg/uSP
         X67kP1xddq7SlyiqFl0D2mUnh5PpJEV6ornhSMPGw4d2Hk1Tf+In3zyX2WP4lD+LJvvp
         6b8qVttSuMLVQJ33HLS0RRUJqGqidVB6mAotKeoyeIWgW6XlzddbrYPbtduC0afgcl8g
         2xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732007831; x=1732612631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mh9tKfQZDVb7Srbzricoyx+VzVp7BjyJVZmRNXjCsTY=;
        b=qL086lHaB1fN/Ka/8V1K1ri+F9gUe3Mql6NAnUF3CeMklngvThiof+jWcy8/pDRBi5
         tH1Ro7w/bxPnESRU5R61YPum6vBacE2v5WdEji+hpR72T8vHBQWKppNVDcpO3IYYokX8
         HgAQ4ui63OFllDKIbVIf989koA6p0y1CAP8X0OEajmxXlgm0OQpw6y+cPF4uG5pDSdLW
         GBOoybA9Uy+UJOZD2Z54tz+EDLnw5s+ymntb9kaKbyR9P1khkiqTg3kS828+eA1yf0bq
         eOyNRdRrXsmsdUZbozVfH5ZOUZXrM1NzGoa2vIGbYplChYLD3VcNhWfVJekj6hM3Hn19
         eWwg==
X-Forwarded-Encrypted: i=1; AJvYcCWyItAYJMEPKjDK18kcRtDYpOMr6Duuk5gtHCy64VSwEyvleX5JlBwzp0LlCNLJDPXGPJE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuJBCDs+kJ8qer6pUA+1bYHEIx45Q928JILInFRqYii3Zuv8eB
	4pb7+yTroNauEsJuV9nRbMBRe6KdghCFoYknHNA0GD/X5+Yh3JTbt87yfNobfA==
X-Google-Smtp-Source: AGHT+IF6oNS7zAaqiMj3qBtazoexGSI49TeW8s00tlEKm6P+2kEMfwF3rimz60UqsKAumxJWheQLUg==
X-Received: by 2002:a05:6830:2a8f:b0:718:a3e:29b7 with SMTP id 46e09a7af769-71a779213bamr15070132a34.7.1732007830619;
        Tue, 19 Nov 2024 01:17:10 -0800 (PST)
Received: from thinkpad ([117.213.96.14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dade0esm7241941a12.66.2024.11.19.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:17:10 -0800 (PST)
Date: Tue, 19 Nov 2024 14:46:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v5 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
Message-ID: <20241119091659.rmdufvdi6jkynvfe@thinkpad>
References: <20241104-imx95_lut-v5-0-feb972f3f13b@nxp.com>
 <20241104-imx95_lut-v5-2-feb972f3f13b@nxp.com>
 <20241113174841.olnyu5l6rbmr3tqh@thinkpad>
 <ZzTrdUX0NUsHQLvd@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzTrdUX0NUsHQLvd@lizhi-Precision-Tower-5810>

On Wed, Nov 13, 2024 at 01:09:57PM -0500, Frank Li wrote:

[...]

> > > +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> > > +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, IMX95_PEO_LUT_RWA | i);
> > > +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, &data1);
> > > +
> > > +		if (!(data1 & IMX95_PE0_LUT_VLD)) {
> > > +			if (free < 0)
> > > +				free = i;
> >
> > So you don't increment 'free' once it becomes >=0? Why can't you use the loop
> > iterator 'i' itself instead of 'free'?
> 
> It is used to find first free slot. This loop check if there are duplicated
> entry. If no duplicated rid entry, then use first free slot.
> 

Ah, so you have combined both in one loop. A comment on top would've been
helpful to understand the logic.

[...]

> > > +	if (!err_i)
> > > +		return imx_pcie_add_lut(imx_pcie, rid, sid_i);
> > > +	else if (!err_m)
> > > +		/* Hardware auto add 2 bit controller id ahead of stream ID */
> >
> > What is this comment for? I don't find it relevant here.
> 
> The comment for why need mask 2bits before config lut. for example, dts
> set stream id is 0xC4, but lut only need 0x4.
> 

Ok. It was not super clear. Could you please reword it as below?

"LUT only needs the lower 6 bits of the SID as it will prepend the 2 bit
controller ID by default."

- Mani

-- 
மணிவண்ணன் சதாசிவம்
