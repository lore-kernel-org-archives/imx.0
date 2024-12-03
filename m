Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE421F4283
	for <imx@lists.linux.dev>; Tue,  3 Dec 2024 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243399; cv=none; b=b4wxvovOrLD9UUAnDeBwavWhmsyGBQkyQQGRxPRBUJbpQgFN2udNEnftRRTOv8JYT03cEAnstzllJVGvq4+dx21BvLVhOnUKC/RuiZ/8DjVba50GpJmuifz1/kZAJE7GBXeEpI2BBQu5siPZy7v0Eba1cNAoiJUbQXvL6HikOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243399; c=relaxed/simple;
	bh=Tv0/FtCsUcuTGQ+jsoiF0iOjSni5uFgH74oUN7PTxcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A68j8vLS6YNpUK8lwnzmSlKKTtD6b/MDs0Ze8rnRn5UJBVyOicB1SBvrm/OANdVHtP530pAA3DRCZsKz2lTsiQ2jDGDWdU8j8TEV4eWR3iZhn9jbv8TvgwmI5FGXvLTptruyFiguaf/VmaHXm1mPzEvi5gp293qzXhk1+QicmTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ti9pdhA+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ti9pdhA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B09EC4AF0B
	for <imx@lists.linux.dev>; Tue,  3 Dec 2024 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733243399;
	bh=Tv0/FtCsUcuTGQ+jsoiF0iOjSni5uFgH74oUN7PTxcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ti9pdhA+K7R/MPEZB9ABHCXpptFb69ykzeorjO1rSowT+A1f1/5qsxBMP9aRP5y2O
	 OAKylJF/RCg0sYh48Rb9frTmiNMGek+mCyy6aDOUhouTxm5B2yG1fXBuoPKPM8lrR7
	 HK7c/XG29FNkOe7ozwcPw9kkTFCuArWHMOoL+m4OfYxK0iLKHbijYR+lJXpMxBk75B
	 UE+lUdwXMRCA1+DrAiC8nw6gZAyYSOH76Rb1FkqS7z/QTCjbEUtuVsDjr66tTk1fTI
	 zTGk5nGOSiP1es4Mz85xnsfYlRjCcqWseLp2wpCcno/hvOP34AzgraYIWEaYgUkh1m
	 qfInz0nP1ZKqA==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so4195496276.3
        for <imx@lists.linux.dev>; Tue, 03 Dec 2024 08:29:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxLpFuUe6EOCYYt6uIhKb6lOXyns7QkwjAUA68iWXj9a1wIvQhYMJxdGNjA0m34Ra1ibE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO6MGUKlCo8hLQWXiwn9Zd5GqFzfrRcitkqhyRB0MBwMFM7zrd
	+dWOPDtEWjLde/mhnJuynn7+izJVCHpNpP5vyuTa5VpuhvE2niwxG/zqE2a7CCAiAeaImUpE6Yr
	IxXTO49tgqHf3LXBoKzbm8a6mUQ==
X-Google-Smtp-Source: AGHT+IEjhzwVUw3GpUhAyfiDrfv9x9+EZvaLuj9fZM6qMK5uI75t59+f1FnfnDvhq+imIO6/SaFkHANqNEPhKwxddCU=
X-Received: by 2002:a05:6902:f89:b0:e30:e39b:9d72 with SMTP id
 3f1490d57ef6-e39d3a2a894mr3508084276.16.1733243398164; Tue, 03 Dec 2024
 08:29:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023185841.1183706-1-festevam@gmail.com> <20241024-pep-proud-d714705c9ddf@spud>
 <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com> <CAOMZO5AgQxd2_gkcPSdhfSDArEEkBVvo_yAW3hdHVXtHH5FyAg@mail.gmail.com>
In-Reply-To: <CAOMZO5AgQxd2_gkcPSdhfSDArEEkBVvo_yAW3hdHVXtHH5FyAg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Dec 2024 10:29:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKeAknYwaR_VRfrT7bHf9q6iNMyC9VV+dNBPd5VZNTLAg@mail.gmail.com>
Message-ID: <CAL_JsqKeAknYwaR_VRfrT7bHf9q6iNMyC9VV+dNBPd5VZNTLAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	Conor Dooley <conor@kernel.org>, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 11:57=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Rob,
>
> On Tue, Nov 5, 2024 at 7:48=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Can you apply this series via your tree?
>
> A gentle ping.

Daniel should apply this. That was my assumption and it was out of my
queue (which drops the chances of me ever reading this ping).

Rob
