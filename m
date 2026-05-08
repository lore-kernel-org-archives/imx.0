Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8922FF67A
	for <imx@lists.linux.dev>; Fri,  8 May 2026 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257215; cv=none; b=RIV4eH+hY++okCrbMyW/50E1oKxR2uyRMGLFnbZPBFBKdwxmNztOGDpGIyFC+Gvqy/Cch211/oaT+OTP34sK3NcUpyzYcpNoMCdZq9eoIZifGwjNJrRoOTgODMwWC7zx8aN2cgYlH9IjaCFo/w1P2qM+uifsAxHw0LvbhhwKz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257215; c=relaxed/simple;
	bh=20rWNJSwAUqKvx/mzVIT6PjH75jga5o8fHrg9imIkK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eF4KAC/TPRc1k1I0T28XIry0zgRSC+/baLe2NxtPsAh1KOeT1SUlV7IEJ0snfL5eFrQADpuGlchWgcNqfrliRLQCh1IDAJnAd9m4lKybLxm4bylifrK1dzbluI+xD/ZkPvKo9nIEJtDD/HI8hvKPjIDQo72BQH75kUUTb7wMaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hRqjGfl6; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hRqjGfl6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EB0A10D4EC;
	Fri,  8 May 2026 18:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778257212;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OqtuJSGDNO5ECwD5qTpWrG3+H6LLJZbAaU3D2FX/gd4=;
	b=hRqjGfl6+Hz5Mm1zUBPkNTPEwQEZrJdTheBJmGcHZ6NaCgyPEVTOChWdnyLYCZLq0qUR1k
	wyKVW7M9z5wJD9VxgnZYoKELPhLfJsprJ3b+fXsh3BkL3VzwN9FK4V6XHdqltygfmr6z2a
	DHtLa1oyyKWjroTJ9KYbQNN3rnGyfPecg6MFsjR0ryFfSbGSt+JRMS3rIXZ/Xoefcq9RA8
	j/fB0dJU6a5YB1pBrmtJmfk6S67qvluYMOknwWqhNulPUE2TGx5XaJVMshhLaBUSQFQ/N4
	gkPp2eGek9S7w5BvjDHitaNlX/6ZBjSnUq4m2wdrE1pnBw1MguAFNVrYeuM3nA==
Message-ID: <dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com>
Date: Fri, 8 May 2026 18:20:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260407211850.79881-1-marex@nabladev.com>
 <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
 <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 5/8/26 5:46 PM, Frank Li wrote:

Hello Frank,

>> this patchset is now split. How can we proceed ?
> 
> I am thinking about it. I found an old thread
> https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
> 
> The current code base already supportted partitial of it, such as gpio and
> irq map for connector.
> 
> Internal chancel liu have prepared version by use nexus mapping for audio
> boards, which almost done to send out to review.
> 
> I want to wait for a little bit well to resolve or partitial resolve N x M
> problem.
DT connectors have been discussed for the last 10 or so years and three 
is still no real progress.

I would be happy to send a follow up patchset which would convert the 
DTOs to whatever connector implementation format lands in the future, 
but I am concerned that waiting for DT connectors will block this 
patchset from landing for a long time.

So how about finalizing this patchset, landing it, and once connectors 
become available, I will send a follow up conversion patchset ? Would 
that be workable for you ?
