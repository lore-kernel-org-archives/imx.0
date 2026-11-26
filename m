Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738839;
	b=SDexsUnVQIOOgaFVF7ooee2yUB+H0OnFsLDyaJT22/0pZFzBFcmROwn2pK5UlUMGIaID
	 itupMZDZKs5SD+MaK1SrCtzsHp6dz9nBwmmm1jdLNNNXyzjljFDshifA05UwWlnht4sc+
	 mVXBfDKzl8RQ8xGT7adKIqr/PfP+Q7xwaRqgfGnp2v3/jpssCd5jwDB+Ggmp+gU5MOO6R
	 gQCIgLbHxLxmMspNneTxWv6cwKv5zPZsmwaEHl+wKfIaC9XpJ46WMKWLeGkt/FAPSvcF3
	 b7DNVIFXG3y3nkPMFQ/sIiSmnWS9lFkxP8oRSVzysm3PQmd+3lFxsneWP1NvuH9jmGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738839;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=H6tRRsQCF4iyzVxbUzhJCcNKza/mMttiKLDZ5wLU/Wo=;
	b=zRuKtOeFvN0QAq2seN+FIS1eZQg0To58bMzDCwKE7NFEXC+bRAlET5ZBhO3YLMjXgA/V
	 bI1plc6hSKlvEAUMDFY0Pjg9V2CZY4/ryEv+d8ZeR4f2JZBXYp6DhTkyygxsEWRds01XD
	 xv78moJqaJMbpNTDiQxM9Ar1IaZwzeD0cWEiD2NNk0qCJC1tYhJcEbU3pRwjDUhDSf92e
	 xLF4MHcSsTRXSi7tfN/QjDL2ohxZZtKKXLll0jgUCs7W/szEUbWY2RflxXV3Ohm6Emngc
	 cImLADvJOvURrjm7u2eBoAcQJbRLi55pX5IQ3YXEds2fdJ/SQ4koJjS5Hhl9rUbyfIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=SpcLCQhB;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2D606A31C
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 00:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF2D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=SpcLCQhB
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E30810A5CD;
	Fri, 27 Nov 2026 01:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795738832;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H6tRRsQCF4iyzVxbUzhJCcNKza/mMttiKLDZ5wLU/Wo=;
	b=SpcLCQhBdkzksljTDxldG6WmnKmqpLXIivzMR94GmIDRFQRYx5Ka2Fmj88IgSpC0JA5dsW
	edkpaGR1OSTHY4CxAf4C7PJaKbh1zvNxlFMlxMaTg2EDyz3I+4NqHkn+J0L/sPvxKap9kS
	u7h+uNTDptkbZ7uPkrRBCoH8A3Tng5EWazvkGE2keLlEuQeFFK7WWEhtJteIAic0rnRBPH
	semGo6osjkKpX6+Wf0tja23NeZFCSnyAktoZLCeZOdq2quvBdaBLeX8lv05PJXkBYukXwz
	+Qfi/XNihhED6v8hawCh6qMZob4DIz6fh5oXQhk05mZthoN6L/KSUUwVPP3PPg==
Message-ID: <1ff22f13-08e5-40a4-b061-07b50b0135ef@nabladev.com>
Date: Thu, 26 Nov 2026 10:26:16 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel <kernel@dh-electronics.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
 <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
 <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/26/26 9:51 AM, Christoph Niedermaier wrote:
> From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Sent: Thursday, November 26, 2026 9:25 AM
>>> On 11/25/26 1:56 PM, Christoph Niedermaier wrote:
>>>> From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
>>>>
>>>> Tests have shown that, with the current pin configuration of the
>>>> eMMC (usdhc2 interface) read errors can occur with a certain
>>>> type of eMMC chips.
>>>
>>> Which chips are those ?
>>
>> The problems occurred with chips from Macronix.
> 
> To be more specific, the model that's causing problems is called
> the Macronix MX52LM04A11XVW.
This would be good to have in the commit message.
