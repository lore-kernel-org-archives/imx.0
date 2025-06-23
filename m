Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5302550CC
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688384; cv=none; b=gjP4C8XUZv1FFis3kJjD+u8lWhhXOe/riDGu++Mh/pDkQYFpbAOtqrP/GELI4c7M7VOOa4oq3BTvU0jPv0vRCPwGHBJBzQWgJhGZxdQuyMGnxL7NKfV7ycG1bVgEAdL+0CED8cSQBwSXDdbLktTbIhxA6tfRq2bu8TNSsX211bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688384; c=relaxed/simple;
	bh=2eXRoLGrutdapHVUIYcYjg3zDaVUJEsXBCFHk1LBPqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYtIq7ibSon5/tC353jWvmUbi3StnpwlhPNt2B5ItcL62QcMQkAinb+izwyBr7jo+SsjP2HmyEJyIk1Busi4sLZwHg09htR9+N8ugDV7zYXmPI+7adrESnDfQWn7S9FPWiOGt5kh64PYGPNLDl4sZ+kZ8SRK4OOmuseb2+8dJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctTVLwM+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctTVLwM+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adb2bb25105so682091266b.0
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750688381; x=1751293181; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4RaWpq0ZKRdLkixVIJe8lYt976+F2RYcsNhNiQu2Tg=;
        b=ctTVLwM+N+mooY8n9pjjwDPgwz7Qziq1eyBc8VW4XkKn6rPZVl+/M6jMS6qegjj6/S
         QZqAS50ZMxCo0yndQpoNE3b6ipgf7Wqx4fjTbz+E9kbNGoxgLSwemvi9o6ViayuPZjxG
         9ySIFQkMK4IlTDCpBHgvDmNkUyoa4OAeGwAiYmJKaUySKCZ/n314L/csGnngqqBpaln1
         HcjU9MRa7PzqOh4ntFkAWF1/og4HEzwmZ/CS8tSt/oZsSnD0zwefIBjedPY5oN95UPUt
         P5W3yYg+2zL+qjR6bIHvZupBNzCIQOgMoZPn126qC/ywupZDKiAX3lPTrwbe48N6Hcth
         5cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688381; x=1751293181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4RaWpq0ZKRdLkixVIJe8lYt976+F2RYcsNhNiQu2Tg=;
        b=XRj7AOfpL4d52BuEnvgAruZLeXh+MLrE8mAopEtnD2U6C8eqzcuu4b8SGtT/mtspGL
         PhOHU+KM8EiL6w9CyMisVRuLhgsYduSKbntwhdEilGiiQ8el38P9zf9TDVt5UoLN/9x9
         USnLKZXJEd+6hWMIyzEjcGj/V8mn4yht8b9rBTyuMrxg4lXXjFg0X72xQGhOUWjVJuUo
         KWLJYVj2qrkX1j6dZL+klC5pqjy+HFAFCjQA5pzkSqtjgmcBJnTc1R5z3KixnFYWQ3b4
         8kV6ASvSCLD+haxC+JO+2ESVX8TkB+scHFyKHJ6Dt2Wrr7udepmeCZ2hao/TGEDOJGRh
         7PwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMa6TZeADm9E0JoVK0TluzxTBfftdTuYlJWOYi2C2BN+woCPko72L7WttXUL6SQpzImJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEs4r6tMr2p4I6BhcZIMh1/ICe7PaiRW8JhztzSl52Wy/02ch7
	F5t3KyP1QDY9ay3vuGjYXOyTJ6UvhNNVrygKb680dE1+E33J+BIGo0rq
X-Gm-Gg: ASbGncu0GN00YPwopeDZkrcY47JvYAnLMzTBZgRZSWb2curJvVqVpXsrt4FvjAUvbYk
	6tLUxryDAiExObQUC729+oeMPGwrm+Ce1zd4VZVH16E3Kb1rnnc17vplgGnpMfl5VkfNHdc2M4Z
	h8XXKDtsFDfvAG4u4cL8s1BiFzYcSkABOo/Hi6uOHlk382LGk3A1wFu01GbESqZrLzftRe1m6b0
	pUWsYSDMRaEVb+ByPJ5ymfiURBc/TmdYxF7VtfFGQl3rRQw4jxwIlnodxdseM5ZKCgoy7BkIZrj
	DbF1/y18Z0BjrzLDdMUxcmMOTip9BwOpXFlphI7zqDDBixDC0/mmKct6DOgt/CcbZUfNSBI=
X-Google-Smtp-Source: AGHT+IFysmPAl7SZsmV9pPCgEFPxil+tuIOlJgMNXwTSQbww7umYOSo53xU6pPPX9Cpuqly+9XmnGQ==
X-Received: by 2002:a17:907:6088:b0:ad2:3fa9:7511 with SMTP id a640c23a62f3a-ae057bb8dcamr1242357766b.41.1750688380845;
        Mon, 23 Jun 2025 07:19:40 -0700 (PDT)
Received: from [192.168.1.150] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054082d0esm719221466b.79.2025.06.23.07.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:19:40 -0700 (PDT)
Message-ID: <0a73b9be-d0d2-448f-91db-209f0d59198c@gmail.com>
Date: Mon, 23 Jun 2025 16:19:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com>
 <aFVz48C3d+HHVHvv@lizhi-Precision-Tower-5810>
 <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
 <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Fabio Estevam wrote:
> On Mon, Jun 23, 2025 at 10:17 AM Goran Radenovic <goran.radni@gmail.com> wrote:
> 
>> I was using git send-email, and I did not notice any problems with
>> dry-run. I have 3 patches and a cover letter. All were marked correctly
>> v3 0/3 - v3 3/3.
>> Everything looks fine here:
>> https://lore.kernel.org/all/20250620122353.150700-1-goran.radni@gmail.com/
>> Or am I missing something completely?
> 
> I only received the patch 3/3 in my Inbox.
> 
> It seems you missed copying everyone on the three patches.

Thank you for the feedback.

I was using the following configuration in my global .gitconfig:

[sendemail "linux"]
     tocmd = "`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nol"
     cccmd = "`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nom"

So I relied on the automatic recipient generation from get_maintainer.pl.
I didn’t explicitly specify the recipient list, assuming the tool would 
correctly assign To/Cc entries per patch. I’ll make sure to double-check 
and manually adjust if necessary next time.

Thanks again for pointing it out.

Best regards,
Goran
