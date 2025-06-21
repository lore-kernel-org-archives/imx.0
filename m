Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8B199BC
	for <imx@lists.linux.dev>; Sat, 21 Jun 2025 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750525692; cv=none; b=dHlopjuxD0bHhBtO2uCzMZ0Ga1w89CLkEkyaDH7ojRL//7N8plmLZAfnOtpJj4yqIYjgq1+EapKSIIe0HVdSnbpXfhq7tQ7K/yXMC84d5qLA3lL5/0x2uDbPxQBYNdnipLDoYcdNmgwsrJffrdxdUw+HxdUqu9dVH8DnCuTigFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750525692; c=relaxed/simple;
	bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8EAb6L8FzlvaSM1mPk4w5xhUoWRJj0KmTgI6ZaGI4ZWLK8xsOO9inO4KePPikuy7/dJtc4l1Q/zUV1guNAha4i+seub5ZsDY8M6KknOU+XvAYeqjhz/jpmJR3QK7CUDBvXgNEb97ERN1mFN/yd/vU41w+lzPI/pPBxehEB1t3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHwobWev; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHwobWev"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3278794e87.1
        for <imx@lists.linux.dev>; Sat, 21 Jun 2025 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750525688; x=1751130488; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
        b=aHwobWevX1KLklLmm7zbtLyiLX7EcxqHa7XRFuS+3lilAmBRmx3TNCcxs0RnyXOXrX
         PEJjlRH6LVN9A389hZjWinUuO93PMenHlEKkfgt7gfuUCuZTWBHmIFxmVUnxTRmNQ1nN
         /7cJL0JqnNIUzPhPIQJjYRwUyTzh7NFjA/LggFyP6KStZH0WxGHxT0FmEOq3pgy5UWXF
         iGzMhur3ayslB344ElkGUkqE8+58/4ZZnyDWjmh9q5M99AM1uNfSC30b/Rq95e0PKCYM
         frWiau2KmHIK8DVZXahSAbabGDQpdz5bZ8BDojoZ6pgOuKJ7Mom+B9nt4lPbdGYJT/+c
         ht7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750525688; x=1751130488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
        b=UHvxtAO8UZAI5Y1vhOXoKnbjuFOYqKD2byNosXuMIgwpLbgIFde6cjsCMfXDTW9gOV
         2W+PI1UgIG7GDFzInXQQL2zL3WN1Xjubg0vqxGhSYLAxUh9/1mQxvGxaw4ZM2BOdjsxz
         NqWba7mC/cx6EqoTJH1wx369d3Y1D4Z+OAcnluv4Yf28c0nRzZxMU+jKjUvjCp4zju98
         2vCFdZdD24pFEQDY7kaLdHFduceX1Jw4cy1H9uePPt1JRsttOOGIMp2WZEe1mpxe/sY/
         mGigLpteNQWGVKhci5CB/EucQVqvXzuEkmgelR/uPhkItzNLZZDfSojYfp2HzsEKVcMY
         XmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdIz9+vy+uMM8b3toSkFeuV23JWoDy9ni1aZtaLYFXDd/PJ3lbkHpVuN00RHMmox7QE6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZtmBuM1vTnI0Nhs/7JuBf53ThEwFPtoytphKlKi4acKN9lSWn
	3EDDfUczzXn+owyZ8yq80+9fOt0uLNB5f7aJfHUgdsEMkDEWC8SnnpwHgfCukyVQDEZ7/j6fa8a
	tY/AXLkJ9NegrE6t+054y6DmxDBcZ/JPkSg==
X-Gm-Gg: ASbGnctsg4s+pFNeKLPPZ56xDT2WZtfK2/ol4M6JDSQ6u5ctwFT75lnJl3yaN5HK64B
	p1OvY85M7q7bEBq2zeYpEZGXZXikJZNyAJ1niO8/HK6Z7HfEFRTGzF0Zltszlw/ko+CEJLa6UV0
	f5bD76/A7E+jXOcGekBv8QfxKF7PnAY+Se697JCjFgoQ+1nF1TNeYuZd5IZ38XWqpeiPxNunZgw
	Ic=
X-Google-Smtp-Source: AGHT+IE9XukBFnfqYPGxv15LwD4aFI78caQyw/4Eu8EFUxN/5Av0fimYLTnJIM5a8dCDg+V1FF7pxxWduBGUw5Lpv/Y=
X-Received: by 2002:a05:6512:4014:b0:553:acf9:c430 with SMTP id
 2adb3069b0e04-553e3ba865emr2715526e87.17.1750525687553; Sat, 21 Jun 2025
 10:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250621112311.68101-1-aford173@gmail.com>
In-Reply-To: <20250621112311.68101-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Jun 2025 14:07:56 -0300
X-Gm-Features: AX0GCFsyZkLAi_IdniUJd_5FXJgXSkkE5eshqUFluI-nTmyTXyPV2FSCarf00P8
Message-ID: <CAOMZO5DUVVBmxfrJPjcZPCQGFg-rVNTUch6APWfSKF6LY1DWHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm: Configure DMA on UART2
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 8:23=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recomended to not use the DMA on the

Typo: recommended


> console. Beacause, the driver checks to see if the UART is used for

Typo: Because

> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.

The same comment applies to the other patch.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
