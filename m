Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EE91E3DE5
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739980327; cv=none; b=uVxgR5eCUhYNKvmxuUegW5hsXIX1EdGphOtHfrZ491fj5Br4+JEklVQamxt0UiCX+EBrHoRib7RKybM6g5VgoY1V8/YSKXAw51+FmYOdMY0u4SNAAZ+Xqm4Npz53IhD5brUekD4aS+9VwiB3e5TMjdHVYLyBtviiTsqwx6/7vWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739980327; c=relaxed/simple;
	bh=LAnsK6LosCmR3Q5sroUbUdru/UW8IBuyDt8wliL0qcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYvSFW0kGPnEGSyp8TEEJTtoL9r6/u7cdIzU3RC81cIVUy9V1TRzGer/HBuIZYFCvpvgaHfp8mE7XM9BwY121UO40VtU8cqV+0mxda3vU44T5Z4zki8PqEzqbKhVTFNSB4zQ1TXrjCjy7kwDIympFWu3kLFmJfWqDtBB4XzJNaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/uj4pCA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/uj4pCA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220f4dd756eso99586715ad.3
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 07:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739980325; x=1740585125; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ILKPl0SNay3a32+/RRSyxh1SJEExDN/cTqsidRAj8PU=;
        b=X/uj4pCAVknxAVyqCW++lrF3EdOqYgu4WaJUZxUS/MVuEM/klz0AuqI1DIgFLupHAy
         xIi8yX2EYpDalA1/i8UXEap+7lqUbkIaCKh/d4PzwnUgiZce4tpTJvxFLfsd6sLN2eeK
         9KMjZ7jY96n0+EATTbBEJBmXzY5n0rm3zl178tCMm5nZ+55d+0Y8dErNVoUlfVSE7m/m
         Ivne48Itt7OvWdMWwjhEVeCBgzvnWTgKMjIcXe+Ek5J0EDpr+VJaA0LUynX0vTN+nZwI
         l29swdTqL+ajbksBWjmO+z1RjhAyXfsQ/vRqMYUfWdJvU8q4DuL7bithOHDdE9/zefnV
         fUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980325; x=1740585125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILKPl0SNay3a32+/RRSyxh1SJEExDN/cTqsidRAj8PU=;
        b=sC2+PSQxu8DIciC3Kpk94irvxeaIkANSUFj9D5uOvtZe49Un5uuj5GY6/LQuhU/YEq
         m+XRMqrNqav5g1v8CbjhJw2OlGCerHjD9VukBKyxqAy/PFcUbBiWY3t+PbyPEO9CvRBN
         k4Av1fAkqPYLa73U18A9KQCVedQdPvYL8VWwBaYCYRzCpCq/IebbfApCH5Cvtm+DfP8z
         RILu6l7/8ULvXxoudArjQ7cz6FjpYwiIEh4TR1CIIm0euRwByGvPFW0lgVky35YkRcmY
         XWv59+o5Dx7l1X1O2yc2QLPlo7dPgasC/7XT3l8pHtrEYzpIqbBahDoxeuqp1pn9M75i
         T7rw==
X-Forwarded-Encrypted: i=1; AJvYcCUHlPO/zeGE7krVMUUeZxl8FW4nsza9IK8ifczOZBJmGCONsTpL2ZPxWnUZRQh4iO4qFu0=@lists.linux.dev
X-Gm-Message-State: AOJu0YztAaPpisAuqwHaaUYkyGalp450YluVf+Su/A5BTQ7uhR0lpz7u
	5eHkbUwslmW2JEwnn5bEoeJeDJkyS1OC+HqI4tqH2CURQ3qcJbmN
X-Gm-Gg: ASbGncvCfJPZB2S4PPCkEKKPyFOmwuMw7cLNPjtCVHfJ0vGz9jawRMqFmlfJVHr45Je
	8vU2aKLldMtktZkchbgc9R+h6HinTXLsKiF6IrcJQ+X1zv11xkGQ+RuboBlpU+oC6VRDxE0XzmN
	o424JOzRZvRTlgHuwiehQlw0saqpkn0zyzT7bDPeiuzdYtJnu/WofMLwsfItCbRYNS2Wbnay5F9
	IzUYagdLfp0u1U4BVk/O8pMFcnOtwbk5zwpZWLMTk5hNCg0vF9AlRug8+yuE2O7yVOnwLUkmco8
	KObJXPPvQ+caX2GIU2mjhlu6FDEezpa9UcAqaAa1U+uz3zj2QhP7pLq873HjaFnO
X-Google-Smtp-Source: AGHT+IGW8+CBVhv4LqCaNkiqyMeXKPeQs7b+MCMYUpO6R3KWdsi8G6YGkHjrQBMgwy6+AQ9im63ntQ==
X-Received: by 2002:a05:6a21:789b:b0:1ee:d2d9:351f with SMTP id adf61e73a8af0-1eed2d93688mr7526340637.42.1739980324740;
        Wed, 19 Feb 2025 07:52:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5dee4sm11119348a12.14.2025.02.19.07.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 07:52:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ae40d143-a5ca-4a38-844f-ca58a06834a5@roeck-us.net>
Date: Wed, 19 Feb 2025 07:52:01 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: emc2305: Add YAML binding
 documentation for emc2305 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, florin.leotescu@oss.nxp.com,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com, carlos.song@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Florin Leotescu <florin.leotescu@nxp.com>
References: <20250219133221.2641041-1-florin.leotescu@oss.nxp.com>
 <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
 <fd70f78c-68a5-43ec-9eb2-3f06c5d7a20d@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fd70f78c-68a5-43ec-9eb2-3f06c5d7a20d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/25 06:01, Krzysztof Kozlowski wrote:
[ ... ]

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - hwmon,emc2301
>> +      - hwmon,emc2302
>> +      - hwmon,emc2303
>> +      - hwmon,emc2305
> 
> Nope.
> 
> Was it ever internally reviewed?
> 
No. I intentionally do not review bindings because I notoriously get it wrong,
and instead rely on DT maintainers.

I agree though that this one is really bad :-(.

Guenter

