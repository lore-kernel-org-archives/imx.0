Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F236CDFA
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294719; cv=none; b=J9pXq8AyH8Yn2KwA/EAqDpFGg0eAf1OnFv1LyAmX/gkEPI+dA281eFUqAzT1yJ+RlXJfBGKrZQwpmq/8o6GLh59dprMZ6nEsbk8c8d2WTfWc6zEY7DTpjWL55cD3x4gW7ZeyDXuJjgKzx1QN2VhE/04fcVloci2ia2TXZjLTVSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294719; c=relaxed/simple;
	bh=qFAe31p8PPO4mtj+DijEpW3hOfltqumeq8By/+jReis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+uUR7DrE3gB+3bExmwvgqrcVLc5R+x/tobDkDoHIeYwShtRgTQZqLLQ6yxZV6jz3ibIwmR+VUQ6/Kh8t8YAxGdNnDgO2A9GOH3W1evf1dPOsmHuoi/NzyG4YSWccOAvRNEEVJndktOQMArqCQJQUOCZiJram1jvx3UndY5w5hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY8OT3oH; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY8OT3oH"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-11f36012fb2so9579368c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768294717; x=1768899517; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFAe31p8PPO4mtj+DijEpW3hOfltqumeq8By/+jReis=;
        b=lY8OT3oHUqJqp/9gaGZDYfrV+oTOHqjpI6VHlfIYJEQ7qt91YiYbgTVvD664k9Vqa9
         LGfDRshnePhZver2nIjd/XOKRkFBMW3X/9UOUZFB6X2JRp1HXTA2cOg0FzSND5PiVoKb
         8FTOwrtc48UvpW4MSarCBgRlTjYBbaBLfb7jOnFQuL2OuPo1vUvALk8J8Jq4MdmIBU2W
         wGZbOHII/r3X6RYQHWJbXoHwc8RmQKBew4gr2WahjMCbGilcTTW5oTneH9IEsBA9409h
         9e3SuNIKLTsoAAnpynp0XMAYIguouKLOFkTg2giA1i6MH4br7eUgskY2GTdT9L+mTWdd
         4UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294717; x=1768899517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qFAe31p8PPO4mtj+DijEpW3hOfltqumeq8By/+jReis=;
        b=ADOsxVG6Vnn83e4Y6JWi92/ZkkGjkpOOAXhf1e7F5/LC2Gw9UJtb6zBqtLEvqpniE/
         4dmuJEBMLej3awvlZIi+iYET7J+iqJORG/oAwRbexhXx7oXokNpX/GHEsXYbKsActKQJ
         mS3FKTfPv3ZzXmTMumxiAC80qLcC3o0sM0UbG+bBjI9yHebIFJ7hU2yuzwIFnSyoAUND
         QxXWyfveX73HlnPyUY0zjMhhNirHp7oMdmVrtFDJ5anklIxDUrQrgKtG5+BwWkbNAvhu
         Ki7lm0GJ4xIPFYQUSarfdGQYD0KM2Vm+GWA5PF4U2pTQYhl14SrgOnEOrIzThilg5s94
         KtGg==
X-Forwarded-Encrypted: i=1; AJvYcCWnToM3xjtb71jciprOIlMf6Wyewoo4TBbtHEOaOApo2BizqL6YCowyMq/vpKEeF2KxYZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUm7pA+HGk6vR3Q8e8bX/j3mHymuw4sDl+G/R76iHozUs+TTuC
	BSEGUQFrv6HbsAfZ0tCwIZiXvr0iv8rGWybCD0+uH/2YxU1gZvqvlS7tQSEMu336dOwPBXcwzW4
	h3oiV/8shYOX4AeJEB/muCr6x4D8ERz4=
X-Gm-Gg: AY/fxX7AOvbAgGeZ/ai2JqyYtw3BKqhRo7oJFyUD/+HgKViNKbLdmQH8Mxarw5hwzcl
	4XS9vRt5TadWxht3nOJqg6nb0SZUShwJ+0iWcWqyk4oLauczWyA7uBjIMloJV7OIO6QmYqrPHEH
	5Mq7aQ13k2T9yl16kUulpWi8L14xxCHcWU/1Y0hEQVpQ45S9hmyeBXBoN0UULbXeY2V3FaPGDVt
	eVgWWCGq3XrctFojMNoQFnsdZHxSWoCx1S0ZgWDjYjHj3rgK1eTN7zIrxQBPLWo0Kb+HvtGTDF2
	OFdA8uwh/yHjbgRqMVK/XbTJMFCyB4s3O/YsWJwQqJ6qs8Ox/HYc1RVJ7ORnSH9NJT/JPWhHNfJ
	lxo/WYSqnVQ==
X-Google-Smtp-Source: AGHT+IHiFhj1SBZLl1zt634a7vOzJVi0cLQ2+ekOBzZnK6j9L0o9kjlibBH9Kh5FRme3B2cB/y9gNpIFI0l3hUxnOM0=
X-Received: by 2002:a05:7022:126:b0:121:cae0:a843 with SMTP id
 a92af1059eb24-121f8adce2dmr17795472c88.13.1768294717350; Tue, 13 Jan 2026
 00:58:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-5-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-5-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:01:07 +0200
X-Gm-Features: AZwV_Qgo7fPdD9gHTGPqvBycw28dLEq2C2vaqXtaAyuZNVr2OJaK4dq1mXPXdQ8
Message-ID: <CAEnQRZDc6nbGZt6jzFTYv3VrS+HvcZ9uXCYOGm0XKR7qWSLQbg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: imx952-evk: Enable SPI7
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 2:44=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable SPI7 for i.MX952-EVK.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
