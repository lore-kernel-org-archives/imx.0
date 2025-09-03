Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D900A26A1D8
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 08:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889195; cv=none; b=Re4BcpcBHflUzMp8/YZS4mtPSyF8DJqX85u6HzgINE3UWLk8KFqFoeU8637I1eiX8X9QIfwVFEx0wj4sOKj7kE6t0m2ZBYX5swKwwjgxTnl3k1BRMEcghFeFCz8Zen2T2AGMchZWUI5wX+BGoddKExpaT7RLEAsc2cEwh/PbONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889195; c=relaxed/simple;
	bh=yTFJjzqMU9ZzFUybZd6hkNW7zE/eIZgW+25kCR/mtpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=et5eglCdvNVKyWC/CqGoNuSehxVmFnRn8FH3NMujEIz5uyhBnw8Zj9VlwbHxha0DTmz7VfOGqBQlh1baVlUn9uIaMUkqlmOMmR0+QLSQKg7/kEmFxPt7tYSxzJ2unY9AsmFZ3+LCmLXSDZO0Nnyhx9y0kMAU2UAo/DIhQ3PjYug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1utj8M-0004jB-AR; Wed, 03 Sep 2025 10:46:26 +0200
Message-ID: <5e993e2a-a0bf-45cc-8d95-75cfc1575a41@pengutronix.de>
Date: Wed, 3 Sep 2025 10:46:25 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 Csaba Buday <buday.csaba@prolan.hu>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
 <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
 <c85a94ee-59e1-47d6-8200-813bb434caf2@prolan.hu>
 <1bf75411-4a51-4103-b314-a8a7253bafca@pengutronix.de>
 <57518c46-2e92-4689-80a3-ae4c99b9fc32@prolan.hu>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <57518c46-2e92-4689-80a3-ae4c99b9fc32@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

On 9/3/25 9:57 AM, Csókás Bence wrote:
> On 2025. 09. 03. 9:50, Ahmad Fatoum wrote:
>> On 03.09.25 09:43, Csókás Bence wrote:
>>> [1] https://lore.kernel.org/lkml/20250709133222.48802-4-
>>> buday.csaba@prolan.hu/
>>
>> Is this mainline yet?
> 
> Unfortunately, no. It apparently still needs some polish.

So you are trading one breakage for another here. This needs to be spelt
out along with rationale.

Alternatively, see my suggestion in the reply to Csaba.

Cheers,
Ahmad



> 
> Bence
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

