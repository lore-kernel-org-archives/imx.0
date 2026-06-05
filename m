Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17CA42849D
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656269; cv=none; b=OGFm0br+jg8AoKmYgPict4aYX+pkMk3ShrkqmY4xO8ufC94X9CYvaHhel6qD58Q1OOVLCPFJ7sK9OAK3g7JimMeOPgeT9gQ2x6QiOR7MDKaUpjlwoGvB9c2YDetYFX7kHWD0tQdcE2/kR8wRwO58uy2XlpweblDUwdAjXQh0Odo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656269; c=relaxed/simple;
	bh=25yQeO6z/Sv42/XFzm0mTMdMDNT6A9j02g1aaly+XVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmGzFYCEq2MQut+BTKjHkFRnW/Y/whiR/4UKhjqvgmWcdNSuAF4GIc16fRrV603jHK1Fjms9ceY8zk/ZdCtlKA0XeIAUvL1V7jmFYNrBVYPotolhkU+WJF01lgk2QqRhJLh4gP/3bC6BKOeKvslWMhHAGbLYm+EOhf133xAu4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCKN97Z6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCKN97Z6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so1206850f8f.1
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780656266; x=1781261066; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gn6KVcQqqwpDjyvuwkRjE231Xsgcb7/5TEFaLWl5LFs=;
        b=CCKN97Z6y7NWA1iWU1wiXl7oDYyMsioc1BZi4mXur76U9KOTc1GAdABehDGE/XpNVx
         MEhV4/ygPOyC5d5iQQVxf9ZSg5L4kUQhMmpi586IegCNIEvV1qAf4f328XPNVzQ6fdVm
         vFGdEHAjGonKtcncrNQO6/6kvz0wGJ9upoF1/IUzUJtfkdrv/xqslZvwadwQyYKMlLbG
         Wi90YtiZ4oC8iPGBTF0sqscW7xAKabuz+mvGsQMwNnn0MklaIL0/RzshyBt02QVkFlLJ
         bPhptsthkLRLC3vx1L9YbyBgvWSGzToUdzkP6rnGnc/arWM4szPGMuUZQWTErAQ2nAWm
         YYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780656266; x=1781261066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn6KVcQqqwpDjyvuwkRjE231Xsgcb7/5TEFaLWl5LFs=;
        b=HaQ7y1SUuZuQbWo/h0PZlOT661YQmesSSvYXnihUZrpoitiTW2wVLQ8DuhrT33jrUJ
         m4D7PV6CwpnanjPSNM+AER45E7a4mHpel41meLFCGe4O56bqmYrnv5hFyj4IH3i5pl3+
         C8UUUFFyb6Vx/3a+xGAIeaLQaZMZxaybHqmOODJZ+eRoQg5XNEJFT3x5b8uXrFVKCRN7
         6WX1DmNVMngXxiRbXqo85+ujj4YkOaxppsJ9MmmZIFA8NPb2LkQUU6LhogCA8I6NC3N2
         cEYLF7HJ47i6jKS89zM81orJWeq8jqD6khPWYmh0kLEV+LTeM+VBYHe6ploqS8QRw8+/
         aWSw==
X-Forwarded-Encrypted: i=1; AFNElJ8lZ2dMXSLPOtk5cOHF09zD1sYqRAaMv6YdYFSCHmHoM4TErXUEFci9n9VpEL51EzVcs1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyietfFBEgsnJUAE448NII1kU2s6z+xx9yPMx/k1AFXvi+WhIah
	nH8bKQV0gXTVb0Xwyqv4Yz6SrCpcUdL0nLPXN71fX/djo/Zccs4V8LNc
X-Gm-Gg: Acq92OH7OAOSUquxn9xBTePG2m53JOsH81W6LLmsiwBji+2RuYZLR3YLZrhoh/j43eL
	wUr5isR56AwcI2V3QfsKsRBgNY5uB823SbhpK+imlOIy8mjZCMO25pzmsLUemxC/EWr6ghlvLex
	RPkf7argDX6+gR5eRH5OacKDDWvkT6FI2+xwv+NGBClf0M2hxg8WaJcc5nej6fC0O9j0xw7RsNe
	XSsUV1mFZdDGdRXCFALHgj0lCKgKaXP/oKegtI6ZdArowk6stshT6iSNpl2sNIE/kVTiFzT/f/Y
	11TFmQFho8zt1NiVPf0rJqPAbOpmem6rG11tBEu95JJX6lNnFXy10eVvPpdY8Wifm+iornkIuB3
	MmEFdc90E2jIwVGXj13shfiDu4hsQLTyALz5OnYZDlfgAgvlOXIOg7y20JIlcYHcGFuddi8Od2z
	1dAAkdc1wSZuvOJO3W9z20Ws2Vu+UHI3l0ZlhH+Hau3TWc+udy5DRAsiy/BeHRTf15uA==
X-Received: by 2002:adf:e00f:0:20b0:45f:f142:d55c with SMTP id ffacd0b85a97d-4603063a8ffmr3523153f8f.22.1780656266046;
        Fri, 05 Jun 2026 03:44:26 -0700 (PDT)
Received: from [10.25.213.68] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm25066376f8f.9.2026.06.05.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:44:25 -0700 (PDT)
Message-ID: <cf7b4c03-e1f4-4439-8077-2f8677bb2cea@gmail.com>
Date: Fri, 5 Jun 2026 03:44:23 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/2026 1:28 AM, Joy Zou wrote:
> Add documentation for the dma-channel-mask property in the fsl-edma
> binding. This property uses an inverted bit definition: bit value 0
> indicates the channel is available, while bit value 1 indicates
> unavailable.
> 
> That was already used widely for i.MX8, i.MX9. Correcting the definition
> will break backward compatibility. This reversal only impacts the eDMA
> dts node and driver, and doesn't impact DMA consumer. Therefore,
> keep the inverted definition.
> 
> Also add a note at the top of the binding to highlight this inverted
> definition to prevent confusion.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
Hi,

I believe this patch hasn't been picked up yet even though it's been ACK'd by one of the
DT binding maintainers.

Frank Li, can you please take it into your tree?


Thanks,
Laurentiu
