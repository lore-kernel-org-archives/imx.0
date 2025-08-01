Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22301FF61E
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050686; cv=none; b=AJN2aUbafEOZI8wTy4NaQNWj/nO3h392Xdd2HJF/3lFAZOXG+cPPr4lumaMssXQRpAmSEA7lQ3ZeSqEkW7ke5ERwlyLzSCSfL/WKSqv5NqwLWZnRJK961eXuWy0n7ZdlMrsWYtyvQtmpT+Xc8/Lhar+nm1uasuxaK4cqH1B59Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050686; c=relaxed/simple;
	bh=YsZ1llpJlYq+AjYwqeb+mqRwUxkLzdHogXR1ktSXBGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZxjX7OZ7kPITznkdlGqVrMCak0gs/XgVvE5mR+tbB3wmUdFKbP69gHwo3KgcYdfTwZGDLGYUpOkt5Gs7wzKQDgBtq7PLBRVHtk5Abhw+dSTeSEWeOBWXxu8d8TtzIsKcGwZotM5RIiWKUUVwq6ZJfTWxQICIPrPxKNWh1C/6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiXcY4Z7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiXcY4Z7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso21005475e9.2
        for <imx@lists.linux.dev>; Fri, 01 Aug 2025 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754050683; x=1754655483; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsZ1llpJlYq+AjYwqeb+mqRwUxkLzdHogXR1ktSXBGA=;
        b=DiXcY4Z7Nxl48sUrYquTg5YlRh3tkpi11EZ/4zxgbupze6RWGhuSy4JFke169GhNNy
         DlZ1mVQuFc+9U7A2VFtt3fLu75skUX0+cNoO17WwgFYgIMqBdixUrwGqKq+8YY+oTGpm
         a5G+ipbnueUC2pJgCDUwC7zY6HizyODsxQ+NlgIH6Pmo04FLNIaV5NmGDkN6yr7Mv6hg
         sC5tN4k6lsM+NtE2LfDKm8v3Lp5M3vg8nXbblDsOIYIyGIeSy2ZBYgGg+SooLy81ky0z
         U7rgoAxkCrXHq+r0VwU4tlsRws9omUX5UQKgY8NTjYRozf5tFCJUMdNYHHN+EUeTjIPB
         Ikjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754050683; x=1754655483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsZ1llpJlYq+AjYwqeb+mqRwUxkLzdHogXR1ktSXBGA=;
        b=Gu8bfYlXZN4W2+WR99udZ09ozFcquf4H5GNv81/Jsw9/qiq3tSRs54J2FkXLw65LB5
         bdkRhsJgrl8YiCjCA7ChgLleY26+/v+CiJNarJcPSY5xkKhTKgNlKlJfzuqTUHonCdFs
         BB6MXbMNpi+hySj/+m7E2KJH2ReXdy/2WDoMqmGI0sPhHlwP+OqUU9S8+TIiQ/BErqAW
         bVhFLytLjDKMfRLveMQgNgfZf/Ois0kMbqXAuwsobtTt4hPi+9Kn7jim62W8KLDN1Ofo
         +DGtRtwuw7O8DGbeZlEuBD/rLq0Od280vL3q/W0F2JC06unx25QF5/fa31N2p1rrZIq8
         S0pw==
X-Forwarded-Encrypted: i=1; AJvYcCUtx99evbRh0p0ZCPqZm2PPlu8GOEgw9vkR38FT2cxXgEiUD+H9J6rDDrQq6Mcshk0Ae7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+qls65ui8+u3SDt/l4q9O7NYHxFjNr+TATcEVFXSlOQ66+OGr
	7Duk/C4cN8KT76ILsLK7NM6lMjq+uR4/plsPJ22eONs8jaecvx3SjfkT
X-Gm-Gg: ASbGncvVgfkYPQwyW6GBqfyVTqVK8wsUaVDhAxlTt7ReSiLlCH8w/HO+fZRAWFgHKkf
	oQQXcpSqmIuQqzrNUPUEIdw/sKktdklPUEZ2/wHouCcaQyUdfse4jpOOhkf7GnkiNIW4z8eTc3n
	rrYbcBbg1FRek9BrQ+Sf564uJfdDuaAuYGqSIx8ezbZ0SxjhaDQ0dBV1waL9OeXsFE7aUoMspbB
	+x5IME5qak+hno+9E99gSaQxncVw4IL/tTa8eGd/6GeNQwJ+TtxU5ZJ4dhaAE8c/JZVhfmzgoSL
	2+QD1Sw/gzptSe/kzaDkMTu212OCJ7Aogpfg7jC22jf8Z2Cn/0/0WLT/bUuqwpHvpr4MT1csQ9w
	k1dEEk2ivcj7GUY3k8sOCzlxWSmj3Oji0PuBtdOWKjaNG/LPwXw==
X-Google-Smtp-Source: AGHT+IHrJFPu6CRAATEvAklTPqretPHJtlzsftD5zl+L+B6Yf1bmLAz9RezcD7RpfLo+BJQVo8zS1g==
X-Received: by 2002:a05:6000:652:b0:3b7:90df:c53e with SMTP id ffacd0b85a97d-3b79501f11bmr8833925f8f.28.1754050682841;
        Fri, 01 Aug 2025 05:18:02 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458af78fed0sm11896105e9.0.2025.08.01.05.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 05:18:02 -0700 (PDT)
Message-ID: <c39de58f-7fd9-40e3-b48e-b26b9b3ec5ad@gmail.com>
Date: Fri, 1 Aug 2025 15:18:01 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
 <CAOMZO5DfuRKYHkC8e4mNzetY204UdPDBHzUVy4M9pyjKpx401w@mail.gmail.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAOMZO5DfuRKYHkC8e4mNzetY204UdPDBHzUVy4M9pyjKpx401w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/8/2025 4:39 AM, Fabio Estevam wrote:
> On Mon, Jul 7, 2025 at 8:46 PM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
>> is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).
> Shouldn't this be enabled via a select in Kconfig instead?

would've been nice but I'm not sure we have an i.MX8MP SoC-specific config option for that?
or do you have anything particular in your mind?
