Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FA381AF0;
	Mon, 25 May 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712038; cv=none; b=KuZKvI0dqJgHWNfY3KUgSqsXdfNu9WfHe6AWbPrQl5YXBoJLPviTn6Z5C3XoauilpJ/x+aOs/RzZpPo8yjTFnZOXU8nGv1vFNjD1PaecayiirbHsmgm4foY8+UFBJ+rcCShpS5lzwqWUCh/E0hNNLO+GRYk1nQohtlOES3esy98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712038; c=relaxed/simple;
	bh=RUz4CGagH2+Tj4Y10RIScWn8a59PdYkBrcpsFzrFyiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkIw9DSeyi59Bz1HgjqmNkHRDI7AxPDXrIc1O+L9Ghuk3I2+XzbJUW7UYofohZ4/nK4dRRn4u0ywxHi/UcUHpOavsz7gff++QuuHIS2Fboe2Qd4LVLsUxNkABk5PESrJr0y/K8NmJ/jXmg90U2/0dnYVFyMbqC8nrgRvtE8zgYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c53Pezhs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c53Pezhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23881F000E9;
	Mon, 25 May 2026 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779712036;
	bh=z5Uht39vr75GvbXhlhmve8BdPrujLfsmE7MQhBRtb8M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=c53Pezhshq6PGFgPDAGIkeDKWZHodAXEt/gCyqrUh30GuDrbJzvVjZOLUD0zHsJln
	 Y2Wgkp2UW/AN5koRiMlnZ5KfBlvvIWNaDtmn/6A52/kmMamv1TkbwlRePzIFX++qV8
	 Wur9BMSyzadpYH/hAms5HfJzLVBZHYFrigxILrq+LkYzzdc4mNDZa45YMdfvJ0dSs5
	 Rruvwaw49c2jDpAcE4P5H+y4kGaU/LqWPY4TIQthCh1+34TGItRji/KurD6e3lE8+f
	 vnLKi3XkTuNTWEQEA8FiMxeeL2Pux1D/jbkeOpgMsytHcPbOSdY88F73CZcNLZgyyI
	 GxeDZ5vlbJqXw==
Message-ID: <71629b97-a971-484c-9388-b3fb35adb982@kernel.org>
Date: Mon, 25 May 2026 14:27:11 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a
 twins board
To: Josua Mayer <josua@solid-run.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yazan Shhady
 <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
 <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
 <20260514-macho-white-tapir-4f8cf2@quoll>
 <e26e0b56-a91f-43ff-9268-1b885dafba89@solid-run.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e26e0b56-a91f-43ff-9268-1b885dafba89@solid-run.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2026 12:12, Josua Mayer wrote:
> Hi Krzysztof,
> 
> Am 14.05.26 um 08:43 schrieb Krzysztof Kozlowski:
>> On Tue, May 12, 2026 at 04:39:00PM +0200, Josua Mayer wrote:
>>> The SolidRun LX2160A Twins board supports two configurations, one with
>>> with a sinle CEX-7 module, and one with two (dual).
>>>
>>> The dual configuration was not yet tested.
>> And how do see dual configuration? New compatible? For the same
>> hardware (the same because from SoC point of view it will be exactly
>> the same)?
> 
> From SoC point of view the sides are different, and the hardware looks different
> when it is assembled for dual configuration. Most notably each cpu in dual
> version only sees 12 SFP connectors each, while the single sees 20.
> 
> Further the port numbering might be different between left and right side cpu.
> 
> Finally there are some complications in the current pcb version with resource
> distribution (i.e. fans, leds).
> 
>>
>> You must post complete binding, otherwise this feels risky and when you
>> actually try running dual configuration you will see that existing
>> binding makes no sense.
> 
> I thought about this and decided against it.
> 
> The single version is simple to describe, the cpu always sits in the right side socket,
> sees 20 SFP connectors and has full control over every peripheral.
> 
> The dual version will require different description even if only one cpu is installed.
> 
> Currently dual is hardware only without any software, and changes may or may not
> be made to the PCB to simplify things. Therefore I avoided drafting any bindings.

OK, one compatible is also fine, but your earlier explanation this
should be part of the commit msg.

Best regards,
Krzysztof
