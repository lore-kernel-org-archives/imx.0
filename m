Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F7A1487DC
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 02:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727232526; cv=none; b=VSvNTIZTnaYOOFgzUXMTTLaaLqT8mtI4JpVAfaw8GWwl7K+1I6rFcyCCq8RKAGFyuY5ktslKNR+1yz3uXNRR6I4PviG68seZoUANtpINkeNxWAiLPrqOdmJPPuQmkEQxGaiWP0JsYWk2huuGB2sjCCSR6TW0uK1OSdimVI3rxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727232526; c=relaxed/simple;
	bh=qoT8Ty+KPUD7Jv03SSnqGQ1HXFC6PxOKG7psNfv3a1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSPMf5C12HBrnK5HKtSP5LoyM/RaXi1Vj8i4vtfUtSz1CvMq/LBtX8QTBDKIZ7/cmiAh8nm3xhur7Ad7phnFq9X6Z0SRDx4MB5CG4koUbXH2FEiGiqr/mRQMI9fo2XtMCstN1ZwMjLfm9t3GaMRUaKjbdJhacNaqr3h2kHXBqYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=N0W70ggt; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="N0W70ggt"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 996FE889ED;
	Wed, 25 Sep 2024 04:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727232523;
	bh=qoT8Ty+KPUD7Jv03SSnqGQ1HXFC6PxOKG7psNfv3a1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N0W70ggteSIRdcmomJDTxL1Yvl6ROvkYEaO+Al9A4DV9mK+AFcgq9ThQaLhIprflb
	 ojNaDl4PANPRvpNHhF8un8c4t7+opHR2ittK8/jj5+0TkUMteWK4AzKp5PYr23QQBJ
	 GpgUToi2fLHkmoNCTtzfQ3fBDS8gZla+XZpSM40xt6cmKOiZiI1o6IZZAflEC26Pvo
	 lk9nDtLXf+OVBxBuE6kHSGlx6Qwvu6Zjz3J6zUzaQWQbUqBvUM1Co/oup0fT9MvK4k
	 mY2FMClI/rfOTWxZPziXI94EAoq2gAX7sbgXwg7Q2bZYlJhav5ClOhlUUpS57GDRXi
	 /Ie+Zu/tSkzTA==
Message-ID: <af9fe6ec-06fc-4ff8-8fcd-c2f9dfdfe5b0@denx.de>
Date: Wed, 25 Sep 2024 04:48:25 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: Document DH i.MX8MP DHCOM SoM on
 DRC02 carrier board
To: linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com,
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240925001628.669604-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/25/24 2:15 AM, Marek Vasut wrote:
> Document support for DH electronics i.MX8MP DHCOM SoM on DRC02 carrier board.
> This system is populated with two ethernet ports, two CANs, RS485 and RS232,
> USB, capacitive buttons and an OLED display.
Subject prefix should be dt-bindings: arm: fsl: , will be fixed in V2.
