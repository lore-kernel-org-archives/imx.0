Received: from mail-108-mta60.mxroute.com (mail-108-mta60.mxroute.com [136.175.108.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6377131184
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711642555; cv=none; b=A6Kwp9zd1s09TiMzhDDnuONfdoQNruUh5ml+AdtFcfPNzeAEria/hDhPRr0xaxvC1Ho+qaupDs14D4RczPQdIz4IQhTdlRST/WkKbuuwxkHBH1eADLy27Rdf4QV6/REMLiKExCF7nw4QU7YA8tYD2Dxj9xd4L9EtnEsG256SZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711642555; c=relaxed/simple;
	bh=YGOEk9oKZHq64MKnhZtMmCLowNGolRXyvDgx+imDZ0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOiomombQRwsI8CeIQn+PP8IB+ECk9bUe/yk2AySxL7BoHwgps8+DN2dBqvWSaEnZkJd3eXhzcwuHYAi6+VyLxcKV4mYW9eEvb1bamntwGckxpxHtfVW66nipk3yQdqrw+Zf5sOQQyQUwDFIzRgYukhg7ZqtA3L1Gh0Glp1Ya40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=aWfpoOad; arc=none smtp.client-ip=136.175.108.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="aWfpoOad"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta60.mxroute.com (ZoneMTA) with ESMTPSA id 18e85d89b8a0003bea.00c
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Mar 2024 16:15:49 +0000
X-Zone-Loop: 9df34935e02c1ffe1f66daff0b3a1376bf223b300392
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cwugKwOI6owueldBI/qieNd7LO4DtJURj2EGZCG3x/k=; b=aWfpoOadUR4xHUIzRi70tTlv+/
	blWiooHO+TqI/ECwvXsh8bJODVu6QbL4BKXe1C/0ZJfJy5n3dOTuLRSto2iucUnQDeGicb4NRqZhp
	vnmvi7ImWm+XubSyGD2YuU95yIFWU5lQlhKb0xRzhsRXzbOV6BCXO8qCO/Tn4BxDqfij5fKEAavU2
	1QNVduCGxvYgYuwu3UJ3e5I55Xvqaj7RTLphjVIMjLnbpYS9qdG7w/QYTBZIB9gD635qDn+ZO3O25
	68ZljAx1ZIEIT7GuFZXS/9ZHQTgPcIP+HFyChMg7fvJ5ArbNtZ+7N7F8P14sqEgnDE4b/lpUI2Taq
	3Y8+M4KQ==;
Message-ID: <c6053c86-2ce9-412b-aaee-fbe1ac25b7c2@luigi311.com>
Date: Thu, 28 Mar 2024 10:15:42 -0600
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] dt-bindings: media: imx258: Rename to include
 vendor prefix
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Conor Dooley <conor@kernel.org>, git@luigi311.com,
 linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
 jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240327231710.53188-1-git@luigi311.com>
 <20240327231710.53188-18-git@luigi311.com>
 <20240327-ninth-tulip-77191ad10fdd@spud>
 <0e658ecc-38d2-4d6f-b0cf-f5f3ec32c1b8@luigi311.com>
 <171161592126.3072637.14564447281929105708@ping.linuxembedded.co.uk>
 <20240328-prideful-unopposed-e29fcee74c29@wendy>
From: Luigi311 <personal@luigi311.com>
In-Reply-To: <20240328-prideful-unopposed-e29fcee74c29@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: personal@luigi311.com

On 3/28/24 04:15, Conor Dooley wrote:
> On Thu, Mar 28, 2024 at 08:52:01AM +0000, Kieran Bingham wrote:
>> Quoting git@luigi311.com (2024-03-28 00:57:34)
>>> On 3/27/24 17:47, Conor Dooley wrote:
>>>> On Wed, Mar 27, 2024 at 05:17:03PM -0600, git@luigi311.com wrote:
>>>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>>
>>>>> imx258.yaml doesn't include the vendor prefix of sony, so
>>>>> rename to add it.
>>>>> Update the id entry and MAINTAINERS to match.
>>>>>
>>>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> This is a v1 with my ack, something has gone awry here. It's also
>>>> missing your signoff. Did you pick up someone else's series?
>>>
>>> Yes, this is a continuation of Dave's work. I contacted him directly,
>>> and he mentioned that he is unable to submit a v2 any time soon and
>>> was open to someone else continuing it in his stead.
> 
> Ah okay. Unfortunately I see so many binding patches pass by that I
> sometimes forget about what I already reviewed, and I did not
> remember this one at all.

No worries I'm not surprised since i see constant things submitted
to upstream and v1 was actually sent a year ago so there would be no
shot that i would remember it either.

> 
>>> This is my first
>>> time submitting a patch via a mailing list, so I'm not sure if I'm
>>> missing something, but I only added my sign off for anything that
>>> actually included work from my side and not just bringing his patch
>>> forward to this patch series.
> 
> Right. The rules are that you need to add it when you send someone's
> work, like chain of custody type of thing.

Ohh i see, ok ill go ahead and add my sign off to all the patches then


> 
>> Your cover letter states v2, but the individual patches do not.
>>
>> Add the '-v2' (or, rather, next it will be '-v3') to git format-patch
>> when you save your series and it will add the version to each patch. You
>> can also add '-s' to that command I believe to add your SoB to each
>> patch.
> 
> or a rebase will do it with --signoff:
> https://git-scm.com/docs/git-rebase#Documentation/git-rebase.txt---signoff

Perfect thanks for the information you two! Ill be sure to use those 
for the next revision.

> 
> Cheers,
> Conor.

