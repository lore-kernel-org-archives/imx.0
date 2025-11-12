Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A52F9980
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762938119; cv=none; b=ZxWq17BCIVWl0pItVDnntjg6QTOeMY3TbAQJgcaW0s2ZVjiPGItf0NK+YVNxJrn24lv82FxmBZjPw5/RjggMQfFpviULZz4p3QBbqfjhhuF2mD9OONj1j1G57+GNVT3v5nr6zknTIFg4M5oT53h8+P++Xrd1T8eZM4+SVSnroRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762938119; c=relaxed/simple;
	bh=5zFi3prT/tb4/ZOKQXyzm6NJkVjt+9gP5ezapBHafdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRkLQR5RLuxryXWoPzSPGzV2RyvBDh7udNJAfzWBqVO3ZCfUUv/+IO/Nmlz0D/GY558DJrAPy2hm9teFR75h/Q/4EIv+el5PI8/yfj2NWqxn1QrAQE5NnXeMEWVjALBXRk8y8TMm28uWLN4ftXLOFddmmmwE+KhIRWK1oir/mow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EkyQ9wTC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EkyQ9wTC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477632d9326so3617035e9.1
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938115; x=1763542915; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66JkoVBXRt3KXq4mIKfXgWIsRIseUDoE8lmCrVzLyy4=;
        b=EkyQ9wTCGWdGANr3jf4KvAY2YpTKyM9MN+EPWr3vCV7Po+QfzqXpg6EfNGS6fSO40O
         9MEobkv8wfGN8GN4NXOtt9UHpK+2AD2f1+v/A59rB5uTiSlFSWLdVqywFCMvgC4/60Wf
         6vJY5d61oFLQyHz6YtN/exaAPyHVFVyTnLgILt+6tZh8C4ItHgyE1zYQJZ5aWHVoeOwC
         AwFCvnXjsUCFyrLp6JkXqrGMriDNcwJLrWnZ7Ts/a3Pqp7Fd0a30mCsjcq/k70HsCu1X
         npP9KWRVdG0/n6WyKua87ob1LYNJlUl1J6ecOXhcny9KsXnET4lFU0vw+TAbiOy0ZalO
         wC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938115; x=1763542915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66JkoVBXRt3KXq4mIKfXgWIsRIseUDoE8lmCrVzLyy4=;
        b=ko2ruRMpOjVgDoUHnchyim21feFBQMIN9X4INCU/VE5bQABXnh+bPsgOkgpB9YHLod
         CMCdExrOQA6arijRVJNVWR+cgetyMyGiDevrTHikxHb178SwkIPWlp84///q7yDPIoHG
         eUsZIna/zgA2hXUkNb/BU/CnRWTUGW13iw6fL1lZNfbz8VmkECFto/StXzwQGlbg9Cnh
         2/FVLkRfeSH/RfXPjwuEzhZc0ZXs2hu1+ySKR/i3MoBQS/j1Dj//+62XYBnIjeHseUa+
         fmPkksoH20j9/cF4A2g/ZQmTw7LfSneiK1UjACNuBg2UqkiU9LbDk5+buvYJ8bYco437
         Yn6w==
X-Forwarded-Encrypted: i=1; AJvYcCX2+Fs2uvE40uHnchpjD3TUc3X6aeavqeNqdyan3BsokDZ8JhiLHOzDONfKniP3cVXQOzI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlpDrr8VMabjH7ecNCaPl2veRoq2jsLL4Bb90ewEEcVXtojCu+
	MH0VvSkTKaER9RwxgXxVIO0kicYofHvrQbIEDzq5zXrgBA6/8XXxuLHg+19zcSuboAs=
X-Gm-Gg: ASbGncujqfRBKrEdB1iHxTf3Zs6SI77kBMWfuhznpdAvQLS16a+uQ15gUQ6bBQmcPZl
	RqnvrUDlbNKKifR4riQL5N42veHg6FjjBshv6rYBvKMLlur29Cdr25HrQgdoZKdMpwxGRZ3ufkR
	Hp84Rbxck0MHfBP5c8PiOewZeiphomCvElmQbiuR7dIac0mbzkiuSs6vddtN+G7L2SwtbEGp6To
	MVB4OadTfO3uQ48tGJyExkxC3ZfQxOhdBpshKcNdNjoLi4OmZhIFWmZv1+tEQP7TxZaKgjdqGUI
	zlYhq4wn8eTQzoGkhSgs0xunExJXtkU8Hv1Rqee5UD6EHE30jmMwnGJP6A5xbK663GVIUDXn//Y
	7xMDMouuLoY45/TTYhiFClgBRVY2u36k1U4SZa7oyzn5GSR4tRylFm4Gu0gmjPtASn7UlMHXuAy
	tvW97n+g==
X-Google-Smtp-Source: AGHT+IEl9hg1Kv37coDTdY5hfywj5TzhKzDMoQuXuH/tP7xQz/4t5TIbX/bOlblMbh1MgqEKT4WInw==
X-Received: by 2002:a05:600c:35ca:b0:477:7d94:9d05 with SMTP id 5b1f17b1804b1-477870b4610mr22199385e9.35.1762938115446;
        Wed, 12 Nov 2025 01:01:55 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e442c2sm25971505e9.7.2025.11.12.01.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:01:55 -0800 (PST)
Message-ID: <60625b83-aef6-442b-8b38-558c3751c4a6@linaro.org>
Date: Wed, 12 Nov 2025 11:01:53 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: micron-st: move set_octal_dtr to
 late_init()
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-2-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-2-20aaff727c7d@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/25 8:48 AM, Haibo Chen wrote:
> Move params->set_octal_dtr from flash_info->fixups->default_init()
> to spi_nor_manufacturer-> fixups-> late_init(), this can cover
> all Micorn and ST chips without repeat in each chip's flash_info.
> 
> With this, we can also remove flash_info->size if chip has SFDP.

you could remove flash_info->size when chip has SFDP even before
your patch, as params->size is first initialized with
flash_info->size and then overwritten with the flash size read
from SFDP.

So this comment is misleading and has to be dropped. With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
