Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240A9325729
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538444; cv=pass; b=ujdBUJ8x8gmwWm7NZvZOO7Jt9YxASEvWMf9FY0uIc39oFbl0qHCRE2mumqQZMaCMYx0DnffyicGwOzCllZpuuSh+yx41cn+4iM+KEWSWl7oy0BFH6edHQFkdO1OmVtlFFZ8jo0QfmJPoZj2fdNplwGFyzkwyotPEesLDNwtHI/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538444; c=relaxed/simple;
	bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPclQGyZVadK3MCM4qvwm4M0z+DgZtIp++BOSyQS0TlKkCTz5+F4iYhSePXXdPRjJgGL1LEhlq3YDEdlVY9Q18Pvo9N4Hn+qPXxsvRAxFP4XS0HtGkk93iBMXTFIqx1fS0tR/0vCQNFGjgkJEFGomP4VQbiW3Tbhwdz6NewV740=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyZTlwG6; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyZTlwG6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59de8155501so4578189e87.3
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 10:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769538441; cv=none;
        d=google.com; s=arc-20240605;
        b=GiVr941+YptL++kXc7eP+AQdnRGh6Ind8lTPiq+ceVc5JzcivOK62eJ19U1gyH2yJr
         t0/OlSpTpLaDc7q99vpSjQXxbYWbtUqfusx1CEHzUdEtBxkPcUOBRamk5DWhDqCmGOGg
         gorM3IMv1HAqHXZxeS6O4jMJAWGgBCH4ONH9ndXNLVFxr9FX+hzYLrIKaxW7P8pT+0Rc
         XBpStCaHJ6MoqZDYgtih0JDFYrnb2RbB/qM4N1WnbZsC1mmlj5ZJvHCNtfjmfdsA8WcD
         28WrFEcZene2QadjSYmJDxKvgBIF9e956/Coq+jThOMTrXGPwb5aN22AmxFzGHrfneqT
         lL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=;
        fh=tLM8EV/kDVl+jbtV3ZShBmItnYhLeQb0eZ0SRBx+o8g=;
        b=JbpJNOupUwTxM/LkQKE1tZqvnoIn9qOrT1D/f1QgMbZ8lOFynUYE91SeMG98lAAd1V
         cOjGflq/boZbXZWST2dE2ujFd+W2Mwl42YiBa7NKxuz79Ht/sbKLCTQDpwXhB/B0pHJi
         J3JQuzym4pbzvN8ZyHTvRK6G4JVg8cJEGgnEDsMSjWQDTc29gtIgvMsummT/8ZbMyBDi
         S5uhNCM8W6B44Uw09VS6nEERClY/PtEQdnUdhIzKby6LHzT3/p/rUa4/2e7rHLyu/2as
         qV2sSWqbZsi9nwhPSY6N/M5K7eOTSsDIXYS9sDMr+YyeYqzTvm2t5yG+yEwX3kiKVtq4
         bHVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769538441; x=1770143241; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=;
        b=fyZTlwG64cgriafiW7GSpeyhAfutr4ZWGYSeySRWQZWAy8t63WGCTZPJTAC7dozrwr
         Gup7r9KveUApltG9hADAYo0qrNq0KtA8TrzDaCe6y77oPEbFM1oe1yYvQv73rcrtTJ9d
         Ojlh6CryDU6TNhv8WO8e4D7eGIqaAdoodd/3xwjLDNY3u4zCGU5zQ0Ie+x1H3qjI9seY
         yRBep+v5L4mxpKtRaIv4ar32QruVdAILqI3OXMY4EhROjBRR27NFqb2WaNArL54YLcpx
         agdVP9N0tAWkd2j9/RUQiE3kdfjjF/Mn5GPOLk5n8/BIfYEH8PNl7qPL+cV9ZAfFOczU
         wypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538441; x=1770143241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z4CGyKcCnMa/ZHAIbj4nSTz1dbC/e5JXE8bFaVOZ6yE=;
        b=rGqNQuyTs7ymwUyGH4fb3GpT+Sc3B2Y2JcQkXgbGaf3oRafq9RF3LZFMIMkSG5rmqM
         1mkN+n3cXSRCgv0qkLSbCmKg7OB315+zF40Tii/P4Ozd/LC1aXBwicc1Yl6nSWUFd7tx
         gMJnJabRxy3I47crBTK5JW1Jt3lZg9NSTG5bY8I0sDt2zE09Qz63VajD2GPmKLu2j5vO
         oSTRihAJYq3pu/LXfml/Ehl/kF+cxZbkWSUaB6QcanatPIpPZqXIe8kGKoMEv8t1/EV4
         jNLLgs0KgfbwFr9fLzwyGGdoJswDp9gD3dB1QxW46Wx3Y1zA8j9IXd1Iai+rrTl2jqEc
         WEFg==
X-Forwarded-Encrypted: i=1; AJvYcCVQqzGNMAwHriZQhxulI+8Lt/bxEl3tXmnO6QgBJbzgIpudHkEo1rL+iWpaQsnuF4dbFXY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0Jusrq7acAkZBi6b7FTE5iiM3zwyD6hKOsOotLACXu8h8Tysh
	kJdQ0KaUMHCK7yWqBhN7M2PHPb06ihvNQEGfVT5WecacMATH5zD99ecclssJcjTlYEUf1raqGVt
	ypAW+DvnhprroYYNy3VyQ+UYjOa6trZ4=
X-Gm-Gg: AZuq6aIN4H37rpCEjW3GbRcj8TcMFGTVdAWxQM6Qv2KAVIU9PW9oPDCwAKMQel2BIoA
	v1Q3KgWf/pNq/Vm4AWzn9eVQwbPDQukZWfFX33QbEnk4K9zRAxpnZkogn9BfuMJ9twl//t5gEXe
	a8OVXwDwjZoaNjfdB3CIQAvsi2uLKXvuVSIj0V7ocTb1XD/jk1kER1/6kztFT9rDpgd0RDnuncZ
	BSeZ9O45uGb9BpXaaV9Oz7QCGFuH22JHdVvUrKYTnHkU6OeQTviuHzgPWvRITr0YTUCc/QWwUSd
	KVGfxdhE9MKpJ1U0iDheKPyCfo4=
X-Received: by 2002:a05:6512:612:20b0:59e:417:2805 with SMTP id
 2adb3069b0e04-59e041728eemr897795e87.16.1769538441058; Tue, 27 Jan 2026
 10:27:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
In-Reply-To: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Jan 2026 15:27:09 -0300
X-Gm-Features: AZwV_QhK3eFl5bcR1K336qjRBbT8hoZ1p4zrhgHgCXGLTwM9-xA5aPP55CBui9s
Message-ID: <CAOMZO5DAk3oZcQyqUEBiGhZPaX846q-zypyz3=chSNY1o_kBpA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@puri.sm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 10:56=E2=80=AFAM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> frequency is 400MHz.
>
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Shouldn't this have a Fixes tag?
