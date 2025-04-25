Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21386253359
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585484; cv=none; b=jJJX3MerN0pNfN7HUfD/PF3/UjpT+4r1J5wBmnqrxnWzbHw2LpQEiywdDYoG5RjzYKJhHgYQVS8J9M/qYsrYOwBsWwYLD/0+MhlMC/BC3mp9hrB5T+FiDkCS0Pry+9cyNboztGSFQ3un68p2uYpVl93PsAOktqIOboNGss39d5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585484; c=relaxed/simple;
	bh=sFXXf+y+6Ey0Xg9tWmjOGnjmj6z3lHSKH3Yiq/V7Cu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtOoqith6Sg8YFr1vJKpn2CSuMJD083GpCACwZvmFdvul4Dhp45Tah3kqhD4j4B2YdGX9my/Q8YboGyBqps7DoyKV+7RJz7FPJYaUjR5seD3UduLzweEVOpOwE5mHo7RaPl8ZoS4Y9Vs+8OSkuA63fK+cao/pSSnxI6D+Q9Rr+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSgnRGhU; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSgnRGhU"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acbb48bad09so399637766b.0
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585481; x=1746190281; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48Ovo6gaBm087AHnERQ6MpFZf89kygeClsZJ5ggJTEI=;
        b=dSgnRGhUZ6+rU6knYX3b9zPLbRoX+c5MmF217C/h6dBtgI6pOpC+0aylQeXsQiSiVb
         S4j+MK30lZ3ECGC5XruN7KI4X0N8Y27kGctiYCKGHRIGsX+t3lqv0xVjJgMkuJc1GSoy
         4IVwNmpecZ72tGFPWHmSzW3HwavSV/+FtEZV3FXjitntzNnllYJ18YopJ59HyScomB/e
         +o+KVi8JYy/8f4D+xZXefEQQE+hgk64YCGxKRy9na+7ca+WO8C6TMk7j6W1lc3SoCzz9
         A4Qsjwwr+yFb+PotVzdYTw5lsaC1ceEYaRDWrTto/JirTvkU7Ok2XieMyf3zTEVEKRX+
         BU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585481; x=1746190281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48Ovo6gaBm087AHnERQ6MpFZf89kygeClsZJ5ggJTEI=;
        b=M+NeeFci35l4iv/HS2ayX11p6sq1F1hIxKu0D9EHeimrX2MbARf8B6yZC9Vaz3BslH
         G2auE1wadbm4JW9CRDMmBIPPDW97ES1O6fwZ9BBpYgWXlHB9hMjq14wYsQzUSAc7Y9wu
         tv4o8kd7JF4f3HH1AMODeS0qpSZPzil1yvZ/jTNK6LW2ww/vRml5jj8jmIW8FUdAs7c2
         pA+HETW9C4V8OhFg5QxB2Wlz8U3Hww6LlZjEFrlHv4oETyw59qkf2MO1V2xvJI9/Huc8
         c1mvrkQ7baOtURv1aQhqgNa1pq5OaLWk3EPddhlzca8nSzVx2+kFr0/Nff9532bUB28c
         /TvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3PGLnOaVz22H9oN6OkTCL+3aYiZ/pzO16PUzhnyoOnv6FfD6kSLsXlFSvz03HKPEefHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzssKRAg6rZwwLPyNWDRACHjZEXXH1+JTUScqaM3pjGw0dnvUcM
	bOacS6MHVtEx2EXFEF6dJHn77KlxsTvVMBrhSZOKr6Fm5ks/cGym
X-Gm-Gg: ASbGncvwMjO5CbyUk3DCpuTNvyFC24ZC6h0mlAlXoslyMnX7Wg5zARbE01rawgaSysq
	2Unc5e9kjK/A4BrvMUh0UOs6AxGW8umhVw34V6MIuxx8r2PDvfxdTAqMcE4GLy5urqo4qJowfxd
	T9BmbEFEv15P2gqWG8OnTNqJD6LjnlTCnwnE71SYm2zZ4YGkMcSSaossEZjvuoV32FDw1yk7dcN
	+oUm7ysFcgzeWb7B6b9r6DiZXMo8ouyvvg4FLhIkbjViyQWvQCeiBhDTyWsCHCRP3UzehCOF8m0
	7gbwwo2cSyWE6OpdVaPJlJw5FeIIpmjaqPDGBL/JTi2ZgHwqkrs5LKs=
X-Google-Smtp-Source: AGHT+IEHCHR6MYIQ/h6kJu40DmCfLvHuVDDSvC4wnftT5KG59v5Z95H2gQ4clO0PJ34esem4CaUoFA==
X-Received: by 2002:a17:906:eecb:b0:aca:c7c6:b218 with SMTP id a640c23a62f3a-ace7103b316mr200167466b.1.1745585481087;
        Fri, 25 Apr 2025 05:51:21 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6edb1e60sm130717166b.183.2025.04.25.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:51:20 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:50:37 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm: add system controller watchdog
 support
Message-ID: <aAuFHSqrBrQWU6ek@graute-macos>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>

On 07/04/25, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
