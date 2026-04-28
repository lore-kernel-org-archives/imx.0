Received: from 10.mo581.mail-out.ovh.net (10.mo581.mail-out.ovh.net [178.33.250.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970B2BE051
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 21:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.250.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410576; cv=none; b=n/bTfBR8du5BkwvIXM6EYbK7oaY742/9G6mVqtYb2NpORkxLVQG1d8aGybo5WXmAIZgSp3jAAOGaV0hCrqxBIR2nI8zeHg/EzLVy96wjUh4lTg/Uuskgh1p0BA58dpGOJREXFiHHz6JP150JpELL64eFBfOaDqbObIqjo/E5CS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410576; c=relaxed/simple;
	bh=jmbNS8SSgDf/DqbY6oXw6uPiO29OxR8S55/KIUC5VDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gj/lpvjoYKOCvmE7p9euThr4VVN6u5x2pr5SLgvp2B0xbNEWas6wB044f1Lg67d3qWg3ZiMjLz4tspNypNZgIWAQ9XZrqu44mjfMwIh640fYfjt83YoZ2yw9eznSIvECyiEISe4QcznJ6DWsxL+Hm0xOlHCiwtoSV3QuAgNf7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com; spf=pass smtp.mailfrom=armadeus.com; dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b=ZkpXMjmV; arc=none smtp.client-ip=178.33.250.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armadeus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b="ZkpXMjmV"
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.43.238])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4g4hxT2rGVz68l0
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 14:03:57 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-f6m5b (unknown [10.110.118.251])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9E6451001E8;
	Tue, 28 Apr 2026 14:03:56 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
	by ghost-submission-7d8d68f679-f6m5b with ESMTPSA
	id e7i0HEy+8Gn7awkAA7T7Mg
	(envelope-from <sebastien.szymanski@armadeus.com>); Tue, 28 Apr 2026 14:03:56 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R00242a48d6a-e56a-480c-88df-638997601774,
                    74DB1B90E6E4B7223053899FBA067BA27D68656B) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp:86.243.239.229
Message-ID: <ab6b9b36-f08d-451a-9c2d-ef27b813d744@armadeus.com>
Date: Tue, 28 Apr 2026 16:03:56 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 2/4] i.MX arm dts changes for v7.1
To: Frank Li <Frank.Li@nxp.com>, soc@kernel.org, arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-3-Frank.Li@nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20260330141444.3789193-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 13712616442643404459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEw9tve48xeuW/0pHIXopn/l2+Ei/S3Czvgzi950ns5mJJQ7Ihj5Jwxq/suGN/tS2DUQJj0rlIDVk7jNsZz1bo8ZN6Fg51uKKRXF8P8gKa91T1u84S0h3RlUMCs7Ta43+n6OBx5uJmfLeoH58RspEz+qWrXAL98LU65IIyamgtukazoUmw2z+jvgRqJJWqXZAEmgZhPVG+EQgxULZE9p5QtfEyIyNHhMiOsrVadKWfn1BJyg/zC0QmEJKj+JnkEEYbqfvNkh3jFXMjsEazYHhhG7sXgMnNEvD953xwzvI97N68+Dpt39gZx+j6hZ2WphiS6MYxUF2JOQAQqH7quLF7kohVNmO1+mVgDuKXr0GNq6gP1eBaTZMx3R2NOSLEz+NT9yMbqmdj3/xJhHCFUUO1p/kexAM38s2FaRsjUZ/bhMKtvcGHNtBAPskXOwMtVBKUtN5hF2fb2636ywWngsAX/3M9FMn/PLZC1T+rqXJumtz49GBt1p0zCFWbWTBMCVDcitNwYy0yyTcoC49NuwpyxQ2VRc0CkkEYH5ipZZzy1EFoobHFAjGAJSQyppGvINa7WJSAJ4UZ6VuJPvOzrh5G0t9QysIig5eICS9In5Y6FVxAO7ICsZeg0TyLp1Bp/2BQ5VAv5CJYPZrxjMrSuq8mAmY2RB8cZO0M8bYagIxlVJg
DKIM-Signature: a=rsa-sha256; bh=1dnnnifmIzpF9Ebh8L++t76XOo1eryK5OY/IV/cdBnI=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1777385037; v=1;
 b=ZkpXMjmVLYC9A9pg4wmWmdqk76BC3hBDDXQtA/D56Kq8E8T0/7tbpq4Cwiw55blz/P4qQY8m
 aeD+HUMWH4DXpkpiLMSnw9q7wEqePBQFN45Bqp0MeQLuoBFWj+L8VXHCxCjL1Gs0KClDpXJcceT
 TSKqofDzgm8zGct3MWbcq0wxSsQQKnwwScekth7F8ZW0BsPANHbgjevDcwvz+iU+06qEjk8I50w
 P9KC31DH2MP2Lc8/49lk1qI5ks48mSjgDHpx5wXpqjTFd+SUjY9Y1LhJLBk1T/saoUoBiDEelgP
 Jak3a6OVXpAR4mL+aIprl/rM/rh6Lgrq1XUkVKQvALXgA==

Hello,

On 3/30/26 4:14 PM, Frank Li wrote:
> ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy

This commit breaks Linux 7.1-rc1 boot on my APF27Dev board. I see the 
following errors with earlyprintk enabled:

[    0.346162] imx27-pinctrl 10015000.pinmux: unable to find group for 
node i2c1grp
[    0.354438] imx27-pinctrl 10015000.pinmux: unable to find group for 
node i2c2grp
...
[    0.636217] imx27-pinctrl 10015000.pinmux: unable to find group for 
node pwmgrp
[    0.644346] imx27-pinctrl 10015000.pinmux: unable to find group for 
node gpioledsgrp
[    0.657247] imx27-pinctrl 10015000.pinmux: unable to find group for 
node uart1grp
...
[    0.868102] imx27-pinctrl 10015000.pinmux: unable to find group for 
node cspi1grp
[    0.876513] imx27-pinctrl 10015000.pinmux: unable to find group for 
node cspi2grp
[    0.888903] imx27-pinctrl 10015000.pinmux: unable to find group for 
node fec1grp
...
[    2.413181] imx27-pinctrl 10015000.pinmux: unable to find group for 
node gpiokeysgrp

Reverting the commit makes the errors disappear and the board boot again.

Should I send a patch reverting this commit ?

Regards,

-- 
Sébastien Szymanski, Armadeus Systems
Software engineer
