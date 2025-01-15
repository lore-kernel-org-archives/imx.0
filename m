Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DB52475E9
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942636; cv=none; b=X32oNddJEE3K6/GsGxqXMcCUN6p5HAR7Cz4YJsC6ge0NHgVjKlZbgk7U6PmSS9xVWy3q2SSDtMA62/fnEbwLLH1xHmLblZRVRSyXAEZcAoRbeYBZY3JxgV/fgxlo3F0fcMmB8G4XFQ4MzpOZvKXeG2/PTl0bMFvg8f9bBxHBH74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942636; c=relaxed/simple;
	bh=rYv21w1TNpX166jyKbxCBTg2z1ftliDbp6nskXQ9CbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1fPLwSrcOXCJn+dn5/nf6tYzgq2TOmynhcs4C5YI8FmrhPxNssS5oZ/pTiLvYcLqDqwZz/4s3LtqQfgkjOw1oWg6Nbeb0nkamJ5jgnEf080n1YgK3sJS80LVj3ix4u4sXRG0oWjHAZqKzyMMVRmPa7eOepho06qGw+ABZLC9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21634338cfdso114714575ad.2
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 04:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942634; x=1737547434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn2m3YvPKxsHqucofUHRKBClV54hrr7dyawjs31YpmM=;
        b=uinUQW/1oiWdLdMaDSXisx5VzYp5RXHwZ1M6cFuQW7TY1dFKUpgzUzvbhHQMBGOWRF
         unSff4fYPxe4/VPxKuFc42vbYPWRrcnNLapQF73WPt4En50YMwC+t5kEurDMWn+P2/u+
         xvsz0TiJJxuhNWla6oFZ5J7GyVrsfMnm4q4qli/rNwIiNqqUpx/3ZyjsFCYLXhQli79r
         pHq5pLcPRkv5nS/fzCftHvPu5txWTaDlkvJ1bZxvdsh+kgslcd/woRPlNr2x74e+qb8i
         uaegvC0UMbZV0izCyhIW8l8sXzNgdgqKX8DS1wOcpOonxd7oniDGIAArIhxN7T6OyTJ+
         sWww==
X-Forwarded-Encrypted: i=1; AJvYcCXnECjJH6s/yeXTjE4hxAnlNM/p0cLuRhYNFuvQfh8MVuTRcGECQkUFEO4ARuk1KyNdbRc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/OrSGWtJUaJAiu29HMNgUGV3V2xVnGcECNivW4hPHLsR5d044
	16g8VLHPKwslSVCrY5d5GbHg45b98vGinGdRnLIbeP6EIOhUoS6j
X-Gm-Gg: ASbGncvYuc7OBoHq5QTAHvIv/xh7x+ESmhxFsuMmIfKOck/kUs5+aYSHpR+Te0iz8Et
	NpRAmXCyhHln+TUpolPLFE3uEoIWR1gV+mNb+fRSvzqSaGG1RGGRprxfk+3CYTC/E/A37h5ssYa
	5Nq+XwFxhS1yYgekJMH7Z7HFab8bBlG2neqn7/iP3QA3RAzJKmhJ19VXE4MLU0TLOYqpvzjO1hA
	0a3r4/cttC3wvAi5ky3de6llce9SX9lFUg8Um8RFFlA/WYa+0PpOZxKxIKju4yttzh9fYCuRRdA
	EmyiTBrKtSIcnnU=
X-Google-Smtp-Source: AGHT+IEYVToacHIhaLiuPZMNMw8ey/7WGb5On7+yKJ58yY4usQG65tLlT774MHHUh//xwlxvNtx6eA==
X-Received: by 2002:a17:902:e888:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21a83fc3886mr482072125ad.40.1736942634229;
        Wed, 15 Jan 2025 04:03:54 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f520sm81190325ad.7.2025.01.15.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:03:53 -0800 (PST)
Date: Wed, 15 Jan 2025 21:03:52 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev
Subject: Re: [PATCH 0/2] PCI: Simplify few things
Message-ID: <20250115120352.GR4176564@rocinante>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>

Hello,

> Few code simplifications without functional impact.  Not tested on
> hardware.

Applied to controller/dwc for v6.14, thank you!

	Krzysztof
