Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784345349B
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072411; cv=pass; b=PnTHJgUy/w441JZvUxcOXKfDCGSQMerlkxlTprQV5VJIeiJJMQUk71p7cF2H+glU07Eoyjbv0RuRZzqiASXpPriwxaqAgG8/RIAm5KPW07d2ZbP+bBRzvadH9G3wsGE5I9965feup5UpbVlRith+Z7X0gz3mDX6ULJ0J2i7NLYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072411; c=relaxed/simple;
	bh=+gwAuL8FJyafsH6k369v/fD/X2nT+hweNgWMuxDRSuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cbuliyd3alLCGwzHS4bEJ4D8Azd9/EhvbMZCjOPcH8pdPZfYAQekEBHDNPyaaSbzoBCSyKZyqj6u4pUTJpvBkKUhEWul1QcVLKBxsvAmv/KNBUzTCoQRGKzPIhbTcRvX7NF+wsClfrZHh/TSmydQZ4uyKdBRlK9Bjxv4WCa0W/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkJULSl1; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkJULSl1"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1233c155a42so1060756c88.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 01:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769072408; cv=none;
        d=google.com; s=arc-20240605;
        b=LV3iJE05AbssKYYs2qJDhlzpeMoCjImJ428EQ4ppGdBniajkTygfqs3gAIzA6nAx+6
         mxbf63MWCY15DO8YVQeyY2fDGX1nRQ24CU3KPI4AFF5FeAPsQDNIA+OfzYhegVxh4mrS
         jpLQg04+lG9Ht9ZJqTCxgGwe6Izs+Mb47Nv/Iqu38Sq2zRrg9Ngdlwh2j0FGJ2rinzd5
         O/hkC8kvFKdQ3Ho1Qx8SaY66zYV3d7ABSCLbuaQ3V7vBgrbZtChLp7SiUUq9zyYhEeaH
         E1YPPn0xKMCj8XB0Q5s6JLwlHmKlJPOgTrAACY0USPriBpBHY6olvfEqgLUAeALNtQY6
         17kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        fh=Ex1sgUeL+8rxhfcnhYS7zxgnfWh0qnlYHMfMX8ib0TE=;
        b=OwDeeuZlXSr9rbouAzD5QKr2JUxK/5KGBTlcoTDQuJUhpXzPYabnczLpwaX8MkJIHX
         zCKXLktgJGq6JKZuxExKSSf0IdWRlFNuFcoPZuUAkmRlBfGVK8yelMAZFxGfUqEYvSUc
         a5Nlv8JAe/ELt/Y0pKd689Yuy4Cj8pk2Lr4XJTPUD0uZUDYFOasFBNMBffjF7UfhygQc
         hVlyZAo1yZWuYmQ9ImjTg+aF0qqh2TxHZp3KD3TTrZ81USpY4HBB41XndKwrze1sL9zC
         QMi5ZPhJj+9TDTh3dsEtrVVuyTE489ZAEkufDRytBS+pIXzXR4jgMRX+kV/1BpuLya0n
         Kwng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769072408; x=1769677208; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        b=OkJULSl19jw2o0adzi0Rb6dUErqOPqt7/sXlniY+097A+vlx64E3F+/rRmzhyBUzyW
         c+hJrr14YrYOPl//ppwvXDKbkcim+eMS6jLCRQHE7ygZ8ewhp4Zb33obuAI14iDshFf6
         EW2QgMcMzaoTgeMrcaT7uPhaheO0VTlMJlSzRIqsOGLrT3Gr/nndywDyvAw1N3bk2lmZ
         l/QsofCydMw5KgZCELRXq4yrkX42IiDIFQYFw72U4p/pEnriz8DofkcbseKDe4eH1eBy
         LA5MUaMU6FPR7aUl7Wqy1UHSM9bQq5m5eq8MEQj/y4c7g11kYO3FMgF5K8hYyy2iEBrk
         zG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072408; x=1769677208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        b=CnQIOYVYkPIKWek5IAnp4HauworU59xlIhfu89vta8sXCybWZfkN7SSrduDI4nJowC
         bbJAyD9arc1hZOmgth0oWyEL6XgdOzz7QKm5+/jvB1ng/mdMKLNjm9MTO0cq6BeMDksh
         m8n9phFpNQGtZLpr54zUp7T8bSaRD9MhaP7DqI/PYLyGonUc/5nRd3pzqbF/pKodubJ5
         uK43LG8UEGF1ikUmwlVQ9IK1Z9ZQudVzXhWVZvazpd2ey7kaCPSgPfwdb3mPogsyAjvX
         d5fuhnWhyrakPCIovrZqSBHvHJBmpngL0khIzEv+PGrY7nuhCMmGqAjy7bOa/JpELbMv
         KEBg==
X-Forwarded-Encrypted: i=1; AJvYcCVmb7/NqKb6poV8v9vvHu5WEJQW3SqkTHhXPUhJwiQE4zYqbUwHUtn8SWA1SjIVx6lfC68=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyu0kvmBkSSH2P5iVOARaWAtrj3ZV1JVLrmREyP429faocHTKO
	9Uc56cJKMgzrdylXy2EGrmd8QqylGz5m7vr3khnRlKVtssJ4spwKVSyy5v/Zc/78lPIVxwk2mwd
	mJOtU8NwnmmY3RzoL7W+I04fQhbUjsp4=
X-Gm-Gg: AZuq6aJhXPuI728Vb9x2JjmASWNpr7KS6EbyYRaxXL8qktwIAQXF91t6LchclVR4pVL
	wDjq+YumoyZJEmBBc0VdOgzyE1Nhp2bIDo9JfbZDjy/II1GC3t2YGQHBr6ny7z+K/Q+tmSQtT/J
	2zYSjKoJ4KyyYPC3FTMw61Zga583WcDXbYDqJAGUc/zJ9z0jB0Y5FgiCDwUab/ZLgjQeD9QI97h
	Rz9nBMd28hMcG4i8PwFXu5vchZzvy+z8xYdis6waYDXRTmGythhafg6CZ8CNcm2ewPiGYICkLsw
	6pz3AY/DNubWajbObyvnyKaaZA+NkJyiSwzsiKeGSNR8gWizXNS4zN3qJ4irQEr8NbYhjo0lIle
	ihUOOs1cYPQY/acIK/GnH
X-Received: by 2002:a05:7022:eb47:10b0:11b:a892:80a5 with SMTP id
 a92af1059eb24-1246a9683ddmr4799166c88.13.1769072408307; Thu, 22 Jan 2026
 01:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 11:02:47 +0200
X-Gm-Features: AZwV_QhQ7Di6OY00AIHWXVDVc4TW2QFRAihJ3KdJEN07TYFMxvmJku0VPJz7aJ0
Message-ID: <CAEnQRZD1Hzs=+4piUr9rUga7RqV9PSuB9ZFiMY+qLoRz_2-W=w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 4:33=E2=80=AFPM Shawn Guo <shawnguo@kernel.org> wro=
te:
>
> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Thank you Shawn for all your help and guidance!
Good luck Frank with your new role!


Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
