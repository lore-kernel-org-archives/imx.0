Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1983A784F
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 23:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590865; cv=none; b=RQMtJEkDQ/eFb8op7YNedMEazUIaWmz6xrA1VIApLa+wKHst9MvN19ejRXcZfHdybwShlbq/ZznJyQZNIZZUJ3PAZLtzQ50IjxT8F12gqUhwjAxzeGwPvDhg3eJj+gtAIIAiquyNNLgxViAop7yDTdkokKKBrtLLuH/CQsBXZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590865; c=relaxed/simple;
	bh=PoLlpdsHqpFtL1QScbKQ55IvWNzxPigkSoWvBLAMYow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT1Hk2dZjx+/sFEXnuCizr9jXDUsGJIAOymclHoOSeiiyaHgGmS2L9tAC2LgRo4NI27IV+cBLcUxZb4Z75kp0LXgC1YWmt5MjHuhkEVuwliAFfKLNF35aDqy/rOvvJgHHG3Waal6JwF0ect2/86rsZ4H0QgJUnDlaNG7xjPeWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7RwuizQ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7RwuizQ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c795a47186bso600327a12.0
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590863; x=1778195663; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=S7RwuizQoBtAwInON8mEFlCxHrAvGfnyGg/AQozGTUE523eqjWs5Ne/EHPKKYbN+ot
         GqNVCGfAUx3W1ciIpdoT0VKLFV5FVKosb3/1CS8j+ILAAI5Ox2+5fZACoO3xCwYqMxuz
         KnDA1us9GmCKiQHPBZIwVy4m7cp/haxlJtbigHek4BN3wCFQOoZoPUYTeTRIaGQkH4FX
         WE5/WZDNEJEsAnwQHDknkZSC67Am3aKnv2MJmcln5GjdVfC4joP0qlEiZX8CcXezTYzx
         DBR2QAxMCUxcngTfHzO6ruV1wEBYpum7+AeTF/uACxRPA5lpoTJggLb1U/9nltFUFJL3
         4m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590863; x=1778195663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=EspArxoeDOKKx/p7SpKBmkemNx9zU2FFQhfNWv/4BujxKNVwAnE5GMvSAhqj/NjONG
         /7ASVxnk1rWHEU0R3yRLVugEjhIlA9Lf8xa6ZFqkEmq8lj/iPiCpDsnwTMTRHf1dA5W8
         QcoWiqAiYQAYpeWNnAjTf0m/+iaQ01MI2Lpl1w8BHtYSPPRnMGM5SAowJNIu1Aiv6GPl
         NpImOkMAT7R6pkksJ4JfhUYItpF7IZMUyM0L0vv7oOA+tBpOBCSCUTO8/P5Vdajk3OD+
         U8gvu7WCLAH2v5vqnRGWisShdfn0Knmq5ic/5RBk9+CdBKQ3lwxZGKWneXlRrsa91q8P
         Yi2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9U1LU0gnRU6i1Z7K8FttFqQn7qNNcu1LVjkzVWL4jwzkT1QK1y7W6DB4j48nc41tX3ieA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRFHYseCoMPDq68NtUdy1hGVq07lajm8Ru/xlGEn4KNZ4nul2v
	NuhdB9IQSPaxfiG3asEr+VTYM5vLtXIl0S6y+VFsA1ZbdeICPI0/04Vf
X-Gm-Gg: AeBDiev/L9MI+DHT5sOzvQSns8AACuot25vVpjVIfIB7wYqtBbCSMJV/cgi9kKXQKYD
	xsB4027Hz9W4dy9NAf3DXCjxA4x3L+XvxCQAUfBQgM+24elgSP+hMgOJXutLO6bu/JpkSVL4cDa
	ZZQnCnaRCIRT+LqjaOXYY5biFwMsm9nB5hrigw3gvKv1zY+7lu1OZIAHZdbwSxQXDsEKcVzb5UU
	DfienC6mvI10zFfrr0a4buHzRB/UIqrx+pgR/R0aDuuvpHA2cnvgIbBArdWRu9rikIIXU2bAeWh
	gUXbiSX818sqDdZ3MrzDAYBSiZriiZq54gp43Ulh5XWFDrmnrKalOb6tRnXZRCReK2zU8A4w2dh
	0orEtr225szlgk4owdWXnJ/Lg7UuIHWxlGwB1/oKdu/4InSex4be6T54xa9Eq4rM8SKqD73z7pt
	0m8wS7llRDri92Y6zhK2lDeRfJjkHcDLTjs1QxrL7Rmb0pfM1t6T+17FF3Ew==
X-Received: by 2002:a05:6a21:3298:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3a3d1cf2f62mr4499046637.15.1777590863268;
        Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm603009a12.32.2026.04.30.16.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:14:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:14:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <4981e0ac-ee89-4c6b-8fc4-d6899f1cf353@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>

On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
> 
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
