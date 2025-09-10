Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E1311595
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494670; cv=none; b=gSGglytgX2kk3NQCQK/pjg00U8WbMIIPkQNIkQstiyVC1LHQoAIFvKvzo2/33FBek5kmCujDcUWNJryqlzN7ySo/95e8osN+hLQG8fyIiSqR/EuMSAlLjOwNkDi+QeULamQ0lISD++bJzfXuLxknGJ+sMKGUaLz61gDTt1AciYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494670; c=relaxed/simple;
	bh=mUPUv1qyd97znqrQy6Xj6SNJzpr5XsHLjgPM2Gm4KWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BPEfJB5n0SPVbPZSEhJuPc3UdU1I1hq2+kDDUg7fP4wr7yCf+n8HbLoaTJUcB/b+25Y3vEl+RtKOO5vuEedO9wHo+jDG8QjrQ1LKgRF0fajQhnGRaEq/zA6TM/ZtDphakBkZMAS/Jluvngxwdnbkb1vTl5vdgFsp0koOGMQEe/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF6f9aww; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF6f9aww"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7a34fb35so6410588e87.1
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757494666; x=1758099466; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LK2XrNKkgd8rdfWEOo97HFUVmGk3ZSED1YaVjmkZkoA=;
        b=nF6f9aww805sayy+G/q5kgIMvZbzT3ZmSTshfwCLsIsckLNj70HWIL2WqJgmFFFA5k
         vkgWTTiubeBYBulovyeumb3138Q2lAvS0jDLqCSOViFlyalzpVY2SImUa77B0PlmdcA1
         mhEDC8PFVMdX8CX6LYGKziwT/7Ks7CWHOkr4l8M52HsbcRPtVXZ7b+UntIyLdGvBR8Ok
         b8LluxkUVznXq4Yaa9LVmddjPfvpib8wRv8LJLpOqBS7cgTca8Vn4uEwDYkhyb7eYI0u
         mkw4opjhgZZO+LqUVX5Jc6tAqDobXANVivIhv2DkZ+3xPUlu0BagoM6HSG8jYUPWdA+s
         I+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757494666; x=1758099466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LK2XrNKkgd8rdfWEOo97HFUVmGk3ZSED1YaVjmkZkoA=;
        b=vGxcdXUbblHpIqTMtl90tezs3Fwmskad/tz33gHjwDXDCc1DGOZif+HLJJLcfJ5Xbx
         CX2SWJXMFtp83iT15TJ7KDk8eO7ATV50CLWSlByVRDS1uQnGipgtuDsflFqsxqXzeOCY
         hHuNheV5zJ3UU50I6+JkhAgTEVlvN7xNG27ZmpJlcn+4tPi45Vcwu+smG8/u7qBwGX6X
         DZfz+ce0Ff+sag7ABMbKWZ7ZO9Y2gPW40Sz6NyDyq3TFNx9NpVNLC5iYRO45mhOpYiaD
         oFzYB39HMKZNL14ExQc0MVhsEoqAAL1cfWVRGwVK34GHePAwfR0z/RbthsAxUllj6m70
         +vmA==
X-Forwarded-Encrypted: i=1; AJvYcCVsRN4Wpjn8A00y4Qs3oXUxaMRNCb2WYCmZv5kAJFj833jaDoLwhDlz4eMy88nHTdgvOcE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqT9MF+d/qC2KVe0cX+rQfgEivrkTFvzoU7xu+zNzxHd/3HzAp
	twN3W65VRUSzMTNDDCW5WM1kM6QQmrapaH9AtKUSjxlvQhcugUjzEb20isCgVAy3
X-Gm-Gg: ASbGncuO0MG/2Yr9M3OxZCBmmkDnd7eVho2+BaCySX6CiNeYJotj+iaK75uzNKM4NMK
	eaFureyjl4DsmDxvHx9+YajgEQBNplQw6atgOBgTZxDNdZV9aJPsfp7BMtK9vVZ6Uy0X+5DNmjU
	5AXK/m9uyaM/BbFJGf9Hz3I5Kz+hxKwE2Yv00KuaoBlFqlMUFY4sMgQMQnDbfB+AD0ze5RuRPZ2
	B4odaTIYxIeFT/EI7SlRbpfrsCK18Fu3jh71vFdFh3BTsHtsUErupLqCBRmK+70HmaXOwzKTvjv
	a4vGbOQvH02UrThAmuyk2YC+dUNdCqz8yRqdWNqCUZolgDqtA0A6EJRQk+EFdwtRbmlPs/G4BL5
	1CzRaOddaY47L4291va3dBI0yivq044y1PJSJ1b0vIFzPDglIOTSSwYflEOjPU5ss9U5hLAE3ws
	d2IuRx
X-Google-Smtp-Source: AGHT+IFOg+w8CQ1Pyd3vV9OuLbAyp2SxZMbbXebY3T+dS2xnuXxe7RzvBpWw7tcbqOAeggvctjmMGA==
X-Received: by 2002:a05:6512:4017:b0:568:e61e:5c71 with SMTP id 2adb3069b0e04-568e61e5dddmr1844132e87.46.1757494666105;
        Wed, 10 Sep 2025 01:57:46 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cbf2612sm1136121e87.45.2025.09.10.01.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:57:45 -0700 (PDT)
Message-ID: <04dbf985-09c2-4221-b40e-55999641495c@gmail.com>
Date: Wed, 10 Sep 2025 11:57:44 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange PMIC behaviour with rohm bd71847 on Ka-Ro tx8m-1610
 (imx8mm)
To: Maud Spierings <maudspierings@gocontroll.com>, imx@lists.linux.dev,
 LW@KARO-electronics.de
References: <56e7a430-79dc-4598-8e58-809759cf0711@gocontroll.com>
 <f5736f7e-26ec-4a20-8f4d-82d45e719f3a@gmail.com>
 <42b98b9b-5561-4a46-bab8-a5dc60b69669@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <42b98b9b-5561-4a46-bab8-a5dc60b69669@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 11:49, Maud Spierings wrote:
> Hello Matti,
> 
> On 9/10/25 08:25, Matti Vaittinen wrote:
>> On 09/09/2025 18:16, Maud Spierings wrote:

> Again very sorry, a day of patience would've resolved this issue on its 
> own it seems. And many thanks for the help.

No problem! Glad it works for you now.

Yours,
	-- Matti
