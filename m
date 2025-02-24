Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA0241CA6
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391137; cv=none; b=tp8DqwqJtsEbfAUBmsnjmR3cDag+x/mGNxL6Akq+hJ+R/sCVdf/bvjr+78SEZ4UThGfFS2QxUgqk0Xlzp/m8o3uExFCvtP/Xc/SgYaiBeR71iNoHT/JfdffnqQCfE/3j4306onWXUhZ/726xyVu1xEyOXPc+zKgryWRDdYUguxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391137; c=relaxed/simple;
	bh=fX2FejRKLHmTf189qkb5nrdkHYro4O5UcpVBV7OFrbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4QT9+uShHW+Hb+wDw9jFNlXKFqLePBRjABr6Z78JpkRdsS099dwiQVSqE4x7qZwk48jJAe9vyTen9h/aB0HrTKyjGfRjPujHGQU6PMF32qCwamxvtv0SEVb09pmhDHJKZdXMf25E0Wqm4uWVuV5i5hJXdBhqZdbg62jmi/0/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjBl/R47; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjBl/R47"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abec8b750ebso9295166b.0
        for <imx@lists.linux.dev>; Mon, 24 Feb 2025 01:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391134; x=1740995934; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlyuCvvFDo2128e2teHgyAWHlRy7aBFZ5OZbDHsqsLE=;
        b=MjBl/R47N1A4TEgFcqgNsGKVSVJZ4wHdHQDjvHiltjf9d2VwzS6eWAGmYvJKkEcn35
         iF1dY/NWUTbC2C7KsXtSzPBan+Tc1f9F08k2HvhcJ1FJCPFimzW/RVcbTl1FjeB5l3yO
         cpF5r43/lmD+ERbD/msnmv/1Fhvh1l3Bj3Z0Ki9nVOfhMcphp8eyUKr9bjCcyXaIM7Af
         eDknT5VKLICKXH2cxDC0In5v1fwZLod5qFst7q/RYW3ZY8ZUjRDZpmll2tMN00UHUKxY
         qPadu/NXWq13k301y1hrW7jGSchDfhJXudpDb/b1FJtkL1LeG7/XVxvDkInLcvg9CjFC
         hwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391134; x=1740995934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlyuCvvFDo2128e2teHgyAWHlRy7aBFZ5OZbDHsqsLE=;
        b=ckv06Ib5U0qySS2Tho20N772gV3SrP11TmjYTrjLxAPqDvHyOZSacH//Si7eUSBmzl
         6qIOEgc9ljUOzE1TlxHcgyGXMGo5JM7WW+zT6c3l085OuOa5V/rhGTp2I9/C+wDw9Hdf
         CpJ+yZmmPYTiK3pfYw/ur4nFEsei+gegUOWrDMg/qyYNgRvPxXsLNywzhL7ah+12jRR2
         Tf/s4EuSZzDiIQ27UtYuAiAdBxHPxQ9wrbKYw6Po0rrEbqTBBQsxAyWi3N0yWPB57bbe
         BPl5gDtsRoG+zoFnw7xbZHWnul/5tcyWSsi90wCu0xOj3oYz57y17vVr3NxcOTKDg1Wa
         qw5w==
X-Forwarded-Encrypted: i=1; AJvYcCUx3yPJkvYgZEytsMQZaTzV0nC4zv3Z0cV+ZvnvSTxDAxDH+Y5zd5RTmAwyKVIcq7SO4+I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXBs91t1kYLNzX5zenMAdtCfkOWZ9ANeBYwoJclRK7nDrVz2fn
	LnlnTZR1IPldEGzJZRI84RcEHgt7iyh8bfbEQf1NMY36Ip13pfPh
X-Gm-Gg: ASbGncv433Pf7vTKhhkfw5/HZS2+AuDAH3wgQVHjIVIYnaiHRmM/7nJECD4D93FR0At
	X2FH+38UHwm9ublLv4N24DiHd9/TCsXw/XZE/mUZ9N6JbsvcHqBv4uYH8NNBpMcGjpWBOOU6Ytg
	pk2z5nTdUe93K6x8ynLFWg1YSPqsdRMTs37cR8Iy0yFwuKGV3JHy7+/CrJWOlZ7PcHA+hkvzRjH
	uMCmwDTAiqVPGzo0jBOg/ZO+QJCCyYgtJZagm5fscjv+2QSZaGBjVqaBNk3gZzX8gfRwNF9Uuyf
	526LWdHD6AxB3eyQV34WbrHGpjrNe9IkXSbGBToVEpdmwLEzhLg=
X-Google-Smtp-Source: AGHT+IE4DISpsiKgYOL3EFZd4l0OSdPpTIlMEud2TUQe2sSiVQY+CihGdqfWOxw12evc/bJo4FFOAA==
X-Received: by 2002:a17:906:31cf:b0:ab6:ef33:402 with SMTP id a640c23a62f3a-abc0d9e4ef5mr1108032166b.18.1740391133934;
        Mon, 24 Feb 2025 01:58:53 -0800 (PST)
Received: from [192.168.5.199] ([92.120.5.6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbbc95288sm1255333966b.158.2025.02.24.01.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:58:53 -0800 (PST)
Message-ID: <a62ab860-5e0e-4ebc-af1f-6fb7ac621e2b@gmail.com>
Date: Mon, 24 Feb 2025 12:07:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] bus: add driver for IMX AIPSTZ bridge
Content-Language: en-GB
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
 <20250224075538.7oetjzllqqr2mlnt@pengutronix.de>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250224075538.7oetjzllqqr2mlnt@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 24.02.2025 09:55, Marco Felsch wrote:
> Hi Laurentiu,
>
> thanks for your patch.
>
> On 25-02-21, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
>> configurations meant to restrict access to certain peripherals.
>> Some of the configurations include:
>>
>> 	1) Marking masters as trusted for R/W. Based on this
>> 	(and the configuration of the accessed peripheral), the bridge
>> 	may choose to abort the R/W transactions issued by certain
>> 	masters.
> Setting these bits requires very often that the core is running at EL3
> (e.g. secure-monitor) which is not the case for Linux. Can you please
> provide more information how Linux can set these bits?
>
> Regards,
>   Marco


In this particular case, as far as I was able to understand, NS EL1 has enough

privilege to program this IP. This is why Linux can do it.

