Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53D13E02E
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727298559; cv=none; b=E3C9waPCSFD1+wEb0Z2G+3kCByxT0bCmppEAeLK5HMCQIUHXLzwUM+NVITJntlHvKSkjjTqcT53aI+wwBHxGhV6zPz2mqwgpdXX4Stk1+H6XA2+cJxdLXRRGahqia4kCdFlqkrZPy9d/vS5YIhwmRN4dBtpPlHtkI8obq0/mOUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727298559; c=relaxed/simple;
	bh=nf2jRDe7YOb62V0yxLHQRkU3J79+1yvoaoml12fC0GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQmdhcSn/rCmj6Vg86+Kr/yfVBAYUdCNYe36h2SEJ+DPjvcmvYJ8lCxTe2tlR7hKiC1OCHHyOlbSzZ4chXgqUUZxYgav5A+fm0fWgPyXZUz6tjx6FvAuYoq53RRFFZeh+pEkowP5klu1PvzCd2oYB92/6xZI6NuIwxnYTHI+SLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OA1UvoXu; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OA1UvoXu"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8CF5386DBD;
	Wed, 25 Sep 2024 23:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727298556;
	bh=K75U2k/x20rH4YoM4z8OTVABunQZ5QU6E8UEzcLk2XI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OA1UvoXuikvu+2ZNeOExtJ7J0KZhhxeLKMjLXYr9xAT9zlRBtXti1LFyTxZVp7O8A
	 O/IzKdkucVOg9NUIsBFsIJ9j7bnCaZ1R5e16WiUUU8/jTHqXst4mDIaPphynX/Tywn
	 e12Ti5MDysNi5R5pZfFL4J7+q/gthUEnmly7PH1W9MgEB4ELfYJLu1wA+PrC5UsSq2
	 Zw8qJ1UfVGt4nTEZBBSRVyYWrko6F1hWpjYvR5Af+rhMM4A/92kwNJojYgO5JhZ4N8
	 P2kNvpbCo8RfupG9UyFXAhZ4cWBJSs2ZrbwWF/tx1cEswKd2Muo3Vj2zy2NU8OY1n6
	 rXZUy2rNKuALA==
Message-ID: <08b805f8-a4c5-4aa1-95b2-66292a681aa9@denx.de>
Date: Wed, 25 Sep 2024 23:09:13 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: Add DH i.MX8MP DHCOM SoM on DRC02
 carrier board
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Hiago De Franco <hiago.franco@toradex.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mathieu Othacehe <m.othacehe@gmail.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle
 <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev
References: <20240925001628.669604-1-marex@denx.de>
 <20240925001628.669604-2-marex@denx.de>
 <ZvQ6qWMAEZaR/5pl@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZvQ6qWMAEZaR/5pl@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/25/24 6:30 PM, Frank Li wrote:

[...]

>> +/* USB_OTG port is not routed out on DRC02. */
>> +&usb3_0 {
>> +	status = "disabled";
>> +};
>> +
>> +&usb_dwc3_0 {
>> +	status = "disabled";
>> +};
>> +
>> +/* USB_HOST port has USB Hub connected to it, PWR/OC pins are unused */
>> +&usb3_1 {
>> +	fsl,disable-port-power-control;
>> +	fsl,permanently-attached;
>> +};
> 
> Suggest run https://github.com/lznuaa/dt-format to sort node
> 
> &usb_dwc3_0
> &usb_dwc3_1
> &usb3_0
> &usb3_1

I'm afraid the tool (I did not try it, I used plain GNU sort) is not 
sorting this correctly, look at ASCII table, 0x33 is '3' and 0x5f is '_':

$ printf 3_ | hexdump -vC
00000000  33 5f

So if the sorting was correct, it would be:

usb3_0
usb3_1
usb_dwc3_0
usb_dwc3_1

But I would prefer to keep the controllers close to each other, i.e. the 
current order which seems more logical in this case:

usb3_0
usb_dwc3_0
usb3_1
usb_dwc3_1

[...]
