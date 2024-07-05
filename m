Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A533225CB
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 05:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158431; cv=none; b=lT3sCqMw0a3C07Lb/o9xVz6C1IKw4tYcwB+jjt4eSCeqyivYnynRB6Wh5v9P7X7M6nrxrKFD3qC3WZP1aeUNJhIxsW9VuMmSHEA2Qs8xIuGbU/9MS8ikkjnfFRLpNUN3NFLzx6nzacfG46sdpJGNlWG/q6XuXXPJ5Bxud9k/kd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158431; c=relaxed/simple;
	bh=dG6ZMs8GKA1J4eYx/XekQpH1Qlq8VEqAMdF2BpfTFZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGQ7eYtF1I3IE0WWZtY0sj6Sz2U4z/UzKkbK/3F0TPbksY03AtHrmxV8DOS0njRYTPypfszYq2Vm7kLK9svZa58c+dun6H0Utsc2hJSEdBH7z3+7yPH8F6E9LAlcJL02t1qlLyieuSlyZoDsg3LKMld6yHI6d+1SsypMQGk4mNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIg0Obs5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIg0Obs5"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so48407e87.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 22:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720158427; x=1720763227; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=krCoQNWgWkCVZVoxoVGgCyGHNoVnIgHcNNfQdbjzvpY=;
        b=BIg0Obs5w+A6M30F1JEIYBgwcyKeyqOl1Y9K+XZDt+L1N7ASAbj5ZLibNILqPEhZ0A
         gi8McHGaOmzeHe1ypGvVKA7NDRs+6FfCwpMOsNGlrUdWNqeFH1k3cG84zrHu7uovGuDQ
         LF69lLquPDbMJllvHR1Ma7Kfdr7j9KCMg5BFeisdydaduo95hOdNfiDk0QNryGcoEh7H
         JS+D3LfV10yPgeIzDZweD5rJuw1YWz4i0GLQuOB4dtgO/oY/mGEnrK2nBMonASuhHbun
         6w4DahMqXTMzJGYCJ/WTJxuYgR9ufOI0zgHirZEK+VpNV4TQFf6dPfmJYNTtrIgiunf5
         XmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158427; x=1720763227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krCoQNWgWkCVZVoxoVGgCyGHNoVnIgHcNNfQdbjzvpY=;
        b=QhhoGJyqEDyP2UUNN9/b5NWwtKB5qckOoFyraxMlClzgLIwbSw031XPLM+r3JWil2L
         Qu7NH/z07JXv4UZ/exkGKoZnFXnH02iKBiMb7sUL/D+X38e2tLRdWofCFTu4pxQvqbur
         idYSI78NSWJR2tKwbcSRGgiH31CWQTW2Di64YbEZ3CqHAduJk+9s+8DiqV/6P3xXU5Y1
         5ZFyPQabouW2OR/+bAu82zx/3jct0r+MKq1IQ+jn4EHp5wFqpODg5bb/aSXEdZ+cCl0J
         hDA0H/STBZXCXD0OJKl0bBXxeso3H/sIxChRhH70mdxKf98R0ou/2Z3RAli89oCVGc7a
         A+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUGcqqfvJgFDpC60YiRAfVQtDErB9ebAQVBOCM1ufMyapa58KN2dcchz+kUe8W391iVxxSCHBgFtxyI0WE5+1l0aStf
X-Gm-Message-State: AOJu0Ywp6UuYaBMGY+EsPltzEel8X9q2S+AIxwomU8k0dSb2jW+IkQ2Y
	0tK/E3jhsyHh3FvSXQ68SGb32Pt+E8exV+dFC8dVoNpWxh1QN93j
X-Google-Smtp-Source: AGHT+IE0GNtMf6UPdNr/wI7vJffg6XXW+NaZoazh2xsk3bgg+N44sIBTRgrRFUK3BkppBbWWLLfcqQ==
X-Received: by 2002:ac2:4e8c:0:b0:52e:9b9f:9377 with SMTP id 2adb3069b0e04-52ea062a94dmr2196831e87.21.1720158426713;
        Thu, 04 Jul 2024 22:47:06 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ea378eaa7sm220262e87.300.2024.07.04.22.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:47:06 -0700 (PDT)
Message-ID: <3a90ebea-e0b1-47d9-8fff-cf75429b2696@gmail.com>
Date: Fri, 5 Jul 2024 08:47:04 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] mfd: rohm-bd71828: Constify read-only regmap
 structs
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-13-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-13-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> The regmap_irq and regmap_irq_chip structs are not modified and can be
> declared as const to move their data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

