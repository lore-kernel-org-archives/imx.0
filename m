Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315413B592
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179171; cv=none; b=ZV3o39VRc+BQwGampB/a/K/FWuWLxdJkQoLjVjvLMGZZFeMyJuLWNUaV7Vx+6lgB8L00AYia2s7wWBBDDDA4TDiftjdCxElhO4n9UAFi1QeQfM5o01nV+igbfKzSp0h5rzC0WPnhSDs5FHi4EYNvWel9X9NOwl+jBkxLjrjuQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179171; c=relaxed/simple;
	bh=vc5fwysGsc7IQXwKYL681hzADIFiyvULNF50pd19/Rk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M3IYQ1q+YQmaFsD2PGfDdi6cs6OdDynODZYbaq0ehuOfNe0MMhFggGLucBJVGh3DzEJG229RBP60G0YHDfhbm6TBHEY+OtMIQ9ihiQRsfKL9m9rZvNGiFB2MkJzo7inP8FK6KkvwkQO7zGPx0YyuOCUxIWUcRVHbd1+f7c8ue2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpVe-0007Hv-59; Mon, 06 Jan 2025 16:59:18 +0100
Message-ID: <cccf92df-4a20-4bed-9122-6b7d89bdf28d@pengutronix.de>
Date: Mon, 6 Jan 2025 16:59:17 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH 10/10] arm64: dts: imx8mp-skov: increase I2C clock
 frequency for RTC
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-10-38bf80dc22df@pengutronix.de>
 <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
 <30dbe486-7e36-426d-8fa4-3ecd83193a10@pengutronix.de>
 <Z2Rw8qnn9hULyh8l@lizhi-Precision-Tower-5810>
 <2ae085fa-6f13-4eb7-88c1-e625309fc35e@pengutronix.de>
 <Z2WPbB9cV0hcP2UB@lizhi-Precision-Tower-5810>
Content-Language: en-US
In-Reply-To: <Z2WPbB9cV0hcP2UB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hello Frank,

On 20.12.24 16:38, Frank Li wrote:
> On Fri, Dec 20, 2024 at 10:12:49AM +0100, Ahmad Fatoum wrote:
>> On 19.12.24 20:16, Frank Li wrote:
>>> On Thu, Dec 19, 2024 at 06:51:35PM +0100, Ahmad Fatoum wrote:
>>>> On 19.12.24 18:47, Frank Li wrote:
>>>>> On Thu, Dec 19, 2024 at 08:25:34AM +0100, Ahmad Fatoum wrote:
>>>>>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>> According to
>>> https://docs.kernel.org/process/submitting-patches.html
>>>
>>> Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
>>> instead of “[This patch] makes xyzzy do frotz” or
>>> “[I] changed xyzzy to do frotz”, as if you are giving orders to the
>>> codebase to change its behaviour.
>>
>> I have to disagree with your interpretation. The imperative mood is primarily
>> expected for commit message titles, but if you take a look at normal commit
>> message _bodies_ that make it into the kernel, you'll find that a whole lot
>> of them start off like I do: Describe the situation and then what's done about
>> it.
> 
> I was got many similar feedback from difference maintainer to be required
> change my commit message _bodies_ in past years.
> 
> https://lore.kernel.org/imx/3c9fe85a-5f86-4df6-92fb-e4ceb033f161@kernel.org/

Surely, you can see a difference between marketing fluff and the commit
messages in my series?

> https://lore.kernel.org/imx/117dd6f3-8829-4000-a05b-6cb421ca7de6@kernel.org/

Agreed, I don't see where I talked about my patches in the third person though?

> https://lore.kernel.org/linux-pci/20240807025423.GF3412@thinkpad/

Did you check out how the final version of that commit log looked
like? Here it is:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=64706ba771f5e8f

You may notice that the maintainer has edited it for readability instead
of just having a few imperatives follow each other. :-)

> https://lore.kernel.org/linux-pci/YnvyrSTAxJmGxful@lpieralisi/
> 
> At beginning, I can't understand this. But after follow these expertor
> suggestion, I found some beanfit.

This commit message is indeed very vague. I agree that patch 09/10 in my
series is vague too, so this will be fixed for v2. I don't see this applicable
to other patches though.

> - sentense will be shorter and easy to capture most important part. for
> example:
> 
>   "The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
>   frequency, so let's make use of this instead of the 100 kHz bus frequency
>   we are currently using."
> 
>   34 words
> 
>   "Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
>    support it"
> 
>   13 words

The commit message will be shortened a bit for v2.

>   Linux is big community, even reduce 1 minutes to read it, multi by
> totall reviewer/reader will be very big numbers.
> 
> - empahse the important change first to help understand whole patch
> quickly.
> 
> You can choose what you want if maintainer don't reject it. Generally I
> just send such kind comments for v1 patch, because it is less possible to
> be accepted by by maintainer to accept (except some critial fixes).> 
>>
>> I personally find that this is often easier to follow than just having two
>> imperatives back-to-back.
> 
> Basic principle is clear, simple, and straightforward.

I still believe you are misunderstanding the guidelines in submitting-patches.rst
and that asking for all commit message bodies to be rewritten in imperative mood
doesn't help anyone.

I would have liked for both my patches against submitting-patches.rst to be accepted
to clarify this, but you can check out Jon's answer and compare with commit messages
not authored by you and perhaps see that one needn't golf the commit messages
at the expense of readability.

Thanks,
Ahmad

> 
> Frank
> 
>>
>> I have just Cc'd you on an RFC patch to amend the documentation you linked
>> to reflect this. I am happy to continue the discussion over there:
>>
>> https://lore.kernel.org/workflows/20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de/T/#t
>>
>> Thanks,
>> Ahmad
>>
>>>
>>> Generally, avoid use
>>>
>>> "this patch ..."
>>> "let's ...."
>>> "we do ... for ... "
>>>
>>> Just simple said
>>>
>>> Do ... to ...
>>> Do ... because ...
>>>
>>> Frank
>>>
>>>>
>>>> Thanks,
>>>> Ahmad
>>>>
>>>>
>>>>>
>>>>> Frank
>>>>>
>>>>>>
>>>>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>>>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>>>>>> index a683f46fcbab..ec7857db7bf0 100644
>>>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>>>>>> @@ -333,7 +333,7 @@ reg_nvcc_sd2: LDO5 {
>>>>>>  };
>>>>>>
>>>>>>  &i2c3 {
>>>>>> -	clock-frequency = <100000>;
>>>>>> +	clock-frequency = <400000>;
>>>>>>  	pinctrl-names = "default";
>>>>>>  	pinctrl-0 = <&pinctrl_i2c3>;
>>>>>>  	status = "okay";
>>>>>>
>>>>>> --
>>>>>> 2.39.5
>>>>>>
>>>>>
>>>>
>>>>
>>>> --
>>>> Pengutronix e.K.                           |                             |
>>>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>>>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>>>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>>>
>>
>>
>> --
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
