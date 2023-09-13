Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50B1F924
	for <imx@lists.linux.dev>; Wed, 13 Sep 2023 15:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E18DC433C7;
	Wed, 13 Sep 2023 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694620203;
	bh=4cS9a9ki/iG8FGG+1HPrLkBPok8PcDHXuEtrMm83LOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MACifao79fmPgw3Q6VWdxD5Kg3dOOmLcvkpKXWF7foUL6wVxnLHpkx7PkxplYuYZx
	 rZ1uUvdccp2eCbCf5bRfz1GnELembTf0zGe5jpsKW4etePXS9xeBgfHgAUMpYmYxtr
	 N0/MjPsFtNiFYennz6Z/wkp0SKF8zYekyCfgqSwAclTQrhUSpP7qZfBMhc1FfEmSIp
	 pXjPKc+/UK0NbNtpOGLiB8ZituG0zZSRGb45HTIB7RIl/dsaHzVDUOJVRVRtdrJhKK
	 ePX9k0XCcG9uw41lmPlcFUfKXejWA+XKJS7LUkzsnrPjOm5csX2HMCi0LB0G+aNm/z
	 +JfoHeuQ6lfQA==
Message-ID: <583b6ce6-48eb-9119-4f71-f9a5689354f2@kernel.org>
Date: Wed, 13 Sep 2023 17:49:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 4/9] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-slave-v1
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
 conor.culhane@silvaco.com, imx@lists.linux.dev,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
 <20230905213842.3035779-5-Frank.Li@nxp.com>
 <e9880548-11c5-2790-7c77-7ca031849182@kernel.org>
 <ZPneI4KUw8UXBUze@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ZPneI4KUw8UXBUze@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2023 16:28, Frank Li wrote:
> On Wed, Sep 06, 2023 at 10:01:40AM +0200, Krzysztof Kozlowski wrote:
>> On 05/09/2023 23:38, Frank Li wrote:
>>> Add compatible string 'silvaco,i3c-slave-v1' for slave mode.
>>>
>>
>> No, it's the same device.
>>
>> Anyway, this was not tested.
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC. It might happen, that command when run on an older
>> kernel, gives you outdated entries. Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>> You missed at least devicetree list (maybe more), so this won't be
>> tested by automated tooling. Performing review on untested code might be
>> a waste of time, thus I will skip this patch entirely till you follow
>> the process allowing the patch to be tested.
>>
>> Please kindly resend and include all necessary To/Cc entries.
> 
> Thank you for your comments. I write notes at RFC cover letter, this
> patches is not totally completed yet. I want to get more feedback about
> i3c slave mode API and configfs design, which will impact the overall
> design.
> 
> So I have not included tty mail list and you in review list.
> I send out all patches just because let i3c reviewer know how to use these
> API. 

Other people send RFC and they, surprise, expect comments. Probably
because RFC means Requests For Comments. If you do not expect comments,
review, call it somehow else, like "BROKEN", so we will know to ignore it.

Best regards,
Krzysztof

