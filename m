Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B652459CF
	for <imx@lists.linux.dev>; Tue,  5 Aug 2025 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754380310; cv=none; b=IEz8pu/OC1DsZIMuxuXvdIfBFNPLVXLPUOYpQaO++SF6HkmgV6ibyS38AZ30mPQTLQIx9kOFO+5WAdtD4ICRbHsRxOy4cTTp2BGG1mKIPA81pvPqdpnlAgvAozgiqft63J/T8V0bDH2p5g0tzQExig+R1CA2Gi0JV53dvL7wQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754380310; c=relaxed/simple;
	bh=DF14p86C1doTAXUJtzsz/T5aS+HX53wfXuMCNvC5Hto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxKzO6+A7kt20z/CBV1LLKJXkpz/jUhy/EU5VY60Iov7Mmpw1nZmQbWd3EqvwjpSqBR8feJEarIyc+X41B3EN7dcnj35EaXJZn1tYPDrnsRP07Yf40M6KX2zYiJb14TrmM6oodCGUwvuiA1/nQwo1jz20nr5lPrY2SNZj9vGsyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lX3f6tl+; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lX3f6tl+"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bee58e01cso3337592b3a.1
        for <imx@lists.linux.dev>; Tue, 05 Aug 2025 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754380308; x=1754985108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF14p86C1doTAXUJtzsz/T5aS+HX53wfXuMCNvC5Hto=;
        b=lX3f6tl+LlOOL1ZXAyW8S1UaeOPohzTf0RhcpucnECEyA7lf7tbJyYHThjf+25NrWL
         BiDcJJom7KR1EDTfn08cbBxRwM+3wirlM+frkSJo9kZceR3+ZKH0csQRB9/2g9Fin2wZ
         yhHyY7a1dn9sddsavWDXn/VQkKUbpzkbSmiODR33wvBhu2dvZj3EZs+FAHm6ovCtrGTy
         vU8s9eKDPQuoupP03vdVM59eyb/4QIHGLCh+EeD3AIwZKItQw6y5Nd4KiCxWqblIz1g6
         t3RbvHSDqjInnwI0PAH0PZ3PIpp7e9SbH3QbVp2DAwNzb8TC6IVKI8vZWNDS0ydWPucG
         u4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380308; x=1754985108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF14p86C1doTAXUJtzsz/T5aS+HX53wfXuMCNvC5Hto=;
        b=t1tyjgiXdDpnkRhC9C5l1DUTaKM0W3P2ypj08AVGZKMeVi4SVtefrB3GCyGbvQT2Rf
         WtXo/oUuaAerTDa8PUzGOkkooi/wSyjdiy15Ndpxjc8YPcjaSw3srM2lCRrEPkRspO5z
         s0NfI66t0kNH/DGHsqq49yGgXOO9kd/w48UMqkYVdF1zBXHhnN5aCbdlYS/K7m6sUoEH
         GmE38LstWvZGRZpaNcCZjN+ckLvNFljRa79enVGmJga1om6ufcxE/zKUFLgqJWWzYiZJ
         gHpjpXkxrL1KwIxqSJfqqmGRbFR3vGJmJ2dnNMib6hdp6VVwWr+szL/5GF3qm2w7QpPw
         h6mg==
X-Forwarded-Encrypted: i=1; AJvYcCUk9c6uP6SL2GPQ37uGsi5vWxvbsqnOHXodiGMRiBB7Fa8Tg1ByamGGiRSTkUrb4Wx90kw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW+BMzUsDRN3t58wSQ5yo+hhyzU+N1arvDXOY41MitMomQvGXA
	kylXA6aB2zJN5cdKjxogX+s52RSwiDUbNiChjfgPKdALSm7GwfpPLMPsVYFVbQJdlvy+YqxI3D3
	uxdxAFDbeva+YsRL7u0jN4EkmwoQnhMg=
X-Gm-Gg: ASbGnctknANqBCst8++Heao6/NeBWYtNaLY99MSpyg1l1rCKsxRh2enw34FGN7Tm9vx
	5esBTQSUs+QUc8LsLU8wYytTWiLjCeELmNJNAYmgLuI2m9jb+RmzusBf4eyLP0IDC2/PUqQZeGa
	gy41X3kagZ7yAEFJsXyNlB8FUhLq6elzqHBenvEoYN7jrYnp9JAmVRY+ubPJpXpmuIgfcBCBIs5
	Iir
X-Google-Smtp-Source: AGHT+IEWmtpQKbGUq/1bFP8Lljg+twjtflzwS9IvD3UxctPY665t4Ffz1Dc9oQm0cJB3lp//A3+8o9nPMjYNlLQTx4A=
X-Received: by 2002:a05:6a20:6a0a:b0:240:198:77be with SMTP id
 adf61e73a8af0-24001987cadmr11786044637.42.1754380308033; Tue, 05 Aug 2025
 00:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com> <20250804155407.285353-7-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250804155407.285353-7-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 5 Aug 2025 10:53:50 +0300
X-Gm-Features: Ac12FXzs-8MGoSs0GqH7OpNp3C2Lxecj08a45oMAKLepSFZX4ZB558QC9xKWl9w
Message-ID: <CAEnQRZDxMc43_U1kwnFDLnQbYgpKDmPYkdqB6dd44K62Ka1GqQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 6:59=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
