Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960792F25F3
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762938310; cv=none; b=I5wk6Kfq2w5z9J5NRrGOgS9aaZLn7L9cEFqTl4igzGHmbIdQre/96uIjn3lM5g3LMGlzExmKFbLQ7EaKN6kzGrdf2X1Wz/rB56T//9IKCpx5Fggi2AtK+/3KyJnJaDxRBt2x718dRe4GzuKU6R4K46QpcC580i3c6m1anxZbdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762938310; c=relaxed/simple;
	bh=UjaEv8WTllVOjp2zrTZ7c9iuJ7T6Yqki2atcrwtghNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AY++C69sNGaNyTK11oGcqDAOoeAUSgdAL4u5aazW4/Z5PcXz5DeqeLDUEjb05cpq5xr2YxbzT2EUWB3L0yIz99UMbUiusM/nqJLgm7t+a7siua3/S5dTjM8s6+zxSDoZ0MvniC1WKwitdWstnTr9IL41sGAHT9lbcNoN9iIi7rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4e7T8hy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4e7T8hy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47721743fd0so2973565e9.2
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938307; x=1763543107; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjaEv8WTllVOjp2zrTZ7c9iuJ7T6Yqki2atcrwtghNk=;
        b=F4e7T8hyNqkE0GMXIjqvQwsDQOrSihIQePg08KYU+EEvauZILW2dbDHcTllDGnzOx3
         RUQowf6hNTu3kboeHmweDXtvd5yTOUWfneKjoT3hoiiW9sPV2OSmWury2KZOhM9RsVn7
         Bm3zgRC1k2p2vBPvkKiyH1U2kaCLLb/slHkDuxPc22LBCaMtGo2i/0XH90kEXN7v1pcB
         wWrXuyYm+b6uq6/cdE2dpYZwvOVb9eNw3Qtmz7MoXPGCqWC+rHBi9/YeDBT+icfsXaDm
         dcqOmiLFQzTuMQBc1TNlTHH0nyDbvMYwjqez8T6bYC5Ru+LZ/eilS8/irVXlFMbYf0/d
         yZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938307; x=1763543107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjaEv8WTllVOjp2zrTZ7c9iuJ7T6Yqki2atcrwtghNk=;
        b=wI+XyXpHv8ZPYYdFDSDdzeZZ9lMSZSezwBqcSX7en6jXova/jiJxnTp1RZnY8QYINa
         dE2ebBHY08qARrcxtHA2+8DWRIitISIWFUH8Zy5rGj9iDkDSg1iXrmOBc8TKRWpLexeQ
         PVaKN+bUYuB/j4lMrwhkETk9whHKecHAJEr/ud6ig+NQDBSwrneF3uHZWu5RuCt42aG4
         XEV4dDs5NM78TGdFiELfk8GY4FZQpQrm7PsLMVzd5lJ/mGI1OPuK7ZkkjeSKsCBlgiqz
         m/pALPFJ30HZFFl6GjG8Aq9id67zA4jKyWolkjKagCkwET47L22tRBDrkmNWul8SS4Ir
         NhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsK0brXJoAXC9wXA9kbGGxsMCMe0VLG4pQT68RX+B8URI3uSZLrjz5PcNvZoSMTP5CnEI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQWYeEgRllX8oZpARfgMn6jbxJ+W6N+4RaMXj1S7ELbLtJqMMO
	jkAGcXw1tGoCTGN41vjr4dZVV3FmFL95dgZ+cRwqOmB7sHrWXakkn86+lm7qQucR5Aaa5XdsRaM
	gKwVmWV0=
X-Gm-Gg: ASbGncuOqmpNoua+7Y63H2yrqa8iu+nLstAMipghou8OR8NzK1tVF70lMyakcA29mr0
	iFBRC1z6alI1uuZiGsfaoqynguCBRetMpgPF/RB6nqCDCLyExS0QYuHDfbqYc6YuqABrt7i0Xhy
	H6CTEN5RdAPnZIMklppX8Gsp3XY+q28akfxPjtfrV/G2WTmn8bO/TuySdXxQSv4qVSMmu1Nf74P
	tYZ3amwmVgXnqzai29+MlRUL+NFxwOJNJW5yjLUPiv/UVdAJo7MycSFdJiXaJ3TUgickSKzKRVb
	oLQsVet5xGL3WvFtxg2hQD7iGRK2HN3Gip74T43d3FmQA0+5PlWZD6RZiu3Dg1zMEMiMtu8fKSt
	sZPcxZ5S1kFkUX/ld3hvV+3BQ3hgi2CPLvveGAsNGzlOfeTHCc+kvllpedKOo0hVaHvLfkJniRx
	v49Bk+FgXCmgAOcGm9
X-Google-Smtp-Source: AGHT+IFaZAuEWTwFLR51iHXsJE+bCjGRqn5WR46Rg3eXCp8SfPQgRrpAHKL6EvATHfPuewRU3oUExw==
X-Received: by 2002:a05:600c:3590:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47787070651mr22036785e9.5.1762938306837;
        Wed, 12 Nov 2025 01:05:06 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63ba87sm33666226f8f.14.2025.11.12.01.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:05:06 -0800 (PST)
Message-ID: <7363d995-f96a-49f6-ab44-3e9581b59617@linaro.org>
Date: Wed, 12 Nov 2025 11:05:05 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mtd: spi-nor: micron-st: use SFDP of mt35xu512aba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-3-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-3-20aaff727c7d@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Wonderful, thanks!

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
