Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ACC3845CE
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 21:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388676; cv=none; b=Z9k6dZ0RxpRjz32Ho/v57I64ZdHpu7K2VH3e9G9G4IDDGHIW7WhDdThHjDJbXFJGzuaQNoOTMteh0m1sTedSW5Fxf/Oyo38A9Wt2tAeyAtB2vQUsal771JQDFV1zgGqFemZV7QWnJ3i079ZIvxqS97krbedfN+bsKh51N+K+sBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388676; c=relaxed/simple;
	bh=xQK3fo/yQKWbJQvqeTbsTQNfeWyoFFV9L/347KfXKqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unkiG200+jEnzbohRAJvQZK5HISjo9kmToEyrZPyz1xitZZYF8Jp9fLNKvgtp9wjBaPmbvUiqzs4YY3QWadqMWgcxn+VFzMOJlApbWFw2dXwEiWI13IO4bnXBIm7Wa7AcL9e7PVYUEw8QSIOLhyuVT16L5Yd6HcDL+/7vMKgkoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=KpSz7mVb; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=KpSz7mVb; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="KpSz7mVb";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="KpSz7mVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1774388668; bh=xQK3fo/yQKWbJQvqeTbsTQNfeWyoFFV9L/347KfXKqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KpSz7mVbJk01AbKR6ohkXCBFFHzF+7l7H7QD+p7s7iEVzr8UWaj/etWBag4+3d01i
	 /SXlugtuAjUTsDMpkxiK2os5/jBCPrZNjBIVBlQmQn3AoJPJwxG5txq/KtnUfQldBv
	 I/W5rQboHXqQZ2WJ4g9Qob6YLZ5asvHJdlhUgxs0UhjnZwNP6TghcK/JklJc4oj81e
	 bH8WLFWdbz/rSnVp13zUXtIP2gDz9ezhTsM5jjulJGxEtXBPi+sv4+A4xcPXA9y4DC
	 1coYTGRlAIQO44VUhmzypDysYehPXl5mbG3mJmCO/BeiC0zmMc1jQNIKwYa/C5kTwM
	 45IDug++zXg6A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 7B0A24476;
	Tue, 24 Mar 2026 21:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1774388668; bh=xQK3fo/yQKWbJQvqeTbsTQNfeWyoFFV9L/347KfXKqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KpSz7mVbJk01AbKR6ohkXCBFFHzF+7l7H7QD+p7s7iEVzr8UWaj/etWBag4+3d01i
	 /SXlugtuAjUTsDMpkxiK2os5/jBCPrZNjBIVBlQmQn3AoJPJwxG5txq/KtnUfQldBv
	 I/W5rQboHXqQZ2WJ4g9Qob6YLZ5asvHJdlhUgxs0UhjnZwNP6TghcK/JklJc4oj81e
	 bH8WLFWdbz/rSnVp13zUXtIP2gDz9ezhTsM5jjulJGxEtXBPi+sv4+A4xcPXA9y4DC
	 1coYTGRlAIQO44VUhmzypDysYehPXl5mbG3mJmCO/BeiC0zmMc1jQNIKwYa/C5kTwM
	 45IDug++zXg6A==
Message-ID: <706e2b88-f200-4c12-96f9-5634f80547f3@mleia.com>
Date: Tue, 24 Mar 2026 23:44:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
 <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
 <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
 <f213bdb9-7104-495f-97fe-8190af3ec577@mleia.com>
 <acL_cAQ99B2VliJU@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <acL_cAQ99B2VliJU@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260324_214428_520238_3CE45E9D 
X-CRM114-Status: GOOD (  12.28  )

Hi Frank,

On 3/24/26 23:17, Frank Li wrote:
> On Wed, Jan 28, 2026 at 10:24:50PM +0200, Vladimir Zapolskiy wrote:
>> Hi Frank,
>>
>> On 1/28/26 21:54, Frank Li wrote:
>>> On Wed, Oct 15, 2025 at 10:48:47PM +0300, Vladimir Zapolskiy wrote:
>>>> Hi Frank,
>>>>
>>>> On 10/15/25 21:48, Frank Li wrote:
>>>>> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
>>>>> warnings:
>>>>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
>>>>>
>>>>> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>
>>>> I'll take it for v6.19, thank you.
>>>>
>>>> If you have any other changes in the queue, please feel free to send them also.
>>>
>>> Vladimir Zapolskiy:
>>>
>>> 	look like you missed this patch.
>>>
>>
>> You are right about it. I consider it's pretty late to send another PR
>> including this change, and thus it will be postponed, I'm sorry for it.
> 
> Can I include this patch my imx's PR?
> 

you've already got my RB, and there is no objections from my side, if
the change goes through imx dt PR, otherwise I have to postpone pushing
it upwards, there is no plan to send an ARM LPCxxxx dt PR for v7.1.

-- 
Best wishes,
Vladimir
