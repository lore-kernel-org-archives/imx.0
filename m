Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3160D167272
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761897676; cv=none; b=pp3CL0dNH38nzKcERZpkij+TTP+xlL5nu/S0jtiPByI8mBTjp9X09oRWKTzvDmDR2HvWuSFu4RQHtYeJ4pFi3GRjGcfpX+EPB5cdZFJs9flii++NjurZ9tZXkoDkQvraPhKDt1XCO6mfxqRYgQlPaGsXFdKFIAJU+xeuWMnlgns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761897676; c=relaxed/simple;
	bh=6p33IUItqsgTbWao0/8LpE6O8R7ZzMno24041gdGicw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmZ9EV7wO5xb8IPabRXnWn/sH0gbvuqT/CP7pU98DI6ZU+1LpzHsDoO8w5SPuKTOOZC9c3QZScLE8rTMuM1EZnLwZdqJu7Q9G1rOdK60gr2w4aljsbkkFBR+iX0+fyYtOxqtFFRcRyobGu3Phz4BedDh1GO2EKVrPyYZGZN/ZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFPhiygU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFPhiygU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429be5d31c9so433386f8f.1
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761897673; x=1762502473; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQXG0TEjmE73mxJaXICzQHfEj42B/5Z9uI7ucSq7Rog=;
        b=MFPhiygUmz2tKGsUMJ0JnmEefUXKdv9fHfFXtDcdg/yhXL2oo/NXPmhPq8oqaNWBJ8
         jU0I0NcIFXTA/w6Ua8cx8PHYaqd5BcH1C3JVkZmmMqR6vNO2MhLnJXOnPq0D/E5KphSG
         Vkm1EMYmipL2xp3ZmD35AnFS4muPrwe7t8Wqy7ycE2198GU60mjOqHz2qav4JSt/yuKg
         RM55+ujDCOUM8CLCdlP5PJeqNhB5mAnbQEEmzA/dDLmE9NeUMnDAKjIjN99GOkcP0AcY
         Dg+PAB6TjZNnThn3grkRokZDW2ApeRp8SaWIo0u2drcnvXiX06j67Wheuvi0UeWf1An0
         TTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761897673; x=1762502473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQXG0TEjmE73mxJaXICzQHfEj42B/5Z9uI7ucSq7Rog=;
        b=Vu8scnee34I1sPx5F8WUrVRjDJGmKKGO9b8jHMdiAhumcbyqbcZEmB48YSVsStfG6d
         XrgiVJ6lBdXk0zrqk2OQVRKgc/bBnVjhzVbK5lEd3oAL/bgZZyJocJcXOobahGo4phBF
         XzoP3Zc5zhF4PhgoczriywcwAIyvw1DsplDWb+qa4XeLT6rNt5ULVeC0jnS/XSpAANX8
         lyGUsPmn1Ah9+hUi2W8CWh1laQueJqle9AtOi+bfk8lRdLikNHdS20LNRA0aT85yq72q
         V09ioDwg+lvsLKyOpy5/OzcTqIUCKXDSYS1INq29z9Hqg1YBLE6slHbr8b8EEK6miwkZ
         bDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAqNx7caNWS++7oprWsdrD91PXnbIv4J6PqUxzX+70DrUh09fapuwpq5nOSItxiDt6dE4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtLh+2uae+T7oY9tvxNyJMM6PX9sqgYJEdRCAWnLFy09v/sTW1
	zEOLSZ7P88Q6UyXRXNx1jIDLEw/XnG26NuApCQZwXUS+yQsfh4pWGk6n
X-Gm-Gg: ASbGnctnSr+wdS+OG/mUH49VJ6mt3i6Eq4+1kkNA804bq8E3EaWRHs4hHq2PucP0yWT
	AMl34AcDVdKeU21Uh+PaQDchkZvuaeo7If2ywEGvHmwBzWYxt8a84CFGi2WCKqUvXvrGWV0qVFV
	LPNtDrYpo6r2Qn3bdDCAy9gCeKYbsg59UG2uooDigwf6SvVF6oLieUreiCPmpwTLsRHIFjKHXuS
	300XIoyC6k0rYPyJ2jwX1yPbXuFaMnsKbv5WZOhXjPkum0goerqrKDGmZcppPfVudLTQ2OTg++u
	4CV3tYcq8mCe7FHqm3cfagbNbpzPGaB0sktG0Hhpkj1LF6bzBRpjHD+9OLZDsogPOX8cF+I/vXk
	1y90A1Q7oYwpOGciDAQyV/5foLAQoQ4b+5Vw48e7diB4zhyO3rORJSoYj2OaySfkhp6ug1SIoaR
	H7wtFGNwbZXgPlQ1rZjnw8uai3B0FRQj+NnTGVpwM/vmsgSXVAFhtHc+nyqbJx1glj3SjXFkx+F
	P5OXCy0HUg5FF1jPfdURYHlanS/QIx07QlJk9zWkySOIUxeHAg=
X-Google-Smtp-Source: AGHT+IG3O6vg8rF+wyYnH9VY8eDwwYFcOfRL+X70Z7BOTOQha5cuoUjm6Rm7WfFX1PmypLP9cnG59A==
X-Received: by 2002:a5d:5847:0:b0:3fa:5925:4b11 with SMTP id ffacd0b85a97d-429bd6e100bmr1988899f8f.42.1761897673065;
        Fri, 31 Oct 2025 01:01:13 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f28:b500:9590:7da:a3e7:284b? (p200300ea8f28b500959007daa3e7284b.dip0.t-ipconnect.de. [2003:ea:8f28:b500:9590:7da:a3e7:284b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1125ad0sm2128765f8f.13.2025.10.31.01.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:01:12 -0700 (PDT)
Message-ID: <827e9890-efc1-4630-9a84-931b8482cff5@gmail.com>
Date: Fri, 31 Oct 2025 09:01:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
To: Wei Fang <wei.fang@nxp.com>
Cc: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
 <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
 <PAXPR04MB851024F31700200CC78CE60988F8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <PAXPR04MB851024F31700200CC78CE60988F8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/2025 4:36 AM, Wei Fang wrote:
>> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
>> only be 0 or 1.
>>
> I'm not familiar with the ColdFire platforms. Do these platforms only have
> a maximum of two FEC ports?
> 
> The logic below doesn't show a maximum of two FEC ports.
> 
Right, the quoted logic would support more ports. But AFAIK there's no
hardware with more than two ports. Max is dual fec designs, see comments
in the code wrt i.MX28, and also following commit description:
3d125f9c91c5 ("net: fec: fix MDIO bus assignement for dual fec SoC's")

> for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
> 	if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
> 		continue;
> 	if (dev_id--)
> 		continue;
> 	strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
> 	break;
> }

