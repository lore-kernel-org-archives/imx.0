Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83AD1BDCF
	for <imx@lists.linux.dev>; Thu,  7 Aug 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754577991; cv=none; b=SY/rOpfp9MFXmXSqWKawPEkJusbSA4ST0XzR4aAJtnAoqz9DV0BdjL/5VglGfEgHKDrTMWcv250TjURm35TfFqzObySbImHbE8zkQJrJP/D5p9NLqCeCM4XJN+iaXvTuh3GeMuBQh9X4+TzkpBEs+gV7c6rWnu0g3NjvjwrvfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754577991; c=relaxed/simple;
	bh=eE0vXntSXv93+fow/5pZN0W0ecGonbmWsyek0dW9ZII=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o5L+vmVK4xrz7JZ+XuMsEUBBtzloZIiEBW/IUnIB0zBsOZRDjdPGJ/JwX6FlHoXisWQIVoq/hqouR3RzS2/JZNl7WOiayu6LyH7HEXlAcTGCOtKlPbWmvXPXDnPoKQtbL5Rl89eEnsgEq/O/cVVMzhDEvBvNW6W9fu9/a3YAFeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=YSioIBpR; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="YSioIBpR"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7D22AA037B;
	Thu,  7 Aug 2025 16:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=/fVtAmdmgI6XZ8jo+rVb
	YlNMoKW2iCrPKAgX23Mg/I0=; b=YSioIBpRF0LEzdGibex50F2nrdgvfkwj+lNa
	vh2BQVGrwLIYZVALjU1grM9TwX3coPUT23E9V0Z2jOgO7tuBzcKAMMtGzkLXBu1y
	ZYMHQmPFDsiW6Rc3ns1oHUjrlUC/YPgZgBq+eii2GlOml2LiIAMxK/i8467+R63/
	U8GQvnqXH8rAYAm+AWigzfk1DM84pEkHSHyq3zU60cAA+FDnzTiSx55J/tfbwJBo
	YmevfCRJ7LR6yXl3oz7+MK+S/kYT1FtDLS7ugzLIn8PpFOYbvlc8ZbpWhP3qDqjW
	ERIstPFv8dWBt2h74/GjZ0cfKjTZijk9NTZA8wpLkgcPfZEcLPnsdg13tq/s/sKa
	sBUwDOGAHGnmrCudUui11aDC4BpzH3VCFoXbxToCCHm8HnIJmQCqD8gZ3SC8jRhZ
	OdiXPr0KNF2gG16ge45efsFDuvyfj0S+WN8SpRA7nFd7Pbbejy9azLYr9FhxtJQL
	bzo6gyIJMKV0HNMLH6pjkyVsOhntzjnt/u7EB8Qlmag8n857GXNmp/J8d+WwWXUt
	1DkVm2bVoIIJpi3NJ+N4dtdiePq7bQXYZAZ/0XO1jPbup1MPujHMWnbt9wrIO1BM
	SZUPTKUxAZZGAxdabl5FPP+KnWSphnSkgI8wJbggqgLp9YwiJtU8aVCrwxgmK81O
	vVEK4WA=
Message-ID: <0fdab5ac-604b-46fd-bd25-cfa7afd06f98@prolan.hu>
Date: Thu, 7 Aug 2025 16:46:26 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: imx6-karo: Replace license text comment with
 SPDX identifier
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
References: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E667361

Hi,

On 2025. 07. 03. 11:09, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lothar Waßmann <LW@KARO-electronics.de>
> Acked-By: Lothar Waßmann <LW@KARO-electronics.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
> Changes in v2:
> - fix message tags and typos
> - collect Lothar's Ack

So, what do you think, is this patch acceptable now this way?

Bence

