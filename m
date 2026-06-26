Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CB3E559B
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462640; cv=none; b=kcwHr0kMOooeCIHHsHvBq3zIuKb2BhyrqEI/ZC0dOBF95zVCGhKOtY+jphp2jXI1Wiv5nvldZ3pvyREQAwJKLSN5Bu7QvedT2eyuxnRqi00dbdfXHkC5UYeryzHV8+US7hbu1LW8MX9CWOm/ii03dCx7/IpT6rIxUpuH0oT04Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462640; c=relaxed/simple;
	bh=g7QugsTJVRYqI5KzYuo8WC1k67mQy/4ShxoER+MIinM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iR+otmwXpmMFh/jvhrTGe5clMMtmpoxYJXW9PzspPpUbEEahHqoOvRTSIZuYUWniSA0NffnKqRSDrOVOVJovLIJhdWRjkhCVrnTPMRExivt88PL/AxIkW4MasvkH5G/6Uqiej+t5FO0R9ImXPJ5swKd3foy0wQClmWwuq01tSe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRaROUho; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRaROUho"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845385adf4cso272400b3a.0
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462638; x=1783067438; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7QugsTJVRYqI5KzYuo8WC1k67mQy/4ShxoER+MIinM=;
        b=BRaROUhox8HGQjPIGOkq/AWV2Mux7+dBTJZc0mhr7KkxxTQVZoozHASogwRJ4exr6j
         282o2QkdjemtNAFzdSLx0nBAZQ0CM3Us9fCfgQsfNN76ciAnYR76SkrSFuUTx161dGT1
         htkEbCw14jDh9eyeYswrbCYllF2secvCqpW5dPu45/5pX/J9Mt+xs6msepc6pQHVzYZF
         Sk7WFbvFXZf3PIKFghgmlEBcFYqN/wFyLwLLZYCqW4h/fa6yGs6Gt6Qsi2jBAju2Z4p3
         Ba+YlltRmwvIY/aMX3UU20EfKnecyMYqG7SqGlL7Pu60kx8EVZqO+8Way9NRVx1BspAp
         mT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462638; x=1783067438;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7QugsTJVRYqI5KzYuo8WC1k67mQy/4ShxoER+MIinM=;
        b=o2udwe4NMHnskH5uPQp65SFwln98NhSNte2P2KuDHO6RnbRF/bnK2GDo6RUFFCsQNT
         XKNXa8sub6Gmdb0XMp/4T//JUO8vPfj8ioo95BjpBEXejRlnzZSZYtiZXa7+6ASoT9lR
         GQnZBqvgzHb9I/0tIaxRRBX2Vw/2nX8TDZO+Ui2GO7CILHzfDsB6VD75YlZcY8mAQjWN
         9M0nYCMBoGgwcFvTBRqixWar8D4qfKB39rkIzEOeCf0J2BQOkpGaywzN/LjRn58sUPsX
         Pnsu+N4pMAf9SE48v4qEV3UqR6ZRqzD34fn/305CMhl+Cx9K+KPYeQcMz9tTaHFlDqVc
         nF0A==
X-Forwarded-Encrypted: i=1; AFNElJ8i2Gtw8cQSD9JfQKpj92D3CXaDQne/cY+rvL5YM1l4iz/HTauq1M4sORnt5vE1lJDHsgg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWjlPAkUol3yIKdz0ZoKdZ9OhZbxtGDznEHwdkLFuABkrZQHVR
	uPDGhRQGoelBxixlNXGBpCwEXv7KQ0t7DBJSO4um9HjeTxncsD2duEh7
X-Gm-Gg: AfdE7cn4bwirf9tOlEyDIPq/jNx8EadUflsEhTONGwl9XnyvOyXgWZsEzY8+a7thNf4
	qalCuH0QCzCMADLNU5xBkJMEJ43uapOwvqykQvPtu0Dh9dwzlAwY3xZdeWcIPkCe/c+B+da36bi
	ZhrIRMSYGbY2976vRXzrcOE8UZq1YZysveBJYqdJt9Mw6LNAGWW0zPzZiID9gfpKL+/BQk8uCB0
	EixAlyagwX7UVH3mC4Q6nK9KgfNotN1egALZdYe2jsVvwcxWMxuM3K1mfPutzqgqCgfLJCQskGd
	ZdwPa2HVoMDEjMZ//t4lmwyMz+AfNAcZYVypsVtGic7UX78s6AC0gZwEBPCFGHjPiiXx5H+m98J
	0ti6ae5i60bLjXyELNsPpVwY0UOcojanR0ObWp9CXjx+V6jHYWLj2s2t+UihYSDee73VA6fyppf
	nsBAX72qJbunmPfA==
X-Received: by 2002:a05:6a00:804:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-845b382ec89mr7443975b3a.0.1782462638151;
        Fri, 26 Jun 2026 01:30:38 -0700 (PDT)
Received: from [10.31.13.168] ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c104113esm1660225b3a.57.2026.06.26.01.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:30:37 -0700 (PDT)
Message-ID: <c21cd9dc-9bbf-49dd-9812-4db0733b0636@gmail.com>
Date: Fri, 26 Jun 2026 16:30:26 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: carlos.song@oss.nxp.com
Cc: andi.shyti@kernel.org, biwen.li@nxp.com, festevam@gmail.com,
 frank.li@nxp.com, frank.li@oss.nxp.com, imx@lists.linux.dev,
 kernel@pengutronix.de, liem16213@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 s.hauer@pengutronix.de, stable@vger.kernel.org, wsa@kernel.org
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Subject: RE: [PATCH v3 1/2] i2c: imx: Clear slave pointer on registration
 error
Content-Language: en-US
From: liem <liem16213@gmail.com>
In-Reply-To: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, carlos!

Thanks for the review.
This is a good idea; this is a better way to fix it.
I'll fix Patch 1 as suggested and send a v4.

Regards,

Liem
