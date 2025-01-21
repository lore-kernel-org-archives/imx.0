Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAB1C07C8
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451031; cv=none; b=EanMBS/o0A4NMuss/DeHk+oCKAnqVg1NOK75osBUNkZe9h3w1qcBlAyqpywxVMMv/itO7ExIcTgdCdYhH5TlSaCC1VTnqJ4CVADNvkGEsX67xq7/cznbL27ka8Dt1eXsR1XdDnYlUMIvAhxGoTybLsMR2Tvi+oLJvFOJR+ED8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451031; c=relaxed/simple;
	bh=vG/Go9fgzg7q85qTtpDPDN51SXJkaSOoI0rK4tfXVLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InF0JOGmSS5xZ/qqwRjXDK3qHL0IZgIBOFghAIKH+o5xTcW1aiUZhxaQuPnn/PK+q5JyiMUWagI1Z0YGiNIq1sa6fz005eJcRPoMG0NWbgq++SPUIwvoUDsfVV6JjgTpnCpUJAiDXw145XKtmBvKlCPQ4YPv8CukrvUOOojMW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taANV-0001x0-1a; Tue, 21 Jan 2025 10:16:57 +0100
Message-ID: <1f7289e7-8e5f-448c-a443-2f27a43e640e@pengutronix.de>
Date: Tue, 21 Jan 2025 10:16:54 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Recall: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
References: <AM9PR04MB86041F11E6744FB41C40CECA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM9PR04MB86041F11E6744FB41C40CECA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hello Pankaj,

On 20.01.25 10:26, Pankaj Gupta wrote:
> Pankaj Gupta would like to recall the message, "[PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave".

AFAIK, recall is an outlook-specific feature and most readers on LKMLs
will just get an email like quoted and thus recalling the message only
adds noise.

A single reply to the cover letter that this was sent out by mistake
is enough.

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
