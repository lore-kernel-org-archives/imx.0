Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342E2D9EEC
	for <imx@lists.linux.dev>; Thu,  6 Nov 2025 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418529; cv=none; b=Z7V+WdBHxUMWxrYwYYGvrK7RD4grCjgV+c0UDZ7Lxdvuy96+KQfjhcdWXai5pu5FPh3J7q9zvoKoKEtrVreGVQwrMq95RFS5Ikh+xG2BXzRXx0Fl43CO+ft8P2DRn6LWwmhIXs90aa7LCzWPJfRi2t7BAQtNOn8SVeEYAVwg668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418529; c=relaxed/simple;
	bh=aO/sdUf6lM54QirIfhiTr1e4Iamqnl70j+qLacTd3mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gma5kU/0L5RFxhm4TsofdrZ4qKXwvLEVE9f41xWiMzBFTviyiyZXuWxmg984GzmpDRBYkI+Gd1sZlpGsKjXK3ohwuZIFAnnOmvBaxFzoN9+IXm3iXlhw4l+tmild9T/PfI+XPHZG+B98ORwgHPBFOpMAFuH75E2lXqQ1O7R1WqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=cWhr1oqh; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="cWhr1oqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1762418525;
	bh=55OuAQr6FIZPr3TAwPNOMnE17WSzk2mx5oUi4VbSojU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cWhr1oqhH0GPTEogfnukErJBnrRr5LRJdzBFsZJi6gqihZMJ5G2B0lrSaK90WA//i
	 JiQ9F3ODec8Pdo2t8YzOIEYpAevHj7AmwcU6AIt4EteEm5q3RWiFBMMK9PNWPqSEZO
	 RUpNnbQrQMYRhvhgLwPverOnuoK/dEx9Y8cG31uc=
Received: from [10.1.8.111] (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id EBF96A03F0;
	Thu,  6 Nov 2025 09:42:04 +0100 (CET)
Message-ID: <5379d7f2-24ce-4730-ac39-f2f103403da2@ysoft.com>
Date: Thu, 6 Nov 2025 09:42:04 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: imx6dl-yapp4: Model the RGB LED as a single
 multi-led part
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251105152555.1992513-1-michal.vokac@ysoft.com>
 <20251105152555.1992513-2-michal.vokac@ysoft.com>
 <CAOMZO5AKmKWciyF7-f_mVfJWdLB1rjh_Xi=BhkBAcmV=cJ-nyg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <CAOMZO5AKmKWciyF7-f_mVfJWdLB1rjh_Xi=BhkBAcmV=cJ-nyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/25 16:55, Fabio Estevam wrote:
> On Wed, Nov 5, 2025 at 12:26 PM Michal Vokáč <michal.vokac@ysoft.com> wrote:
>>
>> Describe the RGB LED indicator according to the reality - it is a single
>> part containing all the three R,G and B LEDs in one package.
>> With this description the chan-name property becomes useless, remove it.
>>
>> issue: HWOS-816
> 
> This issue notation appears to be an internal matter. Please remove it.

Ups. I will send v2.
Thank you Fabio.
