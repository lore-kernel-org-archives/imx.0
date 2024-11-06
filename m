Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B31F582D
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730897800; cv=pass; b=r/FwI4Rwet8j5BGhKcEriRBm4QfI75FPwCSrbol+5Ibhk2qq0H7c9R9fps+JZyfLfz3aQv+xXRhMrNHcNthwRgUtle4kbAEPFf730hddev2tiFcOMc0pV5eZzPc4MLC1gPPnaCHqcWIX0WSizjWOxa3cCOmYOAf70GMwFWEOBh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730897800; c=relaxed/simple;
	bh=J+0ET3+741mDa43G0HbwmzjwqQmYyHm7Vok+NKjfzFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1c7w2bhleHMr65eFlIZQvEN3MerUdOdVD2t0odJ2Obw1NcoPNl6T9raJuACrJ77WROX3nFMu4EhCNmpUW42g+cbopP0wAa5qNsrei+nyff5ZO8l7VFRTX+IDW/nmMYITisT/Rg5wowLsrBlhhkQ9LDp7TfRfMcjrNmYP18RL/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=lJsrc0lu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="lJsrc0lu"
ARC-Seal: i=1; a=rsa-sha256; t=1730897795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WRp/7Hu+GZ5KYKNjcI0S36YGbzuDlAFdnfopa1xr5Qissc8C+gRGCBpHor70uBaTTxQ3BIPtM1cgEp+gzHwnob5QCBo4SOOXG54ymwoab20T89uq6crC8lDExXCozHN3ABfQdrbWWBV6M+9Zn2fw60SdIMhJGU/47pEUj1I61pc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730897795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J+0ET3+741mDa43G0HbwmzjwqQmYyHm7Vok+NKjfzFQ=; 
	b=kQWeXfW4U5uw5S92h02C2UmratF8d3jrS0EgboCUvVm7VhagrreDkGt6i3RomVgAzs36y/h7peOeFbmIjjL9j5cZoLP5ft8x/hT603q38voayOYFcdYGpjsP7h/uzTa0vA/irhm3E6vV6k6Cxfi0I+bahpGfni42/4cs6xT2/j0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730897795;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=J+0ET3+741mDa43G0HbwmzjwqQmYyHm7Vok+NKjfzFQ=;
	b=lJsrc0luwNqqOBxI8gKUO4UXqPl6yRirEjtDqJfFb0erhz5Wv2/063X5DFZD4ftW
	aUTJtm5atUrYuPewNPUFPqc8JDttMf1nx9F3XMqQUFuRAn6KDzoNQQMxHsYhlkRGsiz
	ROrPNjNxafY8wf5xbxMiWhjax/aMfbhXlltX5+9A=
Received: by mx.zohomail.com with SMTPS id 1730897793985463.4704130607637;
	Wed, 6 Nov 2024 04:56:33 -0800 (PST)
Message-ID: <1ecd57a6-6872-4494-9472-0fa904991a39@collabora.com>
Date: Wed, 6 Nov 2024 13:56:31 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IMX8MQ EVK board not booting anymore with v6.12-rc
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
 <CAOMZO5A3dtic1CZS4RJ3RoBP_rV0PpK5oin4J8531XRebkb0ag@mail.gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <CAOMZO5A3dtic1CZS4RJ3RoBP_rV0PpK5oin4J8531XRebkb0ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 06/11/2024 à 12:12, Fabio Estevam a écrit :
> On Wed, Nov 6, 2024 at 6:43 AM Benjamin Gaignard
> <benjamin.gaignard@collabora.com> wrote:
>
>> Have you been able to boot IMX8MQ evk board with a kernel version since v6.12-rc* ?
>> I don't have any log since kernel just don't start.
> It is booting here for me:
>
> https://pastebin.com/raw/h95JZgjk

I see the difference, you have compile the kernel to support only IMX SoCs so the
size of Image is smaller and u-boot can relocate Image from 0x40480000 to 0x40600000
without overlapping DT area.
It is working for me now.

Thanks a lot,
Benjamin

