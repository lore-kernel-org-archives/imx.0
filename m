Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D37BBE6C
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 01:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938804; cv=none; b=s27fZ9reszEmdR/o4NAJEaRDyRh9O9tRKVE2eUUiS3xo6SpMXwHaZnxi+bzirFcHmUEJpqDu5LLW5mIsjx3TbIGj/fhTdtOVD/vHDH+QWdHdudx1UTtoZIrwB1aMXNzcOnRunf1gJ1z7vGXmh2c613QVhNNkaKkvBMuUJVm93n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938804; c=relaxed/simple;
	bh=ZgzMhn9PXUw8XaAQ7bqis9LsIzAHvccPSnO/9V1QKUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9zydA/SnDh3vZidgynPqqbk95nL741q8scs2I/J2xNnVD3Hw7mXB0iqkKUtl6pEErZ+iVLX2+3LHmsKnHegF9oK2IVz9ffjsoaZs+DVetnETvq1bOA+a33TcppWJJVNyvyh1NlYFOCWwrKZu7SYUcDE/xFcuqloB8c/zFAfGQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqeRHvzM; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqeRHvzM"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d52cb80dso3491724e87.1
        for <imx@lists.linux.dev>; Mon, 07 Jul 2025 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938801; x=1752543601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgzMhn9PXUw8XaAQ7bqis9LsIzAHvccPSnO/9V1QKUU=;
        b=lqeRHvzMhxCH2X6xUhxtf7bjr8KbLeBpWPnvu0AOIjNWTEHwi1VWCCUmloh01rcXlq
         pwqOruwKFPLFLs9Hhlpu5yF7nhZECAz7gUTdtnpIexlVBJ0OZE5u3gwBLwTpUO8wfig+
         4roKuiwVutwnQHt9K7XYJChZ6WczdiQfRa2mrXSvx+xP3K1O3RxCF3JCUEcLWI5KjFy0
         z3GPqjtoZoM//2PF5qXoW8p9sLxDv7ScB/aZuZ+VjVGLylGloUCZ0d53cUKhsSSDL8nN
         9iOS+0x94KpQ8KLK/MFdOXGfhYvJgYcx/t9tF8deB6bjbwub8RuVyUICQjslkUnQdyWh
         BRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938801; x=1752543601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgzMhn9PXUw8XaAQ7bqis9LsIzAHvccPSnO/9V1QKUU=;
        b=oEcfHCdXf6VB5Hw9gNLWGGoAzzwGk7Q9JOMOVYIr1nrtSEMlAOUPzfRczErzP1EMNE
         R4EQE+aCrsR+HXNJ0MwEqfGBuLbspIbZY0cKHmcDl6ELx1hcvJsUsIOe4HtYSbzKDrCS
         cXprMuNU+XwzTW2/Xgw30ekgHgJn8ahBDvHfs746gTIcL/lLdgrOvp0MTQ9G4EshpO1/
         Ggo07gGKpMIb9zjBvGVhDV90gX2zdzD8ZFOUTsTGPuCJjLru8JIfgZJw9aghn/GWtDyc
         9WoUoIHN0AXXn+kF1Kn/xc09+5wwuZi2STZkDpjobv/d6AjPD7ip25NWOqpVa4N+JHlb
         nXWg==
X-Forwarded-Encrypted: i=1; AJvYcCUpAtP4vRXAiJLmwa0IOlO9O3NYhKWRnKtGo3cAtJpEZJMmZV6B/p+T9T10bGL6ANUIJgE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSlgOdYixH0rEATSmXFfYxxwATB7TX15tZ//K8UvECh7BpLQrG
	b44Jg5aXetguAbNoNNoSnS6ZFajh2depZFxR85CIerg49Zvfk2TZFqRyqhvtuT8epQqmz3XZ6yA
	NJ2qrrGJd02IcziVVeLtFK146WsPsB+U=
X-Gm-Gg: ASbGncvBGjMjIDTMbuC1jHbusMaD4BCZGTX/qJpA+hev0OKtzfIAb+KJLBLSqc3nRS3
	24WQ4SrqmZ2W2Faj6fESOOo+nye0UFCPE7r4OzH8ByrMLE3VtK+V4tFm7jJgNKleFlCVuOMXU6B
	jnaPpAmyaFv7CTCw9nkSwSRvyna09JtHcYwxu64HBu3HIO6V2Az8sjzBij2PkdLBwL81xxZ40MR
	+k=
X-Google-Smtp-Source: AGHT+IHygg0TywmldncFMonK90kHL8Dr5llLxOm3DhG+XHvJuPfci4yTlbVuoguyFC6BCZkSLwEJ56H4J2PHxXgxdT0=
X-Received: by 2002:a05:6512:340d:b0:553:2969:1d54 with SMTP id
 2adb3069b0e04-557f89b1acbmr264901e87.8.1751938800572; Mon, 07 Jul 2025
 18:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com> <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Jul 2025 22:39:49 -0300
X-Gm-Features: Ac12FXyFWnyJ-B08lFE9ya2aqIPGseDa9aDMsZwjLGBKAWhJik9-kphabCMJ-sQ
Message-ID: <CAOMZO5DfuRKYHkC8e4mNzetY204UdPDBHzUVy4M9pyjKpx401w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mark Brown <broonie@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 8:46=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
> is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).

Shouldn't this be enabled via a select in Kconfig instead?
