Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798721B87C0
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757432948; cv=none; b=g1ygH+diPJq/JYzV2QatA+HTFhoO5ZpfFqYLgUROLHoF22YkF6BMPUoei6WvzBRIbY79n2Ibu0o3zN6JXe0BiSaSLYV+FofQ2ykx6MiM/i2xVJXOkxzlJSxamwJwJwtFKL0YYBHN8diTOKNtUUN0cs4EajSpxKTsdd0MTrW6cZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757432948; c=relaxed/simple;
	bh=dHDWslSUN5qjeF54dGcCHKAmPaXKcOdd8JVtArwQHwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RrwTCH3DIdzcy8qqH1RwXPpL1DT7NBJ/HvqznRXw8Z+wpMWr0N3XKwnmpOTUkL/m6ji48+NiQahrRkWGllfdDqmlKBOlkLbgZaoH6L0l5szK/gN7zvyphxPjbB47GdRITuc6+ikmgi/F+U9lYf2FmPIJQ6h6qY1y9zUH+d4qHLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=TCqAfMX7; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="TCqAfMX7"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 29FD9A09D7;
	Tue,  9 Sep 2025 17:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=kH++1lRd3b590KtsiJ2D
	GXmZpkwvUsmHCqZRXED4GfU=; b=TCqAfMX7NO3TWA7vFyNOiUSla1GlfKUSPtYl
	wdZ1JPQSS9MvP/QTzGcSyKx5FDr6B4yim9+RftMGuqx6UwkA1dIrKdEZOS5F6hPL
	j44u9gRKE5TiDng3lY8jOy2yKXjJyEhoUjz8Vd8YHyy1Wtve1JZFVGRMM0LPrs4i
	H6K45Z0WiVV0iXf5Vu82DWR/0Ic+BIRhRs//mCd1DgCi21DGLhpjOdfLZgKJp7H8
	tElGF6gUYcFHQFeidp+GZWrHvca5RLG+3YBCXxBR66d0VZtpwT4GlThNLlLFLUDO
	AmcfISk945iKEsVEhxhHTl54lSRGMhkxEzUFXd42MMrnpgsnAAu4HOq+DfzQT90e
	q8FLU/owU0Vdg+BgWRTVz1NkT4+Mb3M9CJQ9BT7UrOKH5djtTDrOehSVwUkYEP64
	LDtlSKJliHgY6rzunur9xFXINR5UOPN6aI4BRv8fwoHXeuNd8YaaMP7Y7uHRyIzW
	jMs2abbwkYXHfQAAqwvyhDgknrb1YEblPDZpQJhOHGxThXaGiu6cNMS/F2erw3Er
	QqIIJBWFHUaaCCBFq0iDvbS0wplWphEXyHA65mdnbLcpsYUNd9YQcXzZYeSBLdtT
	Rxzs2iVkHQaot20y4TWUphcn/oYuiMJMi9YA4Vw6RIEetZfDdhWlntaampQP/EML
	GvjVSdQ=
Message-ID: <b48844bc-07f3-4fc1-8486-8968bf6d2362@prolan.hu>
Date: Tue, 9 Sep 2025 17:48:41 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ARM: dts: imx53-usbarmory: Replace license text
 comment with SPDX identifier
To: Andrej Rosano <andrej.rosano@reversec.com>, Andrej Rosano
	<andrej@inversepath.com>, Andrea Barisani <andrea@inversepath.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring
	<robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
 <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627464

Hi,

On 2025. 08. 14. 9:47, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Andrej Rosano <andrej@inversepath.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

+To: Andrea Barisani <andrea@inversepath.com>

Andrej, Andrea, do you agree with this?

Thanks,
Bence

