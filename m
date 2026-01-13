Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6158A29D27D
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319382; cv=none; b=SNei+C+uE4gDNffIQkZr3avOZMkR1ywUg6D91Fx+B6zgFvhWEaZzgdp+18fwUxe8rNzVAAU721+PS8ltlCmIfhjB++W8N10QAZ5OpXz1UuNppPvra2A6miBZFr5BsvDOiNJyYBRPK/JaCx3QkDBu0xuVBLng1UWWK/haHR0Hc3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319382; c=relaxed/simple;
	bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoYSWIfmOxqUpnUJZFAeZLC1GQYIxszxKqMxnI8iuLbtgn/IerHRJiz77SB3aogxLViIdPn730RhK4CHU2WUesgREln53z5RbisYSMV0NZsp0LaKtp8ZUnlewZvvX9CuGgmfvO1mZVCedVPvK0rj9B2KBew7ZXcd7Gso+eB+fSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwfeYx4N; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwfeYx4N"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-11beb0a7bd6so4794122c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 07:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319380; x=1768924180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
        b=DwfeYx4NWtmTGV2EQWa5qneAIxEwL8JYTuaP4p6TZFxQuIGsBn2NbpLCx6YQzI4Y8y
         Q2GkAT0j1WsFK0kl1ecfd3GcDTKottHbc4++pkUrQbitwCisUBJbX13Jrrg2Y7PtyZcz
         7BD7WRrxmMx69WQkQ33hGKpfSC2YggtcKNK9yhodrSKdHjawpUboiS1IA6D9WQ51WEC6
         Iu0W12wY678jU6rRJlvj01d/w0w9m5nX0BoGDPiX3NMgisrCJLN9fPq54Au5eA6+zfvr
         /oM9/RuqZp53XDq5k7CL1khLAWNcsasfvzOrGRCUzT8GMCjb+kAUz69NcMKY/HyUt3Wo
         8/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319380; x=1768924180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
        b=uS6+FJHkMvV02ZlslxRcPZYA7ZHorFlxBBv/0QG1JN5Tq9ZGwyturnZtQSmtK8gl00
         6HxOkIyjoauzqCMRQ9AUVNS557ZBzZ3XP4poBYCdOXYZkb5WvgyLgXmi6QD3csDYxcmB
         fWgXinERQZc9h0e2wMZFLzOm/U2Wyhh6ob7lWop2V4HuhfeJI+vQ+zwNnCaojhn0MGPj
         qsyU8fjPqrIxhoTibhmpHxScalZC4wG3NWi5XrgNv46/f5EIiloNOqq5zcaHztMzOwnd
         0WluM4h2YfRof7En93b836954NAwcxgwqyr+mdv71qo6IcOmRm8Q9WHAWq+jo10wNSt3
         vDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8ANpG5R+EHIA8UX4LguyN4fjeK5k0l2y+Zxn1Ffdf9DDVypWx1lVc5mHoMkyN7hf9pg8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyY30Ht4vRvW/HxvFMpkNLwFxpkqWL8Nk32d2bQfQJ5hQN/6Zre
	g93oHkfYXs7SbGAMC+7Z5F7UdxM5yl5b/16paklxNtAwQXZUONBgiDdKO8E5xrhaFHt7RSj+ZSi
	7qOyh6yeDqC6buzVvBWX/ryC7wo2gMyc=
X-Gm-Gg: AY/fxX6uS+CeZeag1fty6dM/Ff/0T++4a6Z9NX72gljnShWo6nq9zLzbUxEtlx5I8Qh
	pTjgG6AFwX00FvMsOrgB73u9oRsT3CPuvKg0oo9FNsLxx/gh9nXlYqSbe9Q6GmQzPlvDzyCyyRq
	Qm0UZkYqg3cN2S++CyMbkX0qR5UwPspACLFcrH9hU/q+0vF/BcLohgaGzvizxe4mgba3tXanye9
	bfotZlt2wbm1YefJxnNN2I1ESF5dUPNV7+5JRvWqcE/M9/00J8GXg47nXqVjmrF+4UMUQQXlgfE
	/fdfTuYLeZtwvoQeY+zsmBI6k/gimIC3j3r4GzWyWlaJ+uHKDPt1KQudj6MwY5A4/7dIIFd1kYb
	UxWIJOgG1eA==
X-Google-Smtp-Source: AGHT+IGjwuR69qA8lHJxE6iN497KsDTMWZ2U3kZzgncmWwfux7F5qK7HWUrvnZrqKDNyxZj/FyGWFvfT5x9jkoebLmw=
X-Received: by 2002:a05:7022:f111:b0:123:2d00:c074 with SMTP id
 a92af1059eb24-1232d00c1b4mr2953367c88.25.1768319380033; Tue, 13 Jan 2026
 07:49:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 17:52:06 +0200
X-Gm-Features: AZwV_Qio2Twao-YGROiITtozUb3Ksp-2XNSe0asye7QZjZsW6UFB1JKtigNETmM
Message-ID: <CAEnQRZAUw8cVb8N4tvVP6scs2dTedRra653WPvpKOWanQ0gNGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 4:53=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
