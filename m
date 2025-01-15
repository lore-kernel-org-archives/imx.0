Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8A02459B0
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946374; cv=none; b=f9H+Uq27bt4iLWK3Sw3yrp8HqCXjfbJ/N+vAQT/BqLlrz+m/TjRFuKALuKYoOTbV/QPMRKI6dfIzz5D8AT+zL2Afba4Yrd2TfvA3dfsztw0Aeg2LVcNMkTyd86potfYwymbbOJSmIiUZlX5F0RlGrUX+M4YHJB+x/EPE1a6/ln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946374; c=relaxed/simple;
	bh=IcErqgkVtojnS3l7Vk5cUhVIaizwZ2PN7GlLBEXgIZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QucPpeCULdMX8WU3Bz7OiAhI6tdTdPWKb/gDCOW40nN+PRQ8YfBuAz/eE3zRqC8EKklcZz8bWjHmiCKN5ykzw2a5Ofag3CZZ63EkPw6VQvbTahJhbW6IpC6wF75BmhwZGCU6MSTxNujVrgQQbLGxxgyyiGZQj527DdB1CRWDD0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21631789fcdso10146635ad.1
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 05:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946372; x=1737551172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7fe4W5yc3F8Xv0So0kkrSAGzgbnJTso86hkv0C/0xo=;
        b=jVOWdpsT/YoeNQsnvAZFhPBE3bJV7VidVjz3639e83wC6jFCIDsslqgXHnthXalfAQ
         mMnTQ2Ke9uhU37zkgxcWR6shWt5sY9+yGrX1NbBC+ZSewd9mPSIe+KiO2+OJqCg6HDGk
         nMOBMwUBsi77QlKvzqisNNV1rijom2XHdS5BnqQUisGUG4PgaF6xRt8G9KC1j1EbW4gw
         oL0mHIpdW3YE4+IwuLhSEIchEyXaHWsgrvHQKiDNxpq/rz7jRkMjuLG7leitF8ijvG8L
         gNrZ8N+JzEo0rQJu0/GoeOW9hkxY1jwVm4WaOOYufb0DhkQEEdZNWZYa/UMhaeoIXUVZ
         8t6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqxLuHNijA5SxRnqFtZMCWup+2lYC+TR/GV8PdFS8wXzl60Nza4CfTGuBW5saIwR+YGFo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbNKNcS/H10P5c5Gj7D5c/xTfFYPoda43/IQTNEKfi0MiZJJwe
	rGV6wygaFzrRilLy0T8iah0qV20zWTLgXe9PdpifcczJbbH2jkoG
X-Gm-Gg: ASbGnctwbdfFYiMDKwRdp7A7ItTEdxE9WKHyeHGpqVpzc+XsOodTyFLPU+palZKc5dN
	t+XQu/q9X1BY6hByW/3E+zaJDlLO9oPKg4fJK+efk1OPI9RpkRMwrykxx+UWhgqpZiU/mMOn56J
	BQjiaG1/dwyU83K6yani74j0WZww07U4u4V4qMmYxdOIGMIiad/womemZWvHRvb+1NB0xPArlZG
	6l0fDG6eWeluCjNnbWGvFOeXa0BjeV51W/oMAs+pfozPn3T1ZfMy7RHL6ER7pa8MX5WgS2jbP0n
	09GADYTXfq4NX4g=
X-Google-Smtp-Source: AGHT+IH7Jz31AbcmjVSbvq5BrZBB3n03YE0IrL+y2Ko96uKhRd1FiR82/SvqmJ8dZ/Wra69YjzLPHg==
X-Received: by 2002:a05:6a21:338f:b0:1e0:cc01:43da with SMTP id adf61e73a8af0-1eb0235a1f9mr4919297637.0.1736946372423;
        Wed, 15 Jan 2025 05:06:12 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a6b4sm9361210b3a.60.2025.01.15.05.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:06:11 -0800 (PST)
Date: Wed, 15 Jan 2025 22:06:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/10] A bunch of changes to refine i.MX PCIe driver
Message-ID: <20250115130609.GT4176564@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20250115130406.GS4176564@rocinante>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115130406.GS4176564@rocinante>

Hello,

> > A bunch of changes to refine i.MX PCIe driver.
> > - Add ref clock gate for i.MX95 PCIe.
> >   The changes of clock part are here [1], and had been applied by Abel.
> >   [1] https://lkml.org/lkml/2024/10/15/390
> > - Clean i.MX PCIe driver by removing useless codes.
> >   Patch #3 depends on dts changes. And the dts changes had been applied
> >   by Shawn, there is no dependecy now.
> > - Make core reset and enable_ref_clk symmetric for i.MX PCIe driver.
> > - Use dwc common suspend resume method, and enable i.MX8MQ, i.MX8Q and
> >   i.MX95 PCIe PM supports.
> 
> Applied to controller/imx6 for v6.14, thank you!

Richard and Frank, please have a look at the code to make sure that
everything looks fine to you.  There were some conflicts while I applied
the series, and I want to make sure that nothing is broken.

Thank you!

	Krzysztof
