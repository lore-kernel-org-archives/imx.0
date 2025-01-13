Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B222CF05
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736776302; cv=none; b=t/Makk3uFg6WsWeXX8oaTFyOoAx15qlruKyrdlZvSiZy0/J/whtPO3hWE0prOVVpYaszVK8r8RMFLvsiO0yNdsiVrw/EMeoRgSqQ260Gh6NspdsOgODkp6bZGxs7MYw/uaT/Xvjil0ohQrDgIYkWYif31hfiLesnsFq6/iVKy/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736776302; c=relaxed/simple;
	bh=+r/a7YbyUWYBgwndbhj+vR5UeZAcrz6DRygjRCQcE04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdBfNrS46aCon8N3Em5UoWT3zaCM7EDpJoadD8kUqyOog9OyPx2FCagGldBIVZMYHP2euzP4JK2dyGPAG25grc8EvJQdIP2RL3wCPcQ95BREsNzmyI/v0BVkLmVyy+o3sD1/KM9t2UO8x9k76EItlZsndr66RAnlaqNJTfM3Kv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKqj-0004AM-V3; Mon, 13 Jan 2025 14:51:26 +0100
Message-ID: <b447c110-067b-440c-afcc-6eb3d87b174c@pengutronix.de>
Date: Mon, 13 Jan 2025 14:51:25 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
 Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
 <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
 <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
 <Z3wyG61QEzgCJFh+@lizhi-Precision-Tower-5810>
 <6fddfd9a-8a8c-4dae-9f74-e8019b7ed404@pengutronix.de>
 <ismbe2ne65ew2jkcoa2tmbjz2eajvuz5bxuwef3wptj7tkvqhn@norm5p52aygr>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <ismbe2ne65ew2jkcoa2tmbjz2eajvuz5bxuwef3wptj7tkvqhn@norm5p52aygr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Krzysztof,
Hi Conor,

On 07.01.25 07:52, Krzysztof Kozlowski wrote:
> On Mon, Jan 06, 2025 at 08:55:08PM +0100, Ahmad Fatoum wrote:
>> I am not sure what's the preference is though, should we have>>
>>   fsl,operating-mode = "normal" / "overdrive"
>>
>> or 
>>
>>   fsl,operating-mode = <IMX_OPMODE_NORMAL> / <IMX_OPMODE_OVERDRIVE>
>>
>>
>> Any idea? Conor?
> 
> If these are two exclusive modes (plus default), then as Frank
> suggested: use enum of strings. Imagine encoding enum of 10 values with
> bools as you did: that would be enourmous oneOf condition or if:then:.
> 
> Preferred is strings, but numerical values are also accepted.

Ok, I went with strings for v3. Thanks

@Conor, as the binding changed I've dropped your Ack from v3.

Thanks,
Ahmad

> 
> Best regards,
> Krzysztof
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
