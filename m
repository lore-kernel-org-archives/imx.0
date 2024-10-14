Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8241514FB
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894557; cv=none; b=fupKKVjQkwTK5+e4a4C09HKkvEBO4kXhr8xM9ymtzjV2PSfyTMMc/mWcv7XlpCrImSoznv9BlvhFR/iqLwbyiQKLA827njv0l/K8Ekdx4MGYW13a0gsIMijAE+s/NVZGuYhMR5D+H02Mdjegifb1xZ9D1zyx8BQR8xSo1v2oQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894557; c=relaxed/simple;
	bh=vcsyM6w5SlFGcrqYwvPSlCYxhrylpBGSgkSppQKyoMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LM2AqkF/R4KF63HDxqbzcVkJ0d0BTlO8cuTWydkYEU3kpZ96wxziJbdwFDHU1OUfT4bSlP1dF7AwL/zn/nBjtjiTM0A94ZEYf4FpYg0KssxKOah4sfEKIxb97uxcuETN7IxpQ8M8R+IQxOh+qOshFizjiVzP7th5Fo5rx5B5vwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVKbDhca; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVKbDhca"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so5155851a12.0
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728894554; x=1729499354; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d91S4I2UZXSrPkvBmzWLzGhfndrc3g6nHTmmorzhjG0=;
        b=TVKbDhcatRYbzPBD9sAkvLy9WRw4khaJu8ldWCESdHPN1VmFMz0RCSKKU9Tye6T9ho
         FuF6robu80I7OYyPR52Sho42tP+8BGh3cxIQM43946/nkvhzVL2G7Umg7lgBBlMN6SSS
         55ko1nMvmz/pusJdGdjIZLeenVMMCBgrypB7oZGZ0Bys3epwb3WWKONo34B0G+gj6l5n
         YMCtUjQlClbh+DHXsT8Lw47pRqEkexEs8B6j2yeErBiKGd/wz2NZO1VvFlQdc23t60cU
         hqqemqRlv9cOlflEYU7ArYOu+FFtpDZ69AWqXorgBT2vpxR7U/9V1HkFHAlYfN3omqWw
         h+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894554; x=1729499354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d91S4I2UZXSrPkvBmzWLzGhfndrc3g6nHTmmorzhjG0=;
        b=cJu3JhVJEA8CsEw7cCh6A470R1tmdg32EvbYVq/zXmUI4cn4x6269onh4/pHA0ULz/
         jQWrITZhKSxKZio9IXWVocZOfagOGfFbn2GQe3D3U3UC+3ifO+xe2X4sssTJE7xc/mFy
         ASDHGh7m/ommkQK3nawuvfKEpXjTKkUuK5K760nNPY2vb0TR4ju5lwLKbANUqHTT0VOP
         pmNYtXuQoNsQ62tX2Ilf/5egp8VvplkO60WPKusxobn8zYPLSYvJNUevTh5+OqZvatvr
         DSG7+OThD8tU0JDJ4M6HzqTnh0acJKr1OWkrI37Zi47AiunapYch19oJpEg/0CAHZfpz
         wGzw==
X-Forwarded-Encrypted: i=1; AJvYcCW77i6t5kRDyoHtLq2IdtTmKixwenFfDpTAQ6aSiOIMdvFs13vQN1tSBRVHQFziBcJiLMk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBLFkR50Zzy5faW52Lo3QAlTwY/WFb7j0eGR3FM3QObzAs3WrQ
	9H1OrfMD0BeY8AqfOOPLF6mQul1Qq6SmvlmnKFgpxD0JPT6Y/ERMo5KYD+j52c4=
X-Google-Smtp-Source: AGHT+IF6RwCW+FyEK3/Fal9ivHW7iWGPlCDb/O1Fkx9nd90PKRCkEMCBSO4PJJepAjsrqveEArsROw==
X-Received: by 2002:a05:6402:1e8b:b0:5c8:79fa:2e4f with SMTP id 4fb4d7f45d1cf-5c948d764e2mr7389203a12.32.1728894554097;
        Mon, 14 Oct 2024 01:29:14 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153032sm4707474a12.53.2024.10.14.01.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:29:13 -0700 (PDT)
Message-ID: <ca48de1b-b45e-4b27-a186-3bb7eb5859fa@linaro.org>
Date: Mon, 14 Oct 2024 09:29:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
 <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 08:43, Krzysztof Kozlowski wrote:
>> -  - assigned-clocks
>> -  - assigned-clock-rates
> That's not extraneous, but has a meaning that without assigned-clocks
> this device or driver will not operate.
> 
> File should rather stay as is.

Hmm, I've obviously missed a trick here.

I'll check it out.

---
bod
