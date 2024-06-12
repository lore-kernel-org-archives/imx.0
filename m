Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA916DEDE
	for <imx@lists.linux.dev>; Wed, 12 Jun 2024 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718185624; cv=none; b=mQA4KZD/8mmAXxx3tciMjYcQ8AKUwDLDTD3Cwz27LyW+/z9/0XcnrKYN9DEoXQV7c86fvWYQLEtAaba1867GjKZ6wR/JXb81LAghvg2eimd3NBJNvED1SGjuMBAaMj9vo+DmBB380GwTIcZoxBgiz3MiAbA1f4jAdPk3sBSL6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718185624; c=relaxed/simple;
	bh=zQKdgF8mcEp+wVi7lqvaVDwpdEckLhnlchOC12xC+RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TV4P0amtMSJ+rxeA4XmTjPbEgs8aZex0O6Etu2mTcGxdnccYkTF3qFLTAOPVcW2EkRkgI6z6fQSjC1eUc0Wv+O5Y3dmCLv7l5JjQtLbTPxdI0o8szVpmBn5yqhEPKczpYw1zjNJlw0wEgFj7gGKu+oJrHtFsp9WphDpPossmyHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dg0Opz02; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dg0Opz02"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c82101407so6797743e87.3
        for <imx@lists.linux.dev>; Wed, 12 Jun 2024 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718185621; x=1718790421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQKdgF8mcEp+wVi7lqvaVDwpdEckLhnlchOC12xC+RA=;
        b=Dg0Opz02KwVLj4O0g9VuWoe+tndksQqbtnsgNJ89PSyY2byJMLRDoRDq4HLD9Bj035
         J/i//StTU7cZQBCvumLiVL5gYv9oBxusyfhqX0skGELUHUYrJrWCNvkFBzd8Rgj7Peu0
         UAw13o6v1eGUZvhpYzaNPv6/cRrp13uV0Yv/JIY3vCXs4ySKGj9UpJgXTkYPR6MjRh8N
         uB0bmk+BVdrK5AljVHXz89B6R5cDrBVfYb7dzj3UvOC9GNCSXarFsvIzm3A0RkNCIHNw
         OVMIrAWML97OpZFWyGDVe7icUWoJFllBPsXidrzvVjn5yxhgGgiK+WrxwVhAvfusndTE
         Woow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718185621; x=1718790421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQKdgF8mcEp+wVi7lqvaVDwpdEckLhnlchOC12xC+RA=;
        b=FV+GTAxCxjY3bgXDcovg4Yh52sWLwHyHGbxKFi5eDXcEPaxmmuNCxRNeTygbkQIomB
         +1zRM3kvmWcwwWTaG5++4Fkq3QiWNpGgwJT4Kb2xJ1EbKiOkAdWTD6fma016h9XaRXL5
         G8h7YjX2FHNDbKZ2w65ibzGO+gJELiJXrI6mOgkklzxXC5KvBsgveSW3kRAiDCAOX4ST
         BZJH5pFyknxj/fknWMZX7DoZwS4hClS6F7aap846JN2tIVo922+hI/mPJUf8QsdBNrv9
         ODoYYKdpi443zI462UKcdMciEdRgbmkx7YFClvfjcp20XnZ5s1RFg8iJwVMYSE9USd7b
         MZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXacLUkZVpoPVA0yEOhCcYNQz57ABlD8moOP9oQV+7TK5TcACrarNeqXJ/Gp6+kzQC5bTjEJu55xciOFuw00QIUupkW
X-Gm-Message-State: AOJu0YxhMMZLROf6w+BhS30FoYTZkHaEKZPsbQgRzyI/1t5OB6+T9s0n
	BS8UC8F3lmgkrVWqGZ5W7/Hi7Y9kh/8+0yiUG6V/GjDXwcDpNT7fhl32RkHEHaHkyAU2qTryWMX
	5e5JkfZOUZpr/k1hbv/sBP2K7mAiv8jUN5VBvAA==
X-Google-Smtp-Source: AGHT+IGCNkHASnW9VHX/JSYWKJzZNEu3Qmg4CK2c1hPkFlnh/pbup3cTnpgiY+Of0KiWJ4QoVJYCQXU1sRI9qEXlsX4=
X-Received: by 2002:a19:e00a:0:b0:52c:8811:42f7 with SMTP id
 2adb3069b0e04-52c9a3d2020mr998967e87.19.1718185620774; Wed, 12 Jun 2024
 02:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240530165424.3173673-1-Frank.Li@nxp.com>
In-Reply-To: <20240530165424.3173673-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Jun 2024 11:46:49 +0200
Message-ID: <CACRpkdYbZAMjgLQPo9Xw_ooqpohwGKG3S1qMV0sKsDAYh3Pv+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: robh@kernel.org, brgl@bgdev.pl, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 6:54=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert binding doc from txt to yaml.
>
> Remove redundated "gpio1: gpio@2300000" example.
> Add gpio-controller at example "gpio@1100".
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
