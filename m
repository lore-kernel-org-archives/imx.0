Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6313244660
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051766; cv=none; b=OdLlu+w3rdI6MkEj9VlF6U/eVzlE4eHZ7Y6w345r8cJKrcxFbFRVC1WIqbRgxK79rx1ZZ1OURXbLJ1Ad3gv2cH3ZnpYZuD6X3uH49p3d6oMBO+PcErHUyLEupMQwEvZtTrMWkgY0S72TMtuxHiX/+35ZoPl4Pwx3v8pR+57RBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051766; c=relaxed/simple;
	bh=76YrXol1VadaVpm2rSKGIHqgcLtD5umJrfw747ixCOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7kTrqL1JSRBWTmO1qfl6YZi3AMpcd5/Ctdwvd3yHGBR0f6gYpKK+P2vUsaYC8B2HBjFZ2GYwllllwlXV7jfY0L2Dd6ac/1UBVC5ypr89iDOMgViIrmJ7FlzhJOzSZAZ7/Vonr9hAEYVbEC9DB5fjc2n7ViHXmml5rfzaJsV9l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLzuhv7f; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLzuhv7f"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4589968e001so12384205e9.0
        for <imx@lists.linux.dev>; Fri, 01 Aug 2025 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754051763; x=1754656563; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76YrXol1VadaVpm2rSKGIHqgcLtD5umJrfw747ixCOw=;
        b=TLzuhv7fDwDRHhB3ucISQrurIR5QdXZEelPoy2tBntHcwUtJjXcVtRuQcF1QYp35t8
         XyITI0vatEmYLLViAsgg0Z22FwWKOxAj73m5OmpQxmPY7S7qUuGz1Bbinvs2eDtkuH/7
         YI1E8q8sCUDwvBvV3Ww4GHUoN1v4qa4jBLEi0jXWX4ilVS5jtF3wRNVDLZ5WlU88T592
         nkgcL/uGaiVbQrGJtz0BbSVZCwycPHiGhj68P/artXLstbaZ6oOYhKTpk7pBKG3cbO6i
         zfHcaw8vgsB1wCwcqF/dgOwFQvbzH7UCVlphwU06XPvqVIu3lLRZkl+ZW4lE9DrzS1mU
         HwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754051763; x=1754656563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76YrXol1VadaVpm2rSKGIHqgcLtD5umJrfw747ixCOw=;
        b=lNFJfTNHyo77BknGe/F6TGNUZK2sboUCIu8ysv2C9UNc0U3e4V0lfkSYRkcn28WTuk
         6MYzXx1Bwdk1cJMDJTj/yt7ihm8TBAKLsmBKainoMcaNVpHCwfJbXGHzEiKV2a8XgYo2
         6XnTvEMlBcZ+W339dJ1n5UhbtvZwI0hOn+uSmLIOvwzU8dXzMcJDCnvGNdQdPcPCiQN9
         qqUEOBagN+NKE8G90dOVnGrnAthtuurIiEBSADnR0xfvDEuzD8T4c8fkmQoDFKzPtsdm
         fV+ZS8H0oJsDATblN+rDCBkrVQ36HNu7MTznYjuZdhxv+JHbxrbd5CDGgUEp+ELlNtE+
         kr0A==
X-Forwarded-Encrypted: i=1; AJvYcCVD+k3qzfZy+siK0j6gkdKMxuW460m+SeWv3P9tWGYArLEvJI5KEZC1joUsSWCRls4+p50=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXqDmAy4N/Eu3Ju5qQuRa96Chktzds26hJYqk2Nsxt44KA/ZK6
	10bFKt20zahtvjoDcxrx3ipf0ofIGaYdDYpCzKa0Ojs9WhIjAeiu821O
X-Gm-Gg: ASbGnctkheRRHVpScidvFmZRgATRVhGkYgi3NNTInyC1RVTmCUzzdd0TgDqJrZC+crm
	IikJCGDehtwDFwl28hushmYqrzcSoRf2uButisi05CI3O4iMaE4NPlCveeBc69G2gRNp10fRq7Y
	ni1+v0+ELf5hLGp1G3L3ORxvZ3l2Xm3fO4VFETLxtAX/1V17cXRkiASPFKKgXsuN1V9dGDBceOj
	olPCTUm3BnPSIC2qWI3NiicQp+T3hQdVqZKO5UW+aVRV6ZrhwxT6QG4VYasmsCsrDuKWEzPpycB
	ao7kBGQOiC1QoIQtjD2MrnCv0RPKryWn5ULSiKyMFHAZgVjaLmUHS/3QjvTcomsvnKMUE+rkZSO
	UDNOKprijmzFaurdeGHYs81WbUVC63pQ61yJqg2btCgpeMywn0Q==
X-Google-Smtp-Source: AGHT+IFaCtYVTgRwZ19nJjwacjiBxot+B0gOHr5d7RezG9lzzdi5O12mr/cv+SRU8eaUlfGK7m1eYQ==
X-Received: by 2002:a05:600c:4f09:b0:458:affe:a5b5 with SMTP id 5b1f17b1804b1-458affeab35mr15788205e9.24.1754051762846;
        Fri, 01 Aug 2025 05:36:02 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eb7acsm100098665e9.28.2025.08.01.05.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 05:36:02 -0700 (PDT)
Message-ID: <69f6a044-be90-490f-b0ad-e7867a4825da@gmail.com>
Date: Fri, 1 Aug 2025 15:36:01 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Content-Language: en-US
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <aHDNmVE23O4V4rqJ@dragon>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aHDNmVE23O4V4rqJ@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/11/2025 11:38 AM, Shawn Guo wrote:
> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
>>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
>>
>> The DT node name is not changed to avoid potential issues with DTs in
>> which this node is referenced.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Shawn and Mark,

> Patch 4 ~ 6 dropped from my tree due to the regression.

How should we proceed with this? The fix for the issue reported by Alexander
Stein was already picked up by Shawn via [1]. We also have [2], which is meant
to fix the Verdin issues pointed out by Mark. However, I'm still unsure about the
EVK issues reported by Mark, which I was not able to reproduce on my local setup.


[1]: https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/
[2]: https://lore.kernel.org/lkml/20250707234628.164151-3-laurentiumihalcea111@gmail.com/

Thanks,
Laurentiu

