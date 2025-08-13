Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9C22CBE6
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073768; cv=none; b=R9CL0V1eKvLKZ6HLW2q4LEQs9JsleT098cBj28xOo/i0MrSTLcumj6ZbSsLkCuAzB8itgYqwJU23hBMIWumKOv0ugUOoUpcPmdN5T+zStDuFeeZGjPRC2kJqgPAoEHzLJXMScyZOOTHsN8tSil6oBiTwA5sorsXamP+NAG8/BEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073768; c=relaxed/simple;
	bh=U9SP2g+1o5HuQsjOdWWsXoBuSvpDRttSOJq85x+A4CI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=WD/cnEJ9yN8kjpSe9RUo8eBoRLRxkQJ+Jk8ZG/KAnIgeyW+idktvGYimb4hE/FAkUSkuPzK+3LiK7u1cJsLw2ubbEkGFUMOJ+L3pZ2rGiFv8md9eF0VdHtS/oW8S5ESffLY442n8MzVPqspR9pgHNnHLl3JqXe+pgH6hBq0M6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=E5tytUhX; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="E5tytUhX"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 823A8A024B;
	Wed, 13 Aug 2025 10:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=kVMjeVimj9bigs3Ft2HZ
	zQg53xmlBKzfvvopzZb05O0=; b=E5tytUhXXMptxH2U2Z5HK9cD5DDwOqB7OZuA
	8Ygm0pG+3d782Fv89BRFsm8NkmD7QbU/u/3kvdhQqzduShzMMjvvZNOEOv/fV2gp
	4afRxcHV7UN68ndSGmlPYAQymy0uwyeLf/bBXyBTEiyrtC2tjKiXr6u7XcY52We9
	L7sh6wQNJIWw/HIZrdCI2A8Mcqsx/mlUFvC5L4UxEmqicv359Ny3LN5maWsezGR2
	yF6LYNebXletH93zeqoigFtnNTJkGrJRNnRA1P4dQkiUilVBItfLNTyOZnm28S6g
	CmMZ5+Mpla0H7r1FKoiSxcVI2DXtbDBzeadP8jgGzA2/CdgjZ7ASsfOhnGxHz5av
	7DY2DOY56lXRTumCOJ4qFj3H6ET62QN6oacTOzWLy+CSTtLl5VUd2oGMS/8ZAIzf
	jjM8WiuxexfXJW68Ace1O4xNFTJiU1kqU+YoiRt4E4qYcvuNP2PRIHJZbPbnNPRf
	RNwvL1x9oWH0F320FQE62Mi+OhDFe8RwxHsX1deMRvyeRg03xeiKLRYnlZqybeqW
	JDEQVur9QKioq/TaELXoN/qjPGE6xdNFmKmoH8xk9xczCw3b5E/825u2NLiDoqiN
	teOBNoUYQ9swJ05cgU6x/OzIuE0w74I5KqWYL7gk0ZV2I+gKIgrYgCHCx2+YfXnD
	G1eC+g0=
Message-ID: <d9e81ff2-5621-49db-92a1-acf304b225f8@prolan.hu>
Date: Wed, 13 Aug 2025 10:29:22 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH] ARM: dts: imx6-display5: Replace license text comment
 with SPDX identifier
To: Lukasz Majewski <lukma@denx.de>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
Content-Language: en-US
In-Reply-To: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E617761

Hi,

On 2025. 07. 09. 9:32, Bence Csókás wrote:
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
> Cc: Lukasz Majewski <lukma@denx.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

So, what do you all think, is this patch acceptable?

Bence

