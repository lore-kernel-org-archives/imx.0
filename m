Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2164299A82
	for <imx@lists.linux.dev>; Fri, 26 Dec 2025 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766744684; cv=none; b=W2uiPkqRnEJtdhLmw4jiTMcW2aQt5MekFIr8J8T9DlPD/o7+5MlBhtC0ilq9/+XL2avnMppt0XvgJNCEG9Aceov1ChDt2TKmkSjSVm/1oRAbIbZm1ylpxsoCq8vFmVaQfVWQCijxHSo3krwl/oRGagfsQZ4cY1eporNjkCP4Hf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766744684; c=relaxed/simple;
	bh=w5NuVlZ3Mxd4Dtq/uECrT8SFBmnDLpfFkQLmKl2Nak4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUSbDcg2gOLfe/dJCHg6URxbaTbLyLaOyVJR0chvB5U2IAlLCPBuM2HKIA+jEdXlhs2z2hMriK/fnqT4aGva6sZ9RI1xhtFLCIRwhYT223H2yhuUXXs2WfG1fOr9M0vaCLpgFS6vbuUrXStnCyhnJ5qvP+yVjWcwGP7XwIp567Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WLd705T8; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WLd705T8"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dd1v446tmz9tcZ;
	Fri, 26 Dec 2025 11:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766744672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBkJaHWBMYgOiv48kF1QDYjafSqkHvQlKdfY3CelGy0=;
	b=WLd705T81Ccq/lqxekWccd52GzH9d1TaFErX6ISqXS0FvdOqOj6nOnDiIYgJu5ybv93BA0
	78FqoG66elWOdXVYBe8+d7argkB70apgjyITIJfffMH67HV8aR6SGDmbDAskKaA9LYDs1G
	sii4zE9ZsMZAWXjiTTYeIh+QbJxsr39vtvSdQ/mYCbzWy35xJtCpAVFMs5xJJtWwTUtBVt
	oCy5G07zb+3p8oLp4wb8IkyTs/VNKUOjDHS6pkWa84738EdTPM7V66f+hOO4o1gVZ2BsXG
	GsDLgmD2JSyuLeEXnGSAKWvQy7ga88DxcAcXNF3PIeeBYABr76sxhXzIwC7Vsw==
Message-ID: <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>
Date: Fri, 26 Dec 2025 11:24:29 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM SBC
 DT to rev.903
To: "Rob Herring (Arm)" <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <173531253398.3886481.9345779510218290682.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c872a8573b8c5cbe46c
X-MBO-RS-META: 1pimp8jhrujnxcy3xx9ihf7yxt4edirb

On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:

Hello Shawn,

> On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
>> Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
>> board which implements significant changes. Keep some of the rev.900
>> and rev.902 nodes in the DT so that a DTO can be used to support old
>> rev.900 and rev.902 boards easily.

[...]

> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
> 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']

This is addressed in bindings patch [1] . Can this patch and the 
bindings patch be applied ?

https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/

Thank you.
