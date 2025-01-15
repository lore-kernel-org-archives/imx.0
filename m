Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6E2459B6
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946251; cv=none; b=U+EiBdjV+gU/HgzkYYG70wLDiRmM7KflU3y03vxVckgGUAakTY4NDevLv8BT7hS2AnXTTvKqOlYBXhaZK4JO7DD5w4hAY/pqJ2UrVLlJ2SDBis+t9KPUzAzU+GVY2+/yFDFasmSuZL3m6Ujde0RP+6mPi1HwM/OCdsg7e2Mkx7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946251; c=relaxed/simple;
	bh=FbLUcEIiJh+jtgdTTb4glrRZOazsjj7x/E+5iF5lUbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXW7KTMcnZzTPu2kgVrqqQ7RYbM+o0i00IRJPFt1jMeetrJGSoSHv8iURW2U8pkiNV5x2EPrYGWt02dkva+QTY7G/QmywxgH5m+4kCBryZOdKLNC3MD+vKvMvmZBBZnHYzxgnpV0ZP3U8n1FenogqbB90xYLiHVr8St13vbL6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21680814d42so99400985ad.2
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 05:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946249; x=1737551049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cU3e/n6KhYgwGmV111UKdccXNVZHL0iNnBKvqCJS5vk=;
        b=V4IDUq/bZkz399s1ffM9wFuJ1H2hC6sxFIEvW5Xzm/fdDKKKIaGuTSENEh216GXkn5
         nd+dJjlnx2+gm8JPGTlML2iUcnhET6OwwDfRuvOz82uay5Wc/vL9/Si26BwIoKD6W4uE
         +HZKeO7NiaTBRCawkwgQLuBpg8pLrWw1rM4uzbZWBpXoBm19+4AWZVDQUdTY2NIESq5G
         a6tiUhwCaW18nHroYjvZz1AZUqtJMxxNo+ISjO4Uf+v//aVZaqDxEiuoc5N4wlWS7O0f
         +OLCXS4j65xEmRXSyuSAoES5yVYHW2hAMINrbkMw6M+XkA8G91jwrAemMCjSS86HrVSA
         GspQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpgiRMag3QgTc3Pg//iBq7SMJSYLFLGTeHzM5Y//C6fszsQZCdsVMqTcLkPP77m7Yy6vo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjFWI70vByWsVSFw5L8hjbJySN9YRELYyr/aZjm/4CGHTcdR9o
	F6l9ioesrcZ+njAPUb+NKx0GMSfnZiYO7AkTOzcPH14EQ8g3ryeT
X-Gm-Gg: ASbGncvwwfcg+M3JnC01w/qYzMrvJCAGLInR5Q78QR4P3+M/5ea4zPdMU4kcUVsxcB8
	WNBHX2Pl0nNMdo1xwaCG8Fl0AQjdQ+XkGSCj8jFHFnNX9mntJ+gCk2MNQtyo2wRimR48z6if3CI
	ano/U3oEePcs84aeeq4yAjhQl9LCMye4oV5e966/SuMYulOkLDtjpbdL0GiId3UWtHwy3fVYUvl
	saVNyWtUcBUTjL/hTafypt/5QIO7m6BkJOwwBh8nRpBiw5GbsEsgsoEjJjzJtYe4sYSAfBhggqM
	EGPkjDcPEvcMwLc=
X-Google-Smtp-Source: AGHT+IGJ0xkBFQDRoR8kdZYAlnl/B+msy18AyfBuH1HwSbOm/KPPtntHdjqM9javko0XPog/mwl9og==
X-Received: by 2002:a17:902:da84:b0:216:501e:e314 with SMTP id d9443c01a7336-21a83f54b4bmr429475315ad.20.1736946249035;
        Wed, 15 Jan 2025 05:04:09 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm81875515ad.139.2025.01.15.05.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:04:08 -0800 (PST)
Date: Wed, 15 Jan 2025 22:04:06 +0900
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
Message-ID: <20250115130406.GS4176564@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126075702.4099164-1-hongxing.zhu@nxp.com>

Hello,

> A bunch of changes to refine i.MX PCIe driver.
> - Add ref clock gate for i.MX95 PCIe.
>   The changes of clock part are here [1], and had been applied by Abel.
>   [1] https://lkml.org/lkml/2024/10/15/390
> - Clean i.MX PCIe driver by removing useless codes.
>   Patch #3 depends on dts changes. And the dts changes had been applied
>   by Shawn, there is no dependecy now.
> - Make core reset and enable_ref_clk symmetric for i.MX PCIe driver.
> - Use dwc common suspend resume method, and enable i.MX8MQ, i.MX8Q and
>   i.MX95 PCIe PM supports.

Applied to controller/imx6 for v6.14, thank you!

	Krzysztof
